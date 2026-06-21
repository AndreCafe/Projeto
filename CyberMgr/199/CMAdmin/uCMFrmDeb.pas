unit uCMFrmDeb;

interface

uses
  Windows, Messages, Variants, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxCntner, dxEditor, dxEdLib, dxDBELib, OvcBase, OvcRLbl, OvcPLb,
  dxExEdtr, dxDBEdtr, dxBar, StdCtrls, OvcEditF, OvcEdPop, OvcEdCal,
  OvcDbDat, DBCtrls, OvcPB, OvcPF, OvcDbPF, OvcEF, OvcSF, OvcDbSF, ExtCtrls,
  ComCtrls, OvcDbDLb, dxTL, dxDBCtrl, dxDBGrid, lmdcctrl, lmdctrl,
  lmdstdcS, Lmddbctr, Db, kbmMemTable, dxDBTLCl, dxGrClms, 
  lmdgroup, lmddbctA, nxdb, dxGrClEx,
  Mask, dxInspRw, dxDBInRw, dxInspct, dxDBInsp,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomLabel, LMDLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, OvcNF, OvcDbNF,
  dxBarExtItems,
  LMDCustomSimpleLabel, LMDSimpleLabel, dxInRwEx;

type
  TMeuCurrencyEdit = class(TdxInplaceCurrencyEdit);
  TMeuMaskEdit     = class(TdxInplaceMaskEdit);
  
  TFrmDeb = class(TForm)
    BarMgr: TdxBarManager;
    mtItens: TkbmMemTable;
    dsItens: TDataSource;
    dsTran: TDataSource;
    panCab2: TLMDSimplePanel;
    InspCab: TdxDBInspector;
    InspCabDiaHora: TdxInspectorDBMaskRow;
    Timer1: TTimer;
    OvcController1: TOvcController;
    tTran: TnxTable;
    tTranNumero: TAutoIncField;
    tTranCaixaI: TIntegerField;
    tTranCaixaF: TIntegerField;
    tTranCaixaP: TIntegerField;
    tTranTipoAcesso: TWordField;
    tTranInicio: TDateTimeField;
    tTranFim: TDateTimeField;
    tTranDataPagto: TDateTimeField;
    tTranContato: TIntegerField;
    tTranNome: TStringField;
    tTranMaquina: TWordField;
    tTranTipo: TWordField;
    tTranFuncI: TStringField;
    tTranFuncF: TStringField;
    tTranTempo: TDateTimeField;
    tTranTempoCobrado: TDateTimeField;
    tTranCredUsado: TIntegerField;
    tTranCredAnterior: TIntegerField;
    tTranDesconto: TCurrencyField;
    tTranProdutos: TCurrencyField;
    tTranValor: TCurrencyField;
    tTranObs: TMemoField;
    tTranIsento: TBooleanField;
    tTranNaoUsarPacote: TBooleanField;
    tTranCodPacote: TWordField;
    tTranSinal: TCurrencyField;
    tTranTransacaoVinculada: TIntegerField;
    tTranValorFinalAcesso: TCurrencyField;
    tTranDescontoProduto: TCurrencyField;
    tTranNumDoc: TStringField;
    tTranNomeContato: TStringField;
    tTranNomeFunc: TStringField;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    panTotais: TLMDSimplePanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    LMDSimplePanel5: TLMDSimplePanel;
    tTranTotalFinal: TCurrencyField;
    tTranStatusPagto: TWordField;
    Grid: TdxDBGrid;
    GridPagar: TdxDBGridCheckColumn;
    GridMaquina: TdxDBGridMaskColumn;
    GridData: TdxDBGridDateColumn;
    GridInicio: TdxDBGridTimeColumn;
    GridTempo: TdxDBGridTimeColumn;
    GridTipoTran: TdxDBGridImageColumn;
    GridTotal: TdxDBGridCurrencyColumn;
    mtItensPagar: TBooleanField;
    mtItensMaquina: TIntegerField;
    mtItensHora: TTimeField;
    mtItensData: TDateField;
    mtItensNumTran: TIntegerField;
    mtItensTipo: TIntegerField;
    cmSelTodos: TdxBarButton;
    cmSelNenhum: TdxBarButton;
    tItens: TnxTable;
    mtTran: TkbmMemTable;
    mtTranContato: TIntegerField;
    mtTranNomeContato: TStringField;
    mtTranData: TDateTimeField;
    mtTranUsuario: TStringField;
    mtTranNomeUsuario: TStringField;
    mtTranDebSel: TCurrencyField;
    mtTranDesconto: TCurrencyField;
    mtTranTotalFinal: TCurrencyField;
    mtTranObs: TMemoField;
    mtTranDebTot: TCurrencyField;
    InspCabRow4: TdxInspectorLookupRow;
    mtTranCaixa: TIntegerField;
    mtItensTotal: TCurrencyField;
    mtItensVendas: TCurrencyField;
    mtItensAcesso: TCurrencyField;
    mtItensDescProd: TCurrencyField;
    tItensNumero: TAutoIncField;
    tItensCaixaI: TIntegerField;
    tItensCaixaF: TIntegerField;
    tItensCaixaP: TIntegerField;
    tItensTipoAcesso: TWordField;
    tItensInicio: TDateTimeField;
    tItensFim: TDateTimeField;
    tItensDataPagto: TDateTimeField;
    tItensContato: TIntegerField;
    tItensNome: TStringField;
    tItensMaquina: TWordField;
    tItensTipo: TWordField;
    tItensFuncI: TStringField;
    tItensFuncF: TStringField;
    tItensTempo: TDateTimeField;
    tItensTempoCobrado: TDateTimeField;
    tItensCredUsado: TIntegerField;
    tItensCredAnterior: TIntegerField;
    tItensDesconto: TCurrencyField;
    tItensProdutos: TCurrencyField;
    tItensValor: TCurrencyField;
    tItensObs: TMemoField;
    tItensIsento: TBooleanField;
    tItensNaoUsarPacote: TBooleanField;
    tItensCodPacote: TWordField;
    tItensSinal: TCurrencyField;
    tItensTransacaoVinculada: TIntegerField;
    tItensValorFinalAcesso: TCurrencyField;
    tItensDescontoProduto: TCurrencyField;
    tItensNumDoc: TStringField;
    tItensStatusPagto: TWordField;
    mtItensAcessoSel: TCurrencyField;
    mtItensVendaSel: TCurrencyField;
    mtItensDebVendas: TCurrencyField;
    mtItensDebAcesso: TCurrencyField;
    mtItensTempo: TTimeField;
    mtTranNumero: TIntegerField;
    cmEmDeb: TdxBarStatic;
    LMDLabel1: TLMDLabel;
    edObs: TDBMemo;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    LMDSimpleLabel1: TLMDSimpleLabel;
    LMDSimpleLabel2: TLMDSimpleLabel;
    LMDSimpleLabel3: TLMDSimpleLabel;
    edSubTotal: TdxDBCurrencyEdit;
    edDesconto: TdxDBCurrencyEdit;
    edTotalFinal: TdxDBCurrencyEdit;
    dxEditStyleController1: TdxEditStyleController;
    LMDSimpleLabel4: TLMDSimpleLabel;
    dxDBCurrencyEdit1: TdxDBCurrencyEdit;
    LMDSimplePanel7: TLMDSimplePanel;
    InspCabRow3: TdxInspectorDBExtLookupRow;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tTranCalcFields(DataSet: TDataSet);
    procedure mtItensCalcFields(DataSet: TDataSet);
    procedure cmSelTodosClick(Sender: TObject);
    procedure cmSelNenhumClick(Sender: TObject);
    procedure GridPagarToggleClick(Sender: TObject; const Text: String;
      State: TdxCheckBoxState);
    procedure mtTranCalcFields(DataSet: TDataSet);
    procedure edDescontoChange(Sender: TObject);
    procedure GridCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure FormShow(Sender: TObject);


  private
    procedure LeItens(Novos: Boolean);
    procedure SalvaItens;
    { Private declarations }
  public
    { Public declarations }
    FDebVendas : Double;
    FDebAcesso : Double;
    FSelVendas : Double;
    FSelAcesso : Double;

    procedure Editar(Num: Integer);
    procedure Criar(Contato: Integer);
  end;

