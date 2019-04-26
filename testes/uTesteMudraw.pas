unit uTesteMudraw;

interface

uses
  Windows, Messages, SyncObjs, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls;

type
  TForm20 = class(TForm)
    Button1: TButton;
    edPages: TSpinEdit;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TThreadMu = class ( TThread )
  private
    pgi, pgf : Integer;
    ticks    : Cardinal;
  protected
     procedure Execute; override; 
  public
    constructor Create(i, f: Integer);
  end;

  TArrayThread = Array of TThreadMu;

var
  Form20: TForm20;
  cs : TCriticalSection;
  total : Integer;
  cstart : Cardinal;
  cend   : Cardinal;

implementation

uses ncShellStart;

{$R *.dfm}

{ TThreadMu }

constructor TThreadMu.Create(i, f: Integer);
begin
  inherited Create(True);
  pgi := i;
  pgf := f;
  cs.Enter;
  try
    Inc(Total);
    if Total = 1 then 
      cstart := GetTickCount;
  finally
    cs.Leave;
  end;

  Priority := tpLower;

  FreeOnTerminate := True;
end;

procedure TThreadMu.Execute;
var s: String; i : integer;
begin
  for I := pgi to pgf do begin
    if I>pgi then s := s + ',';
    s := s + IntToStr(i);
  end;
  Ticks := GetTickCount;  
  ShellStartCustom('c:\mupdf\mudraw.exe', '-o teste%d.png -b 8 -r 96 teste.pdf '+s, '', 0, SW_HIDE, 'open', true);
  Ticks := GetTickCount - Ticks;

  cs.Enter;
  try
    Dec(Total);
    if Total = 0 then cend := GetTickCount;
  finally
    cs.Leave;
  end;
end;

procedure TForm20.Button1Click(Sender: TObject);
var 
  A : TArrayThread;
  TT, TP, I, F : Integer;
begin
  Button1.Enabled := False;
  TT := 0;
  TP := 198;
  I := 0;
  F := 0;
  cs.Enter;
  try
    cstart := 0;
    cend := 0;
  finally
    cs.Leave;
  end;
  SetLength(A, 0);
  while F < TP do begin
    I := F + 1;
    F := F + edPages.Value;
    if F > TP then F := TP;
    SetLength(A, TT+1);
    A[TT] := TThreadMu.Create(I, F);
    Inc(TT);
  end;

  Caption := IntToStr(TT) + ' threads';

  Timer1.Enabled := True;

  for I := 0 to High(A) do A[i].Resume;
end;

procedure TForm20.Timer1Timer(Sender: TObject);
begin
  cs.Enter;
  try
    Label1.Caption := IntToStr(Total);
    if Total = 0 then begin
      Label1.Caption := Label1.Caption + ' - Tempo Total:  ' + IntToStr(cend - cstart);
      Timer1.Enabled := False;
      Button1.Enabled := True;
    end;
  finally
    cs.Leave;
  end;
end;

initialization
  cs := TCriticalSection.Create;

finalization
  cs.Free;
    

end.
