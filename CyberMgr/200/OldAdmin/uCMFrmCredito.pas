unit uCMFrmCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp, ExtCtrls, dxBar, Db,
  kbmMemTable, nxdb, dxExEdtr, dxInRwEx;

type
  TFrmCredito = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    Panel1: TPanel;
    Insp: TdxDBInspector;
    dsTab: TDataSource;
    InspObs: TdxInspectorDBMemoRow;
    InspRow10: TdxInspectorDBDateRow;
    Tab: TkbmMemTable;
    TabContato: TIntegerField;
    TabNomeContato: TStringField;
    TabUsuario: TStringField;
    TabNumero: TIntegerField;
    TabObs: TMemoField;
    TabInicio: TDateTimeField;
    TabDataPagto: TDateTimeField;
    InspTempo: TdxInspectorDBTimeRow;
    TabTempo: TDateTimeField;
    TabDesconto: TCurrencyField;
    InspValor: TdxInspectorDBCurrencyRow;
    cmNovoCli: TdxBarButton;
    TabValor: TCurrencyField;
    TabValorC: TCurrencyField;
    TabTempoC: TDateTimeField;
    InspDesc: TdxInspectorDBCurrencyRow;
    TabValorFinal: TCurrencyField;
    TabNomeTipoAcesso: TStringField;
    InspTA: TdxInspectorLookupRow;
    TabTipoAcesso: TIntegerField;
    InspValorFinal: TdxInspectorDBCurrencyRow;
    TabStatusPagto: TIntegerField;
    InspRow11: TdxInspectorDBImageRow;
    InspRow7: TdxInspectorLookupRow;
    TabNomeFunc: TStringField;
    InspNomeContato: TdxInspectorDBExtLookupRow;
    TabDebitoCli: TCurrencyField;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmNovoCliClick(Sender: TObject);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure InspNomeContatoEditButtonClick(Sender: TObject);
    procedure InspNomeContatoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure InspChangeNode(Sender: TObject; OldNode,
      Node: TdxInspectorNode);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab  : TnxTable;
    FCredito : Boolean;
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

uses uCMFrmPri, cmClassesBase, uCMDados, uCMFrmCliente, cmIDRecursos;


{$R *.DFM}

procedure TFrmCredito.cmGravarClick(Sender: TObject);
var 
  CredAntes : Cardinal;
  CredDepois : Integer;
  TempoAnt, TempoAgora  : Cardinal;
  Fator,
  ContatoAnt: Integer;
  M : TCMMaquina;
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
  
  if Tab.State in [dsEdit, dsInsert] then Tab.Post;
  FTab.DisableControls;
  FTab.AutoCalcFields := False;
  try
    with Dados do begin  
      if not tbCli.Locate('Codigo', TabContato.Value, []) then begin
        Beep;
        ShowMessage('Cliente não encontrado!');  
        Exit;
      end;

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

      if (not FNovo) and FCredito then begin
        TempoAnt := DateTimeToTicks(FTab.FieldByName('Tempo').AsDateTime);
        TempoAgora := DateTimeToTicks(TabTempo.Value);
        tbCli.Refresh;
        if TempoAgora < TempoAnt then begin
          CredAntes := tbCli.FieldByName('CreditoM').AsInteger;
          TempoAgora := TempoAnt - TempoAgora;
          M := Dados.CM.Maquinas.PorContato[TabContato.Value];
          if (CredAntes < TempoAgora) or ((M<>nil) and (M.NumTicks>TempoAgora)) then 
            Raise Exception.Create('O cliente não possui crédito suficiente para abater ' + FormatDateTime('hh:mm:ss', TicksToDateTime(TempoAgora)));
        end;  
      end;
    end;  
  
    with Dados do begin
      DB.StartTransactionWith([tbCli, FTab]);
      try
        tbCli.Refresh;
        tbCli.Edit;
        CredAntes := ObtemCred(tbCli.FieldByName('CreditoM').AsInteger);

        if FCredito then 
          Fator := 1
        else
          Fator := -1;  
        
        if not FNovo then begin
          FTab.Edit;
          TempoAnt := DateTimeToTicks(FTab.FieldByName('Tempo').AsDateTime);
          ContatoAnt := FTab.FieldByName('Contato').AsInteger;
        end else begin
          FTab.Insert;
          TempoAnt := 0;
          ContatoAnt := 0;
        end;  
            
        tbCli.FieldByName('CreditoM').AsInteger := 
          ObtemCred(ObtemCred(tbCli.FieldByName('CreditoM').AsInteger) +
          ((DateTimeToTicks(TabTempo.Value)*Fator) - 
           (TempoAnt*Fator)));
  
        tbCli.Post;
  
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

        TotalizaDebCli(FTab.FieldByName('Contato').AsInteger);
        if (ContatoAnt <> FTab.FieldByName('Contato').AsInteger) and (ContatoAnt>0) then
          TotalizaDebCli(ContatoAnt);

        DB.Commit;

        M := Dados.CM.Maquinas.PorContato[TabContato.Value];
        with Dados.CM do 
        if M <> nil then begin
          M.AtualizaCache;
          M.CreditoCli := ObtemCred(tbCli.FieldByName('CreditoM').AsInteger);
          M.LiberaAlemPacote := (Config.EncerramentoPrePago=eppContinuarEmPosPago);
          SalvaAlteracoesObj(M, False);
        end;  
        
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

procedure TFrmCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCredito.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
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
  InspTA.Visible := Dados.CM.Config.VariosTiposAcesso;
  Calculando := False;
  UValor := 0;
  UTempo := 0;
  Dados.tbCli.Refresh;
  Tab.Active := True;
end;

procedure TFrmCredito.FormShow(Sender: TObject);
begin
  InspDesc.ReadOnly := not Permitido(daTraDesconto);
  InspValor.Visible := FCredito;
  InspDesc.Visible  := FCredito;
  InspTA.Visible    := InspTA.Visible and FCredito;
  InspValorFinal.Visible := FCredito;
  Insp.SetFocus;  
  Insp.FocusedField := TabObs;
  if FCredito then begin
    if TabContato.Value > 0 then
      Insp.FocusedField := TabValor 
    else
      Insp.FocusedField := TabNomeContato;  
  end else  
    Insp.FocusedField := TabTempo;
    
  if FCredito then
    Caption := 'Crédito de Tempo'
  else
    Caption := 'Débito de Tempo';  
end;

procedure TFrmCredito.cmNovoCliClick(Sender: TObject);
begin
  TFrmCliente.Create(Self).Novo;
  Dados.tbCli.Refresh;
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

procedure TFrmCredito.InspNomeContatoEditButtonClick(Sender: TObject);
begin
  Dados.AjustaCampoLocalizaCli;
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

procedure TFrmCredito.InspNomeContatoCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
  Accept := True;
  MostraDebito;
end;

procedure TFrmCredito.InspChangeNode(Sender: TObject; OldNode,
  Node: TdxInspectorNode);
begin
  MostraDebito;
end;

end.
