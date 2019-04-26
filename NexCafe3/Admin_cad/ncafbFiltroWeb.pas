unit ncafbFiltroWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxBar,
  dxPSCore, cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, nxdb,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer,
  cxLabel, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton;

type
  TfbFiltroWeb = class(TFrmBase)
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    Tab: TnxTable;
    DS: TDataSource;
    TabID: TAutoIncField;
    TabURL: TStringField;
    TabLiberar: TBooleanField;
    TVURL: TcxGridDBColumn;
    tlmdsp: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    lbAtivo: TcxLabel;
    btnAtivar: TLMDSpeedButton;
    procedure cmApagarClick(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure btnAtivarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
  
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbFiltroWeb: TfbFiltroWeb;

implementation

uses ncaFrmPri, ufmImagens, ncaDM, ncaFrmSite;

{$R *.dfm}

procedure TfbFiltroWeb.AtualizaDireitos;
begin
  inherited;
  if Dados.CM.Config.FiltrarWeb then begin
    lbAtivo.Caption := 'Ativo';
    lbAtivo.Style.TextColor := clGreen;
    btnAtivar.Caption := 'Clique aqui para Desativar';
  end else begin
    lbAtivo.Caption := 'Inativo';
    lbAtivo.Style.TextColor := clRed;
    btnAtivar.Caption := 'Clique aqui para Ativar';
  end;
  FiltraDados;
end;

procedure TfbFiltroWeb.btnAtivarClick(Sender: TObject);
begin
  inherited;
  with Dados, CM do begin
    Config.AtualizaCache;
    Config.FiltrarWeb := not Config.FiltrarWeb;
    tbConfig.Edit;
    tbConfigFiltrarWeb.Value := Config.FiltrarWeb;
    tbConfig.Post;
    SalvaAlteracoesObj(Config, False);
    AtualizaDireitos;
  end;
end;

procedure TfbFiltroWeb.cmApagarClick(Sender: TObject);
begin
  inherited;
  if not Tab.IsEmpty then 
  if SimNao('Deseja realmente desbloquear o site ' + TabURL.Value + ' ?') then
    Tab.Delete;
end;

procedure TfbFiltroWeb.cmNovoClick(Sender: TObject);
var S: String;
begin
  inherited;
  S := TFrmSite.Create(nil).ObtemURL('');
  if S > '' then begin
    Tab.Insert;
    TabURL.Value := S;
    Tab.Post;
  end;
end;

class function TfbFiltroWeb.Descricao: String;
begin
  Result := 'Bloqueio de Sites';
end;

procedure TfbFiltroWeb.FiltraDados;
begin
  if not Tab.Active then
    Tab.Open else
    Tab.Refresh;
end;

end.
