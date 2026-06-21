unit Splash;

interface

uses
  Classes, Graphics, Controls, Forms, StdCtrls, ExtCtrls, cxControls, 
  cxContainer, cxEdit, cxImage, cxTextEdit, cxMemo, cxRichEdit, cxButtons, 
  cxLookAndFeelPainters, Menus;

type
  TfmSplash = class(TForm)
    cxImage1: TcxImage;
    cxRichEdit1: TcxRichEdit;
    btnOK: TcxButton;
    PaintBox1: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
  end;

implementation

{$R *.DFM}

uses
  Windows, SysUtils, dxUxTheme, dxThemeConsts, dxThemeManager;
  
procedure TfmSplash.FormCreate(Sender: TObject);
var
  FileName: string;
begin
  FileName := ExtractFilePath(Application.ExeName) + 'PS3-Splash.rtf';
  if FileExists(FileName) then
    cxRichEdit1.Lines.LoadFromFile(FileName);
end;

procedure TfmSplash.PaintBox1Paint(Sender: TObject);
var
  Theme: HTHEME;
  C: TColor;
begin
  with TPaintBox(Sender) do 
  begin
    if AreVisualStylesAvailable then 
    begin
      Theme := OpenTheme(totEdit);
      if Failed(dxUxTheme.GetThemeColor(Theme, 0, 0, TMT_BORDERCOLOR, COLORREF(C))) then
        C := clBtnShadow
    end
    else
      C := clBtnShadow;   

    Canvas.Brush.Color := C;
    Canvas.FillRect(ClientRect);
  end;
end;

end.
