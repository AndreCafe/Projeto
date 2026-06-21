unit uAFrmItemRA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, 
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, LMDCustomScrollBox, LMDScrollBox, lmdsplt, Buttons,
  PngSpeedButton, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, 
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxMaskEdit, cxDBLookupComboBox, cxTextEdit,
  cxCalendar, cxImageComboBox, cxCurrencyEdit, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridLevel, cxGrid, cxTimeEdit,
  dxPScxCommon, dxPScxGrid6Lnk, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, LMDBaseGraphicControl;

type
  TFrmRA = class(TForm)
    panPri: TLMDSimplePanel;
    LMDSimplePanel1: TLMDSimplePanel;
    btnImpGrid: TLMDSpeedButton;
    LMDSimplePanel2: TLMDSimplePanel;
    GroupBox1: TGroupBox;
    cbCon: TCheckBox;
    edCon: TEdit;
    cbStatusCli: TCheckBox;
    edStatusCli: TComboBox;
    edStatusTec: TComboBox;
    cbStatusTec: TCheckBox;
    btnAplicar: TPngSpeedButton;
    GroupBox2: TGroupBox;
    btnNenhum: TLMDSpeedButton;
    btnAgrupaTec: TLMDSpeedButton;
    btnAgrupaClienteRA: TLMDSpeedButton;
    btnAgrupaCliente: TLMDSpeedButton;
    LMDSplitterPanel1: TLMDSplitterPanel;
    LMDSplitterPane1: TLMDSplitterPane;
    LMDSplitterPane2: TLMDSplitterPane;
    btnExpGrid: TLMDSpeedButton;
    btnEditar: TLMDSpeedButton;
    dlgExp: TSaveDialog;
    CP: TdxComponentPrinter;
    Grid: TcxGrid;
    glDesp: TcxGridLevel;
    tvDesp: TcxGridDBBandedTableView;
    tvDespNumF1: TcxGridDBBandedColumn;
    tvDespNomeCli1: TcxGridDBBandedColumn;
    tvDespNomeTec1: TcxGridDBBandedColumn;
    tvDespChave1: TcxGridDBBandedColumn;
    tvDespDataI1: TcxGridDBBandedColumn;
    tvDespTipo: TcxGridDBBandedColumn;
    tvDespValor1: TcxGridDBBandedColumn;
    tvDespStatusCli1: TcxGridDBBandedColumn;
    tvDespValorCli1: TcxGridDBBandedColumn;
    tvDespStatusTec1: TcxGridDBBandedColumn;
    tvDespValorTec1: TcxGridDBBandedColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    GridRAOS: TcxGrid;
    glRAOS: TcxGridLevel;
    tvRAOS: TcxGridDBBandedTableView;
    tvRAOSDataOS1: TcxGridDBBandedColumn;
    tvRAOSIDOS1: TcxGridDBBandedColumn;
    tvRAOSHoras1: TcxGridDBBandedColumn;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cplDesp: TdxGridReportLink;
    btnAgrupaTecRA: TLMDSpeedButton;
    procedure tvDespValorTec1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvDespValorCli1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvDespValor1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure btnAgrupaTecRAClick(Sender: TObject);
    procedure btnAgrupaClienteClick(Sender: TObject);
    procedure btnAgrupaClienteRAClick(Sender: TObject);
    procedure btnAgrupaTecClick(Sender: TObject);
    procedure btnNenhumClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnImpGridClick(Sender: TObject);
    procedure btnExpGridClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AplicarFiltro;
    { Public declarations }
  end;

var
  FrmRA: TFrmRA;

implementation

uses uDMA, uAFrmAprov, cxGridExportLink;

{$R *.dfm}

procedure TFrmRA.btnAgrupaClienteClick(Sender: TObject);
begin
  tvDesp.BeginUpdate;
  try
    tvDesp.DataController.Groups.ClearGrouping;
    tvDespNomeCli1.GroupIndex := 0;
  finally
    tvDesp.EndUpdate;;
  end;  
  tvDesp.DataController.Groups.FullExpand;
end;

procedure TFrmRA.btnAgrupaClienteRAClick(Sender: TObject);
begin
  tvDesp.BeginUpdate;
  try
    tvDesp.DataController.Groups.ClearGrouping;
    tvDespNomeCli1.GroupIndex := 0;
    tvDespChave1.GroupIndex := 1;
  finally
    tvDesp.EndUpdate;;
  end; 
  tvDesp.DataController.Groups.FullExpand;
end;

procedure TFrmRA.btnAgrupaTecClick(Sender: TObject);
begin
  tvDesp.BeginUpdate;
  try
    tvDesp.DataController.Groups.ClearGrouping;
    tvDespNomeTec1.GroupIndex := 0;
  finally
    tvDesp.EndUpdate;;
  end; 
  tvDesp.DataController.Groups.FullExpand;
end;

procedure TFrmRA.btnAgrupaTecRAClick(Sender: TObject);
begin
  tvDesp.BeginUpdate;
  try
    tvDesp.DataController.Groups.ClearGrouping;
    tvDespNomeTec1.GroupIndex := 0;
    tvDespChave1.GroupIndex := 1;
  finally
    tvDesp.EndUpdate;;
  end; 
  tvDesp.DataController.Groups.FullExpand;
