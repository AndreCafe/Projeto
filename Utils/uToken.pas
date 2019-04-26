unit uToken;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxLabel;

type
  TForm19 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    cxLabel1: TcxLabel;
    edSenha: TEdit;
    cxLabel2: TcxLabel;
    lbSenha: TcxLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

uses ncToken;

{$R *.dfm}

procedure TForm19.Button1Click(Sender: TObject);
begin
  edSenha.Text := GetTokenPass(edit1.text);
  lbSenha.Caption := Format2Dig(edSenha.Text);
  edSenha.SetFocus;
  
end;

procedure TForm19.FormCreate(Sender: TObject);
begin
  lbSenha.Caption := '';
end;

end.
