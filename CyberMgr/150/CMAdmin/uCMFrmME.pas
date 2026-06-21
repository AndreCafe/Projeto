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
  Mask, dxInspRw, dxDBInRw, dxInspct, dxDBInsp, ppCtrls, ppPrnabl,
  ppClass, ppBands, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, daDataModule, ppModule, ppMemo, ppStrtch, ppRegion,
  LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomLabel, LMDLabel, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, OvcNF, OvcDbNF, ppEndUsr;

type
  TMeuCurrencyEdit = class(TdxInplaceCurrencyEdit);
  TMeuMaskEdit     = class(TdxInplaceMaskEdit);
  
  TFrmME = class(TForm)
    BarMgr: TdxBarManager;
    cmGravar: TdxBarButton;
    cmCancelar: TdxBarButton;
    Pc: TPageControl;
    tsItens: TTabSheet;
    panTotais: TLMDSimplePanel;
    gridItens: TdxDBGrid;
    mtItens: TkbmMemTable;
    mtItensQuant: TFloatField;
    mtItensUnitario: TCurrencyField;
    mtItensItem: TWordField;
    dsItens: TDataSource;
    dsME: TDataSource;
    tItensME: TnxTable;
    tItensMEProduto: TStringField;
    tItensMEItem: TWordField;
    gridItensNomePro: TdxDBGridLookupColumn;
    gridItensQuant: TdxDBGridMaskColumn;
    gridItensValor: TdxDBGridCurrencyColumn;
    gridItensTotal: TdxDBGridMaskColumn;
    mtItensunidade: TStringField;
    cmImprimir: TdxBarButton;
    tItensMETotal: TCurrencyField;
    panCab2: TLMDSimplePanel;
    LMDSimplePanel8: TLMDSimplePanel;
    InspTotais: TdxDBInspector;
    InspTotaisTotal: TdxInspectorDBCurrencyRow;
    InspTotaisDesconto: TdxInspectorDBCurrencyRow;
    InspTotaisRow3: TdxInspectorDBCurrencyRow;
    LMDSimplePanel4: TLMDSimplePanel;
    InspCab: TdxDBInspector;
    InspCabUsuario: TdxInspectorDBMaskRow;
    InspCabNomeCli: TdxInspectorLookupRow;
    LMDSimplePanel2: TLMDSimplePanel;
    InspCabDiaHora: TdxInspectorDBMaskRow;
    Timer1: TTimer;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    edObs: TDBMemo;
    LMDSimplePanel5: TLMDSimplePanel;
    dbpPed: TppDBPipeline;
    dbpItens: TppDBPipeline;
    tItensMENomeProduto: TStringField;
    dstbItens: TDataSource;
    repImpressao: TppReport;
    mtItensNomePro: TStringField;
    OvcController1: TOvcController;
    tItensMEEmissor: TIntegerField;
    tItensMESerie: TStringField;
    tItensMENumero: TIntegerField;
    tItensMEQuant: TFloatField;
    tItensMEUnitario: TCurrencyField;
    tItensMEDesconto: TCurrencyField;
    tItensMEData: TDateTimeField;
    tItensMEMovEst: TBooleanField;
    tItensMECancelado: TBooleanField;
    tItensMEEstoqueAnt: TFloatField;
    tItensMETipoMov: TStringField;
    tItensMEContato: TIntegerField;
    tItensMENumSeq: TAutoIncField;
    tItensMEFatorSaldo: TIntegerField;
    tItensMEEntrada: TBooleanField;
    tItensMESaldo: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppShape3: TppShape;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppRegion1: TppRegion;
    ppShape4: TppShape;
    ppShape2: TppShape;
    ppLabel14: TppLabel;
    ppDBText14: TppDBText;
    ppLine3: TppLine;
    ppDBText13: TppDBText;
    ppLabel13: TppLabel;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLine2: TppLine;
    ppLabel16: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    tItensMECaixa: TIntegerField;
    mtItensTotal: TFloatField;
    mtItensProduto: TStringField;
    gridItensProduto: TdxDBGridColumn;
    mtItensEstoqueAtual: TFloatField;
    gridItensEstoque: TdxDBGridMaskColumn;
    InspCabRow4: TdxInspectorDBRow;
    dxBarDockControl1: TdxBarDockControl;
    cmNovoItem: TdxBarButton;
    cmApagarItem: TdxBarButton;
    procedure cmGravarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Function  Valida: Boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tMECalcFields(DataSet: TDataSet);
    procedure mtItensAfterInsert(DataSet: TDataSet);
    procedure gridItensEnter(Sender: TObject);
    function ValidaLinha: Boolean;
    procedure gridItensChangeNodeEx(Sender: TObject);
    procedure tMEAfterInsert(DataSet: TDataSet);
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
    procedure InspTotaisKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridItensExit(Sender: TObject);
    procedure InspTotaisEnter(Sender: TObject);
    procedure InspTotaisExit(Sender: TObject);
    procedure edObsEnter(Sender: TObject);
    procedure edObsExit(Sender: TObject);
    procedure cmImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridItensMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mtItensAfterDelete(DataSet: TDataSet);
    procedure gridItensItemGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);
    procedure tMEAfterEdit(DataSet: TDataSet);
    procedure cbTipoChange(Sender: TObject);
    procedure tItensMECalcFields(DataSet: TDataSet);
    procedure cbTipoEnter(Sender: TObject);
    procedure cbTipoExit(Sender: TObject);
    procedure gridItensNomeProValidate(Sender: TObject;
      var ErrorText: String; var Accept: Boolean);
    procedure mtItensCalcFields(DataSet: TDataSet);
    procedure mtItensBeforeDelete(DataSet: TDataSet);
    procedure mtItensProdutoValidate(Sender: TField);
    procedure mtItensProdutoChange(Sender: TField);
    procedure cmApagarItemClick(Sender: TObject);
    procedure cmNovoItemClick(Sender: TObject);


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
    
    procedure Editar(Emissor: Integer; Serie: String; Num: Integer);
    procedure Criar(Tipo : String);
    function MesmoME(Emissor: Integer; Serie: String; Numero: Integer): Boolean;
  end;

