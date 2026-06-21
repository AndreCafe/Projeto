unit SelfishSample;

interface

type
  ISelfish = interface
    ['{14C78CAC-69E5-11D6-9239-0004AC5359AE}']
    procedure TellMeAboutSelf;
  end;
  TSelfish = class(TInterfacedObject,ISelfish)
  protected
    procedure TellMeAboutSelf;
  end;
  TSelfishWithData = class(TInterfacedObject,ISelfish)
  private
    FData : Integer; // 4 bytes - this should offset the interfaces by 4 bytes
  protected
    procedure TellMeAboutSelf;
    constructor Create(SomeData: Integer);
  end;

implementation

uses LoggerIntf, SysUtils;

{ TSelfish }

procedure TSelfish.TellMeAboutSelf;
begin
  Logger.LogMessage(Format('I am located at $%s (%d)',
    [IntToHex(Longint(Self),8),Longint(Self)]));
end;

{ TSelfishWithData }

constructor TSelfishWithData.Create(SomeData: Integer);
begin
  inherited Create;
  FData := SomeData;
end;

procedure TSelfishWithData.TellMeAboutSelf;
begin
  Logger.LogMessage(Format('I am located at $%s (%d)',
    [IntToHex(Longint(Self),8),Longint(Self)]));
end;

end.
 