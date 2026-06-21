unit ucmaFrmCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, dxBar, Db,
  kbmMemTable, nxdb, cxStyles, cxGraphics, cxEdit,
  cxDBLookupComboBox, cxCurrencyEdit, cxTimeEdit, cxImageComboBox, cxMemo,
  cxCalendar, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBExtLookupComboBox,
  cxCheckBox, dxBarExtItems, cxRadioGroup, cxImage;

type
  TFrmCredito = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    dsTab: TDataSource;
    Tab: TkbmMemTable;
    TabContato: TIntegerField;
    TabNomeContato: TStringField;
    TabUsuario: TStringField;
    TabNumero: TIntegerField;
    TabObs: TMemoField;
    TabInicio: TDateTimeField;
    TabDataPagto: TDateTimeField;
    TabTempo: TDateTimeField;
    TabDesconto: TCurrencyField;
    TabValor: TCurrencyField;
    TabValorC: TCurrencyField;
    TabTempoC: TDateTimeField;
    TabValorFinal: TCurrencyField;
    TabNomeTipoAcesso: TStringField;
    TabTipoAcesso: TIntegerField;
    TabStatusPagto: TIntegerField;
    TabNomeFunc: TStringField;
    TabDebitoCli: TCurrencyField;
    Insp: TcxDBVerticalGrid;
    InspTA: TcxDBEditorRow;
    InspValor: TcxDBEditorRow;
    InspTempo: TcxDBEditorRow;
    InspDesc: TcxDBEditorRow;
    InspValorFinal: TcxDBEditorRow;
    InspStatusPagto: TcxDBEditorRow;
    InspObs: TcxDBEditorRow;
    InspUsuario: TcxDBEditorRow;
    InspInicio: TcxDBEditorRow;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    InspNomeContato: TcxDBMultiEditorRow;
    TabUsernameContato: TStringField;
    cmNovoCli: TdxBarLargeButton;
    TabTipoAcessoCli: TIntegerField;
    tCli: TnxTable;
    tCliCodigo: TAutoIncField;
    tCliCreditoM: TIntegerField;
    tCliNome: TStringField;
    tCliLimiteDebito: TCurrencyField;
    tCliTipoAcessoPref: TIntegerField;
    procedure InspDescPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure InspTempoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure InspItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
      AOldCellIndex: Integer);
    procedure InspNomeContatoEditPropertiesCloseUp(Sender: TObject);
    procedure InspNomeContatoEditPropertiesInitPopup(Sender: TObject);
    procedure InspCodigoEditPropertiesInitPopup(Sender: TObject);
    procedure cmNovoCliClick(Sender: TObject);
    procedure InspNomeContatoEditors1EditPropertiesInitPopup(
      Sender: TObject);
  private
    { Private declarations }
    function Fator: Integer;
  public
    FNovo : Boolean;
    FTab  : TnxTable;
    FCredito : Boolean;
    FContatoAnt: Integer;
    UValor : Double;
    UTempo : TDateTime;
    Calculando : Boolean;
    FMsgDebito : Integer;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable; aContato: Integer; aCredito: Boolean);
    procedure CalcValor;
    procedure CalcTempo;
    procedure MostraDebito;
    { Public declarations }
  end;

var
  FrmCredito: TFrmCredito;

implementation

uses ucmaPri, cmClassesBase, ucmaDM, ucmaFrmCliente, cmIDRecursos,
  ufmImagens;


{$R *.DFM}

procedure TFrmCredito.cmGravarClick(Sender: TObject);
var 
  CredAntes : Cardinal;
  CredDepois : Integer;
  DifTempoAnt, DifTempoAtu: Integer;
  TempoAnt, TempoAgora  : Cardinal;
  M : TCMMaquina;

procedure AjustaCredCli(aDif, aContato: Integer);
begin
  if aDif=0 then Exit;

  if not tCli.FindKey([aContato]) then
    raise exception.Create('O cliente de código '+IntToStr(aContato)+' não foi encontrado!');  
    
  CredDepois := ObtemCred(tCliCreditoM.Value) + (aDif * Fator);
    
  if FCredito and (aDif<0) then begin
    M := Dados.CM.Maquinas.PorContato[aContato];
    if (CredDepois < 0) or ((M<>nil) and (M.NumTicks>CredDepois)) then
      Raise Exception.Create('O cliente não possui crédito suficiente para abater ' + 
        FormatDateTime('hh:mm:ss', TicksToDateTime(-1*aDif)));
  end;
  
  tCli.Edit;
  tCliCreditoM.Value := CredDepois;
  tCli.Post;
end;

