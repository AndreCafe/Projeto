unit ncgFrmAtualiza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, 
  lmdclass, LMDCustomComponent, LMDIniCtrl, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel,
  pngimage;

type
  TFrmAtualiza = class(TForm)
    panPri: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    Timer1: TTimer;
    Image1: TImage;
    Timer2: TTimer;
    LMDLabel2: TLMDLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    IsNew: Boolean;
    { Public declarations }
  end;

  procedure ExecFile(FN: String);
  
var
  FrmAtualiza: TFrmAtualiza;

implementation

uses ncgDM;

{$R *.DFM}

procedure ExecFile(FN: String);
begin
  WinExec(PChar(FN), SW_Show);
end;

procedure TryCopyAndExecFile(Source, Dest: String);
var n: Integer;
begin
  n := 400;
  while (n>0) and (not CopyFile(PChar(Source), PChar(Dest), False)) do begin
    Dec(n);
    Sleep(50);
  end;  
  if n>0 then ExecFile(Dest);
end;

procedure TFrmAtualiza.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmAtualiza.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if Pos('CMGUARD', UpperCase(ParamStr(0))) > 0 then begin
    try mkdir(copy(ParamStr(0), 1, 3)+'nexcafe'); except end;
    CopyFile(pchar(ExtractFilePath(ParamStr(0))+'cmguard.ini'), 
             pchar(copy(paramstr(0), 1, 3)+'nexcafe\nexguard.ini'), False);
    TryCopyAndExecFile(ParamStr(0), 
                       pchar(copy(paramstr(0), 1, 3)+'nexcafe\NexGuard.exe'));
  end else                       
    TryCopyAndExecFile(ParamStr(0), ExtractFilePath(ParamStr(0))+'NexGuard.exe');
  FreeAndNil(dmOneInstance);
  Application.Terminate;
end;

procedure TFrmAtualiza.FormShow(Sender: TObject);
begin
  Top := 0;
  if IsNew
    then Timer1.Enabled := True
end;

procedure TFrmAtualiza.FormCreate(Sender: TObject);
begin
  IsNew := False;
end;

procedure TFrmAtualiza.Timer2Timer(Sender: TObject);
begin
  with panPri.Bevel do 
  if BorderColor = clLime then
    BorderColor := clGreen else
    BorderColor := clLime;
end;

end.
