unit urafbStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmFormBase, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, dxBar,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxBarExtItems, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, cxColorComboBox;

type
  TfbStatus = class(TFrmBase)
    TV: TcxGridDBTableView;
    GL: TcxGridLevel;
    Grid: TcxGrid;
    cmSenha: TdxBarButton;
    VDescricao1: TcxGridDBColumn;
    VCorFonte1: TcxGridDBColumn;
    VCorFundo1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cmNovoClick(Sender: TObject);
    procedure cmEditarClick(Sender: TObject);
    procedure cmApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function Descricao: String; override;
    
    procedure Atualizar;
    { Public declarations }
  end;

var
  fbStatus: TfbStatus;

implementation

uses uRADM, uRAPri, urafrmStatus;

{$R *.dfm}

{ TfbUsuario }

procedure TfbStatus.Atualizar;
begin
  DM.qStatus.Active := False;
  DM.qStatus.Active := True;
end;

class function TfbStatus.Descricao: String;
begin
  Result := 'Cadastro de Status de Clientes';
end;

procedure TfbStatus.FormCreate(Sender: TObject);
begin
  Atualizar;
end;

procedure TfbStatus.cmNovoClick(Sender: TObject);
begin
  TFrmStatus.Create(Self).Novo;
end;

procedure TfbStatus.cmEditarClick(Sender: TObject);
begin
  TFrmStatus.Create(Self).Editar;   
end;

procedure TfbStatus.cmApagarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente apagar o status '+DM.qStatusDescricao.Value+' ?', mtConfirmation, [mbNo, mbYes], 0)=mrYes then
    DM.qStatus.Delete;
end;

end.
