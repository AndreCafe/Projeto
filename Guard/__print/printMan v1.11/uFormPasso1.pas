unit uFormPasso1;

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
  cxCheckBox, LMDCustomScrollBox, LMDScrollBox;

type
  TFormPasso1 = class(TForm)
    Panel2: TPanel;
    cxButtonContinuar: TcxButton;
    cxImagePrinter: TcxImage;
    cxLabel2: TcxLabel;
    cxLabelTittle: TcxLabel;
    cxLabel1: TcxLabel;
    cxButtonEliminar: TcxButton;
    cxCheckBoxEngano: TcxCheckBox;
    LMDScrollBox1: TLMDScrollBox;
    cxRadioGroupPrinters: TcxRadioGroup;
    procedure cxRadioGroupPrintersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxCheckBoxEnganoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPasso1: TFormPasso1;

implementation

{$R *.dfm}

procedure TFormPasso1.cxCheckBoxEnganoClick(Sender: TObject);
begin
     cxButtonContinuar.enabled := (not cxCheckBoxEngano.checked)and(cxRadioGroupPrinters.ItemIndex>-1);
     cxButtonEliminar.visible  := cxCheckBoxEngano.checked;
end;

procedure TFormPasso1.cxRadioGroupPrintersClick(Sender: TObject);
begin
     cxButtonContinuar.enabled := true;
end;

procedure TFormPasso1.FormShow(Sender: TObject);
begin
    cxButtonContinuar.Enabled := false;
    cxButtonEliminar.visible := false;
    cxCheckBoxEngano.checked := false;
end;

end.
