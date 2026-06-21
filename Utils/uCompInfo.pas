unit uCompInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomComponent, LMDSysInfo, ExtCtrls;

type
  TForm1 = class(TForm)
    SI: TLMDSysInfo;
    SD: TSaveDialog;
    LB: TListBox;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if SD.Execute then
    LB.Items.SaveToFile(SD.FileName);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  with LB.Items do begin
    Add('username='+SI.Username);
    Add('usercompany='+SI.UserCompany);
    Add('currentuser='+SI.CurrentUser);
    Add('RegisteredCompany='+SI.RegisteredCompany);
    Add('RegisteredOwner='+SI.RegisteredOwner);
    Add('VersionWIN='+SI.VersionWIN);
    Add('WinPath='+SI.WinPath);
    Add('WinSysPath='+SI.WinSysPath);
    Add('');
    Add('ENVIROMENT');
    Add('---------------------');
    AddStrings(SI.Environment);
    Add('');
    Add('Platform='+SI.Platform);
    Add('TempPath='+SI.TempPath);
    Add('ComputerName='+SI.Computername);
  end;  
end;

end.
