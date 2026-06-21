unit  CopiauTMFrmPedido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dxCntner, dxEditor, dxEdLib, dxDBELib, OvcBase, OvcRLbl, OvcPLb,
  dxExEdtr, dxDBEdtr, dxBar, StdCtrls, OvcEditF, OvcEdPop, OvcEdCal,
  OvcDbDat, DBCtrls, OvcPB, OvcPF, OvcDbPF, OvcEF, OvcSF, OvcDbSF, ExtCtrls,
  ComCtrls, OvcDbDLb, dxTL, dxDBCtrl, dxDBGrid, lmdcctrl, lmdctrl,
  lmdstdcS, Lmddbctr, Db, kbmMemTable, dxDBTLCl, dxGrClms, wwdblook,
  lmdgroup, lmddbctA, nxdb, dxGrClEx, Qrctrls, QuickRpt,
  uTMFrmChamada, 
  funcoes, Mask, dxInspRw, dxDBInRw, dxInspct, dxDBInsp;

type
  TMeuCurrencyEdit = class(TdxInplaceCurrencyEdit);
  TMeuMaskEdit     = class(TdxInplaceMaskEdit);
  
  ItemRec = record
    irNum : Integer;
    irProduto : String[15];
    irQuant : Double;
    irUnit  : Double;
    irTotal : Double;
  end;  

  TFrmPedido = class(TForm)
    BarMgr: TdxBarManager;
    btGravar: TdxBarButton;
    btCancel: TdxBarButton;
    Pc: TPageControl;
    TabSheet1: TTabSheet;
    tsEntrega: TTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    QPed: TQuickRep;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRExpr3: TQRExpr;
    QRGroup1: TQRGroup;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    foot: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QEnd: TQuickRep;
    QRBand3: TQRBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr7: TQRExpr;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    endent: TQRLabel;
    baient: TQRLabel;
    cident: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel15: TQRLabel;
    OBs: TQRRichText;
    cmImprimir: TdxBarButton;
    cmChamada: TdxBarButton;
    LMDSimplePanel7: TLMDSimplePanel;
    LMDSimplePanel8: TLMDSimplePanel;
    InspTotais: TdxDBInspector;
    InspTotaisTotal: TdxInspectorDBCurrencyRow;
    InspTotaisDesconto: TdxInspectorDBCurrencyRow;
    InspTotaisRow3: TdxInspectorDBCurrencyRow;
    LMDSimplePanel4: TLMDSimplePanel;
    InspCab: TdxDBInspector;
    InspCabUsuario: TdxInspectorDBMaskRow;
    InspCabNomeCli: TdxInspectorLookupRow;
    InspCabNomeEntre: TdxInspectorLookupRow;
    LMDSimplePanel2: TLMDSimplePanel;
    InspCabDiaHora: TdxInspectorDBMaskRow;
    dxDBInspector1: TdxDBInspector;
    dxDBInspector1EndEnt: TdxInspectorDBMaskRow;
    dxDBInspector1BaiEnt: TdxInspectorDBMaskRow;
    dxDBInspector1CidEnt: TdxInspectorDBMaskRow;
    dxDBInspector1UFEnt: TdxInspectorDBMaskRow;
    LMDSimplePanel3: TLMDSimplePanel;
    InspCab2: TdxDBInspector;
    InspCab2Pendente: TdxInspectorDBCheckRow;
    InspCab2Saida: TdxInspectorDBDateRow;
    InspCab2Entregar: TdxInspectorDBCheckRow;
    InspCab2FormaPagto: TdxInspectorDBPickRow;
    LMDSimplePanel5: TLMDSimplePanel;
    LMDSimplePanel6: TLMDSimplePanel;
    edObs: TDBMemo;
    procedure btGravarClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Function  Valida: Boolean;
    procedure mtItensQtdeChange(Sender: TField);
    procedure mtItensValorChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure mtItensProdutoValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure tbPedCalcFields(DataSet: TDataSet);
    procedure mtItensAfterInsert(DataSet: TDataSet);
    procedure gLinPedEnter(Sender: TObject);
    function ValidaLinha: Boolean;
    procedure gLinPedChangeNodeEx(Sender: TObject);
    procedure cmChamadaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tbPedAfterInsert(DataSet: TDataSet);
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
    procedure InspCab2EntregarChange(Sender: TObject);
    procedure gLinPedValorChange(Sender: TObject);
    procedure gLinPedTotalChange(Sender: TObject);
    procedure gLinPedQtdeChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure gLinPedKeyPress(Sender: TObject; var Key: Char);
    procedure gLinPedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    function SalvarItem: Boolean;
    
    procedure LeItens;
    procedure SalvaItens;
    procedure CalcTotal(I: Integer);
    procedure CalcTotais;
    { Private declarations }
  public
    { Public declarations }
    UltimaLin: Integer;
    EditCache : Array[1..100] of ItemRec;
    
    procedure Editar(Num: Integer);
    procedure Criar(Chamada: TFrmChamada);

  end;

  function NomeTelaPed(N: Integer): String;

