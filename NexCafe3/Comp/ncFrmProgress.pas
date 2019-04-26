unit ncFrmProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxProgressBar, cxLabel;

type
  TFrmProg = class(TForm)
    PB: TcxProgressBar;
    lbArq: TcxLabel;
  private
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
  exit;
  params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
  params.WndParent := GetDesktopwindow;
end;}

procedure TFrmProg.ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, Handle, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

  procedure RestProgressProc(table:string;perc:integer);
  begin
    OpenProgressForm;
    FrmProg.lbArq.Caption := table;
    FrmProg.PB.Position := perc;
    FrmProg.ProcessMessages;
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
      FrmProg.ProcessMessages;
    end;
  end;            


initialization
  FrmProg := nil;

end.
