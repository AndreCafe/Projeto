unit uCMFrmVendaPac;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxInspRw, dxDBInRw, dxInspct, dxCntner, dxDBInsp, ExtCtrls, dxBar, Db,
  kbmMemTable, nxdb, cmClassesBase, dxExEdtr, dxInRwEx;

type
  TFrmVendaPac = class(TForm)
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
    cmNovoCli: TdxBarButton;
    TabDescrHoras: TStringField;
    TabCodPacote: TWordField;
    InspRow9: TdxInspectorDBImageRow;
    TabStatusPagto: TIntegerField;
    InspRow7: TdxInspectorLookupRow;
    TabNomeFunc: TStringField;
    InspNomeContato: TdxInspectorDBExtLookupRow;
    TabDebitoCli: TCurrencyField;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cmNovoCliClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InspNomeContatoCloseUp(Sender: TObject; var Text: String;
      var Accept: Boolean);
    procedure InspChangeNode(Sender: TObject; OldNode,
      Node: TdxInspectorNode);
  private
    { Private declarations }
  public
    FNovo : Boolean;
    FTab  : TnxTable;
    FMsgDebito : Integer;
    procedure Editar(aTab: TnxTable);
    procedure Novo(aTab: TnxTable);
    procedure MostraDebito;
    { Public declarations }
  end;

var
  FrmVendaPac: TFrmVendaPac;

implementation

uses uCMFrmPri, uCMDados, uCMFrmCliente, cmIDRecursos;

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

procedure TFrmVendaPac.Novo(aTab: TnxTable);
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

procedure TFrmVendaPac.TabCalcFields(DataSet: TDataSet);
begin
  TabTotalFinal.Value := TabValorL.Value - TabDesconto.Value;
end;

procedure TFrmVendaPac.FormCreate(Sender: TObject);
begin
  Tab.Active := True;
end;

procedure TFrmVendaPac.cmNovoCliClick(Sender: TObject);
begin
  TFrmCliente.Create(Self).Novo;
  Dados.tbCli.Refresh;
end;

procedure TFrmVendaPac.FormShow(Sender: TObject);
begin
  InspDesconto.ReadOnly := not Permitido(daTraDesconto);
  Dados.AjustaCampoLocalizaCli;
end;

procedure TFrmVendaPac.MostraDebito;
begin
  if not Dados.tbCOnfigNaoMostrarMsgDebito.Value then 
  if (FMsgDebito<>TabContato.Value) and (TabDebitoCli.Value > 0.009) then begin
    Beep;
    ShowMessage('Cliente possui débito de ' + FloatToStrF(TabDebitoCli.Value, ffCurrency, 10, 2));
  end;
  FMsgDebito := TabContato.Value;
end;

procedure TFrmVendaPac.InspNomeContatoCloseUp(Sender: TObject;
  var Text: String; var Accept: Boolean);
begin
  Accept := True;
  MostraDebito;
end;

procedure TFrmVendaPac.InspChangeNode(Sender: TObject; OldNode,
  Node: TdxInspectorNode);
begin
  MostraDebito;
end;

end.