var
  FrmDeb: TFrmDeb;
  
implementation

uses uCMFrmConfig, uCMDados, uCMFrmPri, cmClassesBase;


{$R *.DFM}

procedure TFrmDeb.cmGravarClick(Sender: TObject);
begin
  PostInspectors(Self);
  if mtTranDesconto.Value > mtTranTotalFinal.Value then begin
    Beep;
    ShowMessage('O Valor do desconto não pode ser maior que o total à pagar!');
    Exit;
  end;
  if mtTranDebSel.Value<0.00001 then begin
    Beep;
    ShowMessage('Não foi selecionado nenhuma transação para pagamento');
    Exit;
  end;  

  Dados.DB.StartTransactionWith([tItens, tTran, Dados.tbCli]);
  try
    if mtTranNumero.Value>0 then
      tTran.Edit
    else begin
      tTran.Insert;
      tTranTipo.Value := ttPagtoDebito;
      tTranInicio.Value := mtTranData.Value;
      tTranFuncI.Value := mtTranUsuario.Value;
      tTranFim.Value := mtTranData.Value;
      tTranFuncF.Value := mtTranUsuario.Value;
      tTranDataPagto.Value := mtTranData.Value;
      tTranCaixaI.Value := NumAberto;
      tTranCaixaF.Value := NumAberto;
      tTranCaixaP.Value := NumAberto;
      tTranContato.Value := mtTranContato.Value;
      tTranNome.Value := mtTranNomeContato.Value;
      tTranStatusPagto.Value := spPago;
    end;
    tTranObs.Value := mtTranObs.Value;
    tTranValor.Value := FSelAcesso;
    tTranProdutos.Value := FSelVendas;
    tTranDesconto.Value := DuasCasas(mtTranDesconto.Value / mtTranTotalFinal.Value) * FSelAcesso;
    tTranDescontoProduto.Value := mtTranDesconto.Value - tTranDesconto.Value;
    tTranValorFinalAcesso.Value := tTranValor.Value - tTranDesconto.Value;
    tTran.Post;
    SalvaItens;
    Dados.TotalizaDebCli(tTranContato.Value);
    Dados.DB.Commit;
  except;
    Dados.DB.Rollback;
    Raise;
  end;
  if Sender<>nil then Close;
