unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinValentine, StdCtrls, ImgList, cxImage, XPMan,
  dxSkinSilver, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TForm1 = class(TForm)
    cxImage1: TcxImage;
    cxImageList1: TcxImageList;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  dxGDIPlusClasses;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ABitmap: TcxAlphaBitmap;
  APNGImage: TdxPNGImage;
begin
  ABitmap := TcxAlphaBitmap.Create;
  cxImageList1.GetImage(0, ABitmap);

  APNGImage := TdxPNGImage.Create;
  APNGImage.SetBitmap(ABitmap);
  cxImage1.Picture.Assign(APNGImage);

  ABitmap.Free;
  APNGImage.Free;
end;

end.
