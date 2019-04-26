unit ncaPanItensVendaGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncaPanItensVendaBase, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxMaskEdit, cxTextEdit, cxCurrencyEdit,
  cxSpinEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGrid, dxBar, ncMovEst, ImgList, LMDDckAlphaImages,
  dxBarExtItems, cxContainer, cxLabel, Menus, StdCtrls, cxButtons, ExtCtrls;

type
  
  TpanItensVendaGrid = class(TpanItensVendaBase)
    Grid: TcxGrid;
    TV: TcxGridTableView;
    TVCodigo: TcxGridColumn;
    TVDescr: TcxGridColumn;
    TVQuant: TcxGridColumn;
    TVvezes: TcxGridColumn;
    TVUnitario: TcxGridColumn;
    TVFidPontos: TcxGridColumn;
    TVIgual: TcxGridColumn;
    TVTotal: TcxGridColumn;
    TVFidPontosTotal: TcxGridColumn;
    GL: TcxGridLevel;
    BarMgr: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    BarMgrBar1: TdxBar;
    cmRemover: TdxBarLargeButton;
    cmCancelar: TdxBarLargeButton;
    TVIDProduto: TcxGridColumn;
    TVCancelado: TcxGridColumn;
    LMDAlphaImageList1: TLMDAlphaImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cmTotal: TdxBarButton;
    cxStyle2: TcxStyle;
    LMDSimplePanel1: TLMDSimplePanel;
    btnFontUp: TcxButton;
    cxLabel1: TcxLabel;
    btnFontDown: TcxButton;
    btnBold: TcxButton;
    TVItem: TcxGridColumn;
    cxStyle3: TcxStyle;
    Timer1: TTimer;
    procedure TVDataControllerAfterDelete(
      ADataController: TcxCustomDataController);
    procedure TVQuantGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVvezesGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure TVIgualGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cmRemoverClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TVCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure TVPOSGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure btnFontUpClick(Sender: TObject);
    procedure btnFontDownClick(Sender: TObject);
    procedure btnBoldClick(Sender: TObject);
    procedure TVQuantCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure GridEnter(Sender: TObject);
    procedure GridExit(Sender: TObject);
    procedure TVItemGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure GridResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FClicouBotao : TClicouBotao;
    FTotal : Currency;
    FEntrou : Boolean;
  protected

    procedure MyBestFit;

    procedure _SetResgateFidelidade; override;
    function FieldIndex(aName: String): Integer;
    function GetField(aIndex: Integer; aName: String): Variant; override;
    procedure SetField(aIndex: Integer; aName: String; const aValue: Variant); override;
    function GetCount: Integer; override;
    procedure SetCount(const Value: Integer); override;

    procedure SaveGridStyle;

    procedure UpdateTotal;

    property Total: Currency
      read FTotal;
    
  public
    procedure DelItem(aIndex: Integer); override;
    procedure SetFontSize(aSize: Integer); override;

    procedure SetGap(aPixels: Integer); override;

    procedure BeginUpdate; override;
    procedure EndUpdate; override;
    
    function FocusedItemIndex: Integer; override;

    procedure Atualiza; override;

    procedure MostrarBotao(aBotao: TBotaoItemVenda; aMostrar: Boolean); override;


    { Public declarations }
  end;

var
  panItensVendaGrid: TpanItensVendaGrid;

implementation

uses ufmImagens, ncClassesBase, ncaDM, ncaFrmPri;

{$R *.dfm}


resourcestring
  SConfirmaCancelamento = 'Confirma realmente o cancelamento do item selecionado?';

{ TpanItensVendaGrid }


procedure TpanItensVendaGrid.Atualiza;
begin
  inherited;
  TVFidPontos.Visible := ResgateFidelidade;
  TVFidPontosTotal.Visible := ResgateFidelidade;

  TVUnitario.Visible := (not ResgateFidelidade) and (TipoTran in [trEstVenda, trEstCompra]);
  TVTotal.Visible := (not ResgateFidelidade) and (TipoTran in [trEstVenda, trEstCompra]);
  TVIgual.Visible := TVTotal.Visible;
  TVVezes.Visible := TVTotal.Visible;  
end;

