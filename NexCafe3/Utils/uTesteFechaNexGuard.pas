unit uTesteFechaNexGuard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit, ExtCtrls, WindowList, StdCtrls, LMDCustomButton, LMDButton,
  LMDCustomComponent, LMDStarter;

type
  TForm1 = class(TForm)
    WL: TWinList;
    Timer1: TTimer;
    SE: TcxSpinEdit;
    LMDButton1: TLMDButton;
    starter: TLMDStarter;
    procedure Timer1Timer(Sender: TObject);
    procedure SEPropertiesEditValueChanged(Sender: TObject);
    procedure LMDButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure FechaProc(ProcessID: Integer);
VAR ProcessHandle: THANDLE;
    ExitCode: DWORD;
begin
   ExitCode:= 0;
   ProcessHandle:= OpenProcess(PROCESS_CREATE_THREAD OR
                               PROCESS_VM_OPERATION
                               OR PROCESS_VM_WRITE OR PROCESS_VM_READ OR
                               PROCESS_TERMINATE,
                               FALSE,ProcessID);
   if (ProcessHandle > 0) then
   BEGIN
       GetExitCodeProcess(ProcessHandle, ExitCode);
       TerminateProcess(ProcessHandle,ExitCode);
       CloseHandle(ProcessHandle);
   END;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var I : Integer;
begin
  WL.Refresh(True);
  for I := 0 to  WL.Count - 1 do  with WL.Windows[I]^ do 
  if Pos('NEXGUARD', UpperCase(FName))>0 then begin
    Self.Caption := 'FECHOU';
    FechaProc(ProcessID);
    Exit;
  end;  
end;

procedure TForm1.SEPropertiesEditValueChanged(Sender: TObject);
begin
  Timer1.Enabled := False;
  Timer1.Interval := SE.Value;
end;

procedure TForm1.LMDButton1Click(Sender: TObject);
begin
  Timer1.Enabled := False;
  Starter.Execute;
  Timer1.Enabled := True;
end;

end.
