unit Unit24;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm24 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form24: TForm24;

implementation

uses ncgShell;

{$R *.dfm}

procedure TForm24.Button1Click(Sender: TObject);
begin
  ShowMessage(StartupFolder + sLineBreak + StartMenuSubFolder + ', ' + StartupSubfolder);
end;

end.