var
  FrmME: TFrmME;
  
implementation

uses uCMFrmConfig, uCMDados, uCMFrmPri, uCMFrmRepView, cmClassesBase;


{$R *.DFM}

const
  EnterColor = $00F1E4E4;
       
procedure TFrmME.cmGravarClick(Sender: TObject);
var TF : Double;
begin
  Dados.tbPro.IndexName := 'ICodigo';
  if tME.State in [dsInsert, dsEdit] then 
  try
    if not Dados.tbTipoMov.FindKey([tMETipo.Value]) then begin
      Beep;
      ShowMessage('Tipo "'+tMETipo.Value+'" não existe!');
      Exit;
    end;  

    if edNumero.Enabled and (edNumero.AsInteger=0) then begin
      Beep;
      ShowMessage('Número não pode ser deixado em branco!');
      edNumero.SetFocus;
      Exit;
    end;
      
    with Dados do begin
      tbCaixa.IndexName := 'INumero';
      if not tbCaixa.FindKey([NumAberto]) then begin
        Beep;
        ShowMessage('Caixa não encontrado!');
        Exit;
      end;
    end;    
    
    with Dados do
    DB.StartTransactionWith([tME, tItensME, tbCaixa, tbME, tAuxItens, tbPro]);
    try
      Dados.tbCaixa.Edit;

      if tMETipo.Value = 'VENDA' then 
      if tME.State=dsEdit then 
        Dados.tbCaixa.FieldByName('Vendas').AsFloat := 
          Dados.tbCaixa.FieldByName('Vendas').AsFloat -
          FTotAnt;
      
      tMEMovEst.Value := Dados.tbTipoMovMovEst.Value;
      tMEEntrada.Value := Dados.tbTipoMovEntrada.Value;
      if not tMEEntrada.Value then
        tMEEmissor.Value := 0
      else
        tMEEmissor.Value := tMEContato.Value;    
      if (tME.State=dsInsert) then begin
        if not Dados.tbTipoMovConfirmarMovEstoque.Value then
          tMEDtMovimentacao.Value := tMEDiaHora.Value;
        if Dados.tbTipoMovNumeroAutomatico.Value then
          tMENumero.Value := Dados.ObtemProxNumME(tMEEmissor.Value, tMESerie.Value);
      end;
      tMECaixa.Value := NumAberto;


      if tMETipo.Value = 'VENDA' then 
      Dados.tbCaixa.FieldByName('Vendas').AsFloat := 
        Dados.tbCaixa.FieldByName('Vendas').AsFloat +
        tMETotalFinal.Value;
        
      SalvaItens;

      Dados.tbCaixa.Post;  
      tME.Post;
      
      Dados.DB.Commit;
    except
      Dados.tbCaixa.Cancel;
      tME.Cancel;
      tItensME.Cancel;
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
  tME.Cancel;
  Action:= caFree;
end;

