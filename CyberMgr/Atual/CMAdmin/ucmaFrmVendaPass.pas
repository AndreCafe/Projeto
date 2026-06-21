unit ucmaFrmVendaPass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, dxBar, Db,
  kbmMemTable, nxdb, cmClassesBase, dxBarExtItems,
  cxStyles, cxGraphics, cxEdit, cxDBLookupComboBox, cxMaskEdit, cxTextEdit,
  cxCurrencyEdit, cxImageComboBox, cxMemo, cxCalendar, cxCheckBox,
  cxDropDownEdit, cxVGrid, cxDBVGrid, cxControls, cxInplaceContainer,
  cxDBExtLookupComboBox, cxRadioGroup, cxTimeEdit, cxImage;

type
  TFrmVendaPass = class(TForm)
    BarMgr: TdxBarManager;
    Panel1: TPanel;
    dsTab: TDataSource;
    Tab: TkbmMemTable;
    TabContato: TIntegerField;
    TabNomeContato: TStringField;
    TabValor: TCurrencyField;
    TabDesconto: TCurrencyField;
    TabTotalFinal: TCurrencyField;
    TabValorL: TCurrencyField;
    TabUsuario: TStringField;
    TabNumero: TIntegerField;
    TabObs: TMemoField;
    TabInicio: TDateTimeField;
    TabDataPagto: TDateTimeField;
    TabCodPacote: TWordField;
    TabStatusPagto: TIntegerField;
    TabNomeFunc: TStringField;
    TabNomePass: TStringField;
    tPass: TnxTable;
    TabDebitoCli: TCurrencyField;
    TabSenha: TStringField;
    TabPPCodPacote: TIntegerField;
    TabTempoSeg: TIntegerField;
    TabMinutos: TIntegerField;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    Insp: TcxDBVerticalGrid;
    InspSenha: TcxDBEditorRow;
    InspNomePass: TcxDBEditorRow;
    InspMinutos: TcxDBEditorRow;
    InspValorL: TcxDBEditorRow;
    InspDesconto: TcxDBEditorRow;
    InspTotalFinal: TcxDBEditorRow;
    InspStatusPagto: TcxDBEditorRow;
    InspObs: TcxDBEditorRow;
    InspNomeFunc: TcxDBEditorRow;
    InspInicio: TcxDBEditorRow;
    cmNovoCli: TdxBarLargeButton;
    InspNomeCli: TcxDBMultiEditorRow;
    TabUsernameCliente: TStringField;
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
    procedure InspNomeCliEditPropertiesCloseUp(Sender: TObject);
    procedure InspItemChanged(Sender: TObject; AOldRow: TcxCustomRow;
      AOldCellIndex: Integer);
    procedure InspSenhaEditPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cmNovoCliClick(Sender: TObject);
    procedure InspNomeCliEditors0EditPropertiesInitPopup(Sender: TObject);
    procedure InspNomeCliEditors2EditPropertiesInitPopup(Sender: TObject);
    procedure InspNomeCliEditors1EditPropertiesInitPopup(Sender: TObject);
  private
    { Private declarations }
    function AchaCod(S: String): Boolean;
    function SenhaValida(S: String): Boolean;
    procedure AjustaPreImp;
  public
    FNovo : Boolean;
    FTab  : TnxTable;
    FMsgDebito : Integer;
    FPreImp : Boolean;
    FSenhaAnt : String;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable; aContato: Integer; aPreImp: Boolean);
    procedure MostraDebito;
    { Public declarations }
  end;

var
  FrmVendaPass: TFrmVendaPass;

implementation

uses ucmaPri, ucmaDM, ucmaFrmCliente, cmIDRecursos, cmAuxPassaporte;

{$R *.DFM}

procedure TFrmVendaPass.cmGravarClick(Sender: TObject);
var
  ContatoAnt : Integer; 
  M : TCMMaquina;
  P : TPassaporte;
