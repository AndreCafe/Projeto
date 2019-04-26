unit uLogoff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm35 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form35: TForm35;

implementation

uses JwaWtsApi32;

{$R *.dfm}

procedure TForm35.Button3Click(Sender: TObject);
var
  PSessionInfo: PWTS_SESSION_INFO;
  SessionInfo: WTS_SESSION_INFO;
  SessionCount,
  BuffSize: DWord;
  i,
  lstCount: Integer;
  res: boolean;
  S: String;
begin
    res := WTSEnumerateSessions(WTS_CURRENT_SERVER_HANDLE, 0, 1, PSessionInfo, SessionCount);
    if res then
      begin
        for i := 1 to SessionCount do
          begin
            SessionInfo := PWTS_SESSION_INFO(Integer(PSessionInfo) + (i-1) * SizeOf(WTS_SESSION_INFO))^;
//            if SessionInfo.State <> WTSDisconnected then Continue;
//            WTSQuerySessionInformation(WTS_CURRENT_SERVER_HANDLE, SessionInfo.SessionId, WTSUserName, UserName, BuffSize);
              Memo1.Lines.Add('SessionID: ' + IntToStr(SessionInfo.SessionId) + ' WinStationName: ' + SessionInfo.pWinStationName);

              S := UpperCase(SessionInfo.pWinStationName);
              if Pos('RDP-TCP#', S)>0 then
                WTSLogoffSession(WTS_CURRENT_SERVER_HANDLE, SessionInfo.SessionId, False);
              
              
            
{              if UpperCase(UserName) = UpperCase(Trim(lstTemp.Strings[lstCount])) then
                 begin
                   BooltoStr(WTSLogoffSession(WTS_CURRENT_SERVER_HANDLE, SessionInfo.SessionId, True), True);
                   WTSFreeMemory(UserName);
                   Break;
                 end;}
            
          end;
      end;
    WTSFreeMemory(PSessionInfo);
end;

end.