end;

procedure TFrmDeb.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmDeb.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrmDeb.FormCreate(Sender: TObject);
begin
  FDebVendas := 0;
  FDebAcesso := 0;
  FSelVendas := 0;
  FSelAcesso := 0;
  tItens.Open;
  tTran.Open;
  mtTran.Open;
  mtItens.Open;
end;

procedure TFrmDeb.LeItens(Novos: Boolean);
begin
  tItens.CancelRange;
  if Novos then begin
    tItens.IndexName := 'IDebito';
    tItens.SetRange([mtTranContato.Value, spDebitado, 0],
                    [mtTranContato.Value, spDebitado, 0]);
  end else begin
    tItens.IndexName := 'ITransacaoVinculada';
    tItens.SetRange([tTranNumero.Value], [tTranNumero.Value]);
  end;

  tItens.First;
  while not tItens.Eof do begin
    mtItens.Append;
    mtItensPagar.Value := (not Novos);
    mtItensMaquina.Value := tItensMaquina.Value;
    mtItensData.Value := tItensInicio.Value;
    mtItensHora.Value := tItensInicio.Value;
    mtItensTempo.Value := tItensTempo.Value;
    mtItensTipo.Value := tItensTipo.Value;
    mtItensVendas.Value := tItensProdutos.Value - tItensDescontoProduto.Value;
    mtItensAcesso.Value := tItensValorFinalAcesso.Value;
    mtItensNumTran.Value := tItensNumero.Value;
    mtItens.Post;
    tItens.Next;
  end;
  
  mtItens.First;
end;

procedure TFrmDeb.SalvaItens;
begin
  mtItens.First;
  tItens.CancelRange;
  tItens.IndexName := 'INumero';
  while not mtItens.Eof do begin
    if tItens.FindKey([mtItensNumTran.Value]) then begin
      tItens.Edit;
      if mtItensPagar.Value then begin
        tItensCaixaP.Value := tTranCaixaP.Value;
        tItensDataPagto.Value := tTranDataPagto.Value;
        tItensTransacaoVinculada.Value := tTranNumero.Value;
      end else begin
        tItensCaixaP.Value := 0;
        tItensDataPagto.Clear;
        tItensTransacaoVinculada.Value := 0;
      end;
      tItens.Post;
    end;
    mtItens.Next;
  end;
end;