procedure TFrmME.FormCreate(Sender: TObject);
begin
  UltimoCampo := '';
  FTotItens := 0;
  FocouTipo := False;
  Pc.ActivePageIndex := 0;
  cbTipo.Clear;
  with Dados, tbTipoMov do begin
    First;
    while not Eof do begin
      cbTipo.Items.Add(tbTipoMovNome.Value);
      Next;
    end;  
  end;  
  tItensME.Open;
  tME.Open;
  mtItens.Open;
end;

procedure TFrmME.FormShow(Sender: TObject);
begin
  Dados.tbPro.IndexName := 'IDescricao';
  
  mtItens.Append;
  cbTipoChange(nil);

  if cbTipo.Enabled then
    cbTipo.SetFocus
  else  
    gridItens.SetFocus;
    
end;

procedure TFrmME.tMECalcFields(DataSet: TDataSet);
begin
  tMETotalFinal.Value := tMETotal.Value - tMEDesconto.Value;    
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
  tItensME.SetRange([tMEEmissor.Value, tMESerie.Value, tMENumero.Value], 
                     [tMEEmissor.Value, tMESerie.Value, tMENumero.Value]);
  Item := 0;
  mtItens.DisableControls;
  try
    tItensME.First;
    while not tItensME.Eof do begin
      Inc(Item);
      mtItens.Append;
      mtItensItem.Value := Item;
      mtItensProduto.Value := tItensMEProduto.Value;
      mtItensQuant.Value := tItensMEQuant.Value;
      mtItensUnitario.Value := tItensMEUnitario.Value;
      mtItens.Post;
      tItensME.Next;
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
    if (mtItensProduto.Value = tItensMEProduto.Value) and SalvarItem then 
      Exit;
    mtItens.Next;
  end;
  Result := True;
end;
  
begin
  if (tMETotal.Value > 0.009) and (tMEDesconto.Value > 0.009) then 
    Fator := (tMEDesconto.Value / tMETotal.Value)
  else
    Fator := 0;  

  DescFinal := tMEDesconto.Value;  
    
  tItensME.SetRange([tMEEmissor.Value, tMESerie.Value, tMENumero.Value], 
                     [tMEEmissor.Value, tMESerie.Value, tMENumero.Value]);
  tItensME.First;
  while not (tItensME.Eof and tItensME.Bof) do begin
    if (not tItensMEData.IsNull) and ApagouProduto then begin
      Data := tItensMEData.Value;
      Produto := tItensMEProduto.Value;
      NumSeq := tItensMENumSeq.Value;
    end else
      Produto := '';

    if (not tItensMECancelado.Value) and tItensMEMovEst.Value then begin
      if not tItensMEData.IsNull then begin
        Tipo := 0;
        Mov := tItensMEFatorSaldo.Value * tItensMEQuant.Value;
      end else begin
        Mov  := tItensMEQuant.Value;
        if tItensMEEntrada.Value then
          Tipo := 1
        else
          Tipo := -1;  
      end;  
      Dados.AjustaEstoqueProduto(tItensMEProduto.Value, 0, (-1 * Mov), Tipo);
    end;                                 

    SaldoAnt := tItensMEEstoqueAnt.Value;                                 
    tItensME.Delete;
    
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
        tItensME.Append;
        tItensMEItem.Value := I;
          
        tItensMEEmissor.Value := tMEEmissor.Value;
        tItensMESerie.Value := tMESerie.Value;
        tItensMENumero.Value := tMENumero.Value;
        tItensMECaixa.Value := tMECaixa.Value;
        tItensMEProduto.Value := mtItensProduto.Value;
        tItensMEQuant.Value := mtItensQuant.Value;
        tItensMEUnitario.Value := mtItensUnitario.Value;
        tItensMETotal.Value := mtItensTotal.Value;
        tItensMETipoMov.Value := tMETipo.Value;
        tItensMEEntrada.Value := tMEEntrada.Value;
        tItensMEMovEst.Value := tMEMovEst.Value;
        tItensMECancelado.Value := tMECancelado.Value;
        tItensMEEstoqueAnt.Value := 0;
        if tMEDtMovimentacao.IsNull then
          tItensMEData.Clear
        else  
          tItensMEData.Value := tMEDtMovimentacao.Value;

        if Contador = Ultimo then
          tItensMEDesconto.Value := DescFinal
        else  
          tItensMEDesconto.Value := DuasCasas(tItensMETotal.Value * Fator);

        DescFinal := DescFinal - tItensMEDesconto.Value;
          
        tItensME.Post;
        
        if Dados.tbTipoMovAtualizaCusto.Value then
          Custo := DuasCasas(tItensMEUnitario.Value - (tItensMEUnitario.Value * Fator))
        else
          Custo := 0;  

        if (not tItensMECancelado.Value) and tItensMEMovEst.Value then begin
          if not tItensMEData.IsNull then begin
            Tipo := 0;
            Mov := tItensMEFatorSaldo.Value * tItensMEQuant.Value;
          end else begin
            Mov  := tItensMEQuant.Value;
            if tItensMEEntrada.Value then
              Tipo := 1
            else
              Tipo := -1;  
          end;
          Dados.AjustaEstoqueProduto(tItensMEProduto.Value, Custo, Mov, Tipo);
        end;                                 
        
        if not tItensMEData.IsNull then begin
          tItensME.Edit;
          tItensMEEstoqueAnt.Value := 
            Dados.ObtemSaldoAnterior(tItensMEProduto.Value, 
                                     tItensMEData.Value,
                                     tItensMENumSeq.Value);
          tItensME.Post;                           
          Dados.AjustaSaldoPosterior(tItensMEProduto.Value, 
                                     tItensMEData.Value,
                                     tItensMENumSeq.Value,
                                     tItensMESaldo.Value);
        end;                             
      end;  
      mtItens.Next;
    end;
  finally
    mtItens.EnableControls;
  end;   
