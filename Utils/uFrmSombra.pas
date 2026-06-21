unit uFrmSombra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrmSombra = class(TForm)
    TimerFree: TTimer;
    procedure TimerFreeTimer(Sender: TObject);
  private
    FParentHWND : HWND;

    procedure CreateParams(var Params: TCreateParams); override;
    
    { Private declarations }
  public
    constructor CreateEsp(aParentHWND: HWND); 
    { Public declarations }
    procedure FadeIn(MS: Cardinal = 0);
    procedure FadeOut(MS: Cardinal = 0);
  end;

  

var
  FrmSombra: TFrmSombra;

implementation

{$R *.dfm}

{ TFrmSombra }

constructor TFrmSombra.CreateEsp(aParentHWND: HWND);
begin
  FParentHWND := aParentHWND;
  inherited Create(nil);
end;

procedure TFrmSombra.CreateParams(var Params: TCreateParams);
begin
  inherited;
  params.ExStyle := params.ExStyle or WS_EX_APPWINDOW;
  params.WndParent := FParentHWND;
end;

procedure TFrmSombra.FadeIn(MS: Cardinal = 0);
var 
  C, Dif : Cardinal;
begin
  Width := Screen.Width;
  Height := Screen.Height;
  Show;
  Left := 0;
  Top := 0;
  if MS>0 then begin
    AlphaBlendValue := 0;
    Application.ProcessMessages;
    C := GetTickCount; Dif := 0;
    while (Dif<MS) do begin
      Dif := GetTickCount-C;
      AlphaBlendValue   := Trunc((Dif/MS) * 220);
      Repaint;
      Sleep(0);
    end;
  end else begin
    AlphaBlendValue := 220;
    Application.ProcessMessages;
  end;
end;

procedure TFrmSombra.FadeOut(MS: Cardinal = 0);
var 
  C, Dif : Cardinal;
begin
  C := GetTickCount; Dif := 0;
  while (Dif<MS) do begin
    Dif := GetTickCount-C;
    if Dif>180 then Dif := 180;
    AlphaBlendValue   := 180 - Trunc((Dif/MS) * 180);
    Repaint;
    Sleep(0);
  end;
  Hide;
end;

procedure TFrmSombra.TimerFreeTimer(Sender: TObject);
begin
  Free;
end;

end.