var
  FrmPedido: TFrmPedido;
  
implementation

uses uTMFrmConfig, uTMDados, uTMFrmPri;


{$R *.DFM}

function NomeTelaPed(N: Integer): String;
begin
  Result := 'FrmPedido' + IntToStr(N);
end;

procedure TFrmPedido.btGravarClick(Sender: TObject);
var indChama: string;
begin
  indChama := Dados.tbChama.IndexName;
  Dados.tbChama.IndexName := 'INumero';
  try
    Dados.db.StartTransaction;
    try
      tbPed.Post;
      SalvaItens;
      with Dados do
      if tbChama.FindKey([tbPedChamada.Value]) then begin
        tbChama.Edit;
        tbChamaPedido.Value := tbPedNumero.Value;
        tbChama.Post;
      end;  
      Dados.DB.Commit;
    except
      tbPed.Cancel;
      tbItens.Cancel;
      Dados.tbChama.Cancel;
      Dados.DB.RollBack;
      Raise;
    end;
  finally
    Dados.tbChama.IndexName := indChama;
  end;  
  
  FrmPri.AtualizaDados(viPed);
  FrmPri.AtualizaDados(viLig);

  Close;
end;

Function TFrmPedido.Valida: Boolean;
begin
   Result:= true;
   if mtItens.RecordCount = 0 then
     Result:= false;
end;

procedure TFrmPedido.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbPed.Cancel;
  Action:= caFree;
end;

procedure TFrmPedido.mtItensQtdeChange(Sender: TField);
begin
  mtItensTotal.Value := mtItensQtde.Value * mtItensValor.Value;
end;

procedure TFrmPedido.mtItensValorChange(Sender: TField);
begin
  mtItensTotal.Value := mtItensQtde.Value * mtItensValor.Value;
  if mtItensItem.Value > 0 then
  EditCache[mtItensItem.Value].irUnit := mtItensValor.Value;
end;

procedure TFrmPedido.FormCreate(Sender: TObject);
begin
  FillChar(EditCache, SizeOf(EditCache), 0);
  Pc.ActivePageIndex := 0;
  tbItens.Open;
  tbPed.Open;
  mtItens.Open;
end;

procedure TFrmPedido.mtItensProdutoValidate(Sender: TField);
begin
  mtItensValor.Value := dados.tbProPreco.Value;
end;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
  tsEntrega.TabVisible := tbPedEntrega.Value;

  gLinPed.SetFocus;
  if tbPedNumero.Value <> 0 then
    FrmPri.InsereJanelas('Pedido nº ' + 
                         tbPedNumero.AsString + ' de ' + 
                         tbPedNomeCli.AsString, Self)
  else
  if tbPedChamada.Value <> 0 then
    FrmPri.InsereJanelas('Pedido Chamada nº '+
                         tbPedChamada.AsString + ' de '+
                         tbPedNomeCli.AsString, Self)
  else
    FrmPri.InsereJanelas('Pedido Novo', Self);
