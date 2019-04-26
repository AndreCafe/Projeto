unit unxInst_Folder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StShlCtl, StdCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, ShlObj, cxShellCommon, cxContainer,
  cxShellTreeView, LMDControl, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, cxEdit, cxTreeView;

type
  TFrmFolder = class(TForm)
    Edit1: TEdit;
    TV: TcxShellTreeView;
    LMDSimplePanel1: TLMDSimplePanel;
    btnOk: TButton;
    Button3: TButton;
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function ObtemFolder(aFolder: String): String;
    { Public declarations }
  end;

var
  FrmFolder: TFrmFolder;

implementation

{$R *.dfm}

procedure TFrmFolder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFolder.FormShow(Sender: TObject);
begin
  TV.Path := 'C:\';
end;

function TFrmFolder.ObtemFolder(aFolder: String): String;
begin
  Edit1.Text := aFolder;
  ShowModal;
  if ModalResult=mrOk then
    Result := Edit1.Text else
    Result := aFolder;
end;

procedure TFrmFolder.TVChange(Sender: TObject; Node: TTreeNode);
var S: String;
begin
  S := TV.Path;
  if Copy(S, Length(S), 1)='\' then
    Delete(S, Length(S), 1);
  if Trim(S)>'' then   
    Edit1.Text := S+'\Nexcafe';
end;

end.
