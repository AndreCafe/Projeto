unit uRAFrmPC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxMaskEdit, cxRadioGroup, cxMemo,
  cxDropDownEdit, cxSpinEdit, cxImageComboBox, cxVGrid, cxDBVGrid,
  cxControls, cxInplaceContainer, dxBar, dxBarExtItems, cxDBLookupComboBox;

type
  TFrmPC = class(TForm)
    BarMgr: TdxBarManager;
    cmCancelar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    cmSalvar: TdxBarLargeButton;
    VG: TcxDBVerticalGrid;
    VGNome: TcxDBEditorRow;
    VGSintetico: TcxDBEditorRow;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmSalvarClick(Sender: TObject);
    procedure cmCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Novo;
    procedure Editar;
    { Public declarations }
  end;

var
  FrmPC: TFrmPC;

implementation

uses uRAPri, uRADM, DB, ufmImagens;

{$R *.dfm}

procedure TFrmPC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  if DM.qPC.State in [dsEdit, dsInsert] then begin
    DM.qPC.Cancel;
    DM.qPC.Rollback;
  end;  
end;

procedure TFrmPC.cmSalvarClick(Sender: TObject);
begin
  if DM.qPC.State in [dsEdit, dsInsert] then
    DM.qPC.Post;
  Close;  
end;

procedure TFrmPC.cmCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPC.Editar;
begin
  DM.qPC.Edit;
  ShowModal;
end;

procedure TFrmPC.Novo;
begin
  DM.qPC.Insert;
  ShowModal;
end;

end.




                                                                                        
