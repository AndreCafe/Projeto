unit uCMFrmVendaPass;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp, ExtCtrls, dxBar, Db,
  kbmMemTable, nxdb, cmClassesBase, dxExEdtr, dxInRwEx;

type
  TFrmVendaPass = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    Panel1: TPanel;
    Insp: TdxDBInspector;
    dsTab: TDataSource;
    InspDesconto: TdxInspectorDBCurrencyRow;
    InspTotalFinal: TdxInspectorDBRow;
    InspDescrHoras: TdxInspectorLookupRow;
    InspValorL: TdxInspectorLookupRow;
    InspObs: TdxInspectorDBMemoRow;
    InspRow10: TdxInspectorDBDateRow;
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
    cmNovoCli: TdxBarButton;
    TabCodPacote: TWordField;
    InspRow9: TdxInspectorDBImageRow;
    TabStatusPagto: TIntegerField;
    InspRow7: TdxInspectorLookupRow;
    TabNomeFunc: TStringField;
    TabNomePass: TStringField;
    tPass: TnxTable;
    InspNomeContato: TdxInspectorDBExtLookupRow;
    TabDebitoCli: TCurrencyField;
    TabSenha: TStringField;
    InspSenha: TdxInspectorDBMaskRow;
    TabPPCodPacote: TIntegerField;
    TabTempoSeg: TIntegerField;
    TabMinutos: TIntegerField;
    InspRow11: TdxInspectorDBRow;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cmNovoCliClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InspChangeNode(Sender: TObject; OldNode,
      Node: TdxInspectorNode);
    procedure InspNomeContatoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure InspSenhaValidate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
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
    procedure Novo(aTab: TnxTable; aPreImp: Boolean);
    procedure MostraDebito;
    { Public declarations }
  end;

var
  FrmVendaPass: TFrmVendaPass;

implementation

uses uCMFrmPri, uCMDados, uCMFrmCliente, cmIDRecursos, cmAuxPassaporte;

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
  cmGravar.Enabled := PodeEditarTran(FTab);

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

procedure TFrmVendaPass.Novo(aTab: TnxTable; aPreImp: Boolean);
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
  ShowModal;
end;

procedure TFrmVendaPass.TabCalcFields(DataSet: TDataSet);
begin
  TabTotalFinal.Value := TabValorL.Value - TabDesconto.Value;
  TabMinutos.Value := TabTempoSeg.Value div 60;
end;

procedure TFrmVendaPass.FormCreate(Sender: TObject);
begin
  FSenhaAnt := '';
  tPass.Open;
end;

procedure TFrmVendaPass.cmNovoCliClick(Sender: TObject);
begin
  TFrmCliente.Create(Self).Novo;
  Dados.tbCli.Refresh;
end;

procedure TFrmVendaPass.FormShow(Sender: TObject);
begin
  Dados.AjustaCampoLocalizaCli;
  InspDesconto.ReadOnly := not Permitido(daTraDesconto);
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

procedure TFrmVendaPass.InspChangeNode(Sender: TObject; OldNode,
  Node: TdxInspectorNode);
begin
  MostraDebito;
end;
                                                                 
procedure TFrmVendaPass.InspNomeContatoCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
  Accept := True;
  MostraDebito;
end;

procedure TFrmVendaPass.InspSenhaValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  Accept := SenhaValida(TdxInspectorRow(Sender).Inspector.InplaceEditor.GetEditingText);
  if not Accept then
    ErrorText := 'A senha digitada não foi encontrada ou já foi vendida';
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
    InspDescrHoras.Visible := False;
    TabValorL.KeyFields := 'Senha';
    TabValorL.LookupDataSet := tPass;
    TabValorL.LookupKeyFields := 'Senha';
    TabValorL.LookupResultField := 'Valor';

    TabTempoSeg.KeyFields := 'Senha';
    TabTempoSeg.LookupDataSet := Dados.tbPass;
    TabTempoSeg.LookupKeyFields := 'Senha';
    TabTempoSeg.LookupResultField := 'MaxSegundos';
  end else begin
    InspSenha.Visible := False;
    Caption := 'Venda de Cartão Pré-Pago';
  end;
  Tab.Active := True;
end;

function TFrmVendaPass.SenhaValida(S: String): Boolean;
begin
  S := UpperCase(S);
  Result := (S<>'') and ((S=FSenhaAnt) or AchaCod(S));
end;

end.