end;

procedure TFrmPedido.tbPedCalcFields(DataSet: TDataSet);
begin
  tbPedTotalFinal.Value := tbPedTotal.Value - tbPedDesconto.Value;    
end;

procedure TFrmPedido.mtItensAfterInsert(DataSet: TDataSet);
begin
  mtItensItem.Value := mtItens.RecordCount+1;
end;

function TFrmPedido.SalvarItem: Boolean;
begin
  Result := 
    (mtItensProduto.Value > '') and
    (mtItensQtde.Value > 0.0009);
end;

procedure TFrmPedido.LeItens;
var Item: Integer;
begin
  mtItens.EmptyTable;
  tbItens.SetRange([tbPedNumero.Value], [tbPedNumero.Value]);
  Item := 0;
  mtItens.DisableControls;
  try
    tbItens.First;
    while not tbItens.Eof do begin
      Inc(Item);
      mtItens.Append;
      mtItensItem.Value := Item;
      mtItensProduto.Value := tbItensProduto.Value;
      mtItensQtde.Value := tbItensQtde.Value;
      mtItensValor.Value := tbItensValor.Value;
      mtItensTotal.Value := tbItensTotal.Value;

      EditCache[Item].irNum := Item;
      EditCache[Item].irProduto := mtItensProduto.Value;
      EditCache[Item].irQuant := mtItensQtde.Value;
      EditCache[Item].irUnit := mtItensValor.Value;
      EditCache[Item].irTotal := mtItensTotal.Value;
      
      mtItens.Post;
      tbItens.Next;
    end;  
  finally
    mtItens.EnableControls;
  end;    
end;

procedure TFrmPedido.SalvaItens;
begin
  tbItens.SetRange([tbPedNumero.Value], [tbPedNumero.Value]);
  tbItens.First;
  while not (tbItens.Eof and tbItens.Bof) do tbItens.Delete;
  
  mtItens.First;
  mtItens.DisableControls;
  try
    while not mtItens.Eof do begin
      if SalvarItem then begin
        tbItens.Append;
        tbItensItem.Value := mtItensItem.Value;
        tbItensPedido.Value := tbPedNumero.Value;
        tbItensProduto.Value := mtItensProduto.Value;
        tbItensQtde.Value := mtItensQtde.Value;
        tbItensValor.Value := mtItensValor.Value;
        tbItensTotal.Value := mtItensTotal.Value;
        tbItens.Post;
      end;  
      mtItens.Next;
    end;
  finally
    mtItens.EnableControls;
  end;   
end;

procedure TFrmPedido.Editar(Num: Integer);
begin
  Name:= NomeTelaPed(Num);
  with tbPed do
  if FindKey([Num]) then begin
    Edit;
    LeItens;
    Show;
  end else
    Free;
end;

procedure TFrmPedido.Criar(Chamada: TFrmChamada);
begin
  if Chamada = nil then
    Name:= NomeTelaPed(0)
  else
    Name:= NomeTelaPed(Chamada.Numero);

  with tbPed do begin
    Append;
    if Chamada <> nil then begin
      tbPedCliente.Value := Chamada.Cliente;
      tbPedChamada.Value := Chamada.Numero;
    end;
  end;
  Show;
end;

procedure TFrmPedido.gLinPedEnter(Sender: TObject);
begin
  gLinPed.FocusedField := mtItensProduto;
end;

Function TFrmPedido.ValidaLinha: Boolean;
begin
  Result := (mtItensQtde.Value>0) and
            (mtItensProduto.Value<>'');
end;

procedure TFrmPedido.gLinPedChangeNodeEx(Sender: TObject);
begin
  gLinPed.FocusedField := mtItensProduto;
end;

