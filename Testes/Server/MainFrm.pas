unit MainFrm;

interface

uses
  {$IFDEF NXWINAPI}nxWinAPI{$ELSE}Windows{$ENDIF}, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, nxllPluginBase, nxrpBase, nxrpServer, nxllTransport,
  nxrpCommandHandler, nxllSimpleCommandHandler, nxtmSharedMemoryTransport,
  nxtnNamedPipeTransport, nxllComponent, nxptBasePooledTransport,
  nxtwWinsockTransport;

type
  TForm1 = class(TForm)
    Winsock: TnxWinsockTransport;
    NamedPipe: TnxNamedPipeTransport;
    SharedMemory: TnxSharedMemoryTransport;
    SimpleCommandHandler: TnxSimpleCommandHandler;
    RemotingCommandHandler: TnxRemotingCommandHandler;
    RemotingServer: TnxRemotingServer;
    bnStart: TButton;
    bnStop: TButton;
    procedure bnStartClick(Sender: TObject);
    procedure bnStopClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.bnStartClick(Sender: TObject);
begin
  try
    Winsock.Open;
    NamedPipe.Open;
    SharedMemory.Open;
  except
    SimpleCommandHandler.Close;
    raise;
  end;
  Caption := 'Server started';
end;

procedure TForm1.bnStopClick(Sender: TObject);
begin
  SimpleCommandHandler.Close;
  Caption := 'Server stopped';
end;

end.
