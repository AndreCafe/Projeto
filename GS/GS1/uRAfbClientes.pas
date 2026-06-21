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
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore;

type
  TfbClientes = class(TFrmBase)
    Grid: TcxGrid;
    tvCli: TcxGridDBTableView;
    tvCliCodigo: TcxGridDBColumn;
    tvCliLoja: TcxGridDBColumn;
    tvCliLicTipo: TcxGridDBColumn;
    tvCliLicVenc: TcxGridDBColumn;
    tvCliLicMaq: TcxGridDBColumn;
    tvCliDBColumn1: TcxGridDBColumn;
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
    procedure FrmBasePaiDestroy(Sender: TObject);
    procedure tvCliColumnPosChanged(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
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

uses uRAPri, uRADM, Clipbrd, uRSFrmCli;

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

procedure TfbClientes.cmAtualizarClick(Sender: TObject);
var Cod: Integer;
begin
  inherited;
  Cod := DM.qCliCodigo.Value;
  DM.qCli.DisableControls;
  try
    DM.qCli.Active := False;
    DM.qCli.Active := True;
    DM.qCli.Locate('Codigo', Cod, []);
  finally
    DM.qCli.EnableControls;
  end;    
end;

procedure TfbClientes.FrmBasePaiCreate(Sender: TObject);
var S: String;
begin
  inherited;
  S := ExtractFilePath(ParamStr(0)) + 'regadminlayout.ini';
  if FileExists(S) then
    tvCli.RestoreFromIniFile(S);
  cmAtualizarClick(nil);
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

procedure TfbClientes.FrmBasePaiDestroy(Sender: TObject);
var S: String;
begin
  inherited;
  S := ExtractFilePath(ParamStr(0)) + 'regadminlayout.ini';
  tvCli.StoreToIniFile(S);
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
