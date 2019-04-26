unit ncPRFrmPrintTipo;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmComSombra, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox, cxTextEdit, cxContainer,
  Menus, kbmMemTable, cxClasses, StdCtrls, cxButtons, LMDPNGImage, ExtCtrls,
  cxLabel, cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, LMDControl, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSimplePanel, cxNavigator;

type
  TFrmPrintTipo = class(TFrmComSombra)
    LMDSimplePanel3: TLMDSimplePanel;
    grid: TcxGrid;
    tv: TcxGridDBTableView;
    tvImg: TcxGridDBColumn;
    tvDescr: TcxGridDBColumn;
    tvID: TcxGridDBColumn;
    tvDescr2: TcxGridDBColumn;
    tv2: TcxGridDBBandedTableView;
    tv2Img: TcxGridDBBandedColumn;
    tv2Descr: TcxGridDBBandedColumn;
    gl: TcxGridLevel;
    lbTot: TcxLabel;
    LMDSimplePanel1: TLMDSimplePanel;
    Image2: TImage;
    lbTitulo: TcxLabel;
    btnCancelar: TcxButton;
    btnContinuar: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    dsTipo: TDataSource;
    mtTipo: TkbmMemTable;
    mtTipoImg: TIntegerField;
    mtTipoDescr: TStringField;
    mtTipoDescr2: TStringField;
    mtTipoID: TIntegerField;
    mtTipoValor: TCurrencyField;
    cxStyle3: TcxStyle;
    procedure LMDSimplePanel3Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvDescrCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tvDblClick(Sender: TObject);
  private
    { Private declarations }
    FPaginas : Integer;
    procedure RefreshTot;
  public
    function ObtemTipoImp(var aTipoImp: Integer; aPag: integer; aCancelar: Boolean): Boolean;
    { Public declarations }
  end;

var
  FrmPrintTipo: TFrmPrintTipo;

implementation

uses ncImgImp, ncTipoImp, ncClassesBase;

// START resource string wizard section
resourcestring
  SPorPágina = ' por página';
  SSelecionar = 'Selecionar';
  SSair = 'Sair';
  SPáginaS = ' página(s) = ';

// END resource string wizard section


{$R *.dfm}

procedure TFrmPrintTipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmPrintTipo.FormCreate(Sender: TObject);
var i: integer;
begin
  inherited;

  dsTipo.Dataset := nil;
  try
    mtTipo.Active := True;
    for i := 0 to gTiposImp.Count-1 do begin
      mtTipo.Append;
      mtTipoImg.Value := gTiposImp.Itens[i].ImgID;
      mtTipoDescr.Value := gTiposImp.Itens[i].Nome;
      mtTipoDescr2.Value := FloatToStrF(gTiposImp.Itens[i].Valor, ffCurrency, 10, 2) + SPorPágina;
      mtTipoValor.Value := gTiposImp.Itens[i].Valor;
      mtTipoID.Value := gTiposImp.Itens[i].ID;
      mtTipo.Post;
    end;
    mtTipo.First;
  finally
    dsTipo.Dataset := mtTipo;
  end;
end;

procedure TFrmPrintTipo.FormShow(Sender: TObject);
begin
  inherited;
  RefreshTot;
end;

procedure TFrmPrintTipo.LMDSimplePanel3Enter(Sender: TObject);
begin
  inherited;
  lbTot.Visible := True;
  lbTitulo.Style.TextColor := $00404040;
  btnContinuar.Enabled := True;
end;

function TFrmPrintTipo.ObtemTipoImp(var aTipoImp: Integer; aPag: Integer; aCancelar: Boolean): Boolean;
begin
  if not aCancelar then begin
    btnContinuar.Caption := SSelecionar;
    btnCancelar.Caption := SSair;
    btnCancelar.Width := 55;
  end;

  FPaginas := aPag;
  mtTipo.Locate('ID', aTipoImp, []); // do not localize
  if ShowModal=mrOk then begin
    Result := True;
    aTipoImp := mtTipoID.Value;
  end else
    Result := (ModalResult<>mrCancel);
end;

procedure TFrmPrintTipo.RefreshTot;
begin
  lbTot.Caption := IntToStr(FPaginas)+ SPáginaS + FloatToStrF(mtTipoValor.Value * FPaginas, ffCurrency, 10, 2);
end;

procedure TFrmPrintTipo.tvDblClick(Sender: TObject);
begin
  inherited;
  if btnContinuar.Enabled then
    btnContinuar.Click;
end;

procedure TFrmPrintTipo.tvDescrCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var R: TRect;  
begin
  R := AViewInfo.Bounds;
  ACanvas.FillRect(AviewInfo.Bounds);
  R.Bottom := R.Top + ((R.Bottom - R.Top) div 2);
  ACanvas.DrawTexT(AViewInfo.Text, R, cxAlignLeft or cxShowEndEllipsis or cxAlignBottom);

  ACanvas.Font.Style := [];
  ACanvas.Font.Size := 8;
//  ACanvas.Font.Color := clGray;
  R.Top := R.Bottom + 1;
  R.Bottom := AViewInfo.Bounds.Bottom;
  ACanvas.DrawTexT(AViewInfo.GridRecord.Values[tvDescr2.Index], R, cxAlignLeft or cxShowEndEllipsis or cxAlignTop);
  
  ADone := True;
end;

procedure TFrmPrintTipo.tvFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  RefreshTot;
end;

end.

