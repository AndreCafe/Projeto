unit CSCCustomBase;

interface

uses
  Classes,
  CSCBase,
  CSCQueue;

type
   TCSCCustomCommBase = class ( TCSCCommBase )
     FMsgQueue : TCSCMessageQueue;
   public
     constructor Create(Owner: TComponent); override;
     destructor Destroy; override;

     property MsgQueue: TCSCMessageQueue
       read FMsgQueue;
   end;

implementation

constructor TCSCCustomCommBase.Create(OWner: TComponent);
begin
  inherited;
  FMsgQueue := TCSCMessageQueue.Create(Self);
end;

destructor TCSCCustomCommBase.Destroy;
begin
  FMsgQueue.Free;
  inherited;
end;

end.
 