end;

procedure TFrmME.Editar(Emissor: Integer; Serie: String; Num: Integer);
begin
  with tME do
  if FindKey([Emissor, Serie, Num]) then begin
    Edit;
    FTotAnt := tMETotalFinal.Value;
    LeItens;
    if tMEDtMovimentacao.IsNull and tMEMovEst.Value and (not tMECancelado.Value) then
    begin
      cmConfirma.Visible := ivAlways;
      if tMEEntrada.Value then
        cmConfirma.Caption := 'Confirmar &Entrada'
      else
        cmConfirma.Caption := 'Confirmar &Saída';  
    end else
      cmConfirma.Visible := ivNever;
    cbTipoChange(nil);  

    if (NumAberto<1) or (tMECaixa.Value <> NumAberto) then 
      cmGravar.Enabled := False;
    
    ShowModal;
  end else begin
    Beep;
    ShowMessage('Item não encontrado!');
    Free;
  end;  
end;

procedure TFrmME.Criar(Tipo: String);
begin
  with tME do begin
    Append;
    tMETipo.Value := Tipo;
    cbTipoChange(nil);
    
    mtItens.Active := True;
  end;
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

procedure TFrmME.tMEAfterInsert(DataSet: TDataSet);
begin
  tMEDiaHora.Value := Now;
  tMEUsuario.Value := Dados.CM.UA.Username;
  tMECancelado.Value := False;
  if cbTipo.Items.Count > 0 then begin
    tMETipo.Value := cbTipo.Items[0];
    cbTipoChange(nil);
  end;  
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
      InspTotais.SetFocus;
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

procedure TFrmME.InspTotaisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Up :
    if InspTotais.FocusedField.FieldName = 'Total' then begin
      gridItens.SetFocus;
      Key := 0;
    end;

    Key_Down,
    Key_Enter : 
    if InspTotais.FocusedField.FieldName = 'TotalFinal' then begin
      InspCab.SetFocus;
      Key := 0;
    end;
  end;
end;

procedure TFrmME.gridItensExit(Sender: TObject);
begin
  gridItens.Color := clWindow;
end;

procedure TFrmME.InspTotaisEnter(Sender: TObject);
begin
  TdxDBInspector(Sender).Color := EnterColor;
end;

procedure TFrmME.InspTotaisExit(Sender: TObject);
begin
  TdxDbInspector(Sender).Color := clBtnFace;
end;

procedure TFrmME.edObsEnter(Sender: TObject);
begin
  edObs.Color := EnterColor;
end;

procedure TFrmME.edObsExit(Sender: TObject);
begin
  edObs.Color := clWindow;
end;

procedure TFrmME.cmImprimirClick(Sender: TObject);
var FName : String;
begin
  FName := ExtractFilePath(ParamStr(0)) + '\Pedido.rtm';
  if FileExists(FName) then begin
    repImpressao.Template.FileName := ExtractFilePath(ParamStr(0)) + '\Pedido.rtm';
    repImpressao.Template.LoadFromFile;
  end else
    repImpressao.Template.FileName := '';  
  cmGravarClick(nil);
  with TFrmRepView.Create(nil) do
  Mostra(repImpressao);
end;

