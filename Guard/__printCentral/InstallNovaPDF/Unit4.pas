unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSpool, Printers, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, StdCtrls, cxButtons, registry, LMDCustomComponent,
  LMDBaseController, LMDCustomContainer, LMDGenericList, uHttpDownloader,
  ComCtrls, ExtCtrls, IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze,
  md5, uPrintException, uPrinterInfo8, strutils, ncgPrintInstall;

Const
  kInstallDir = 'c:\gs\';
  kDriverPath = kInstallDir + 'drivers\';
  kredmonDir = 'redmon17';
  kredmon32  = 'redmon17.zip';
  kredmon64  = 'redmon17x64.zip';
  kgs904Version  = '9.04';
  kgs904Dir  = 'gs'+kgs904Version;
  kgs90432  = 'gs904w32.exe';
  kgs90464  = 'gs904w64.exe';
  kTempoRestante1 = 'Tempo restante:';
  kDownloadServer = 'www.nexcafe.com.br';
  kDownloadPath   = '/dnld/1/';
  kDescarregado = 'descarregado.';
  kNexCafe5PrintCommand = 'nexCafe5PrintCommand.exe';

  kPrinterDriver1 = 'AdobePSGenericPostScriptPrinter';
  kPrinterDriver2 = 'MS Publisher color Printer';
  kLmPrinterName = 'Nexcafé PS printer';
  kLmPrinterCommand = 'C:\gs\'+kNexCafe5PrintCommand;

  kRedirectedPortShowWindowNormal = 0;
  kRedirectedPortShowWindowMinimized = 1;
  kRedirectedPortShowWindowHidden = 2;


type
  TForm4 = class(TForm)
    cxButtonInsatalar: TcxButton;
    cxMemo1: TcxMemo;
    cxButtonDesinstalar: TcxButton;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    procedure cxButtonInsatalarClick(Sender: TObject);
    procedure cxButtonDesinstalarClick(Sender: TObject);
  private
    procedure ShowMessage(aMsg:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses
   uDirUtils, uZipUtils, uCommonProc, uDisplayUtils, uVersionInfo;

{$R *.dfm}

procedure TForm4.ShowMessage(aMsg: string);
begin
     cxMemo1.lines.add(aMsg);
     application.ProcessMessages;
end;

procedure TForm4.cxButtonInsatalarClick(Sender: TObject);
begin
    cxMemo1.clear;
    application.processmessages;
    screen.Cursor  := crHourGlass;
    cxButtonInsatalar.Enabled := false;
    cxButtonDesinstalar.Enabled := false;

    RemovePrinters(false);
    {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'RemovePrinters');{$ENDIF}
    if not NexPrinterInstalled then begin

            if not isServiceStarted('','Spooler') then begin
                ShowMessage('Start Spooler');
                ServiceStart('','Spooler');
                ShowMessage('Spooler Started');
            end;

            InstallNexPrinter(false);
            {$IFNDEF NOLOG} GLog.Log(nil,[lcTrace],'InstallNexPrinter');{$ENDIF}

            ShowMessage('Stop Spooler');
            ServiceStop('','Spooler');
            ShowMessage('Spooler Stop');


            ShowMessage('Start Spooler');
            ServiceStart('','Spooler');
            ShowMessage('Spooler Started');

    end;

    screen.Cursor  := crDefault;
    cxButtonInsatalar.Enabled := true;
    cxButtonDesinstalar.Enabled := true;
    ShowMessage('ok');

end;


procedure TForm4.cxButtonDesinstalarClick(Sender: TObject);
begin
    cxMemo1.clear;
    application.processmessages;
    screen.Cursor  := crHourGlass;
    cxButtonInsatalar.Enabled := false;
    cxButtonDesinstalar.Enabled := false;


    screen.Cursor  := crDefault;
    ShowMessage('ok');
    cxButtonInsatalar.Enabled := true;
    cxButtonDesinstalar.Enabled := true;

end;

end.