procedure AjustaAcesso(aContato: Integer);
begin
  if aContato=0 then Exit;

  if not tCli.FindKey([aContato]) then
    raise exception.Create('O cliente de código '+IntToStr(aContato)+' não foi encontrado!');  
    
  M := Dados.CM.Maquinas.PorContato[aContato];
  with Dados.CM do 
  if M <> nil then begin
    M.AtualizaCache;
    M.CreditoCli := ObtemCred(tCliCreditoM.Value);
    M.LiberaAlemPacote := (Config.EncerramentoPrePago=eppContinuarEmPosPago);
    SalvaAlteracoesObj(M, False);
  end;  
end;

begin
  PostInspectors(Self);
  if (TabDesconto.Value - TabValor.Value) > 0.00001 then begin
    Beep;
    ShowMessage('Desconto não pode ser maior que valor!');
    Exit;
  end;

  if TabContato.Value=0 then begin
    Beep;
    ShowMessage('O cliente não foi selecionado!');
    Exit;
  end;  
  tCli.IndexName := 'ICodigo';
  
  
  if Tab.State in [dsEdit, dsInsert] then Tab.Post;
  FTab.DisableControls;
  FTab.AutoCalcFields := False;
  try
    with Dados do begin  
      tbCaixa.Refresh;
      tbCaixa.IndexName := 'INumero';

      if NumAberto=0 then begin
        Beep;
        ShowMessage('Caixa não está aberto!');
        Exit;
      end;  
      
      if not tbCaixa.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Caixa não encontrado!');
        Exit;
      end;
    end;  
  
    with Dados do begin
      DB.StartTransactionWith([tbCli, tCli, FTab]);
      try
        if FContatoAnt>0 then begin
          TempoAnt := DateTimeToTicks(FTab.FieldByName('Tempo').AsDateTime);
          TempoAgora := DateTimeToTicks(TabTempo.Value);
          if FContatoAnt=TabContato.Value then begin
            DifTempoAnt := 0;
            DifTempoAtu := TempoAgora - TempoAnt;
          end else begin
            DifTempoAnt := -1 * TempoAnt;
            DifTempoAtu := TempoAgora;
          end;  
        end else begin
          DifTempoAnt := 0;
          DifTempoAtu := DateTimeToTicks(TabTempo.Value);
        end;

        AjustaCredCli(DifTempoAnt, FContatoAnt);
        AjustaCredCli(DifTempoAtu, TabContato.Value);
        
        if FNovo then 
          FTab.Insert
        else
          FTab.Edit;  
            
        FTab.FieldByName('Contato').AsInteger := TabContato.Value;
        FTab.FieldByName('CaixaI').AsInteger   := NumAberto;
        FTab.FieldByName('CaixaF').AsInteger   := NumAberto;
        if TabStatusPagto.Value=spPago then begin
          FTab.FieldByName('CaixaP').AsInteger   := NumAberto;
          if TabDataPagto.IsNull then
            FTab.FieldByName('DataPagto').AsDateTime := Now
          else
            FTab.FieldByName('DataPagto').AsDateTime := TabDataPagto.Value;
        end else begin
          FTab.FieldByName('CaixaP').AsInteger := 0;
          FTab.FieldByName('DataPagto').Clear;
        end;    
        FTab.FieldByName('Tempo').AsDateTime  := TabTempo.Value;
        FTab.FieldByname('Desconto').AsFloat := 0;
        if FCredito then
          FTab.FieldByName('Tipo').AsInteger := ttCreditoTempo
        else
          FTab.FieldByName('Tipo').AsInteger := ttDebitoTempo;
            
        FTab.FieldByName('Valor').AsFloat := TabValor.Value;
        FTab.FieldByName('TipoAcesso').AsInteger := TabTipoAcesso.Value;
        FTab.FieldByName('Desconto').AsFloat := TabDesconto.Value;
        FTab.FieldByName('StatusPagto').AsInteger := TabStatusPagto.Value;
        FTab.FieldByName('Nome').AsString := TabNomeContato.Value;
        FTab.FieldByName('FuncI').AsString := TabUsuario.Value;
        FTab.FieldByName('FuncF').AsString := TabUsuario.Value;
        FTab.FieldByName('CredAnterior').AsInteger := CredAntes;
        FTab.FieldByName('CredUsado').AsInteger := 0;
        FTab.FieldByName('Obs').Value := TabObs.Value;
        FTab.FieldByName('Isento').Value := False;
        FTab.FieldByName('Inicio').Value := TabInicio.Value;
        FTab.FieldByName('Fim').Value := TabInicio.Value;
        FTab.FieldByName('ValorFinalAcesso').AsFloat := TabValorFinal.Value;
        FTab.Post;

        if (FContatoAnt<>0) and (FContatoAnt<>TabContato.Value) then
          TotalizaDebCli(FContatoAnt);
        TotalizaDebCli(TabContato.Value);

        if (TabStatusPagto.Value = spDebitado) and tbCliTemDebito.Value and
           (tbCliDebito.Value>LimiteDebito(tbCliLimiteDebito))
        then 
          Raise Exception.Create('Não é possível deixar essa operação em débito. Débito máximo permitido foi ultrapassado');
        
        DB.Commit;

        AjustaAcesso(TabContato.Value);
        if (FContatoAnt<>0) and (FContatoAnt<>TabContato.Value) then
          AjustaAcesso(FContatoAnt);
      except
        FTab.Cancel;
        tbCli.Cancel;
        DB.Rollback;
        Raise;
      end;
    end;  
  finally
    FTab.EnableControls;
    FTab.AutoCalcFields := True;  
  end;  
  Close;
