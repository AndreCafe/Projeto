unit ncPRFrmEtapas;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmComSombra, 
  cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, GIFImg, ExtCtrls, StdCtrls,
  cxPC, cxPCdxBarPopupMenu, cxContainer, cxEdit, cxLabel, LMDControl,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel, Menus,
  cxButtons, LMDCustomScrollBox, LMDScrollBox, LMDPNGImage, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxImageComboBox,
  cxTextEdit, cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, kbmMemTable, cxClasses, cxCurrencyEdit, ieview, iemview,
  LMDCustomComponent, LMDBaseController, LMDCustomContainer, LMDGenericList,
  cxNavigator, dxBarBuiltInMenu;

type
  TFrmPREtapas = class(TFrmComSombra)
    panEtapa: TLMDSimplePanel;
    lbRevisar: TcxLabel;
    lbPreparar: TcxLabel;
    lbTipo: TcxLabel;
    Paginas: TcxPageControl;
    tsPreparar: TcxTabSheet;
    tsTipo: TcxTabSheet;
    tsConfRevisao: TcxTabSheet;
    btnRevisar: TcxButton;
    btnImprimir: TcxButton;
    LMDSimplePanel4: TLMDSimplePanel;
    btnAvancar: TcxButton;
    LMDSimplePanel6: TLMDSimplePanel;
    btnVoltar: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    dsTipo: TDataSource;
    mtTipo: TkbmMemTable;
    mtTipoImg: TIntegerField;
    mtTipoDescr: TStringField;
    mtTipoDescr2: TStringField;
    mtTipoID: TIntegerField;
    mtTipoValor: TCurrencyField;
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
    Timer1: TTimer;
    cxStyle4: TcxStyle;
    tvTotal: TcxGridDBColumn;
    cxStyle5: TcxStyle;
    lbFolhas: TcxLabel;
    mtTipoTotal: TCurrencyField;
    genList: TLMDGenericList;
    img: TImageEnMView;
    cxLabel1: TcxLabel;
    btnCancelar: TcxButton;
    cxLabel2: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tsPrepararShow(Sender: TObject);
    procedure tsPrepararHide(Sender: TObject);
    procedure tsTipoShow(Sender: TObject);
    procedure tsConfRevisaoShow(Sender: TObject);
    procedure tsConfRevisaoHide(Sender: TObject);
    procedure tsTipoHide(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure btnAlteraTipoClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnRevisarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tvFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure tvDblClick(Sender: TObject);
    procedure tvDescrCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tsTipoEnter(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cxLabel2Click(Sender: TObject);
  private
    { Private declarations }
    FFolhas   : Integer;
    FRes      : Integer;
    FCancelar : Boolean;
    procedure RefreshTot;
    procedure SetFolhas(const Value: Integer);

    property Folhas: Integer
      read FFolhas write SetFolhas;
  public
    procedure GerouDoc(aPaginas: Integer);
    procedure Cancelar;
    function Imprimir(var aTipo: Integer; aPaginas: Integer): Integer;
    { Public declarations }
  end;

var
  FrmPREtapas: TFrmPREtapas;

const
  resCancelar = 0;
  resRevisar  = 1;
  resImprimir = 2;

implementation

uses ncImgImp, ncClassesBase, ncTipoImp, ncDebug;

// START resource string wizard section
resourcestring
  SDesejaRealmenteCANCELAREssaImpre = 'Deseja realmente CANCELAR essa impressão?';
  SAtenção = 'Atenção';
  SPorPágina = ' por página';
  SPáginaS = ' página(s) = ';
  SImprimirDiretoSemRevisar = 'Imprimir direto sem revisar.';
  SImprimir = 'Imprimir  - ';
  SCusto = ' Custo = ';
  SFolhas = ' Folhas';
  SFolha = ' Folha';

// END resource string wizard section


{$R *.dfm}

procedure TFrmPREtapas.tsConfRevisaoHide(Sender: TObject);
begin
  inherited;
  lbRevisar.Enabled := False;
  if Paginas.ActivePageIndex<2 then
    lbRevisar.Style.TextColor := clBlack;
end;

procedure TFrmPREtapas.tsConfRevisaoShow(Sender: TObject);
begin
  inherited;
  lbRevisar.Enabled := True;
  lbRevisar.Style.TextColor := clBlue;
end;

procedure TFrmPREtapas.tsPrepararHide(Sender: TObject);
begin
  inherited;
  img.Playing := False;
  lbPreparar.Style.TextColor := clBlack;
  lbPreparar.Enabled := False;
end;

procedure TFrmPREtapas.tsPrepararShow(Sender: TObject);
begin
  inherited;
  img.PlayLoop := True;
  img.Playing := True;
  Height := 460;
  Width := 500;
  Left := (Screen.DesktopWidth - Width) div 2;
  Top := (Screen.DesktopHeight - Height) div 2;
end;

procedure TFrmPREtapas.tsTipoEnter(Sender: TObject);
begin
  inherited;
  lbPreparar.Enabled := False;
end;

procedure TFrmPREtapas.tsTipoHide(Sender: TObject);
begin
  inherited;
  lbTipo.Enabled := False;
end;

procedure TFrmPREtapas.tsTipoShow(Sender: TObject);
begin
  inherited;
  lbTipo.Enabled := True;
  lbTipo.Style.TextColor := clBlue;
  Height := 460;
  Width := 500;
  Left := (Screen.DesktopWidth - Width) div 2;
  Top := (Screen.DesktopHeight - Height) div 2;
end;

procedure TFrmPREtapas.tvDblClick(Sender: TObject);
begin
  inherited;
  if btnAvancar.Enabled then
    btnAvancar.Click;
end;

procedure TFrmPREtapas.tvDescrCustomDrawCell(Sender: TcxCustomGridTableView;
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

procedure TFrmPREtapas.tvFocusedRecordChanged(Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  RefreshTot;
end;

procedure TFrmPREtapas.btnAlteraTipoClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 1;
end;

procedure TFrmPREtapas.btnAvancarClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 2;
end;

procedure TFrmPREtapas.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Cancelar;
end;

procedure TFrmPREtapas.btnImprimirClick(Sender: TObject);
begin
  inherited;
  FRes := resImprimir;
  Close;
end;

procedure TFrmPREtapas.btnRevisarClick(Sender: TObject);
begin
  inherited;
  FRes := resRevisar;
  Close;
end;

procedure TFrmPREtapas.btnVoltarClick(Sender: TObject);
begin
  inherited;
  Paginas.ActivePageIndex := 1;
end;

procedure TFrmPREtapas.Cancelar;
begin
  FCancelar := True;
  Close;
end;

procedure TFrmPREtapas.cxButton4Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmPREtapas.cxLabel2Click(Sender: TObject);
begin
  inherited;
  FCancelar := True;
  Close;
end;

procedure TFrmPREtapas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFrmPREtapas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FCancelar then
    CanClose := True
  else
  if Paginas.ActivePageIndex = 0 then
    CanClose := False 
  else
    CanClose := (FRes = resImprimir) or (FRes = resRevisar) or 
                (MessageBox(Handle, PChar(SDesejaRealmenteCANCELAREssaImpre), PChar(SAtenção),
                            MB_YESNO or 
                            MB_ICONQUESTION or 
                            MB_APPLMODAL or 
                            MB_DEFBUTTON2) = IDYES);
end;

procedure TFrmPREtapas.FormCreate(Sender: TObject);
var i: integer;
begin
  inherited;
  img.mio.LoadFromStreamGIF(genList.Items[0].Data);
  FCancelar := False;
  Width := 500;
  FFolhas := 0;
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
  Paginas.HideTabs := True;
  Paginas.ActivePageIndex := 0;
end;

procedure TFrmPREtapas.FormShow(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := True;
end;

procedure TFrmPREtapas.GerouDoc(aPaginas: Integer);
begin
  DebugMsg('TFrmPREtapas.GerouDoc - aPaginas: ' + IntToStr(aPaginas));
  Folhas := aPaginas;
  RefreshTot;
  Paginas.ActivePageIndex := 1;
end;

function TFrmPREtapas.Imprimir(var aTipo: Integer; aPaginas: Integer): Integer;
begin
  FRes := resCancelar;
  Folhas := aPaginas;
  if aPaginas>0 then 
    Paginas.ActivePageIndex := 1;
  RefreshTot;
  mtTipo.Locate('ID', aTipo, []); // do not localize
  ShowModal;
  if FRes<>resCancelar then aTipo := mtTipoID.Value;
  Result := FRes;
end;

procedure TFrmPREtapas.PaginasChange(Sender: TObject);
begin
  inherited;
  if Visible and (Paginas.ActivePageIndex=1) then begin
    DebugMsg('TFrmPREtapas.PaginasChange - PaginasChange: ' + IntToStr(Paginas.ActivePageIndex));
    grid.SetFocus;
    if gConfig.ImprimirPDFDireto then
      btnImprimirClick(nil);
  end;
end;

procedure TFrmPREtapas.RefreshTot;
begin
  lbTot.Caption := IntToStr(FFolhas)+ SPáginaS + FloatToStrF(mtTipoValor.Value * FFolhas, ffCurrency, 10, 2);
  if gConfig.RevisarPDF and gConfig.PMReviewCli then begin
    btnRevisar.Visible := True;
    btnRevisar.Top := 0;
    btnImprimir.Caption := SImprimirDiretoSemRevisar; 
    btnImprimir.Top := 150;
  end else begin
    btnImprimir.Caption := SImprimir;
    btnRevisar.Visible := False;
  end;
  btnImprimir.Caption := btnImprimir.Caption + SCusto + FloatToStrF(mtTipoValor.Value * FFolhas, ffCurrency, 10, 2);
end;

procedure TFrmPREtapas.SetFolhas(const Value: Integer);
begin
  if FFolhas=Value then Exit;
  FFolhas := Value;
  if FFolhas>1 then
    lbFolhas.Caption := IntToStr(Value) + SFolhas else
    lbFolhas.Caption := IntToStr(Value) + SFolha;
  dsTipo.Dataset := nil;
  if mtTipo.Active then 
  try
    mtTipo.First;
    while not mtTipo.Eof do begin
      mtTipo.Edit;
      mtTipoTotal.Value := FFolhas * mtTipoValor.Value;
      mtTipo.Post;
      mtTipo.Next;
    end;
    mtTipo.First;
  finally
    dsTipo.Dataset := mtTipo;
  end;
  RefreshTot;
end;

function ForceForegroundWindow(hwnd: THandle; aFormName: String): boolean;
const
  SPI_GETFOREGROUNDLOCKTIMEOUT = $2000;
  SPI_SETFOREGROUNDLOCKTIMEOUT = $2001;
var
  ForegroundThreadID: DWORD;
  ThisThreadID : DWORD;
  timeout : DWORD;
begin
  DebugMsg('ForceForeGroundWindow - aFormName: '+aFormName); // do not localize
  if IsIconic(hwnd) then ShowWindow(hwnd, SW_RESTORE);
  if GetForegroundWindow = hwnd then 
    Result := true
  else begin

  // Windows 98/2000 doesn't want to foreground a window when some other
  // window has keyboard focus
  
    if ((Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion > 4)) or
        ((Win32Platform = VER_PLATFORM_WIN32_WINDOWS) and
        ((Win32MajorVersion > 4) or ((Win32MajorVersion = 4) and
        (Win32MinorVersion > 0)))) then
    begin
  
  // Code from Karl E. Peterson, www.mvps.org/vb/sample.htm
  // Converted to Delphi by Ray Lischner
  // Published in The Delphi Magazine 55, page 16
  
      Result := false;
      ForegroundThreadID := GetWindowThreadProcessID(GetForegroundWindow,nil);
      ThisThreadID := GetWindowThreadPRocessId(hwnd,nil);
      if AttachThreadInput(ThisThreadID, ForegroundThreadID, true) then
      begin
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hwnd);
        AttachThreadInput(ThisThreadID, ForegroundThreadID, false);
        Result := (GetForegroundWindow = hwnd);
      end;
      if not Result then begin
  // Code by Daniel P. Stasinski
        SystemParametersInfo(SPI_GETFOREGROUNDLOCKTIMEOUT, 0, @timeout, 0);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0, TObject(0),  SPIF_SENDCHANGE);
        BringWindowToTop(hwnd); // IE 5.5 related hack
        SetForegroundWindow(hWnd);
        SystemParametersInfo(SPI_SETFOREGROUNDLOCKTIMEOUT, 0,
        TObject(timeout), SPIF_SENDCHANGE);
      end;
    end
    else begin
      BringWindowToTop(hwnd); // IE 5.5 related hack
      SetForegroundWindow(hwnd);
    end;
  
    Result := (GetForegroundWindow = hwnd);
  end;
end; { ForceForegroundWindow }

procedure TFrmPREtapas.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
  ForceForegroundWindow(Handle, 'TFrmPREtapas'); // do not localize
end;

end.