end;

procedure TFrmRA.btnNenhumClick(Sender: TObject);
begin
  tvDesp.BeginUpdate;
  try
    tvDesp.DataController.Groups.ClearGrouping;
  finally
    tvDesp.EndUpdate;;
  end; 
  tvDesp.DataController.Groups.FullExpand;
end;

procedure TFrmRA.tvDespValor1GetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V  := ARecord.Values[TVDespTipo.Index];
  if (V<>null) and (V=0) then begin
    V := ARecord.Values[TVDespValor1.Index];
    if V<>null then
      AText := IntToStr(Trunc(V)) + 'KM';
  end;
end;

procedure TFrmRA.tvDespValorCli1GetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V  := ARecord.Values[TVDespTipo.Index];
  if (V<>null) and (V=0) then begin
    V := ARecord.Values[TVDespValorCli1.Index];
    if V<>null then
      AText := IntToStr(Trunc(V)) + 'KM';
  end;
end;

procedure TFrmRA.tvDespValorTec1GetDisplayText(Sender: TcxCustomGridTableItem;
  ARecord: TcxCustomGridRecord; var AText: string);
var V: Variant;  
begin
  V  := ARecord.Values[TVDespTipo.Index];
  if (V<>null) and (V=0) then begin
    V := ARecord.Values[TVDespValorTec1.Index];
    if V<>null then
      AText := IntToStr(Trunc(V)) + 'KM';
  end;
end;

procedure TFrmRA.btnAplicarClick(Sender: TObject);
begin
  AplicarFiltro;
end;

procedure TFrmRA.btnEditarClick(Sender: TObject);
begin
  with DM do 
  if not (tRAItem.Bof and tRAItem.Eof) then
    TFrmAprov.Create(Self).Editar(tRAItem);
end;

procedure TFrmRA.btnImpGridClick(Sender: TObject);
begin
  CP.Preview(True, cplDesp);
end;

procedure TFrmRA.btnExpGridClick(Sender: TObject);
const
  Exts: Array[1..3] of String = ('xls', 'htm', 'txt');
begin
  if not dlgExp.Execute then Exit;
  if Pos('.', dlgExp.FileName)>0 then
    dlgExp.FileName := Copy(dlgExp.FileName, 1, Pos('.', dlgExp.FileName)-1);

  if not (dlgExp.FilterIndex in [1..3]) then
    dlgExp.FilterIndex := 1;
    
  if dlgExp.Execute and (dlgExp.FileName <> '') then begin
    if Pos('.', dlgExp.FileName)=0 then
      dlgExp.FileName := dlgExp.FileName + '.' + Exts[dlgExp.FilterIndex];
    case dlgExp.FilterIndex of
      1: ExportGridToExcel(dlgExp.FileName, Grid);
      2: ExportGridToHtml(dlgExp.FileName, Grid);
      3: ExportGridToText(dlgExp.FileName, Grid);
    end;
  end;  
end;

procedure TFrmRA.AplicarFiltro;
var NumF: Variant;
begin
  with DM do begin
    NumF := StrToIntDef(edCon.Text, 0);
    if NumF=0 then NumF := null;
    dsRAItem.DataSet := nil;
    try
      tRAItem.CancelRange;
      tRAItem.Filter := '';
      tRAItem.Filtered := False;
      if cbCon.Checked then begin
        if cbStatusCli.Checked then begin
          tRAItem.IndexName := 'INumFStatusCli';
          tRAItem.SetRange([NumF, edStatusCli.ItemIndex], [NumF, edStatusCli.ItemIndex]);
          if cbStatusTec.Checked then begin
            tRAItem.Filtered := True;
            tRAItem.Filter := 'StatusTec = ' + IntToStr(edStatusTec.ItemIndex);
          end;
        end else
        if cbStatusTec.Checked then begin
          tRAItem.IndexName := 'INumFStatusTec';
          tRAItem.SetRange([NumF, edStatusTec.ItemIndex], [NumF, edStatusTec.ItemIndex]);
        end else
        begin
          tRAItem.IndexName := 'INumFStatusTec';
          tRAItem.SetRange([NumF], [NumF]);
        end;
      end else 
      if cbStatusCli.Checked then begin
        tRAItem.IndexName := 'IStatusCli';
        tRAItem.SetRange([edStatusCli.ItemIndex], [edStatusCli.ItemIndex]);
        if cbStatusTec.Checked then begin
          tRAItem.Filtered := True;
          tRAItem.Filter := 'StatusTec = ' + IntToStr(edStatusTec.ItemIndex);
        end;                 
      end else
      if cbStatusTec.Checked then begin
        tRAItem.IndexName := 'IStatusTec';
        tRAItem.SetRange([edStatusTec.ItemIndex], [edStatusTec.ItemIndex]);
      end;
    finally
      dsRAItem.Dataset := tRAItem;
    end;
  end;
end;

end.