procedure TpanItensVendaGrid.BeginUpdate;
begin
  inherited;
  TV.BeginUpdate(lsimPending);
end;

procedure TpanItensVendaGrid.btnBoldClick(Sender: TObject);
begin
  inherited;
  if fsBold in Grid.Font.Style then
    Grid.Font.Style := Grid.Font.Style - [fsBold] else
    Grid.Font.Style := Grid.Font.Style + [fsBold];
  SaveGridStyle;  
end;

procedure TpanItensVendaGrid.btnFontDownClick(Sender: TObject);
begin
  inherited;
  Grid.Font.Size := Grid.Font.Size - 1;
  SaveGridStyle;
end;

procedure TpanItensVendaGrid.btnFontUpClick(Sender: TObject);
begin
  inherited;
  Grid.Font.Size := Grid.Font.Size + 1;
  SaveGridStyle;
end;

procedure TpanItensVendaGrid.cmCancelarClick(Sender: TObject);
begin
  inherited;
  if SimNao('Deseja realmente o item selecionado?') then
    if Assigned(OnClicouBotao) then
      OnClicouBotao(Self, bivCancelarItem); 
end;

procedure TpanItensVendaGrid.cmRemoverClick(Sender: TObject);
begin
  inherited;
  if Assigned(OnClicouBotao) then
    OnClicouBotao(Self, bivRemoverItem);
end;

procedure TpanItensVendaGrid.DelItem(aIndex: Integer);
begin
  inherited;
  if aIndex=-1 then Exit;
  TV.DataController.DeleteRecord(aIndex);
  with TV.DataController do 
  if RecordCount>0 then begin
    cmRemover.Enabled := True;
    cmCancelar.Enabled := True;
    if aIndex < RecordCount then
      FocusedRecordIndex := aIndex else
      FocusedRecordIndex := RecordCount-1;
  end else begin
    cmRemover.Enabled := False;
    cmCancelar.Enabled := False;
  end;
  UpdateTotal;
end;

procedure TpanItensVendaGrid.EndUpdate;
begin
  inherited;
  TV.EndUpdate;
  UpdateTotal;
end;

function TpanItensVendaGrid.FieldIndex(aName: String): Integer;
var I: Integer;
begin
  for I := 0 to TV.ColumnCount-1 do with TV.Columns[I] do
   if SameText(Name, 'TV'+aName) then begin
     Result := Index;
     Exit;
   end;
  Result := -1;   
end;

function TpanItensVendaGrid.FocusedItemIndex: Integer;
begin
  Result := TV.DataController.FocusedRecordIndex;
end;

procedure TpanItensVendaGrid.FormCreate(Sender: TObject);
begin
  inherited;
  TV.OptionsView.Header := False;
  Grid.Font.Size := StrToIntDef(slConfig.Values['panItensVendaGrid.Grid.Font.Size'], Grid.Font.Size);
  if slConfig.Values['panItensVendaGrid.Grid.Font.Bold']='1' then
    Grid.Font.Style := [fsBold] else
    Grid.Font.Style := [];
  
  FTotal := 0;
  FEntrou := False;
  cmTotal.Caption := '';
end;

function TpanItensVendaGrid.GetCount: Integer;
begin
  Result := TV.DataController.RecordCount;
end;

function TpanItensVendaGrid.GetField(aIndex: Integer; aName: String): Variant;
begin
  Result := TV.DataController.Values[aIndex, FieldIndex(aName)];
end;

procedure TpanItensVendaGrid.GridEnter(Sender: TObject);
begin
  inherited;
  FEntrou := True;
end;

procedure TpanItensVendaGrid.GridExit(Sender: TObject);
begin
  inherited;
  FEntrou := False;
end;

procedure TpanItensVendaGrid.GridResize(Sender: TObject);
begin
  inherited;
  MyBestFit;
end;

procedure TpanItensVendaGrid.MostrarBotao(aBotao: TBotaoItemVenda;
  aMostrar: Boolean);
begin
  inherited;
  case aBotao of
    bivRemoverItem : 
      if aMostrar then
        cmRemover.Visible := ivAlways else
        cmRemover.Visible := ivNever;

    bivCancelarItem : 
      if aMostrar then
        cmCancelar.Visible := ivAlways else
        cmCancelar.Visible := ivNever;   
  end;
