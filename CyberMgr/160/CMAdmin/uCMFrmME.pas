unit uCMFrmME;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
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
  LMDCustomSimpleLabel, LMDSimpleLabel;

type
  TMeuCurrencyEdit = class(TdxInplaceCurrencyEdit);
  TMeuMaskEdit     = class(TdxInplaceMaskEdit);
  
  TFrmME = class(TForm)
    BarMgr: TdxBarManager;
    mtItens: TkbmMemTable;
    mtItensQuant: TFloatField;
    mtItensUnitario: TCurrencyField;
    mtItensItem: TWordField;
    dsItens: TDataSource;
    dsTran: TDataSource;
    tMovEst: TnxTable;
    mtItensunidade: TStringField;
    panCab2: TLMDSimplePanel;
    InspCab: TdxDBInspector;
    InspCabUsuario: TdxInspectorDBMaskRow;
    InspCabDiaHora: TdxInspectorDBMaskRow;
    Timer1: TTimer;
    dsMovEst: TDataSource;
    mtItensNomePro: TStringField;
    OvcController1: TOvcController;
    tMovEstFatorSaldo: TIntegerField;
    tMovEstSaldo: TFloatField;
    mtItensTotal: TFloatField;
    mtItensProduto: TStringField;
    mtItensEstoqueAtual: TFloatField;
    cmNovoItem: TdxBarButton;
    cmApagarItem: TdxBarButton;
    tMovEstNumSeq: TAutoIncField;
    tMovEstTransacao: TIntegerField;
    tMovEstProduto: TStringField;
    tMovEstQuant: TFloatField;
    tMovEstUnitario: TCurrencyField;
    tMovEstTotal: TCurrencyField;
    tMovEstItem: TWordField;
    tMovEstDesconto: TCurrencyField;
    tMovEstDataMov: TDateTimeField;
    tMovEstDataPag: TDateTimeField;
    tMovEstEntrada: TBooleanField;
    tMovEstCancelado: TBooleanField;
    tMovEstEstoqueAnt: TFloatField;
    tMovEstTipoTran: TWordField;
    tMovEstContato: TIntegerField;
    tMovEstCaixaMov: TIntegerField;
    tMovEstCaixaPag: TIntegerField;
    tMovEstCategoria: TStringField;
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
    InspCab1: TdxDBInspector;
    InspCab1Cliente: TdxInspectorLookupRow;
    InspCab1Row2: TdxInspectorDBRow;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    gridItens: TdxDBGrid;
    gridItensProduto: TdxDBGridColumn;
    gridItensNomePro: TdxDBGridLookupColumn;
    gridItensEstoque: TdxDBGridMaskColumn;
    gridItensQuant: TdxDBGridMaskColumn;
    gridItensValor: TdxDBGridCurrencyColumn;
    gridItensTotal: TdxDBGridMaskColumn;
    panTotais: TLMDSimplePanel;
    cmGravar: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
    tTranTotalFinal: TCurrencyField;
    tTranStatusPagto: TWordField;
    dxEditStyleController1: TdxEditStyleController;
    LMDLabel1: TLMDLabel;
    edObs: TDBMemo;
    panTotal: TLMDSimplePanel;
    LMDSimpleLabel1: TLMDSimpleLabel;
    LMDSimpleLabel2: TLMDSimpleLabel;
    LMDSimpleLabel3: TLMDSimpleLabel;
    edSubTotal: TdxDBCurrencyEdit;
    edDesconto: TdxDBCurrencyEdit;
    edTotalFinal: TdxDBCurrencyEdit;
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimpleLabel4: TLMDSimpleLabel;
    edDebitar: TdxDBImageEdit;
    LMDSimplePanel7: TLMDSimplePanel;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Function  Valida: Boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mtItensAfterInsert(DataSet: TDataSet);
    procedure gridItensEnter(Sender: TObject);
    function ValidaLinha: Boolean;
    procedure gridItensChangeNodeEx(Sender: TObject);
    procedure InspTotaisRow3DrawCaption(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure InspTotaisRow3DrawValue(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure InspTotaisDescontoDrawValue(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure InspCabNomeCliDrawValue(Sender: TdxInspectorRow;
      ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
      var AColor: TColor; var ADone: Boolean);
    procedure gridItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InspCabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridItensExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridItensMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mtItensAfterDelete(DataSet: TDataSet);
    procedure gridItensItemGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure tMovEstCalcFields(DataSet: TDataSet);
    procedure gridItensNomeProValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mtItensCalcFields(DataSet: TDataSet);
    procedure mtItensBeforeDelete(DataSet: TDataSet);
    procedure mtItensProdutoValidate(Sender: TField);
    procedure mtItensProdutoChange(Sender: TField);
    procedure cmApagarItemClick(Sender: TObject);
    procedure cmNovoItemClick(Sender: TObject);
    procedure tTranCalcFields(DataSet: TDataSet);
    procedure tTranAfterInsert(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);


  private
    function SalvarItem: Boolean;

    procedure LeItens;
    procedure SalvaItens;
    { Private declarations }
  public
    { Public declarations }
    UltimaLin: Integer;
    FocouTipo : Boolean;
    FTotItens : Double;
    FTotAnt   : Double;
    UltimoCampo : String;
    SaveIndex : String;

    procedure Editar(Num: Integer);
    procedure Criar(TipoTran : Byte);
    function MesmoME(Num: Integer): Boolean;
  end;

var
  FrmME: TFrmME;
  
implementation

uses uCMFrmConfig, uCMDados, uCMFrmPri, cmClassesBase;


{$R *.DFM}

const
  EnterColor = $00F1E4E4;
       
procedure TFrmME.cmGravarClick(Sender: TObject);
var TF : Double;
begin
  PostInspectors(Self);
  Dados.tbPro.IndexName := 'ICodigo';
  InspCab1.SetFocus;
  if tTran.State in [dsInsert, dsEdit] then
  try
    with Dados do begin
      tbCaixa.IndexName := 'INumero';
      if not tbCaixa.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Caixa não encontrado!');
        Exit;
      end;
    end;

    if (tTranStatusPagto.Value=spDebitado) and (tTranContato.Value < 1) then begin
      Beep;
      ShowMessage('Para debitar é necessário informar o cliente');
      Exit;
    end;
    
    with Dados do
    DB.StartTransactionWith([tTran, tMovEst, tAuxMovEst, tbPro]);
    try
      if (tTran.State=dsInsert) then begin
        tTranInicio.Value := Now;
        tTranFim.Value := tTranInicio.Value;
        tTranFuncI.Value := Dados.CM.UA.Username;
        tTranFuncF.Value := Dados.CM.UA.Username;
      end;
      tTranNome.Value := tTranNomeContato.Value;
      tTranCaixaI.Value := NumAberto;
      tTranCaixaF.Value := tTranCaixaI.Value;

      if tTranStatusPagto.Value=spDebitado then begin
        tTranCaixaP.Value := 0;
        tTranDataPagto.Clear;
      end else begin
        tTranCaixaP.Value := NumAberto;
        tTranDataPagto.Value := tTranInicio.Value;
      end;  
      tTran.Post;

      SalvaItens;
      Dados.TotalizaDebCli(tTranContato.Value);

      Dados.DB.Commit;
    except
      tMovEst.Cancel;
      Dados.DB.RollBack;
      Raise;
    end;
  finally
  end;  
  
  if Sender<>nil then Close;
end;

Function TFrmME.Valida: Boolean;
begin
   Result:= true;
   if mtItens.RecordCount = 0 then
     Result:= false;
end;

procedure TFrmME.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmME.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tTran.Cancel;
  Action:= caFree;
end;

procedure TFrmME.FormCreate(Sender: TObject);
begin
  UltimoCampo := '';
  FTotItens := 0;
  FocouTipo := False;
  tMovEst.Open;
  tTran.Open;
  mtItens.Open;
  SaveIndex := Dados.tbCli.IndexName;
  DAdos.tbCli.IndexName := 'INome';
end;

procedure TFrmME.FormShow(Sender: TObject);
begin
  Dados.tbPro.IndexName := 'IDescricao';
  panTotal.Visible := (tTranTipo.Value in [ttEstCompra, ttEstVenda]);
  if panTotal.Visible then
    UltimoCampo := 'Unitario'
  else
    UltimoCampo := 'Quant';
      
  edDebitar.Visible := (tTranTipo.Value=ttEstVenda);
  gridItensValor.Visible := panTotal.Visible;
  gridItensTotal.Visible := panTotal.Visible;
  mtItens.Append;
  case tTranTipo.Value of
    ttEstVenda  : Caption := 'Venda Avulsa';
    ttEstCompra : begin
      Caption := 'Compra';
      InspCab1Cliente.Caption := 'Fornecedor';
      gridItensValor.Caption := 'Custo Unitário';
    end;
    ttEstEntrada: begin
      Caption := 'Entrada de Produtos';
      InspCab1Cliente.Visible := False;
    end;
    ttEstSaida  : begin
      Caption := 'Saída de Produtos';
      InspCab1Cliente.Visible := False;
    end;  
  end;
end;

procedure TFrmME.mtItensAfterInsert(DataSet: TDataSet);
begin
  mtItensItem.Value := mtItens.RecordCount+1;
  mtItensQuant.Value := 1;
end;

function TFrmME.SalvarItem: Boolean;
begin
  Result := 
    (mtItensProduto.Value > '') and
    (mtItensQuant.Value > 0.0009);
end;

procedure TFrmME.LeItens;
var Item: Integer;
begin
  mtItens.EmptyTable;
  tMovEst.SetRange([tTranNumero.Value], [tTranNumero.Value]);
  Item := 0;
  mtItens.DisableControls;
  try
    tMovEst.First;
    while not tMovEst.Eof do begin
      Inc(Item);
      mtItens.Append;
      mtItensItem.Value := Item;
      mtItensProduto.Value := tMovEstProduto.Value;
      mtItensQuant.Value := tMovEstQuant.Value;
      mtItensUnitario.Value := tMovEstUnitario.Value;
      mtItens.Post;
      tMovEst.Next;
    end;
  finally
    mtItens.EnableControls;
  end;    
end;

procedure TFrmME.SalvaItens;
var 
  I, Tipo, Contador, Ultimo : Integer;
  Data : TDateTime;
  Produto : String;
  NumSeq : Integer;
  DescFinal, Fator : Double;
  Custo, 
  Mov,
  SaldoAnt: Extended;

function ApagouProduto: Boolean;
begin
  Result := False;
  mtItens.First;
  while not mtItens.Eof do begin
    if (mtItensProduto.Value = tMovEstProduto.Value) and SalvarItem then 
      Exit;
    mtItens.Next;
  end;
  Result := True;
end;
  
begin
  if (tTranProdutos.Value > 0.009) and (tTranDescontoProduto.Value > 0.009) then
    Fator := (tTranDescontoProduto.Value / tTranProdutos.Value)
  else
    Fator := 0;

  DescFinal := tTranDescontoProduto.Value;  
    
  tMovEst.SetRange([tTranNumero.Value], [tTranNumero.Value]);
  tMovEst.First;
  while not (tMovEst.Eof and tMovEst.Bof) do begin
    if ApagouProduto then begin
      Data := tMovEstDataMov.Value;
      Produto := tMovEstProduto.Value;
      NumSeq := tMovEstNumSeq.Value;
    end else
      Produto := '';

    if (not tMovEstCancelado.Value) then begin
      Mov := tMovEstFatorSaldo.Value * tMovEstQuant.Value;
      Dados.AjustaEstoqueProduto(tMovEstProduto.Value, 0, (-1 * Mov));
    end;

    SaldoAnt := tMovEstEstoqueAnt.Value;                                 
    tMovEst.Delete;
    
    if Produto <> '' then 
      Dados.AjustaSaldoPosterior(Produto, Data, NumSeq, SaldoAnt);
  end;  
  
  mtItens.DisableControls;
  
  Ultimo := 0;
  Contador := 0;
  mtItens.First;
  while not mtItens.Eof do begin
    Inc(Contador);
    if SalvarItem then Ultimo := Contador;
    mtItens.Next;
  end;
    
  I := 0;
  Contador := 0;
  mtItens.First;
  
  try
    while not mtItens.Eof do begin
      Inc(Contador);
      if SalvarItem then begin
        Inc(I);
        tMovEst.Append;
        tMovEstItem.Value := I;

        tMovEstContato.Value := tTranContato.Value;
        tMovEstTransacao.Value := tTranNumero.Value;
        tMovEstCaixaMov.Value := tTranCaixaI.Value;
        tMovEstCaixaPag.Value := tTranCaixaP.Value;
        tMovEstDataMov.Value := tTranInicio.Value;
        tMovEstDataPag.Value := tTranDataPagto.Value;
        tMovEstProduto.Value := mtItensProduto.Value;
        tMovEstQuant.Value := mtItensQuant.Value;
        tMovEstUnitario.Value := mtItensUnitario.Value;
        tMovEstTotal.Value := mtItensTotal.Value;
        tMovEstTipoTran.Value := tTranTipo.Value;
        tMovEstEntrada.Value := (tTranTipo.Value in [ttEstCompra, ttEstEntrada]);
        tMovEstEstoqueAnt.Value := 0;

        if Contador = Ultimo then
          tMovEstDesconto.Value := DescFinal
        else
          tMovEstDesconto.Value := DuasCasas(tMovEstTotal.Value * Fator);

        DescFinal := DescFinal - tMovEstDesconto.Value;
          
        tMovEst.Post;
        
        if tMovEstTipoTran.Value=ttEstCompra then 
          Custo := DuasCasas(tMovEstUnitario.Value - (tMovEstUnitario.Value * Fator))
        else
          Custo := 0;  

        if (not tMovEstCancelado.Value) then begin
          Mov := tMovEstFatorSaldo.Value * tMovEstQuant.Value;
          Dados.AjustaEstoqueProduto(tMovEstProduto.Value, Custo, Mov);
        end;                                 
        
        tMovEst.Edit;
        tMovEstEstoqueAnt.Value :=
          Dados.ObtemSaldoAnterior(tMovEstProduto.Value,
                                   tMovEstDataMov.Value,
                                   tMovEstNumSeq.Value);
        tMovEst.Post;
        Dados.AjustaSaldoPosterior(tMovEstProduto.Value,
                                   tMovEstDataMov.Value,
                                   tMovEstNumSeq.Value,
                                   tMovEstSaldo.Value);
      end;  
      mtItens.Next;
    end;
  finally
    mtItens.EnableControls;
  end;   
end;

procedure TFrmME.Editar(Num: Integer);
begin
  with tTran do
  if FindKey([Num]) then begin
    Edit;
    FTotAnt := tTranTotalFinal.Value;
    LeItens;
    cmGravar.Enabled := PodeEditarTran(tTran);
    ShowModal;
  end else begin
    Beep;
    ShowMessage('Item não encontrado!');
    Free;
  end;  
end;

procedure TFrmME.Criar(TipoTran: Byte);
begin
  tTran.Insert;
  tTranTipo.Value := TipoTran;
  tTranStatusPagto.Value := spPago;
  mtItens.Active := True;
  if NumAberto<1 then
    cmGravar.Enabled := False;
  ShowModal;
end;

procedure TFrmME.gridItensEnter(Sender: TObject);
begin
  gridItens.Color := EnterColor;
  gridItens.FocusedField := mtItensProduto;
end;

Function TFrmME.ValidaLinha: Boolean;
begin
  Result := (mtItensQuant.Value>0) and
            (mtItensProduto.Value<>'');
end;

procedure TFrmME.gridItensChangeNodeEx(Sender: TObject);
begin
  gridItens.FocusedField := mtItensProduto;
end;

procedure TFrmME.InspTotaisRow3DrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := AFont.Style + [fsBold];
end;

procedure TFrmME.InspTotaisRow3DrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := AFont.Style + [fsBold];
end;

procedure TFrmME.InspTotaisDescontoDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Color := clMaroon;
end;

procedure TFrmME.InspCabNomeCliDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  Afont.Style := [fsBold];
end;

procedure TFrmME.gridItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Del : 
    if ssCtrl in Shift then begin
      if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
      if mtItens.RecordCount > 0 then
        mtItens.Delete;
      Key := 0;  
    end;  

    Key_Up :
    if gridItens.FocusedNode.Index = 0 then begin
      InspCab.SetFocus;
      Key := 0;
    end;  
    
    Key_Enter : 
    if (gridItens.FocusedField.FieldName = UltimoCampo) then
    if SalvarItem then begin
      if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
      if (gridItens.FocusedNode.Index+1) = mtItens.RecordCount then
        mtItens.Append;
    end else
    if (mtItens.RecordCount > 1) and (mtItensItem.Value=mtItens.RecordCount)
    then begin
      mtItens.Cancel;
      mtItens.Delete;
      edDesconto.SetFocus;
      Key := 0;
    end;

  end;  
end;

procedure TFrmME.InspCabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [Key_Enter, Key_Down]) then 
  if InspCab.FocusedField.FieldName = 'Usuario' then begin
    gridItens.SetFocus;
    Key := 0;
  end;  
end;

procedure TFrmME.gridItensExit(Sender: TObject);
begin
  gridItens.Color := clWindow;
end;

procedure TFrmME.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter :
    if ssCtrl in Shift then begin
      cmGravarClick(cmGravar);
      Key := 0;
    end;{ else
    if FocouTipo or edSerie.Focused or edNumero.Focused then
    begin
      SelectNext(ActiveControl as TWinControl, True, True);
      Key := 0;
    end; }
      
    Key_Esc   : Close;
  end;
end;

function TFrmME.MesmoME(Num: Integer): Boolean;
begin
  Result := (tTranNumero.Value=Num);
end;


procedure TFrmME.gridItensMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if mtItens.State = dsInsert then mtItens.Post;
  if (Button = mbRight) and 
     (mtItens.RecordCount > 0) and
     (gridItens.GetNodeAt(X, Y) <> nil) then
  if MessageDlg('Apagar este item ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes    
    then mtItens.Delete
end;

procedure TFrmME.mtItensAfterDelete(DataSet: TDataSet);
begin
  if mtItens.RecordCount=0 then mtItens.Append;
end;

procedure TFrmME.gridItensItemGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
  Text := IntToStr(ANode.Index);
end;

procedure TFrmME.tMovEstCalcFields(DataSet: TDataSet);
begin
  if tMovEstCancelado.Value then
    tMovEstFatorSaldo.Value := 0
  else
  if tMovEstEntrada.Value then
    tMovEstFatorSaldo.Value := 1
  else
    tMovEstFatorSaldo.Value := -1;
    
  tMovEstSaldo.Value :=
    tMovEstEstoqueAnt.Value +
    (tMovEstFatorSaldo.Value * tMovEstQuant.Value);
end;

procedure TFrmME.gridItensNomeProValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  case tTranTipo.Value of
    ttEstVenda : mtItensUnitario.Value := dados.tbProPreco.Value;
    ttEstCompra : mtItensUnitario.Value := dados.tbProCustoUnitario.Value;
  else
    mtItensUnitario.Value := 0;
  end;    
end;

procedure TFrmME.mtItensCalcFields(DataSet: TDataSet);
begin
  FTotItens := FTotItens - mtItensTotal.Value;
  mtItensTotal.Value := mtItensQuant.Value * mtItensUnitario.Value;
  FTotItens := FTotItens + mtItensTotal.Value;
  if tTran.State in [dsEdit, dsInsert] then
    tTranProdutos.Value := FTotItens;
end;

procedure TFrmME.mtItensBeforeDelete(DataSet: TDataSet);
begin
  FTotItens := FTotItens - mtItensTotal.Value;
  if tTran.State in [dsEdit, dsInsert] then
    tTranProdutos.Value := FTotItens;
end;

procedure TFrmME.mtItensProdutoValidate(Sender: TField);
begin
  with Dados do
  if tbPro.Locate('Codigo', mtItensProduto.Value, []) then begin
    if mtItensUnitario.Value < 0.001 then
    case tTranTipo.Value of
      ttEstCompra : mtItensUnitario.Value := tbProCustoUnitario.Value;
      ttEstVenda  : mtItensUnitario.Value := tbProPreco.Value
    end;
  end else
  if mtItensProduto.Value>'' then begin
    mtItensUnitario.Value := 0;
    mtItensQuant.Value := 0;
    Raise Exception.Create('Código Inválido!');
  end;
end;

procedure TFrmME.mtItensProdutoChange(Sender: TField);
begin
  mtItensUnitario.Value := 0;
  with Dados do
  if tbPro.Locate('Codigo', mtItensProduto.Value, []) then
  case tTranTipo.Value of
    ttEstCompra : mtItensUnitario.Value := tbProCustoUnitario.Value;
    ttEstVenda : mtItensUnitario.Value := tbProPreco.Value;
  else
    mtItensUnitario.Value := 0;
  end;    
end;

procedure TFrmME.cmApagarItemClick(Sender: TObject);
begin
  if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
  if mtItens.RecordCount > 0 then
    mtItens.Delete;
end;

procedure TFrmME.cmNovoItemClick(Sender: TObject);
begin
  if mtItens.State in [dsEdit, dsInsert] then begin
    if SalvarItem then begin
      mtItens.Post;
      mtItens.Append;
    end;
  end else
    mtItens.Append;    
end;

procedure TFrmME.tTranCalcFields(DataSet: TDataSet);
begin
  tTranTotalFinal.Value := tTranProdutos.Value - tTranDescontoProduto.Value;
end;

procedure TFrmME.tTranAfterInsert(DataSet: TDataSet);
begin
  tTranInicio.Value := Now;
  tTranFim.Value := Now;
  tTranFuncI.Value := Dados.CM.Username;
  tTranFuncF.Value := Dados.CM.Username;
end;

procedure TFrmME.FormDestroy(Sender: TObject);
begin
  Dados.tbCli.IndexName := SaveIndex;
end;

end.




