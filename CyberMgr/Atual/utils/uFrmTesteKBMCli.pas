unit uFrmTesteKBMCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm12 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses CMdmKbmCli;

{$R *.dfm}

procedure TForm12.Button1Click(Sender: TObject);
begin
  dmKbmcli.mwCli.GetFile('c:\teste.mp3', 'teste.mp3')
end;

end.