begin
  PostInspectors(Self);
  TabValor.Value := TabValorL.Value;
  if FPreImp then
    TabCodPacote.Value := TabPPCodPacote.Value;
  TabSenha.Value := UpperCase(TabSenha.Value);  
  Tab.Post;

  Dados.tbCli.IndexName := 'ICodigo';
  
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
      
      if FPreImp then begin
        if not SenhaValida(TabSenha.Value) then begin
          Beep;
          ShowMessage('O código pré-impresso digitado não foi encontrado ou já foi vendido');
          Exit;
        end;
      end else
      if not tbTipoPass.FindKey([TabCodPacote.Value]) then begin
        Beep;
        ShowMessage('Não foi informado o Tipo de Passaporte que está sendo vendido!');
        Exit;
      end;

      tbCli.IndexName := 'ICodigo';
      if (TabContato.Value=0) then begin
        if not FPreImp then begin
          Beep;
          ShowMessage('É necessário selecionar 1 cliente');
          Exit;
        end  
      end else
      if not tbCli.FindKey([TabContato.Value]) then begin
        Beep;
        ShowMessage('Cliente não encontrado!');  
        Exit;
      end;
    end;  
  
    with Dados do begin
      DB.StartTransactionWith([tbCli, FTab, tbPass]);
      try
        if TabContato.Value > 0 then 
          tbCli.Edit;

        if FPreImp then
          P.LoadFromDataset(tbPass)
        else  
          P.LoadFromDataset(tbTipoPass);
          
        P.pcPrimeiroUso := 0;
        P.pcSegundos := 0;
        P.pcAcessos := 0;
        P.pcExpirou := False;
        P.pcValido := True;
        P.pcCliente := TabContato.Value;
        
        if not FNovo then begin
          FTab.Edit;
          ContatoAnt := FTab.FieldByName('Contato').AsInteger;
          tbPass.Edit;
        end else begin
          FTab.Insert;
          ContatoAnt := 0;
          if FPreImp then
            tbPass.Edit
          else
            tbPass.Insert;
        end;
        FTab.FieldByName('Contato').AsInteger := TabContato.Value;
        FTab.FieldByName('CaixaI').AsInteger := NumAberto;
        FTab.FieldByName('CaixaF').AsInteger := NumAberto;
        FTab.FieldByName('NaoUsarPacote').AsBoolean := FPreImp;
        
        if TabStatusPagto.Value=spPago then begin
          FTab.FieldByName('CaixaP').AsInteger := NumAberto;
          if FTab.FieldByName('DataPagto').IsNull then 
            FTab.FieldByName('DataPagto').AsDateTime := Now;
        end else begin
          FTab.FieldByName('CaixaP').AsInteger := 0;
          FTab.FieldByName('DataPagto').Clear;
        end;

        FTab.FieldByName('CodPacote').AsInteger := TabCodPacote.Value;
        FTab.FieldByname('Desconto').AsFloat := TabDesconto.Value;
        FTab.FieldByName('Tipo').AsInteger := ttVendaPassaporte;
        FTab.FieldByName('Valor').AsFloat := TabValorL.Value;
        FTab.FieldByName('StatusPagto').AsInteger := TabStatusPagto.Value;
        FTab.FieldByName('Nome').AsString := TabNomeContato.Value;
        FTab.FieldByName('FuncI').AsString := TabUsuario.Value;
        FTab.FieldByName('FuncF').AsString := TabUsuario.Value;
        FTab.FieldByName('Obs').Value := TabObs.Value;
        FTab.FieldByName('Isento').Value := False;
        FTab.FieldByName('Inicio').Value := TabInicio.Value;
        FTab.FieldByName('Fim').Value := TabInicio.Value;
        FTab.FieldByName('ValorFinalAcesso').AsFloat := TabTotalFinal.Value;
        FTab.Post;

        P.SaveToDataset(tbPass);
        tbPass.FieldByName('DataCompra').AsDateTime := TabInicio.Value;
        tbPass.FieldByName('Transacao').AsInteger := FTab.FieldByName('Numero').AsInteger;
        tbPass.Post;

        if not FPreImp then begin
          P.pcNumero := tbPass.FieldByName('Numero').AsInteger;
          P.pcSenha := P.GeraSenha;
          tbPass.Edit;
          tbPass.FieldByName('Senha').AsString := P.pcSenha;
          tbPass.Post;
        end else
          if (not FNovo) and (FSenhaAnt <> TabSenha.Value) and tbPass.Locate('Senha', FSenhaAnt, []) then 
          begin
            tbPass.Edit;
            tbPass.FieldByName('Valido').AsBoolean := False;
            tbPass.FieldByName('Cliente').Clear;
            tbPass.FieldByName('DataCompra').Clear;
            tbPass.FieldByName('Transacao').Clear;
            tbPass.Post;
          end;
        

        if TabContato.Value > 0 then begin
          TotalizaDebCli(FTab.FieldByName('Contato').AsInteger);

          if (TabStatusPagto.Value = spDebitado) and tbCliTemDebito.Value and
             (tbCliDebito.Value>LimiteDebito(tbCliLimiteDebito))
          then 
            Raise Exception.Create('Não é possível deixar essa operação em débito. Débito máximo permitido foi ultrapassado');
          
          if (ContatoAnt <> FTab.FieldByName('Contato').AsInteger) and (ContatoAnt>0) then
            TotalizaDebCli(ContatoAnt);
        end;    

        DB.Commit;

        if TabContato.Value > 0 then begin
          M := Dados.CM.Maquinas.PorContato[TabContato.Value];
          with Dados.CM do 
          if M <> nil then begin
            M.AtualizaCache;
            LePassaportesCliTran(tbPass, tbHistPass, M.TipoAcesso, M.Contato, M.Acesso, M.Passaportes);
            M.CreditoCli := ObtemCred(tbCli.FieldByName('CreditoM').AsInteger);
            M.LiberaAlemPacote := (Config.EncerramentoPrePago=eppContinuarEmPosPago);
            SalvaAlteracoesObj(M, False);
          end;  
        end;  
            
      except
        FTab.Cancel;
        if tbCli.State=dsEdit then
          tbCli.Cancel;
        tbPass.Cancel;
        DB.Rollback;
        Raise;
      end;
    end;  
  finally
    FTab.EnableControls;
  end;    
  
  Close;
