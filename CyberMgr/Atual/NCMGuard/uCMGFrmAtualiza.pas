unit uCMGFrmAtualiza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, lmdctrl, lmdstdcS, lmdcctrl, ExtCtrls, lmdcompo,
  lmdclass, LMDCustomComponent, LMDIniCtrl, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDBaseLabel, LMDCustomLabel, LMDLabel,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDSimplePanel;

type
  TFrmAtualiza = class(TForm)
    LMDSimplePanel1: TLMDSimplePanel;
    LMDLabel1: TLMDLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  TryCopyAndExecFile(ParamStr(0), ExtractFilePath(ParamStr(0))+'CMGuard.exe');
  Application.Terminate;
end;

procedure TFrmAtualiza.FormShow(Sender: TObject);
begin
  if IsNew
    then Timer1.Enabled := True
end;

procedure TFrmAtualiza.FormCreate(Sender: TObject);
begin
  IsNew := False;
end;

end.
