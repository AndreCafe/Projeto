unit uCMGPri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, kbmMWClient, kbmMWFileClient, StdCtrls;

type
  TFrmPri = class(TForm)
    Button1: TButton;
    Button2: TButton;
    LB: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

implementation

uses cmDMClient, cmConst;

{$R *.dfm}

procedure TFrmPri.Button1Click(Sender: TObject);
begin
  with dmClient, Client2 do begin
    mwTCPIPmsg.Active := False;
    mwTCPIP.Active := False;
    Transport := mwTCPIP;
    mwTCPIP.Active := True;
    
    Username := 'admin';
    Password := 'cocoon';
    Token := '';
    ShowMessage(Request('Guard', '', 'OBTEMVERSAOMIN', []));
  end;  
end;

procedure TFrmPri.Button2Click(Sender: TObject);
begin
  with dmClient, Client2 do begin
    mwTCPIPmsg.Active := False;
    mwTCPIP.Active := False;
    Transport := mwTCPIPmsg;
    mwTCPIPmsg.Active := True;
    
    Username := cm_GuardUsername;
    Password := '1';
    Token := '';
    ShowMessage(Request('Guard', '', 'OBTEMVERSAOMIN', []));
  end;  
end;

procedure TFrmPri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmClient.mwTCPIP.Active := False;
end;

end.
