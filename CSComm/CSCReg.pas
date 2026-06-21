unit CSCReg;

interface

procedure Register;

implementation

uses Classes, CSCServer, CSCClient, CSCTimer, CSCTimerList, CSCMsgProcessor;

procedure Register;
begin
  RegisterComponents('Nextar C/S Comm', [TCSCServer, TCSCClient, TCSCTimerList, TCSCMsgProcessor]);
end;


end.
