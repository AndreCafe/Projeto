unit ucmafbAvisos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxMaskEdit, cxCheckBox, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, nxdb, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls;

type
  TfbAvisos = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    TabMinutos: TWordField;
    TabAvisoTexto: TStringField;
    TabSegAvisoTexto: TWordField;
    TabPiscarAvisoTexto: TBooleanField;
    TabSom: TBlobField;
    TabTocarSom: TBooleanField;
    VMinutos1: TcxGridDBColumn;
    VAvisoTexto1: TcxGridDBColumn;
    VSegAvisoTexto1: TcxGridDBColumn;
    VPiscarAvisoTexto1: TcxGridDBColumn;
    VTocarSom1: TcxGridDBColumn;
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AtualizaDireitos; override;
    class function Descricao: String; override;
    { Public declarations }
  end;

var
  fbAvisos: TfbAvisos;

implementation

uses ucmaDM, ucmaPri, ucmaFrmAviso;

{$R *.dfm}

{ TFrmBase1 }

procedure TfbAvisos.AtualizaDireitos;
begin
  inherited;
  if not Tab.Active then 
    Tab.Open
  else
    Tab.Refresh;  
end;

class function TfbAvisos.Descricao: String;
begin
  Result := 'Avisos de Término de Tempo';
end;

procedure TfbAvisos.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmAviso.Create(Self).Novo(Tab);
end;

procedure TfbAvisos.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmAviso.Create(Self).Editar(Tab);
end;

procedure TfbAvisos.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNaoH('Deseja realmente apagar o aviso de ' + TabMinutos.AsString + ' minutos?', Handle) then
    Tab.Delete;
end;

end.
