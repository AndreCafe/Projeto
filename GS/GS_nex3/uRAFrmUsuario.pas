unit uRAFrmUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxMaskEdit, cxRadioGroup, cxMemo,
  cxDropDownEdit, cxSpinEdit, cxImageComboBox, cxVGrid, cxDBVGrid,
  kbmMWClientDataset,
  cxControls, cxInplaceContainer, dxBar, dxBarExtItems, cxCheckBox;

type
  TFrmUsuario = class(TForm)
    BarMgr: TdxBarManager;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cmSalvar: TdxBarLargeButton;
    VG: TcxDBVerticalGrid;
    VGUsername: TcxDBEditorRow;
    VGNome: TcxDBEditorRow;
    VGAdmin: TcxDBEditorRow;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Novo;
    procedure Editar;
    function Query: TkbmMWClientQuery;
    { Public declarations }
  end;

var
  FrmUsuario: TFrmUsuario;

implementation

uses uRAPri, uRADM, DB, ufmImagens;

{$R *.dfm}

procedure TFrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Query.State in [dsEdit, dsInsert] then begin
    Query.Cancel;
    Query.Rollback;
  end;  
end;

procedure TFrmUsuario.cmSalvarClick(Sender: TObject);
begin
  if Query.State in [dsEdit, dsInsert] then
    Query.Post;
  Close;  
end;

procedure TFrmUsuario.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmUsuario.Editar;
begin
  Query.Edit;
  ShowModal;
end;

procedure TFrmUsuario.Novo;
begin
  Query.Insert;
  ShowModal;
end;

function TFrmUsuario.Query: TkbmMWClientQuery;
begin
  Result := TkbmMWClientQuery(VG.DataController.DataSource.DataSet);
end;

end.




                                                                                        
