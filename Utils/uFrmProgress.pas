unit uFrmProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxProgressBar, cxLabel, ExtCtrls;

type
  TFrmProg = class(TForm)
    PB: TcxProgressBar;
    lbArq: TcxLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FShowed : Boolean;
    { Private declarations }
  protected
//    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    procedure ProcessMessages;
  end;

  procedure RestProgressProc(table:string;perc:integer);
  procedure FechaProgressForm;
  procedure OpenProgressForm;
  

var
  FrmProg: TFrmProg;

implementation

{$R *.dfm}

{procedure TFrmProg.CreateParams(var Params: TCreateParams);
begin
  params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
  params.WndParent := GetDesktopwindow;
end;}

procedure TFrmProg.FormCreate(Sender: TObject);
begin
  FShowed := False;
end;

procedure TFrmProg.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFrmProg.ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, Handle, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

procedure TFrmProg.Timer1Timer(Sender: TObject);
begin
  FShowed := True;
  Timer1.Enabled := False;
end;

procedure RestProgressProc(table:string;perc:integer);
  begin
    OpenProgressForm;
    FrmProg.lbArq.Caption := table;
    FrmProg.PB.Position := perc;
    FrmProg.PB.Repaint;
    if perc=100 then
      FechaProgressForm;
  end;

  procedure FechaProgressForm;
  begin
    if Assigned(FrmProg) then 
      FreeAndNil(FrmProg);
  end;

  procedure OpenProgressForm;
  begin
    if not Assigned(FrmProg) then begin
      FrmProg := TFrmProg.Create(nil);
      FrmProg.Show;
      repeat
        FrmProg.ProcessMessages;
      until FrmProg.FShowed;
    end;
  end;            


initialization
  FrmProg := nil;

end.