procedure TFrmPedido.cmChamadaClick(Sender: TObject);
var 
  I: integer;
  Lista: TCpList;
  Aberto: Boolean;
begin
Aberto:= False;
if tbPedChamada.Value <> 0 then
  begin
     Lista := ListaComponentes(TFrmChamada);
     for i:= 0 to (Length(Lista) - 1) do
        begin
            if (Lista[i] as TFrmChamada).Numero = tbPedChamada.Value then
              begin
                 Aberto:= True;
                 with (Lista[i] as TFrmChamada) do
                      Mostra;
              end;
        end;
  end;
if not Aberto then
   begin
       with TFrmChamada.Create(Application) do begin
          Load(tbPedChamada.Value);
          Show;
       end;
   end;
end;

procedure TFrmPedido.FormDestroy(Sender: TObject);
begin
  FrmPri.DeletaJanelas(Self);
end;

procedure TFrmPedido.tbPedAfterInsert(DataSet: TDataSet);
begin
  tbPedEntrega.Value := False;
  tbPedDiaHora.Value := Now;
  tbPedUsuario.Value := Usuario;
  tbPedPendente.Value := True;
end;

procedure TFrmPedido.InspTotaisRow3DrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := AFont.Style + [fsBold];
end;

procedure TFrmPedido.InspTotaisRow3DrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := AFont.Style + [fsBold];
end;

procedure TFrmPedido.InspTotaisDescontoDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Color := clMaroon;
end;

procedure TFrmPedido.InspCabNomeCliDrawValue(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  Afont.Style := [fsBold];
end;

procedure TFrmPedido.InspCab2EntregarChange(Sender: TObject);
begin
  tsEntrega.TabVisible := TdxInspectorCheckEdit(InspCab2.InplaceEditor).Checked;
end;

procedure TFrmPedido.gLinPedValorChange(Sender: TObject);
var V : Double;
begin
  V := TMeuCurrencyEdit(gLinPed.InplaceEditor).Value;
  EditCache[mtItensItem.Value].irUnit := V;
  CalcTotal(mtItensItem.Value);
end;

procedure TFrmPedido.gLinPedTotalChange(Sender: TObject);
begin
  EditCache[mtItensItem.Value].irTotal := 
    TMeuCurrencyEdit(gLinPed.InplaceEditor).Value;
  CalcTotal(mtItensItem.Value);
end;

procedure TFrmPedido.gLinPedQtdeChange(Sender: TObject);
var St : String;
begin
  St := Trim(TMeuMaskEdit(gLinPed.InplaceEditor).Text);
  if St > '' then
    EditCache[mtItensItem.Value].irQuant := StrToFloat(St)
  else
    EditCache[mtItensItem.Value].irQuant := 0;  
  CalcTotal(mtItensItem.Value);
end;

procedure TFrmPedido.CalcTotais;
var 
  I : Integer;
  SubTot : Double;
begin
  SubTot := 0;
  for I := 1 to mtItens.RecordCount do
    SubTot := SubTot + EditCache[I].irTotal;
  tbPedTotal.Value := SubTot;
end;

procedure TFrmPedido.CalcTotal(I: Integer);
begin
  EditCache[I].irTotal := EditCache[I].irQuant * EditCache[I].irUnit;
  CalcTotais;
end;

procedure TFrmPedido.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  CalcTotal(mtItensItem.Value);
end;

procedure TFrmPedido.gLinPedKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13 : 
    if (gLinPed.FocusedField.FieldName = 'Valor') and
       SalvarItem and
       (mtItensItem.Value = mtItens.RecordCount) then
      mtItens.Append;
  end;  
end;

procedure TFrmPedido.gLinPedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    13 : 
    if (gLinPed.FocusedField.FieldName = 'Valor') and
       SalvarItem and
       (mtItensItem.Value = mtItens.RecordCount) then
      mtItens.Append;
  end;  
end;

end.
