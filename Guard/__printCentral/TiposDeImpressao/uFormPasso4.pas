unit uFormPasso4;

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
  cxEdit, dxGDIPlusClasses, cxImage, cxLabel, cxGroupBox, cxRadioGroup,
  cxCheckBox, ncPrinters, ncgPrintInstall, cxTextEdit, cxCurrencyEdit;

type
  TFormPasso4 = class(TForm)
    Panel2: TPanel;
    cxButtonContinuar: TcxButton;
    cxImagePrinter: TcxImage;
    cxLabel2: TcxLabel;
    cxButtonEliminar: TcxButton;
    cxLabelTittle: TcxLabel;
    cxLabelNome: TcxLabel;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxButtonVoltar: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure cxButtonContinuarClick(Sender: TObject);
    procedure cxCurrencyEdit1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPasso4: TFormPasso4;

implementation

uses uTiposDeImpressao;

{$R *.dfm}


procedure TFormPasso4.cxButtonContinuarClick(Sender: TObject);
begin
    FormTipoDeImpressao.preco := cxCurrencyEdit1.value;
end;

procedure TFormPasso4.cxCurrencyEdit1PropertiesChange(Sender: TObject);
begin
    cxButtonContinuar.Enabled := cxCurrencyEdit1.value > 0;
end;

procedure TFormPasso4.FormShow(Sender: TObject);
begin
    cxButtonContinuar.Enabled := false;

    cxLabelNome.caption := FormTipoDeImpressao.tipoImpressaoName;
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxLabelTittle.Caption := kCriarTipoDeImpressaoTittle
        else cxLabelTittle.caption := kModificarTipoDeImpressaoTittle;
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxCurrencyEdit1.value := 0
        else cxCurrencyEdit1.value := FormTipoDeImpressao.preco;
    cxCurrencyEdit1.setfocus;
end;

end.
