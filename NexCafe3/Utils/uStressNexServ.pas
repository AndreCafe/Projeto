unit uStressNexServ;

interface

uses
  Windows, ScktComp, Messages, SyncObjs, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, ExtCtrls;

type
  TForm5 = class(TForm)
    edQtd: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxButton1: TcxButton;
    edServ: TcxTextEdit;
    cxLabel2: TcxLabel;
    Label1: TLabel;
    Timer1: TTimer;
    procedure cxButton1Click(Sender: TObject);
    procedure ghhh(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OnTerm(Sender: TObject);
    procedure HandleAppException(Sender: TObject; E: Exception);
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses uDMStress;

{$R *.dfm}

procedure TForm5.cxButton1Click(Sender: TObject);
var i, t: integer;
begin
  Serv := edServ.Text;
  t := edQtd.Value;
  for I := 1 to T do 
    TThreadStress.Create(False).FreeOnTerminate := True;
end;

procedure TForm5.OnTerm(Sender: TObject);
begin
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
  Application.OnException := HandleAppException;
end;

procedure TForm5.ghhh(Sender: TObject);
begin
  Label1.Caption := 'Tarefas = '+IntToStr(GetQtd);
end;

procedure TForm5.HandleAppException(Sender: TObject; E: Exception);
var ID: Cardinal;
begin
  if E is ESocketError then begin
    ID := GetCurrentThreadID;
//    ShowMessage(IntToStr(ID));
  end else
    Application.ShowException(E);
end;

end.
