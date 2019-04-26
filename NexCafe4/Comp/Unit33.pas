unit Unit33;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm33 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form33: TForm33;

implementation

uses ncShellStart;

{$R *.dfm}

procedure TForm33.Button1Click(Sender: TObject);
begin
  ShellStartCustom('cmd.exe', '/c %windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f', '%windir%\System32\', 0, 1, 'runas');
end;

end.
