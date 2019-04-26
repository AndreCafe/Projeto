unit uFormPasso10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer,
  cxEdit, dxGDIPlusClasses, cxImage, cxLabel, cxCheckBox;

type
  TFormPasso10 = class(TForm)
    Panel2: TPanel;
    cxButtonMandarImpressao: TcxButton;
    cxImagePrinter: TcxImage;
    cxLabelTittle: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabelPreco: TcxLabel;
    cxButtonRevisar: TcxButton;
    cxCheckBoxConcordo: TcxCheckBox;
    cxLabel3: TcxLabel;
    cxButtonEliminar: TcxButton;
    cxCheckBoxEngano: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure cxCheckBoxConcordoClick(Sender: TObject);
    procedure cxCheckBoxEnganoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPasso10: TFormPasso10;

implementation

{$R *.dfm}

procedure TFormPasso10.cxCheckBoxConcordoClick(Sender: TObject);
begin
    cxButtonRevisar.Enabled  := cxCheckBoxConcordo.checked;
    if cxCheckBoxEngano.checked then begin
        cxCheckBoxEngano.checked  := false;
        cxCheckBoxEnganoClick(nil);
    end;
    cxButtonEliminar.visible := false;
    cxButtonMandarImpressao.Enabled  := true;
end;

procedure TFormPasso10.cxCheckBoxEnganoClick(Sender: TObject);
begin
    cxButtonRevisar.Enabled  := false;
    if cxCheckBoxConcordo.checked then begin
        cxCheckBoxConcordo.checked  := false;
        cxCheckBoxConcordoClick(nil);
    end;
    cxButtonEliminar.visible := true;
    cxButtonMandarImpressao.Enabled  := false;
end;

procedure TFormPasso10.FormShow(Sender: TObject);
begin
    cxButtonEliminar.visible := false;
    cxButtonRevisar.Enabled := true;
    cxButtonMandarImpressao.Enabled  := false;
    cxCheckBoxConcordo.OnClick := nil;
    cxCheckBoxEngano.OnClick := nil;
    cxCheckBoxConcordo.checked  := false;
    cxCheckBoxEngano.checked  := false;
    cxCheckBoxConcordo.OnClick := cxCheckBoxConcordoClick;
    cxCheckBoxEngano.OnClick := cxCheckBoxEnganoClick;;
end;

end.
