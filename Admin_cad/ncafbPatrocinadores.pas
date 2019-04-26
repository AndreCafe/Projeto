unit ncafbPatrocinadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxMaskEdit, cxCheckBox, cxCurrencyEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, nxdb, dxPSCore,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBar, dxBarExtItems, ExtCtrls,
  cxImageComboBox;

type
  TfbPatrocinadores = class(TFrmBase)
    Tab: TnxTable;
    dsTab: TDataSource;
    Grid: TcxGrid;
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    TabNome: TStringField;
    TabURLArea1: TMemoField;
    TabURLArea2: TMemoField;
    TabDominiosPerm: TMemoField;
    TVNome: TcxGridDBColumn;
    TVURLArea1: TcxGridDBColumn;
    TVURLArea2: TcxGridDBColumn;
    TVDominiosPerm: TcxGridDBColumn;
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
  fbPatrocinadores: TfbPatrocinadores;

implementation

uses 
  ncaDM, 
  ncaFrmPri, 
  ncaFrmPatro;

{$R *.dfm}

{ TFrmBase1 }

procedure TfbPatrocinadores.AtualizaDireitos;
begin
  inherited;
  if not Tab.Active then 
    Tab.Open
  else
    Tab.Refresh;  
end;

class function TfbPatrocinadores.Descricao: String;
begin
  Result := 'Patrocinadores Acesso Grátis';
end;

procedure TfbPatrocinadores.cmNovoClick(Sender: TObject);
begin
  inherited;
  TFrmPatro.Create(Self).Novo(Tab);
end;

procedure TfbPatrocinadores.cmEditarClick(Sender: TObject);
begin
  inherited;
  TFrmPatro.Create(Self).Editar(Tab);
end;

procedure TfbPatrocinadores.cmApagarClick(Sender: TObject);
begin
  inherited;
  if SimNaoH('Deseja realmente apagar o patrocinador ' + TabNome.AsString + '?', Handle) then
    Tab.Delete;
end;

end.
