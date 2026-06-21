unit ucmaFrmVendaPac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, dxBar, Db,
  kbmMemTable, nxdb, cmClassesBase,  cxStyles,
  cxGraphics, cxEdit, cxDBLookupComboBox, cxCurrencyEdit, cxTextEdit,
  cxImageComboBox, cxMemo, cxCalendar, cxVGrid, cxDBVGrid, cxControls,
  cxInplaceContainer, cxDBExtLookupComboBox, cxMaskEdit, cxDropDownEdit,
  cxCheckBox, dxBarExtItems, cxRadioGroup, cxTimeEdit, cxImage;

type
  TFrmVendaPac = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    dsTab: TDataSource;
    Tab: TkbmMemTable;
    TabContato: TIntegerField;
    TabNomeContato: TStringField;
    TabHoras: TIntegerField;
    TabValor: TCurrencyField;
    TabDesconto: TCurrencyField;
    TabTotalFinal: TCurrencyField;
    TabHorasL: TIntegerField;
    TabValorL: TCurrencyField;
    TabUsuario: TStringField;
    TabNumero: TIntegerField;
    TabObs: TMemoField;
    TabInicio: TDateTimeField;
    TabDataPagto: TDateTimeField;
    TabDescrHoras: TStringField;
    TabCodPacote: TWordField;
    TabStatusPagto: TIntegerField;
    TabNomeFunc: TStringField;
    TabDebitoCli: TCurrencyField;
    Insp: TcxDBVerticalGrid;
    InspDescrHoras: TcxDBEditorRow;
    InspValorL: TcxDBEditorRow;
    InspDesconto: TcxDBEditorRow;
    InspTotalFinal: TcxDBEditorRow;
    InspStatusPagto: TcxDBEditorRow;
    InspObs: TcxDBEditorRow;
    InspNomeFunc: TcxDBEditorRow;
    InspInicio: TcxDBEditorRow;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    cmNovoCli: TdxBarLargeButton;
    TabUsernameCliente: TStringField;
    InspCliente: TcxDBMultiEditorRow;
    procedure InspDescontoPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InspClienteEditPropertiesCloseUp(Sender: TObject);
    procedure InspItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
      AOldCellIndex: Integer);
    procedure cmNovoCliClick(Sender: TObject);
    procedure InspClienteEditors0EditPropertiesInitPopup(Sender: TObject);
    procedure InspClienteEditors1EditPropertiesInitPopup(Sender: TObject);
    procedure InspClienteEditors2EditPropertiesInitPopup(Sender: TObject);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab  : TnxTable;
    FMsgDebito : Integer;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable; aContato: Integer);
    procedure MostraDebito;
    { Public declarations }
  end;

var
  FrmVendaPac: TFrmVendaPac;
            
implementation

uses ucmaPri, ucmaDM, ucmaFrmCliente, cmIDRecursos, ufmImagens;

{$R *.DFM}

procedure TFrmVendaPac.cmGravarClick(Sender: TObject);
var
  ContatoAnt : Integer; 
  CredAntes,
  HorasAnt : Cardinal;
  M : TCMMaquina;
begin
  PostInspectors(Self);
  TabValor.Value := TabValorL.Value;
  TabHoras.Value := TabHorasL.Value;
  Tab.Post;

  FTab.DisableControls;
  
  try
    with Dados do begin
      tbCaixa.Refresh;
      tbCaixa.IndexName := 'INumero';

      if not tbCaixa.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Caixa não encontrado!');
        Exit;
      end;
    
      tbCli.IndexName := 'ICodigo';
      if not tbCli.FindKey([TabContato.Value]) then begin
        Beep;
        ShowMessage('Cliente não encontrado!');  
        Exit;
      end;
    end;  
  
    with Dados do begin
      DB.StartTransactionWith([tbCli, FTab]);
      try
        tbCli.Edit;
        CredAntes := ObtemCred(tbCli.FieldByName('CreditoM').AsInteger);
        
        if not FNovo then begin
          FTab.Edit;
          ContatoAnt := FTab.FieldByName('Contato').AsInteger;
          HorasAnt := Trunc(FTab.FieldByName('Tempo').AsFloat) * 1000 * 60 * 60;
        end else begin
          FTab.Insert;
          HorasAnt := 0;
          ContatoAnt := 0;
        end;  
            
        tbCli.FieldByName('CreditoM').AsInteger := ObtemCred(
          ObtemCred(tbCli.FieldByName('CreditoM').AsInteger) -
          HorasAnt + 
          (TabHorasL.Value * 1000 * 60 * 60));
  
        tbCli.Post;

  
        FTab.FieldByName('Contato').AsInteger := TabContato.Value;
        FTab.FieldByName('CaixaI').AsInteger := NumAberto;
        FTab.FieldByName('CaixaF').AsInteger := NumAberto;
        if TabStatusPagto.Value=spPago then begin
          FTab.FieldByName('CaixaP').AsInteger := NumAberto;
          FTab.FieldByName('DataPagto').AsDateTime := Now;
        end else begin
          FTab.FieldByName('CaixaP').AsInteger := 0;
          FTab.FieldByName('DataPagto').Clear;
        end;

        FTab.FieldByName('Tempo').AsFloat := TabHorasL.Value;
        FTab.FieldByName('CodPacote').AsInteger := TabCodPacote.Value;
        FTab.FieldByname('Desconto').AsFloat := TabDesconto.Value;
        FTab.FieldByName('Tipo').AsInteger := 1;
        FTab.FieldByName('Valor').AsFloat := TabValorL.Value;
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
        FTab.FieldByName('ValorFinalAcesso').AsFloat := TabTotalFinal.Value;
        FTab.Post;

        TotalizaDebCli(FTab.FieldByName('Contato').AsInteger);

        if (TabStatusPagto.Value = spDebitado) and tbCliTemDebito.Value and
           (tbCliDebito.Value>LimiteDebito(tbCliLimiteDebito))
        then 
          Raise Exception.Create('Não é possível deixar essa operação em débito. Débito máximo permitido foi ultrapassado');
        
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
  end;    
  
  Close;
