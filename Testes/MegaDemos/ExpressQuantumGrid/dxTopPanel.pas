unit dxTopPanel;

interface

uses
  Windows, Controls, SysUtils, dxBar, ExtCtrls, cxLookAndFeels, cxLookAndFeelPainters,
  dxOffice11, Classes, Graphics, ImgList, Messages, cxControls, dxGDIPlusClasses, dxCore,
  dxSkinsDefaultPainters;

type
  TdxFrameTopPanel = class(TcxControl)
  private
    function TextRect: TRect;
    function ImageRect: TRect;
    procedure DrawCaption;
    procedure DrawImage;
  protected
    function IsDark: Boolean;
    function GetLogoImage: TGraphic;
    procedure Paint; override;
    function HasBackground: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    property Caption;
  end;

implementation

{$R dxlogo.res}

var
  LogoImage: array[Boolean] of TGraphic;

{ TdxFrameTopPanel }

constructor TdxFrameTopPanel.Create(AOwner: TComponent);
var
  LogFont: TLogFont;
begin
  inherited Create(AOwner);
  Font.Name := 'Tahoma';
  Font.Size := 20;
  if GetObject(Font.Handle, SizeOf(LogFont), @LogFont) <> 0 then
  begin
    LogFont.lfQuality := ANTIALIASED_QUALITY;
    Font.Handle := CreateFontIndirect(LogFont);
  end;
end;

function TdxFrameTopPanel.TextRect: TRect;
var
  Y, AHeight: Integer;
  AImageRect: TRect;
begin
  Canvas.Font.Assign(Font);
  AHeight := Canvas.TextHeight(Caption);
  Y := (Height - AHeight) div 2;
  Result := ClientRect;
  Result.Left := 10; Result.Top := Y;
  AImageRect := ImageRect;
  if(AImageRect.Right > AImageRect.Left) then
    Result.Right := AImageRect.Left;
  Dec(Result.Right, 10);
end;

function TdxFrameTopPanel.ImageRect: TRect;
begin
  Result := ClientRect;
  Result.Top := (ClientHeight - GetLogoImage.Height) div 2;
  Result.Left := ClientWidth - GetLogoImage.Width - 10;
end;

procedure TdxFrameTopPanel.DrawCaption;
var
  R: TRect;
  APrevBkMode: Integer;
begin
  R := TextRect;
  if (R.Right > R.Left + 10) then
  begin
    Canvas.Font.Assign(Font);
    Canvas.Font.Color := LookAndFeelPainter.DefaultContentTextColor;
    APrevBkMode := SetBkMode(Canvas.Handle, TRANSPARENT);
    DrawText(Canvas.Handle, PChar(Caption), Length(Caption), R, DT_END_ELLIPSIS);
    SetBkMode(Canvas.Handle, APrevBkMode);
  end;
end;

procedure TdxFrameTopPanel.DrawImage;
var
  R: TRect;
begin
  R := ImageRect;
  Canvas.Draw(R.Left, R.Top, GetLogoImage);
end;

function TdxFrameTopPanel.IsDark: Boolean;
var
  I: Integer; 
const
  DarkNames: array[0..2] of string = ('Dark', 'Office 2010 Black', 'Pumpkin');
begin
  for I := 0 to High(DarkNames) do
  begin
    Result := (RootLookAndFeel.SkinName <> '' ) 
      and (Pos(AnsiUpperCase(DarkNames[I]), AnsiUpperCase(dxSkinsUserSkinGetLoadedSkinName(True))) <> 0);
    if Result then Break;
  end;
end;

function TdxFrameTopPanel.GetLogoImage: TGraphic;
begin
  Result := LogoImage[IsDark]
end; 

procedure TdxFrameTopPanel.Paint;
begin
  LookAndFeelPainter.DrawPanelContent(Canvas, Bounds, False);
  DrawImage;
  DrawCaption;
end;

function TdxFrameTopPanel.HasBackground: Boolean;
begin
  Result := False;
end;

function LoadLogo(const AResName: string): TdxPNGImage; 
var
  AStream: TStream;
begin
  Result := TdxPNGImage.Create;
  AStream := TResourceStream.Create(hInstance, AResName, RT_RCDATA);
  try
    Result.LoadFromStream(AStream);
  finally
    AStream.Free;
  end;
end;

initialization
  LogoImage[True] := LoadLogo('DXLOGO1');
  LogoImage[False] := LoadLogo('DXLOGO2');

finalization 
  LogoImage[True].Free;
  LogoImage[False].Free;

end.
