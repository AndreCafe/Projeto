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
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cmNovoCliClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab  : TnxTable;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable);
    { Public declarations }
  end;

var
  FrmVendaPass: TFrmVendaPass;

implementation

uses uCMFrmPri, uCMDados, uCMFrmCliente, cmIDRecursos;

{$R *.DFM}

procedure TFrmVendaPass.cmGravarClick(Sender: TObject);
var
  ContatoAnt : Integer; 
  M : TCMMaquina;
  P : TPassaporte;
begin
  PostInspectors(Self);
  TabValor.Value := TabValorL.Value;
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

      if not Dados.tbTipoPass.FindKey([TabCodPacote.Value]) then begin
        Beep;
        ShowMessage('Não foi informado o Tipo de Passaporte que está sendo vendido!');
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
      DB.StartTransactionWith([tbCli, FTab, tPass]);
      try
        tbCli.Edit;
        P.LoadFromDataset(Dados.tbTipoPass);
        P.pcPrimeiroUso := 0;
        P.pcSegundos := 0;
        P.pcAcessos := 0;
        P.pcExpirou := False;
        P.pcCliente := TabContato.Value;
        
        if not FNovo then begin
          FTab.Edit;
          ContatoAnt := FTab.FieldByName('Contato').AsInteger;
          tPass.Edit;
        end else begin
          FTab.Insert;
          ContatoAnt := 0;
          tPass.Insert;
          tPass.FieldByName('DataCompra').AsDateTime := Now;
        end;
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

        P.SaveToDataset(tPass);
        tPass.FieldByName('Transacao').AsInteger := FTab.FieldByName('Numero').AsInteger;
        tPass.Post;


        TotalizaDebCli(FTab.FieldByName('Contato').AsInteger);
        if (ContatoAnt <> FTab.FieldByName('Contato').AsInteger) and (ContatoAnt>0) then
          TotalizaDebCli(ContatoAnt);

        DB.Commit;

        M := Dados.CM.Maquinas.PorContato[TabContato.Value];
        with Dados.CM do 
        if M <> nil then begin
          M.AtualizaCache;
          M.CreditoCli := ObtemCred(tbCli.FieldByName('CreditoM').AsInteger);
          M.LiberaAlemPacote := not Config.PausarFimPacote;
          SalvaAlteracoesObj(M, False);
        end;  
            
      except
        FTab.Cancel;
        tbCli.Cancel;
        tPass.Cancel;
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
  if (not tPass.FindKey([FTab.FieldByName('Numero').AsInteger])) or
     (tPass.FieldByName('Acessos').AsInteger>0) then
    cmGravar.Enabled := False; 
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

  Tab.Post;
  Tab.Edit;
  ShowModal;
end;

procedure TFrmVendaPass.Novo(aTab: TnxTable);
begin
  FNovo := True;
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
end;

procedure TFrmVendaPass.FormCreate(Sender: TObject);
begin
  Tab.Active := True;
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
  InspDesconto.ReadOnly := not Permitido(reTransacoes, taTraDesconto);
end;

end.
