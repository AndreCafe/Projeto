unit uFormPassoQuerSair;

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
  TFormPassoQuerSair = class(TForm)
    Panel2: TPanel;
    cxButtonNao: TcxButton;
    cxImagePrinter: TcxImage;
    cxLabelTittle: TcxLabel;
    cxLabelQuestion: TcxLabel;
    cxButtonSim: TcxButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPassoQuerSair: TFormPassoQuerSair;

implementation

uses uTiposDeImpressao;

{$R *.dfm}

procedure TFormPassoQuerSair.FormShow(Sender: TObject);
begin
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxLabelTittle.Caption := kCriarTipoDeImpressaoTittle2
        else cxLabelTittle.caption := kModificarTipoDeImpressaoTittle2;
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxLabelQuestion.Caption := kCriarTipoDeImpressaoQuestion
        else cxLabelQuestion.caption := kModificarTipoDeImpressaoQuestion;
    cxButtonNao.SetFocus;
end;

end.
