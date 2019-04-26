unit uTesteBrowserEmbutidoAD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls, SHDocVw,
  Vcl.ExtCtrls;

type
  TFrmTestePub = class(TForm)
    WB: TWebBrowser;
    panTop: TPanel;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTestePub: TFrmTestePub;

implementation

{$R *.dfm}

procedure TFrmTestePub.Button1Click(Sender: TObject);
begin
  WB.Navigate(Edit1.Text);
end;

end.
