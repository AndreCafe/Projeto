unit uTestConn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, kbmMWClient, kbmMWCustomTransport,
  kbmMWTCPIPIndyTransport;

type
  TForm1 = class(TForm)
    mwTCPIP: TkbmMWTCPIPIndyClientTransport;
    mwCli: TkbmMWSimpleClient;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
  mwTCPIP.Active := True;
end;

procedure TForm1.Button2Click(Sender: TObject);
var V: Variant;
begin
  V := mwCli.Request('CYBERROOM', '100', 'UserLogin', ['141cd9a7cc']);
  ShowMEssage('Login OK '+V);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  mwCli.Request('CYBERROOM', '100', 'KeepAlive', []);
  ShowMessage('KeepAlive OK');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  mwCli.Request('CYBERROOM', '100', 'UserLogout', []);
  ShowMessage('Logout OK');
end;

end.