end;

procedure TFrmVendaPass.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmVendaPass.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : if ssCtrl in Shift then cmGravarClick(nil);
    Key_Esc   : Close;
  end;
end;

procedure TFrmVendaPass.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVendaPass.Editar(aTab: TnxTable);
begin
  FNovo := False;
  FTab := aTab;
{  cmGravar.Enabled := PodeEditarTran(FTab);}
  cmGravar.Enabled := False;

  FPreImp := FTab.FieldByName('NaoUsarPacote').AsBoolean;
  AjustaPreImp;
  
  Tab.Insert;
  TabNumero.Value        := FTab.FieldByName('Numero').AsInteger;
  TabContato.Value       := FTab.FieldByName('Contato').asInteger;
  TabDesconto.Value      := FTab.FieldByname('Desconto').AsFloat;
  TabValor.Value         := FTab.FieldByName('Valor').AsFloat;
  TabUsuario.Value       := FTab.FieldByName('FuncI').AsString;
  TabObs.Value           := FTab.FieldByName('Obs').Value;
  TabInicio.AsVariant    := FTab.FieldByName('Inicio').Value;
  TabDataPagto.AsVariant := FTab.FieldByName('DataPagto').Value;
  TabCodPacote.AsVariant := FTab.FieldByName('CodPacote').Value;
  TabStatusPagto.Value   := FTab.FieldByName('StatusPagto').Value;

  if (not tPass.Locate('Transacao', TabNumero.Value, [])) or
     (tPass.FieldByName('Acessos').AsInteger>0) then
    cmGravar.Enabled := False;

  TabSenha.Value := tPass.FieldByName('Senha').AsString;  
  FSenhaAnt := TabSenha.Value;

  Tab.Post;
  Tab.Edit;
  ShowModal;
end;

procedure TFrmVendaPass.Novo(aTab: TnxTable; aContato: Integer; aPreImp: Boolean);
begin
  FPreImp := aPreImp;
  AjustaPreImp;
  FNovo := True;
  FSenhaAnt := '';
  FTab := aTab;
  Tab.Insert;
  TabUsuario.Value := Dados.CM.Username;
  TabInicio.Value := Now;
  TabDataPagto.Value := Date;
  TabStatusPagto.Value := spPago;
  TabContato.Value := aContato;
  ShowModal;