end;

procedure TFrmVendaPac.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendaPac.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmVendaPac.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVendaPac.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
  cmGravar.Enabled := PodeEditarTran(FTab);
  Tab.Insert;
  TabNumero.Value := FTab.FieldByName('Numero').AsInteger;
  TabContato.Value := FTab.FieldByName('Contato').asInteger;
  TabHoras.Value := Trunc(FTab.FieldByName('Tempo').AsFloat);
  TabDesconto.Value := FTab.FieldByname('Desconto').AsFloat;
  TabValor.Value := FTab.FieldByName('Valor').AsFloat;
  TabUsuario.Value := FTab.FieldByName('FuncI').AsString;
  TabObs.Value := FTab.FieldByName('Obs').Value;
  TabInicio.AsVariant := FTab.FieldByName('Inicio').Value;
  TabDataPagto.AsVariant := FTab.FieldByName('DataPagto').Value;
  TabCodPacote.AsVariant := FTab.FieldByName('CodPacote').Value;
  TabStatusPagto.Value := FTab.FieldByName('StatusPagto').Value;
      
  Tab.Post;
  Tab.Edit;      
  ShowModal;
end;

procedure TFrmVendaPac.Novo(aTab: TnxTable; aContato: Integer);
begin
  FNovo := True;
  FTab := aTab;
  Tab.Insert;
  TabUsuario.Value := Dados.CM.Username;
  TabInicio.Value := Now;
  TabDataPagto.Value := Date;
  TabStatusPagto.Value := spPago;
  TabContato.Value := aContato;
  ShowModal;
end;

procedure TFrmVendaPac.TabCalcFields(DataSet: TDataSet);
begin
  TabTotalFinal.Value := TabValorL.Value - TabDesconto.Value;
end;

procedure TFrmVendaPac.FormCreate(Sender: TObject);
begin
  Tab.Active := True;
  with Dados, InspCliente.Properties do 
  case tbConfigCampoLocalizaCli.Value of
    1 : begin
      Editors[2].Options.TabStop := False;
      Editors[0].Free;
      Editors[0].Width := 30;
    end;  
    2 : begin
      Editors[2].Options.TabStop := False;
      Editors[1].Free;
      Editors[0].Width := 30;
    end;  
  else
    Editors[0].Free;
    Editors[0].Free;
  end;  
end;

procedure TFrmVendaPac.FormShow(Sender: TObject);
begin
  InspDesconto.Properties.EditProperties.ReadOnly := not Permitido(daTraDesconto);
  Dados.AjustaCampoLocalizaCli;
  Insp.SetFocus;
  Insp.FocusedRow := InspObs;
  if TabContato.Value > 0 then
    Insp.FocusedRow := InspDescrHoras
  else
    Insp.FocusedRow := InspCliente;  
end;

procedure TFrmVendaPac.MostraDebito;
begin
  if not Dados.tbConfigNaoMostrarMsgDebito.Value then 
  if (FMsgDebito<>TabContato.Value) and (TabDebitoCli.Value > 0.009) then begin
    Beep;
    ShowMessage('Cliente possui débito de ' + FloatToStrF(TabDebitoCli.Value, ffCurrency, 10, 2));
  end;
  FMsgDebito := TabContato.Value;
end;

procedure TFrmVendaPac.InspClienteEditPropertiesCloseUp(Sender: TObject);
begin
  MostraDebito;
end;

procedure TFrmVendaPac.InspDescontoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmVendaPac.InspItemChanged(Sender: TObject;
  AOldRow: TcxCustomRow; AOldCellIndex: Integer);
begin
  MostraDebito;
end;

procedure TFrmVendaPac.cmNovoCliClick(Sender: TObject);
var I: Integer;
begin
  I := TFrmCliente.Create(Self).Novo(nil, nil);
  if I>0 then
    TabContato.Value := I;
  I := Insp.FocusedRow.Index;
  Insp.FocusedRow := Insp.Rows[I+1];
  Insp.FocusedRow := Insp.Rows[I];
end;

procedure TFrmVendaPac.InspClienteEditors0EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'ICodigo';
end;

procedure TFrmVendaPac.InspClienteEditors1EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'IUsername';
end;

procedure TFrmVendaPac.InspClienteEditors2EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'INome';
end;

end.
