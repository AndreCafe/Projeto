unit uFormPassoB;

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
  cxEdit, dxGDIPlusClasses, cxImage, cxLabel, cxTextEdit,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, dxLayoutContainer,
  dxLayoutControl, dxLayoutLookAndFeels;

type
  TCheckNameEvent = function (Sender: TObject; aNomeTipo:string):boolean of object;

  TFormPassoB = class(TForm)
    Panel2: TPanel;
    cxImagePrinter: TcxImage;
    cxLabelTittle: TcxLabel;
    cxButtonEliminar: TcxButton;
    cxButtonVoltar: TcxButton;
    cxLabelMaquina: TcxLabel;
    cxButtonConfigurar: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel1: TdxLayoutStandardLookAndFeel;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButtonConfigurarClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    fonCheckName : TCheckNameEvent;
    { Private declarations }
  public
    PrinterId : integer;
    property onCheckName : TCheckNameEvent read fonCheckName write fonCheckName;
    { Public declarations }
  end;

var
  FormPassoB: TFormPassoB;

implementation

uses uPrintGuard, udmPrintGuard;

{$R *.dfm}

procedure TFormPassoB.cxButton1Click(Sender: TObject);
begin
    close
end;

procedure TFormPassoB.cxButton2Click(Sender: TObject);
begin
    FormPrintGuard.Revisar;
end;

procedure TFormPassoB.cxButton3Click(Sender: TObject);
begin
    screen.cursor := crHourGlass;
    try
        if FormPrintGuard.selectedPrinterJson='' then
            FormPrintGuard.getSelectedPrinterJson;
        if FormPrintGuard.Print then
           ModalResult := mrOk;

    finally
        screen.cursor := crDefault;
    end;
end;

procedure TFormPassoB.cxButtonConfigurarClick(Sender: TObject);
begin
    screen.cursor:=crHourGlass;
    try
        FormPrintGuard.ConfigSelectedPrinter(self);
    finally
        screen.cursor:=crDefault;
    end;
end;

procedure TFormPassoB.FormShow(Sender: TObject);
begin
    FormPrintGuard.GetPrinterDescription (
        dxLayoutControl1,
        FormPrintGuard.selectedTipoImpressaoID,
        dmPrintGuard.nxTablePrintListpaginas.AsInteger );

    cxLabelMaquina.caption :=  'Máquina: ' + FormPrintGuard.selectedMaquina;
    FormPrintGuard.LoadSelectedPrinter;

end;


end.
