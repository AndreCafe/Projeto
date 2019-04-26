unit ncFrmProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxProgressBar, cxLabel, nxsdTypes, ncTableDefs;

type
  TFrmProg = class(TForm)
    PB: TcxProgressBar;
    lbArq: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
  private
    { Private declarations }
    FPercAnt : Integer;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    procedure ProcessMessages;
    
    procedure OnProgress(const aTableName : String;
      var aStatus : TnxTaskStatus;
      var aCancel : Boolean);
  end;

  procedure FechaProgressForm;
  procedure OpenProgressForm;

  function InFrmProgress: Boolean;
  

var
  FrmProg: TFrmProg = nil;
  FormPri: TCustomForm;
  ProgTables: TStrings;

implementation

{$R *.dfm}

function InFrmProgress: Boolean;
begin
  Result := (FrmProg<>nil);
end;

procedure TFrmProg.CreateParams(var Params: TCreateParams);
begin
  inherited;
  params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
  params.WndParent := GetDesktopwindow;
end;

procedure TFrmProg.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

procedure TFrmProg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
end;

procedure TFrmProg.OnProgress(const aTableName: String;
  var aStatus: TnxTaskStatus; var aCancel: Boolean);
var S: String;  
begin
  if aTableName<>lbArq.Caption then begin
{    if FormPri<>nil then
      FormPri.Repaint;}
      
//    Repaint;
    lbArq.Caption := aTableName;
    if ProgTables.IndexOf(aTableName)<0 then
      ProgTables.Add(aTableName);

//    lbArq.Repaint;
//    PB.Repaint;
    ProcessMessages;
  end;
  if aStatus.tsPercentDone<>FPercAnt then begin
//    Repaint;
    PB.Position := aStatus.tsPercentDone;
//    PB.Repaint;
    ProcessMessages;
  end;
end;

procedure TFrmProg.ProcessMessages;
var Msg : TMsg;
begin
  try
    while PeekMessage(Msg, Handle, 0, 0, PM_REMOVE) do  begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
    if Assigned(FormPri) then
      while PeekMessage(Msg, FormPri.Handle, 0, 0, PM_REMOVE) do  begin
        TranslateMessage(Msg);
        DispatchMessage(Msg);
      end;
  except
  end;
end;

  procedure FechaProgressForm;
  begin
    if Assigned(FormPri) then FormPri.Enabled := True;
    
    if Assigned(FrmProg) then 
      FreeAndNil(FrmProg);
  end;
  
  procedure OpenProgressForm;
  begin
    if not Assigned(FrmProg) then begin
      FrmProg := TFrmProg.Create(nil);
      FrmProg.Show;
//      FrmProg.ProcessMessages; 
    end;
    if Assigned(FormPri) then FormPri.Enabled := False;
  end;            


initialization
  FrmProg := nil;
  ProgTables := TStringList.Create;

finalization
  ProgTables.Free;  

end.
