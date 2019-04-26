unit ncaFrmMsgChat;
{
    ResourceString: Dario 11/03/13
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, cxLabel, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo, cxGraphics,
  cxLookAndFeels;

type
  TFrmMsgChat = class(TForm)
    meMsg: TcxMemo;
    btnOk: TcxButton;
    btnCancelar: TcxButton;
    lbMaq: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    function EnviarMsg(var S: String; aMaq: Integer): Boolean;
    { Public declarations }
  end;

var
  FrmMsgChat: TFrmMsgChat;

implementation

// START resource string wizard section
resourcestring
  SChatComMáquina = 'Chat com máquina ';

// END resource string wizard section


{$R *.dfm}

{ TFrmMsgChat }

procedure TFrmMsgChat.btnOkClick(Sender: TObject);
begin
  meMsg.PostEditValue;
end;

function TFrmMsgChat.EnviarMsg(var S: String; aMaq: Integer): Boolean;
begin
  Caption := SChatComMáquina+IntToStr(aMaq);
  ShowModal;
  Result := (ModalResult=mrOk);
  S := meMsg.Lines.Text;
end;

procedure TFrmMsgChat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.

