unit udmLogmein;
{
    ResourceString: Dario 13/03/13
}

interface

uses
  SysUtils, Classes, WindowList, Windows, Messages, ExtCtrls;

type
  TdmLogmein = class(TDataModule)
    Timer1: TTimer;
    WL: TWinList;
    procedure Timer1Timer(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FLastTemCC : Cardinal;
    { Public declarations }
    
  end;

function EnumProc(H: HWND; LParam: Cardinal): Boolean; stdcall;

var
  dmLogmein: TdmLogmein;
  
implementation

{$R *.dfm}

function EnumProc(H: HWND; LParam: Cardinal): Boolean; stdcall;
var
  Buffer: array[0..99] of Char;
  Vis: Boolean;
begin
  GetWindowText(H, Buffer, 100);
  Result := True;
  Vis := IsWindowVisible(H);
  if StrPas(Buffer) = '' then Buffer := 'Empty'; // do not localize
  if Vis and (
    SameText('&ok', buffer) or // do not localize
    SameText('OK', buffer) or // do not localize
    SameText('continue', buffer) or // do not localize
    SameText('conectar', buffer) or // do not localize
    SameText('update', buffer) or // do not localize
    SameText('&yes', buffer) or // do not localize
    SameText('&sim', buffer) or // do not localize
    SameText('&si', buffer)) then  // do not localize
  begin
    PostMessage(H, BM_CLICK, 0, 0);
  end;
end;

procedure TdmLogmein.DataModuleCreate(Sender: TObject);
begin
  FLastTemCC := 0;
end;

procedure TdmLogmein.Timer1Timer(Sender: TObject);
var 
  I: Integer;
  P: Pointer;
  TemCC: Boolean;
begin
  Timer1.Enabled := False;
  Timer1.Interval := 1000;
  Timer1.Enabled := True;
  TemCC := False;
  try  
    WL.Refresh(True);
    for I := 0 to WL.Count-1 do with WL.Windows[I]^ do
    if Pos('CALLINGCARD', UpperCase(FName))>0 then begin // do not localize
      TemCC := True;
      FLastTemCC := GetTickCount;
      P := @EnumProc;
      EnumChildWindows(WinHandle, P, 0);
    end;
    
  finally
    if (not TemCC) and ((GetTickCount-FLastTemCC)>120000) then 
      Self.Free;
  end;
end;

end.

