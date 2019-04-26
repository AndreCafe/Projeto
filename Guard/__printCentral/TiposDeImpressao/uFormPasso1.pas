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
  cxCheckBox, ncPrinters, ncgPrintInstall;

type
  TFormPasso1 = class(TForm)
    Panel2: TPanel;
    cxButtonContinuar: TcxButton;
    cxImagePrinter: TcxImage;
    cxLabel2: TcxLabel;
    cxRadioGroupPrinters: TcxRadioGroup;
    cxButtonEliminar: TcxButton;
    cxLabelTittle: TcxLabel;
    cxLabelNome: TcxLabel;
    procedure cxRadioGroupPrintersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButtonContinuarClick(Sender: TObject);
  private
    fPrinters : TStringList;
    thisindex : integer;
    procedure formataRadioImpressoras(aCxRadioGroupPrinters: TcxRadioGroup);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPasso1: TFormPasso1;

implementation

uses uTiposDeImpressao;

{$R *.dfm}

procedure TFormPasso1.formataRadioImpressoras(aCxRadioGroupPrinters: TcxRadioGroup);
var
    i:integer;
    p : TcxRadioGroupItem;
    w, w1 : integer;
begin
    thisindex := 0;
    aCxRadioGroupPrinters.Properties.Items.Clear;
    aCxRadioGroupPrinters.AutoSize := true;
    aCxRadioGroupPrinters.Style.BorderStyle := ebsNone;
    aCxRadioGroupPrinters.StyleFocused.BorderStyle := ebsNone;
    w := 0;
    aCxRadioGroupPrinters.Canvas.font := aCxRadioGroupPrinters.style.font;
    for i:=0 to fPrinters.Count -1 do begin
        p := aCxRadioGroupPrinters.Properties.Items.Add;
        p.Caption := fPrinters[i];
        w1 := aCxRadioGroupPrinters.Canvas.TextExtent(p.Caption).cx+40;
        if w1>w then w:=w1;
        p.Value := i;//fPrinters[i].id;
        if sametext(fPrinters[i],FormTipoDeImpressao.printerName) then
           thisindex := i;
    end;
    aCxRadioGroupPrinters.Width := w;
    aCxRadioGroupPrinters.Left := (FormPasso1.Width-aCxRadioGroupPrinters.Width) div 2;
    aCxRadioGroupPrinters.Top  := 147 + (aCxRadioGroupPrinters.Height div 2);
end;


procedure TFormPasso1.cxButtonContinuarClick(Sender: TObject);
begin
    FormTipoDeImpressao.printerName := fPrinters[cxRadioGroupPrinters.ItemIndex];
end;

procedure TFormPasso1.cxRadioGroupPrintersClick(Sender: TObject);
begin
     cxButtonContinuar.enabled := true;
end;

procedure TFormPasso1.FormCreate(Sender: TObject);
begin
  fPrinters   := TStringList.create;
  //fPrinters   := TncPrinterList.create;
end;

procedure TFormPasso1.FormDestroy(Sender: TObject);
begin
   fPrinters.free;
end;

procedure TFormPasso1.FormShow(Sender: TObject);
begin
    fPrinters.Assign(GetPrinterList(true));
    formataRadioImpressoras(cxRadioGroupPrinters);
    cxButtonContinuar.Enabled := false;
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxLabelNome.Caption := ''
        else cxLabelNome.caption := FormTipoDeImpressao.tipoImpressaoName;
    if FormTipoDeImpressao.IdTipoImpressao=-1
        then cxLabelTittle.Caption := kCriarTipoDeImpressaoTittle
        else cxLabelTittle.caption := kModificarTipoDeImpressaoTittle;

    if FormTipoDeImpressao.IdTipoImpressao>0 then
        cxRadioGroupPrinters.ItemIndex := thisindex;
end;

end.
