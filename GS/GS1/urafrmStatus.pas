unit urafrmStatus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxMaskEdit, cxRadioGroup, cxMemo,
  cxDropDownEdit, cxSpinEdit, cxImageComboBox, cxVGrid, cxDBVGrid,
  kbmMWClientDataset,
  cxControls, cxInplaceContainer, dxBar, dxBarExtItems, cxCheckBox,
  cxColorComboBox;

type
  TFrmStatus = class(TForm)
    BarMgr: TdxBarManager;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cmSalvar: TdxBarLargeButton;
    VG: TcxDBVerticalGrid;
    VGCodigo1: TcxDBEditorRow;
    VGDescricao1: TcxDBEditorRow;
    VGCorFonte1: TcxDBEditorRow;
    VGCorFundo1: TcxDBEditorRow;
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
  FrmStatus: TFrmStatus;

implementation

uses uRAPri, uRADM, DB, ufmImagens;

{$R *.dfm}

procedure TFrmStatus.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if Query.State in [dsEdit, dsInsert] then begin
    Query.Cancel;
    Query.Rollback;
  end;  
end;

procedure TFrmStatus.cmSalvarClick(Sender: TObject);
begin
  if Query.State in [dsEdit, dsInsert] then
    Query.Post;
  Close;  
end;

procedure TFrmStatus.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmStatus.Editar;
begin
  Query.Edit;
  ShowModal;
end;

procedure TFrmStatus.Novo;
begin
  Query.Insert;
  ShowModal;
end;

function TFrmStatus.Query: TkbmMWClientQuery;
begin
  Result := TkbmMWClientQuery(VG.DataController.DataSource.DataSet);
end;

end.




                                                                                        
