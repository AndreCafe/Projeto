unit ucmafbTipoAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, nxdb, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls;

type
  TfbTiposAcesso = class(TFrmBase)
    Tab: TnxTable;
    TabValorTotal: TCurrencyField;
    TabHoras: TIntegerField;
    TabDescr: TStringField;
    TabCodigo: TWordField;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    TVCodigo1: TcxGridDBColumn;
    TVHoras1: TcxGridDBColumn;
    TVValorTotal1: TcxGridDBColumn;
    TVDescr1: TcxGridDBColumn;
    GL: TcxGridLevel;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltraDados; override;
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
  end;

var
  fbTiposAcesso: TfbTiposAcesso;

implementation

uses ucmaPri, ucmaFrmPacote, cmIDRecursos, ucmaDM;

{$R *.dfm}

{ TfbPacotes }

class function TfbTiposAcesso.Descricao: String;
begin
  Result := 'Tipos de Acesso';
end;

procedure TfbTiposAcesso.FiltraDados;
begin
  inherited;
  if not Tab.Active then
    Tab.Open
  else
    Tab.Refresh  ;
end;

procedure TfbTiposAcesso.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmPacote.Create(Self).Novo(Tab);
end;

procedure TfbTiposAcesso.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmPacote.Create(Self).Editar(Tab);
end;

procedure TfbTiposAcesso.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNaoH('Deseja realmente apagar esse pacote', Handle) then
    Tab.Delete;
end;

procedure TfbTiposAcesso.AtualizaDireitos;
begin
  inherited;
  cmApagar.Enabled := Permitido(daCapturar);
end;

end.
