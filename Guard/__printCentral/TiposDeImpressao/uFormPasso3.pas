unit uFormPasso3;

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
  cxEdit, dxGDIPlusClasses, cxImage, cxLabel, cxTextEdit;

type
  TFormPasso3 = class(TForm)
    Panel2: TPanel;
    cxImagePrinter: TcxImage;
    cxButtonEliminar: TcxButton;
    cxButtonContinuar: TcxButton;
    cxLabel3: TcxLabel;
    cxButton1: TcxButton;
    cxLabelTittle: TcxLabel;
    cxLabelNome: TcxLabel;
    cxButtonVoltar: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPasso3: TFormPasso3;

implementation

uses uTiposDeImpressao;

{$R *.dfm}

procedure TFormPasso3.cxButton1Click(Sender: TObject);
begin
    screen.cursor:=crHourGlass;
    try
        cxButtonContinuar.Enabled :=  FormTipoDeImpressao.CapturePrinter(self, FormTipoDeImpressao.IdTipoImpressao>0);
    finally
        screen.cursor:=crDefault;
    end;
end;


procedure TFormPasso3.FormShow(Sender: TObject);
begin
    cxButtonContinuar.Enabled := FormTipoDeImpressao.IdTipoImpressao>0;
    cxButton1.setfocus;
    cxLabelNome.caption := FormTipoDeImpressao.tipoImpressaoName;
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxLabelTittle.Caption := kCriarTipoDeImpressaoTittle
        else cxLabelTittle.caption := kModificarTipoDeImpressaoTittle;
end;

end.