procedure TFrmDeb.Editar(Num: Integer);
begin
  with tTran do
  if tTran.FindKey([Num]) then begin
    mtTran.Insert;
    mtTranContato.Value := tTranContato.Value;
    mtTranData.Value := tTranInicio.Value;
    mtTranUsuario.Value := tTranFuncI.Value;
    mtTranDesconto.Value := tTranDesconto.Value + tTranDescontoProduto.Value;
    mtTranObs.Value := tTranObs.Value;
    mtTranCaixa.Value := tTranCaixaP.Value;
    mtTranNumero.Value := tTranNumero.Value;
    LeItens(False);
    if (tTranCaixaP.Value=NumAberto) then
      LeItens(True)
    else
      cmGravar.Enabled := False;
    
    ShowModal;
  end else begin
    Beep;
    ShowMessage('Item não encontrado!');
    Free;
  end;  
end;

procedure TFrmDeb.Criar(Contato: Integer);
begin
  mtTran.Insert;
  mtTranContato.Value := Contato;
  mtTranData.Value := Now;
  mtTranUsuario.Value := Dados.CM.Username;
  mtTranNumero.Value := 0;
  if NumAberto<1 then
    cmGravar.Enabled := False;
  LeItens(True);  
  ShowModal;
end;


procedure TFrmDeb.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter :
    if ssCtrl in Shift then begin
      cmGravarClick(cmGravar);
      Key := 0;
    end;
    Key_Esc   : Close;
  end;
end;

procedure TFrmDeb.tTranCalcFields(DataSet: TDataSet);
begin
  tTranTotalFinal.Value := tTranProdutos.Value - tTranDesconto.Value;
end;

procedure TFrmDeb.mtItensCalcFields(DataSet: TDataSet);
begin
  FDebVendas := FDebVendas - mtItensDebVendas.Value;
  FDebAcesso := FDebAcesso - mtItensDebAcesso.Value;
  FSelVendas := FSelVendas - mtItensVendaSel.Value;
  FSelAcesso := FSelAcesso - mtItensAcessoSel.Value;

  mtItensDebVendas.Value := mtItensVendas.Value;
  mtItensDebAcesso.Value := mtItensAcesso.Value;
  if mtItensPagar.Value then begin
    mtItensAcessoSel.Value := mtItensAcesso.Value;
    mtItensVendaSel.Value := mtItensVendas.Value;
  end else begin
    mtItensAcessoSel.Value := 0;
    mtItensVendaSel.Value := 0;
  end;

  FDebVendas := FDebVendas + mtItensDebVendas.Value;
  FDebAcesso := FDebAcesso + mtItensDebAcesso.Value;
  FSelVendas := FSelVendas + mtItensVendaSel.Value;
  FSelAcesso := FSelAcesso + mtItensAcessoSel.Value;
  mtItensTotal.Value := mtItensVendas.Value + mtItensAcesso.Value;

  if not (mtTran.State in [dsInsert, dsEdit]) then
    mtTran.Edit;

  mtTranDebTot.Value := FDebVendas + FDebAcesso;
  mtTranDebSel.Value := FSelVendas + FSelAcesso;
end;

procedure TFrmDeb.cmSelTodosClick(Sender: TObject);
begin
  mtItens.First;
  while not mtItens.Eof do begin
    mtItens.Edit;
    mtItensPagar.Value := True;
    mtItens.Post;
    mtItens.Next;
  end;
end;

procedure TFrmDeb.cmSelNenhumClick(Sender: TObject);
begin
  mtItens.First;
  while not mtItens.Eof do begin
    mtItens.Edit;
    mtItensPagar.Value := False;
    mtItens.Post;
    mtItens.Next;
  end;
end;

procedure TFrmDeb.GridPagarToggleClick(Sender: TObject; const Text: String;
  State: TdxCheckBoxState);
begin
  mtItensPagar.Value := (State=cbsChecked);
end;

procedure TFrmDeb.mtTranCalcFields(DataSet: TDataSet);
begin
  mtTranTotalFinal.Value := mtTranDebSel.Value - mtTranDesconto.Value;
end;

procedure TFrmDeb.edDescontoChange(Sender: TObject);
begin
  mtTranDesconto.Value := edDesconto.Value;
end;

procedure TFrmDeb.GridCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
  var ADone: Boolean);
var V: Variant;
begin
  V := ANode.Values[gridPagar.Index];
  if (V<>Null) and (V=True) then
    AFont.Style := [fsBold];
end;

procedure TFrmDeb.FormShow(Sender: TObject);
begin
  Dados.AjustaCampoLocalizaCli;
end;

end.




