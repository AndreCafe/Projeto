unit uInstallNexPrinter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm10 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses ncgPrintInstall, ncDebug;

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
begin
  DebugAtivo := True;
  InstallNexPrinter(True);
end;

end.
