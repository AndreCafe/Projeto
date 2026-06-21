unit uRAfbClientes;

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
  cxInplaceContainer, cxPC, cxRadioGroup, cxDropDownEdit, cxButtonEdit;

type
  TfbClientes = class(TFrmBase)
    Grid: TcxGrid;
    tvCli: TcxGridDBTableView;
    tvCliCodigo: TcxGridDBColumn;
    tvCliLoja: TcxGridDBColumn;
    tvCliLicTipo: TcxGridDBColumn;
    tvCliLicVenc: TcxGridDBColumn;
    tvCliLicMaq: TcxGridDBColumn;
    tvCliUReq: TcxGridDBColumn;
    tvCliDBColumn2: TcxGridDBColumn;
    tvCliNumMaq: TcxGridDBColumn;
    tvCliTipoLoja: TcxGridDBColumn;
    tvCliUF: TcxGridDBColumn;
    tvCliCidade: TcxGridDBColumn;
    tvCliSenha: TcxGridDBColumn;
    tvCliProprietarios: TcxGridDBColumn;
    tvCliCadastroEm: TcxGridDBColumn;
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
    tvCliTelefones: TcxGridDBColumn;
    tvCliEmailReg: TcxGridDBColumn;
    tvCliFormaPagto: TcxGridDBColumn;
    tvCliManInicio: TcxGridDBColumn;
    tvCliManVenc: TcxGridDBColumn;
    tvCliEmailTec: TcxGridDBColumn;
    tvCliGerente: TcxGridDBColumn;
    glCli: TcxGridLevel;
    dxBarButton1: TdxBarButton;
    cmMostrarTel: TdxBarButton;
    tvCliStatus: TcxGridDBColumn;
    tvCliContatarEm: TcxGridDBColumn;
    tvCliFonteStatus: TcxGridDBColumn;
    tvCliFundoStatus: TcxGridDBColumn;
    LMDSimplePanel1: TLMDSimplePanel;
    LMDSimplePanel2: TLMDSimplePanel;
    btnEncontrar: TPngSpeedButton;
    btnLimpar: TPngSpeedButton;
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
    LMDSimplePanel3: TLMDSimplePanel;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
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
    procedure btnLimparClick(Sender: TObject);
    procedure cmLaySalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    
    procedure ListaEmails;
    procedure MostraTel; 
  
    { Public declarations }
  end;

var
  fbClientes: TfbClientes;

implementation

uses uRAPri, uRADM, Clipbrd, uRSFrmCli, uNexRegPri;

{$R *.dfm}

class function TfbClientes.Descricao: String;
begin
  Result := 'Clientes';
end;

procedure TfbClientes.tvCliDblClick(Sender: TObject);
begin
  cmEditarClick(nil);
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
  inherited;
  btnLimpar.Visible := (Paginas.ActivePageIndex=1);
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

procedure TfbClientes.btnLimparClick(Sender: TObject);
begin
  inherited;
  vgNomeLoja.Properties.Value := '';
  vgCodigo.Properties.Value := 0;
  vgProp.Properties.Value := '';
  vgCidade.Properties.Value := '';
  vgNS.Properties.Value := '';
  vgEmail.Properties.Value := '';
end;

procedure TfbClientes.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmCli.Create(Self).Novo;
end;

procedure TfbClientes.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmCli.Create(Self).Editar(0);
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
  S := ExtractFilePath(ParamStr(0)) + 'regadminlayoutpadrao.ini';
  tvCli.StoreToIniFile(S);
  S := ExtractFilePath(ParamStr(0)) + 'regadminlayout.ini';
  if FileExists(S) then
    tvCli.RestoreFromIniFile(S);
  btnEncontrarClick(nil);
  DM.qCli.Last;
  cmApagar.Enabled := DM.EAdmin;
  tvCliColumnPosChanged(nil, nil);
end;

procedure TfbClientes.cmApagarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente apagar o cliente ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
  if MessageDlg('Deseja realmente apagar o cliente '+DM.qCliLoja.Value+' ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
    DM.qCli.Delete;
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