end;

procedure TFrmCredito.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCredito.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

function TFrmCredito.Fator: Integer;
begin
  if FCredito then
    Result := 1
  else
    Result := -1;  
end;

procedure TFrmCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCredito.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  FContatoAnt := FTab.FieldByName('Contato').AsInteger;
  
  cmGravar.Enabled := PodeEditarTran(FTab);
  
  Tab.Insert;

  FCredito := (FTab.FieldByName('Tipo').AsInteger = ttCreditoTempo);
  
  TabNumero.Value := FTab.FieldByName('Numero').AsInteger;
  TabContato.Value := FTab.FieldByName('Contato').asInteger;
  TabTempo.Value := FTab.FieldByName('Tempo').AsDateTime;
  TabUsuario.Value := FTab.FieldByName('FuncI').AsString;
  TabObs.Value := FTab.FieldByName('Obs').Value;
  TabInicio.Value := FTab.FieldByName('Inicio').Value;
  TabDataPagto.AsVariant := FTab.FieldByName('DataPagto').Value;
  TabTipoAcesso.Value := FTab.FieldByName('TipoAcesso').Value;
  TabDesconto.Value := FTab.FieldByName('Desconto').Value;
  TabValor.Value := FTab.FieldByName('Valor').Value;
  TabStatusPagto.Value := FTab.FieldByName('StatusPagto').AsInteger;
  
      
  Tab.Post;
  Tab.Edit;      
  ShowModal;
end;

procedure TFrmCredito.Novo(aTab: TnxTable; aContato: Integer; aCredito: Boolean);
begin
  FCredito := aCredito;
  FNovo := True;
  FTab := aTab;
  Dados.tbTipoAcesso.First;
  Tab.Insert;
  TabTipoAcesso.Value := Dados.tbTipoAcessoCodigo.Value;
  TabContato.Value := aContato;
  TabUsuario.Value := Dados.CM.Username;
  TabInicio.Value := Now;
  TabDataPagto.Value := Date;
  TabStatusPagto.Value := spPago;
  ShowModal;
end;

procedure TFrmCredito.FormCreate(Sender: TObject);
begin
  FContatoAnt := 0;
  with Dados, InspNomeContato.Properties do 
  case tbConfigCampoLocalizaCli.Value of
    1 : begin
      InspNomeContato.Properties.Editors[2].Options.TabStop := False;
      InspNomeContato.Properties.Editors[0].Free;
      InspNomeContato.Properties.Editors[0].Width := 30;
    end;  
    2 : begin
      InspNomeContato.Properties.Editors[2].Options.TabStop := False;
      InspNomeContato.Properties.Editors[1].Free;
      InspNomeContato.Properties.Editors[0].Width := 30;
    end;  
  else
    InspNomeContato.Properties.Editors[0].Free;
    InspNomeContato.Properties.Editors[0].Free;
  end;  
  InspTA.Visible := Dados.CM.Config.VariosTiposAcesso and (Dados.tbTipoAcesso.RecordCount>1);
  Calculando := False;
  UValor := 0;
  UTempo := 0;
  Dados.tbCli.Refresh;
  Tab.Active := True;
end;

procedure TFrmCredito.FormShow(Sender: TObject);
begin
  InspDesc.Properties.EditProperties.ReadOnly := not Permitido(daTraDesconto);
  InspValor.Visible := FCredito;
  InspDesc.Visible  := FCredito;
  InspStatusPagto.Visible := FCredito;
  InspTA.Visible    := InspTA.Visible and FCredito;
  InspValorFinal.Visible := FCredito;
  Insp.SetFocus;  
  Insp.FocusedRow := InspOBS;
  if FCredito then begin
    if TabContato.Value > 0 then
      Insp.FocusedRow := InspValor
    else
      Insp.FocusedRow := InspNomeContato;
  end else  
    Insp.FocusedRow := InspTempo;
    
  if FCredito then
    Caption := 'Crédito de Tempo'
  else
    Caption := 'Débito de Tempo';  
