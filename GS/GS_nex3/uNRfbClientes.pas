unit uNRfbClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox,
  cxMaskEdit, cxCalendar, cxMemo, cxDBLookupComboBox, cxCheckBox,
  kbmMemTable, kbmMWCustomConnectionPool, kbmMWCustomDataset,
  kbmMWClientDataset, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, cxCurrencyEdit,
  dxBar, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, cxSpinEdit, cxTextEdit, cxLabel,
  Buttons, PngSpeedButton, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, dxDockControl, dxDockPanel, cxVGrid,
  cxInplaceContainer, cxPC, cxRadioGroup, cxDropDownEdit, cxButtonEdit,
  cxDBVGrid, LMDCustomScrollBox, LMDScrollBox, lmdsplt, nxdb, uFreeBoletoImage,
  uFreeBoleto, cxRichEdit, cxDBRichEdit, dxSkinsCore, dxSkinsdxBarPainter,
  dxSkinOffice2007Black, dxSkinSeven, dxSkinsDefaultPainters, LMDControl;

type
  TfbClientes = class(TFrmBase)
    cmMostrarTel: TdxBarButton;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    btnEncontrar: TPngSpeedButton;
    Paginas: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    edUltimos: TcxSpinEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxTabSheet2: TcxTabSheet;
    VG: TcxVerticalGrid;
    vgNomeLoja: TcxEditorRow;
    vgCodigo: TcxEditorRow;
    vgProp: TcxEditorRow;
    vgCidade: TcxEditorRow;
    vgEmail: TcxEditorRow;
    vgNS: TcxEditorRow;
    cxTabSheet3: TcxTabSheet;
    cxLabel1: TcxLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
    cmLimpar: TdxBarLargeButton;
    Grid: TcxGrid;
    tvCli: TcxGridDBTableView;
    tvCliCodigo: TcxGridDBColumn;
    tvCliLoja: TcxGridDBColumn;
    tvCliCadastroEm: TcxGridDBColumn;
    tvCliUReq: TcxGridDBColumn;
    tvCliLicMaq: TcxGridDBColumn;
    tvCliDBColumn2: TcxGridDBColumn;
    tvCliStatus: TcxGridDBColumn;
    tvCliTelefones: TcxGridDBColumn;
    tvCliTipoLoja: TcxGridDBColumn;
    tvCliUF: TcxGridDBColumn;
    tvCliCidade: TcxGridDBColumn;
    tvCliSenha: TcxGridDBColumn;
    tvCliProprietarios: TcxGridDBColumn;
    tvCliContatarEm: TcxGridDBColumn;
    tvCliCadastroPor: TcxGridDBColumn;
    tvCliAtualizadoEm: TcxGridDBColumn;
    tvCliAtualizadoPor: TcxGridDBColumn;
    tvCliRazaoSocial: TcxGridDBColumn;
    tvCliPais: TcxGridDBColumn;
    tvCliEndereco: TcxGridDBColumn;
    tvCliCEP: TcxGridDBColumn;
    tvCliBairro: TcxGridDBColumn;
    tvCliSerieHD: TcxGridDBColumn;
    tvCliCNPJ: TcxGridDBColumn;
    tvCliIE: TcxGridDBColumn;
    tvCliObs: TcxGridDBColumn;
    tvCliEmailReg: TcxGridDBColumn;
    tvCliFormaPagto: TcxGridDBColumn;
    tvCliManInicio: TcxGridDBColumn;
    tvCliManVenc: TcxGridDBColumn;
    tvCliEmailTec: TcxGridDBColumn;
    tvCliGerente: TcxGridDBColumn;
    tvCliFonteStatus: TcxGridDBColumn;
    tvCliFundoStatus: TcxGridDBColumn;
    glCli: TcxGridLevel;
    tvCliBloq: TcxGridDBColumn;
    tvCliCliente: TcxGridDBColumn;
    tvCliPrograma: TcxGridDBColumn;
    tvCliCodComp: TcxGridDBColumn;
    tvCliLicenca: TcxGridDBColumn;
    procedure tvCliDblClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmAtualizarClick(Sender: TObject);
    procedure FrmBasePaiCreate(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
    procedure cmMostrarTelClick(Sender: TObject);
    procedure tvCliStatusCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvCliColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure btnEncontrarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure cmLayRestaurarClick(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure cmLaySalvarClick(Sender: TObject);
    procedure cmLimparClick(Sender: TObject);
    procedure tvCliLicTipoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvHistTextoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvCliBloqCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvCliClienteCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    
    procedure ListaEmails;
    procedure MostraTel; 
    function GetDataSource: TDataSource; override;
    function GetDataset: TDataset; override;
  
    { Public declarations }
  end;

var
  fbClientes: TfbClientes;

implementation

uses Clipbrd, uNRFrmCli, uNexRegPri, uNexRegDM, uNRFrmTitulo, uFrmHC, uFrmTar,
  uFrmAutorizacao;

{$R *.dfm}

class function TfbClientes.Descricao: String;
begin
  Result := 'Clientes';
end;

procedure TfbClientes.cmLimparClick(Sender: TObject);
begin
  inherited;
  vgNomeLoja.Properties.Value := '';
  vgCodigo.Properties.Value := 0;
  vgProp.Properties.Value := '';
  vgCidade.Properties.Value := '';
  vgNS.Properties.Value := '';
  vgEmail.Properties.Value := '';
end;

procedure TfbClientes.tvCliDblClick(Sender: TObject);
begin
  cmEditarClick(nil);
end;

procedure TfbClientes.tvCliLicTipoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.Value <> null) and (AViewInfo.Value=4) then
    ACanvas.Canvas.Brush.Color := clRed;
end;

procedure TfbClientes.ListaEmails;
var
  S: String;
  SL: TStrings;
  I : Integer;
begin
  SL := TStringList.Create;
  with DM do
  try
    qCli.First;
    S := '';
    while not qCli.Eof do begin
      SL.Text := qCliEmailReg.Value;
      for I := 0 to SL.Count-1 do
        S := S + SL[I] + '; ';
      qCli.Next;
      Application.ProcessMessages;
    end;
    Delete(S, Length(S)-1, 2);
    Clipboard.AsText := S;
    ShowMessage(S);
  finally
    SL.Free;
  end;  
end;

procedure TfbClientes.MostraTel;
begin
end;


procedure TfbClientes.PaginasChange(Sender: TObject);
begin
  if fechando then Exit;
  
  inherited;
  if Paginas.ActivePageIndex=1 then
    cmLimpar.Visible := ivAlways else
    cmLimpar.Visible := ivNever;
end;

procedure TfbClientes.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  DM.AbreCli;
end;

function VarDef(V, Def: Variant): Variant;
begin
  if V=null then
    Result := Def else
    Result := V;
end;

procedure TfbClientes.btnEncontrarClick(Sender: TObject);
var I : Integer;
begin
  inherited;
  VG.HideEdit;
  lOperacao := Paginas.ActivePageIndex;
  lLoja := VarDef(vgNomeLoja.Properties.Value, '');
  lCodigo := VarDef(vgCodigo.Properties.Value, 0);
  lProprietario := VarDef(vgProp.Properties.Value, '');
  lCidade := VarDef(vgCidade.Properties.Value, '');
  lEmail := VarDef(vgEmail.Properties.Value, '');
  lNumSerie := VarDef(vgNS.Properties.Value, '');
  lUltimos := VarDef(edUltimos.Value, 0);
  DM.AbreCli;
end;

procedure TfbClientes.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmCli.Create(Self).Novo;
end;

procedure TfbClientes.cmEditarClick(Sender: TObject);
begin
  inherited;
  
  with DM do 
  TFrmCli.Create(Self).Editar(qCli, 0);
  
end;

procedure TfbClientes.cmLayRestaurarClick(Sender: TObject);
var S: String;
begin
  S := ExtractFilePath(ParamStr(0)) + 'regadminlayoutpadrao.ini';
  if FileExists(S) then
    tvCli.RestoreFromIniFile(S);
end;

procedure TfbClientes.cmLaySalvarClick(Sender: TObject);
var S: String;
begin
  S := ExtractFilePath(ParamStr(0)) + 'regadminlayout.ini';
  tvCli.StoreToIniFile(S);
end;

procedure TfbClientes.cmAtualizarClick(Sender: TObject);
var Cod: Integer;
begin
  inherited;
  Cod := DM.qCliCodigo.Value;
  DM.qCli.DisableControls;
  try
    DM.AbreCli;
    DM.qCli.Locate('Codigo', Cod, []);
  finally
    DM.qCli.EnableControls;
  end;    
end;

procedure TfbClientes.FrmBasePaiCreate(Sender: TObject);
var S: String;
begin
  inherited;
  Paginas.ActivePageIndex := 0;
  S := ExtractFilePath(ParamStr(0)) + 'nexreglayoutpadrao.ini';
  tvCli.StoreToIniFile(S);
  S := ExtractFilePath(ParamStr(0)) + 'nexreglayout.ini';
  if FileExists(S) then
    tvCli.RestoreFromIniFile(S);
  btnEncontrarClick(nil);
  DM.qCli.Last;
  tvCliColumnPosChanged(nil, nil);
end;

function TfbClientes.GetDataset: TDataset;
begin
  Result := DM.qCli;
end;

function TfbClientes.GetDataSource: TDataSource;
begin
  Result := DM.dsCli;
end;

procedure TfbClientes.cmApagarClick(Sender: TObject);
begin
  inherited;
  if not FrmPri.tFin.IsEmpty then
    Raise Exception.Create('Não é possível apagar um cliente que tem movimentação financeira');
    
  with DM do 
  if MessageDlg('Deseja realmente apagar o cliente ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
  if MessageDlg('Deseja realmente apagar o cliente '+qCliLoja.Value+' ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
  begin
    if not tCli.FindKey([qCliCodigo.Value]) then Exit;
    tCli.Delete;
    qCli.Active := False;
    qCli.Active := True;    
  end;
end;

procedure TfbClientes.cmMostrarTelClick(Sender: TObject);
begin
  inherited;
  tvCli.Preview.Visible := cmMostrarTel.Down;
end;

procedure TfbClientes.tvCliStatusCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var V: Variant;
begin
  inherited;
  if AViewInfo.Value = null then begin
    ACanvas.Brush.Color := clYellow;
    Exit;
  end;
  V := AViewInfo.GridRecord.Values[tvCliFundoStatus.Index];
  if V=Null then V := clBlack;
  ACanvas.Brush.Color := V;
  V := AViewInfo.GridRecord.Values[tvCliFonteStatus.Index];
  if V=Null then V := clBlack;
  ACanvas.Font.Color := V;
end;

procedure TfbClientes.tvHistTextoCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  ACanvas.Brush.Color := clwhite;
end;

procedure TfbClientes.tvCliBloqCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.Value<>null) and (AViewInfo.Value=True) then begin
    ACanvas.Brush.Color := clBlack;
    ACanvas.Font.Color := clWhite;
    ACanvas.Font.Style := [fsBold];
  end;
end;

procedure TfbClientes.tvCliClienteCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if (AViewInfo.Value<>null) and (AViewInfo.Value=True) then begin
    ACanvas.Brush.Color := clWhite;
    ACanvas.Font.Color := clGreen;
    ACanvas.Font.Style := [fsBold];
  end;
end;

procedure TfbClientes.tvCliColumnPosChanged(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  inherited;
  if tvCli.OptionsBehavior.IncSearchItem <> tvCli.Columns[0] then begin
    tvCli.OptionsBehavior.IncSearchItem := tvCli.Columns[0];
    tvCli.DataController.ClearSorting(True);
    tvCli.Columns[0].SortOrder := soAscending;
  end;
end;

end.
