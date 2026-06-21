unit uParseURL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm6 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses ncAppUrlLog;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var 
  UI: TncUrlInfo;
  SI: TncSearchInfo;
begin
  ExtractUrlInfo(Edit1.Text, UI);
  Label1.Caption := UI.aiHost;
  Label2.Caption := UI.aiDominio;
  Label3.Caption := UI.aiPagina;
  ExtractSearchInfo(UI.aiDominio, UI.aiPagina, SI);
  Label4.Caption := SI.siEng;
  Label5.Caption := SI.siArg;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  ShowMessage(UTF8Encode('genérico'));
end;

end.