end;

procedure TFrmCredito.CalcTempo;
var 
  NumTicks: Cardinal;
  TA : TCMTipoAcesso;
begin
  if Calculando then Exit;
  Calculando := True;
  try
    with Dados.CM do  begin
      if TabTipoAcessoCli.Value<>-1 then begin
        TA := TiposAcesso.PorCodigo[TabTipoAcessoCli.Value];
        if TA=nil then 
          TA := TiposAcesso.PorCodigo[TabTipoAcesso.Value]
        else begin
          TabTipoAcesso.Value := TabTipoAcessoCli.Value;
          Insp.Refresh;
          Insp.DataController.PostEditingData;
        end;  
      end else
        TA := TiposAcesso.PorCodigo[TabTipoAcesso.Value];
      if TA <> nil then begin
        NumTicks := ObtemTempo(Now, TA.Codigo, TA.PHoraCor^, CorPrecos, TabValor.Value);
        TabTempoC.AsDateTime := TicksToDateTime(NumTicks);
        if Tab.State in [dsEdit, dsInsert] then
          TabTempo.Value := TabTempoC.Value;
      end;
    end;    
  finally
    Calculando := False;
  end;    
end;

procedure TFrmCredito.CalcValor;
var 
  NumTicks: Cardinal;
  TA : TCMTipoAcesso;
  Credito, TempoCobrado : Cardinal;
  Valor : Double;
begin
  if Calculando then Exit;
  Calculando := True;
  try
    with Dados, CM do  begin
      if TabTipoAcessoCli.Value<>-1 then begin
        TA := TiposAcesso.PorCodigo[TabTipoAcessoCli.Value];
        if TA=nil then 
          TA := TiposAcesso.PorCodigo[TabTipoAcesso.Value]
        else begin
          TabTipoAcesso.Value := TabTipoAcessoCli.Value;
          Insp.Refresh;
          Insp.DataController.PostEditingData;
        end;  
      end else
        TA := TiposAcesso.PorCodigo[TabTipoAcesso.Value];
      if TA <> nil then begin
          CalculaTempoValor(Now, 
                            DateTimeToTicks(TabTempo.Value), 
                            0, TA.Codigo,
                            TA.PHoraCor^, CorPrecos, True,
                            nil, TempoCobrado, Credito, Valor);
        TabValorC.Value := Valor; 
        if Tab.State in [dsInsert, dsEdit] then
          TabValor.Value := Valor;
      end;
    end;    
  finally
    Calculando := False;
  end;  
end;

procedure TFrmCredito.TabCalcFields(DataSet: TDataSet);
begin
  if not FCredito then Exit;
  if UValor <> TabValor.Value then begin
    TabValorC.Value := TabValor.Value;
    CalcTempo;
  end else begin
    TabTempoC.Value := TabTempo.Value;
    CalcValor;
  end;
  TabValorFinal.Value := TabValor.Value - TabDesconto.Value;
  UValor := TabValor.Value;
  UTempo := TabTempo.Value;    
end;

procedure TFrmCredito.MostraDebito;
begin
  if not Dados.tbCOnfigNaoMostrarMsgDebito.Value then 
  if (FMsgDebito<>TabContato.Value) and (TabDebitoCli.Value > 0.009) then begin
    Beep;
    ShowMessage('Cliente possui débito de ' + FloatToStrF(TabDebitoCli.Value, ffCurrency, 10, 2));
  end;
  FMsgDebito := TabContato.Value;
end;

procedure TFrmCredito.InspItemChanged(Sender: TObject;
  AOldRow: TcxCustomRow; AOldCellIndex: Integer);
begin
  MostraDebito;
end;

procedure TFrmCredito.InspNomeContatoEditPropertiesCloseUp(
  Sender: TObject);
begin
  MostraDebito;
end;

procedure TFrmCredito.InspNomeContatoEditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'INome';
end;

procedure TFrmCredito.InspTempoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := (not FNovo) and (not Permitido(daAlterarCredito));
end;

procedure TFrmCredito.InspCodigoEditPropertiesInitPopup(Sender: TObject);
begin
  Dados.tbCli.IndexName := 'ICodigo';
end;

procedure TFrmCredito.InspDescPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmCredito.cmNovoCliClick(Sender: TObject);
var I: Integer;
begin
  I := TFrmCliente.Create(Self).Novo(nil, nil);
  if I>0 then
    TabContato.Value := I;
  I := Insp.FocusedRow.Index;
  Insp.FocusedRow := Insp.Rows[I+1];
  Insp.FocusedRow := Insp.Rows[I];
end;

procedure TFrmCredito.InspNomeContatoEditors1EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'IUsername';
end;

end.
