unit uFormPassoA;

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
  cxCheckBox, udmPrintGuard, LMDCustomScrollBox, LMDScrollBox, WebAdapt, WebComp,
  dxSkinscxPCPainter, dxLayoutcxEditAdapters, dxLayoutContainer, dxLayoutControl,
  dxLayoutLookAndFeels;

type
  TFormPassoA = class(TForm)
    Panel2: TPanel;
    cxButtonContinuar: TcxButton;
    cxImagePrinter: TcxImage;
    cxLabel2: TcxLabel;
    cxButtonEliminar: TcxButton;
    cxLabelTittle: TcxLabel;
    cxLabel1: TcxLabel;
    LMDScrollBox1: TLMDScrollBox;
    cxRadioGroupPrinters: TcxRadioGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    dxLayoutControl2: TdxLayoutControl;
    dxLayoutGroup2: TdxLayoutGroup;
    cxLabelImpAssignada: TcxLabel;
    cxLabelMaquina: TcxLabel;
    procedure cxRadioGroupPrintersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButtonContinuarClick(Sender: TObject);
  private
    thisindex : integer;
    procedure formataRadioImpressoras(aCxRadioGroupPrinters: TcxRadioGroup);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPassoA: TFormPassoA;

implementation

uses uPrintGuard, ncPrinters;

{$R *.dfm}

procedure TFormPassoA.formataRadioImpressoras(aCxRadioGroupPrinters: TcxRadioGroup);
var
    i:integer;
    p : TcxRadioGroupItem;
    w, w1 : integer;
begin
    thisindex := -1;
    aCxRadioGroupPrinters.Properties.Items.Clear;
    aCxRadioGroupPrinters.AutoSize := true;
    aCxRadioGroupPrinters.Style.BorderStyle := ebsNone;
    aCxRadioGroupPrinters.StyleFocused.BorderStyle := ebsNone;
    w := 0;
    aCxRadioGroupPrinters.Canvas.font := aCxRadioGroupPrinters.style.font;
    for i:=0 to FormPrintGuard.fTiposImpressao.Count -1 do begin
        p := aCxRadioGroupPrinters.Properties.Items.Add;
        p.Caption := FormPrintGuard.fTiposImpressao[i].nome;
        w1 := aCxRadioGroupPrinters.Canvas.TextExtent(p.Caption).cx+40;
        if w1>w then w:=w1;
        p.Value := FormPrintGuard.fTiposImpressao[i].id;
        if FormPrintGuard.fTiposImpressao[i].id = FormPrintGuard.selectedTipoImpressaoID then
            thisindex := i;
    end;
    LMDScrollBox1.Width := w + GetSystemMetrics(SM_CXHTHUMB);
    LMDScrollBox1.Left := cxLabel2.Left + (cxLabel2.width div 2) - (w div 2);
    aCxRadioGroupPrinters.Top := 0;
    aCxRadioGroupPrinters.Left := 0;
    aCxRadioGroupPrinters.Width := w;
    if LMDScrollBox1.height > aCxRadioGroupPrinters.height then
        aCxRadioGroupPrinters.Top := (LMDScrollBox1.height - aCxRadioGroupPrinters.height) div 2;
end;


procedure TFormPassoA.cxButtonContinuarClick(Sender: TObject);
begin
    FormPrintGuard.selectedTipoImpressaoID := cxRadioGroupPrinters.Properties.Items[cxRadioGroupPrinters.ItemIndex].Value;
end;

procedure TFormPassoA.cxRadioGroupPrintersClick(Sender: TObject);
begin
     FormPrintGuard.GetPrinterDescription (
            dxLayoutControl2,                       
            cxRadioGroupPrinters.Properties.Items[cxRadioGroupPrinters.ItemIndex].Value,
            dmPrintGuard.nxTablePrintListpaginas.AsInteger );

     cxButtonContinuar.enabled := cxRadioGroupPrinters.ItemIndex>-1;
end;

procedure TFormPassoA.FormShow(Sender: TObject);
begin
    formataRadioImpressoras(cxRadioGroupPrinters);
    cxButtonContinuar.Enabled := false;
    cxRadioGroupPrinters.ItemIndex := thisindex;

    if thisindex = -1 then begin
        cxLabelImpAssignada.caption := 'Não foi possível identificar a impressora escolhida pelo usuário. Por favor, assignar uma.' ;
        cxLabelImpAssignada.visible := true;
        dxLayoutControl1.visible := false;
    end else begin
        cxLabelImpAssignada.visible := false;
        dxLayoutControl1.visible := true;
        FormPrintGuard.GetPrinterDescription (
            dxLayoutControl1,
            cxRadioGroupPrinters.Properties.Items[thisindex].Value,
            dmPrintGuard.nxTablePrintListpaginas.AsInteger );
    end;

    cxLabelMaquina.caption :=  'Máquina: ' + FormPrintGuard.selectedMaquina;

end;

end.
