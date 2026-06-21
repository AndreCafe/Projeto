unit uRAfbUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore;

type
  TfbUsuario = class(TFrmBase)
    GridTV: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    Grid: TcxGrid;
    GridTVUsername: TcxGridDBColumn;
    GridTVNome: TcxGridDBColumn;
    GridTVAdmin: TcxGridDBColumn;
    cmSenha: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmAtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    
    { Public declarations }
  end;

var
  fbUsuario: TfbUsuario;

implementation

uses uRADM, uRAPri, uRAFrmUsuario;

{$R *.dfm}

{ TfbUsuario }


class function TfbUsuario.Descricao: String;
begin
  Result := 'Usuários';
end;

procedure TfbUsuario.FormCreate(Sender: TObject);
begin
  cmAtualizarClick(nil);
end;

procedure TfbUsuario.cmNovoClick(Sender: TObject);
begin
  TFrmUsuario.Create(Self).Novo;
end;

procedure TfbUsuario.cmEditarClick(Sender: TObject);
begin
  TFrmUsuario.Create(Self).Editar;
end;

procedure TfbUsuario.cmAtualizarClick(Sender: TObject);
begin
  DM.qUsuario.Active := False;
  DM.qUsuario.Active := True;
end;

end.
