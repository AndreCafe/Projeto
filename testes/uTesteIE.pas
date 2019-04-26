unit uTesteIE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, SHDocVw;

type
  TForm10 = class(TForm)
    W: TWebBrowser;
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
begin
  W.Navigate(Edit1.Text);
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  Set8087CW($133f) 
end;

end.