procedure TFrmME.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Key_Enter : 
    if ssCtrl in Shift then begin
      cmGravarClick(cmGravar);
      Key := 0;
    end else
    if FocouTipo or edSerie.Focused or edNumero.Focused then
    begin
      SelectNext(ActiveControl as TWinControl, True, True);
      Key := 0;
    end;
      
    Key_Esc   : Close;
  end;
end;

function TFrmME.MesmoME(Emissor: Integer; Serie: String; Numero: Integer): Boolean;
begin
  Result := (tMEEmissor.Value=Emissor) and 
            (tMESerie.Value=Serie) and 
            (tMENumero.Value=Numero);
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

procedure TFrmME.tMEAfterEdit(DataSet: TDataSet);
begin
  cbTipo.Enabled := False;
  edSerie.Enabled := False;
  edNumero.Enabled := False;
end;

procedure TFrmME.cbTipoChange(Sender: TObject);
begin
  if not (tME.State in [dsEdit, dsInsert]) then Exit;
  with Dados do
  if tbTipoMov.FindKey([cbTipo.Text]) then begin
    if Self.tME.State = dsInsert then begin
      edSerie.Enabled := tbTipoMovPermiteAlterarSerie.Value;
      edNumero.Enabled := not tbTipoMovNumeroAutomatico.Value;
    
      Self.tMEMovEst.Value := tbTipoMovMovEst.Value;
      Self.tMEEntrada.Value := tbTipoMovEntrada.Value;
      Self.tMESerie.Value := tbTipoMovSerie.Value;
      if (cbTipo.Text = 'ENTRADA') or (cbTipo.Text = 'SAIDA') then begin
        gridItensValor.Visible := False;
        gridItensTotal.Visible := False;
        UltimoCampo := 'Quant';
      end else begin
        gridItensValor.Visible := True;
        gridItensTotal.Visible := True;
        UltimoCampo := 'Unitario';
      end;  
    end;
  end;
end;

procedure TFrmME.tItensMECalcFields(DataSet: TDataSet);
begin
  if tItensMEData.IsNull or tItensMECancelado.Value or (not tItensMEMovEst.Value) then
    tItensMEFatorSaldo.Value := 0
  else
  if tItensMEEntrada.Value then
    tItensMEFatorSaldo.Value := 1
  else
    tItensMEFatorSaldo.Value := -1;
  tItensMESaldo.Value := 
    tItensMEEstoqueAnt.Value +  
    (tItensMEFatorSaldo.Value * tItensMEQuant.Value);
end;

procedure TFrmME.cbTipoEnter(Sender: TObject);
begin
  FocouTipo := True;
end;

procedure TFrmME.cbTipoExit(Sender: TObject);
begin
  FocouTipo := False;
end;

procedure TFrmME.gridItensNomeProValidate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
begin
  if not tMEEntrada.Value then
    mtItensUnitario.Value := dados.tbProPreco.Value
  else
    mtItensUnitario.Value := dados.tbProCustoUnitario.Value;
end;

procedure TFrmME.mtItensCalcFields(DataSet: TDataSet);
begin
  FTotItens := FTotItens - mtItensTotal.Value;
  mtItensTotal.Value := mtItensQuant.Value * mtItensUnitario.Value;
  FTotItens := FTotItens + mtItensTotal.Value;
  if tME.State in [dsEdit, dsInsert] then
    tMETotal.Value := FTotItens;
end;

procedure TFrmME.mtItensBeforeDelete(DataSet: TDataSet);
begin
  FTotItens := FTotItens - mtItensTotal.Value;
  if tME.State in [dsEdit, dsInsert] then
    tMETotal.Value := FTotItens;
end;

procedure TFrmME.mtItensProdutoValidate(Sender: TField);
begin
  with Dados do
  if tbPro.Locate('Codigo', mtItensProduto.Value, []) then begin
    if mtItensUnitario.Value < 0.001 then
    if tMEEntrada.Value then
      mtItensUnitario.Value := tbProCustoUnitario.Value
    else  
      mtItensUnitario.Value := tbProPreco.Value
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
    if tMEEntrada.Value then
      mtItensUnitario.Value := tbProCustoUnitario.Value
    else  
      mtItensUnitario.Value := tbProPreco.Value
end;

procedure TFrmME.cmApagarItemClick(Sender: TObject);
begin
  if mtItens.State in [dsEdit, dsInsert] then mtItens.Post;
  if mtItens.RecordCount > 0 then
    mtItens.Delete;
end;

procedure TFrmME.cmNovoItemClick(Sender: TObject);
begin
  if mtItens.State in [dsEdit, dsInsert] then
    if SalvarItem then 
      mtItens.Post;
      mtItens.Append;
    end;
  end else
    mtItens.Append;    
end;

end.