end;

procedure TFrmVendaPass.TabCalcFields(DataSet: TDataSet);
begin
  TabTotalFinal.Value := TabValorL.Value - TabDesconto.Value;
  TabMinutos.Value := TabTempoSeg.Value div 60;
end;

procedure TFrmVendaPass.FormCreate(Sender: TObject);
begin
  with Dados, InspNomeCli.Properties do 
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

  FSenhaAnt := '';
  tPass.Open;
end;

procedure TFrmVendaPass.FormShow(Sender: TObject);
begin
  Dados.AjustaCampoLocalizaCli;
  Insp.SetFocus;
  Insp.FocusedRow := InspObs;
  if FPreImp then 
    Insp.FocusedRow := InspSenha
  else  
  if TabContato.Value > 0 then
    Insp.FocusedRow := InspNomePass
  else
    Insp.FocusedRow := InspNomeCli;  
end;

procedure TFrmVendaPass.MostraDebito;
begin
  if not Dados.tbCOnfigNaoMostrarMsgDebito.Value then 
  if (FMsgDebito<>TabContato.Value) and (TabDebitoCli.Value > 0.009) then begin
    Beep;
    ShowMessage('Cliente possui débito de ' + FloatToStrF(TabDebitoCli.Value, ffCurrency, 10, 2));
  end;
  FMsgDebito := TabContato.Value;
end;

function TFrmVendaPass.AchaCod(S: String): Boolean;
begin
  Result := False;
  with Dados.tbPass do 
  if Locate('Senha', S, []) then 
    if not FieldByName('Valido').AsBoolean then
      Result := True;
end;

procedure TFrmVendaPass.AjustaPreImp;
begin
  if FPreImp then begin
    InspNomePass.Visible := False;
    TabValorL.KeyFields := 'Senha';
    TabValorL.LookupDataSet := tPass;
    TabValorL.LookupKeyFields := 'Senha';
    TabValorL.LookupResultField := 'Valor';

    TabTempoSeg.KeyFields := 'Senha';
    TabTempoSeg.LookupDataSet := Dados.tbPass;
    TabTempoSeg.LookupKeyFields := 'Senha';
    TabTempoSeg.LookupResultField := 'MaxSegundos';
    Caption := 'Venda de Cartão Pré-Pago';
    cmNovoCli.Visible := ivNever;
    InspNomeCli.Visible := True;
  end else 
    InspSenha.Visible := False;
  Tab.Active := True;
end;

function TFrmVendaPass.SenhaValida(S: String): Boolean;
begin
  S := UpperCase(S);
  Result := (S<>'') and ((S=FSenhaAnt) or AchaCod(S));
end;

procedure TFrmVendaPass.InspNomeCliEditPropertiesCloseUp(Sender: TObject);
begin
  MostraDebito;
end;

procedure TFrmVendaPass.InspDescontoPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties.ReadOnly := not Permitido(daTraDesconto);
end;

procedure TFrmVendaPass.InspItemChanged(Sender: TObject;
  AOldRow: TcxCustomRow; AOldCellIndex: Integer);
begin
  MostraDebito;
end;

procedure TFrmVendaPass.InspSenhaEditPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := not SenhaValida(DisplayValue);
  if Error then
    ErrorText := 'A senha digitada não foi encontrada ou já foi vendida';
end;

procedure TFrmVendaPass.cmNovoCliClick(Sender: TObject);
var I: Integer;
begin
  I := TFrmCliente.Create(Self).Novo(nil, nil);
  if I>0 then
    TabContato.Value := I;
  I := Insp.FocusedRow.Index;
  Insp.FocusedRow := Insp.Rows[I+1];
  Insp.FocusedRow := Insp.Rows[I];
end;

procedure TFrmVendaPass.InspNomeCliEditors0EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'ICodigo';
end;

procedure TFrmVendaPass.InspNomeCliEditors2EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'INome';
end;

procedure TFrmVendaPass.InspNomeCliEditors1EditPropertiesInitPopup(
  Sender: TObject);
begin
  Dados.tbCli.IndexName := 'ICodigo';
end;

end.