end;

procedure TpanItensVendaGrid.MyBestFit;
begin
  TV.ApplyBestFit;
  TVDescr.Width := Grid.Width - TVItem.Width - TVQuant.Width - TVVezes.Width - TVUnitario.Width - TVIgual.Width - TVTotal.Width;
end;

procedure TpanItensVendaGrid.SaveGridStyle;
begin
  slConfig.Values['panItensVendaGrid.Grid.Font.Size'] := IntToStr(Grid.Font.Size);
  if fsBold in Grid.Font.Style then
    slConfig.Values['panItensVendaGrid.Grid.Font.Bold'] := '1' else
    slConfig.Values['panItensVendaGrid.Grid.Font.Bold'] := '0';
  SaveConfig; 
  MyBestFit; 
end;

procedure TpanItensVendaGrid.SetCount(const Value: Integer);
var I : integer;
begin
  TV.DataController.RecordCount := Value;
  UpdateTotal;
  cmRemover.Enabled := (Value>0);
  cmCancelar.Enabled := (Value>0);
end;

procedure TpanItensVendaGrid.SetField(aIndex: Integer; aName: String;
  const aValue: Variant);
var aField: Integer;  
begin
  inherited;
  with TV.DataController do begin
    aField:= FieldIndex(aName);
{    if SameText(aName, 'Descr') then
      Values[aIndex, aField] := IntToStr(aIndex+1)+'-'+aValue else}
      Values[aIndex, aField] := aValue;
    UpdateTotal;  
  end;
  Timer1.Enabled := True;
end;

procedure TpanItensVendaGrid.SetFontSize(aSize: Integer);
begin
  inherited;
  Grid.Font.Size := aSize;
end;

procedure TpanItensVendaGrid.SetGap(aPixels: Integer);
begin
  inherited;

end;

procedure TpanItensVendaGrid.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  MyBestFit;
end;

procedure TpanItensVendaGrid.TVCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if AViewInfo.GridRecord.Values[TVCancelado.Index]=True then begin
    if (AViewInfo.Item<>TVIgual) and (AViewInfo.Item<>TVVezes) then
      ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeout];
    if AViewInfo.Selected and TV.Focused then
      ACanvas.Font.Color := clSilver else
      ACanvas.Font.Color := clGray;
  end;
end;

procedure TpanItensVendaGrid.TVDataControllerAfterDelete(
  ADataController: TcxCustomDataController);
begin
  inherited;
  cmRemover.Enabled := (TV.DataController.RecordCount>0);
  cmCancelar.Enabled := cmRemover.Enabled;
end;

procedure TpanItensVendaGrid.TVIgualGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  AText := '=';
end;

procedure TpanItensVendaGrid.TVItemGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  AText := IntToStr(ARecord.Index+1);
end;

procedure TpanItensVendaGrid.TVPOSGetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := IntToStr(ARecord.Index+1);
//  while Length(AText)<5 do AText := '0'+AText;
end;

procedure TpanItensVendaGrid.TVQuantCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

  if not (AViewInfo.GridRecord.Selected and FEntrou) then
    ACanvas.Font.Color := clBlue;
end;

procedure TpanItensVendaGrid.TVQuantGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  if TipoTran = trEstEntrada then 
    AText := '+'+AText 
  else
  if TipoTran = trEstSaida then
    AText := '-'+AText;
end;

procedure TpanItensVendaGrid.TVvezesGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  AText := 'X';
end;

procedure TpanItensVendaGrid.UpdateTotal;
var I : Integer;
begin
  if IsUpdating then Exit;
  
  FTotal := 0;
  with TV.DataController do 
  for I := 0 to RecordCount - 1 do
    if (Values[I, TVTotal.Index]<>null) and (Values[I, TVCancelado.Index]<>True) then
      FTotal := FTotal + Values[I, TVTotal.Index];

  cmTotal.Caption := FloatToStrF(FTotal, ffCurrency, 15, CurrencyDecimals);

end;

procedure TpanItensVendaGrid._SetResgateFidelidade;
begin
  inherited;
  Atualiza;
end;

end.
