unit unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxContainer, cxEdit, cxListBox, cxDBEdit, Menus, cxButtons,
  cxTextEdit, cxMemo;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cxDBListBox1: TcxDBListBox;
    cxListBox1: TcxListBox;
    cxButton1: TcxButton;
    cxMemo1: TcxMemo;
    cxButton2: TcxButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form4: TForm4;

implementation

uses
 ncgPrintInstall, printers, WinSpool;

{$R *.dfm}



procedure TForm4.FormCreate(Sender: TObject);
begin
    cxListBox1.Items.Assign(GetPrinterList(true));
    cxButton1.Enabled := false
end;

procedure SavePrinterInfo(APrinterName: PChar; ADestStream: TStream);
var
  HPrinter : THandle;
  InfoSize,
  BytesNeeded: Cardinal;
  PI2: PPrinterInfo2;
  PrinterDefaults: TPrinterDefaults;
begin
  with PrinterDefaults do
  begin
    DesiredAccess := PRINTER_ACCESS_USE;
    pDatatype := nil;
    pDevMode := nil;
  end;
  if OpenPrinter(APrinterName, HPrinter, @PrinterDefaults) then
  try
    SetLastError(0);
    //Determine the number of bytes to allocate for the PRINTER_INFO_2 construct...
    if not GetPrinter(HPrinter, 2, nil, 0, @BytesNeeded) then
    begin
      //Allocate memory space for the PRINTER_INFO_2 pointer (PrinterInfo2)...
      PI2 := AllocMem(BytesNeeded);
      try
        InfoSize := SizeOf(TPrinterInfo2);
        if GetPrinter(HPrinter, 2, PI2, BytesNeeded, @BytesNeeded) then
          ADestStream.Write(PChar(PI2)[InfoSize], BytesNeeded - InfoSize);
      finally
        FreeMem(PI2, BytesNeeded);
      end;
    end;
  finally
    ClosePrinter(HPrinter);
  end;
end;

procedure LoadPrinterInfo(APrinterName: PChar; ASourceStream: TStream);
var
  HPrinter : THandle;
  InfoSize,
  BytesNeeded: Cardinal;
  PI2: PPrinterInfo2;
  PrinterDefaults: TPrinterDefaults;
begin
  with PrinterDefaults do
  begin
    DesiredAccess := PRINTER_ALL_ACCESS; //PRINTER_ACCESS_USE;
    pDatatype := nil;
    pDevMode := nil;
  end;
  if OpenPrinter(APrinterName, HPrinter, @PrinterDefaults) then
  try
    SetLastError(0);
    //Determine the number of bytes to allocate for the PRINTER_INFO_2 construct...
    if not GetPrinter(HPrinter, 2, nil, 0, @BytesNeeded) then
    begin
      //Allocate memory space for the PRINTER_INFO_2 pointer (PrinterInfo2)...
      PI2 := AllocMem(BytesNeeded);
      try
        InfoSize := SizeOf(TPrinterInfo2);
        if GetPrinter(HPrinter, 2, PI2, BytesNeeded, @BytesNeeded) then
        begin
          PI2.pSecurityDescriptor := nil;
          ASourceStream.ReadBuffer(PChar(PI2)[InfoSize], ASourceStream.size);
          // Apply settings to the printer
          if DocumentProperties(0, hPrinter, APrinterName, PI2.pDevMode^,
                                PI2.pDevMode^, DM_IN_BUFFER or DM_OUT_BUFFER) = IDOK then
          begin
            SetPrinter(HPrinter, 2, PI2, 0);  // Ignore the result of this call...
          end;
        end;
      finally
        FreeMem(PI2, BytesNeeded);
      end;
    end;
  finally
    ClosePrinter(HPrinter);
  end;
end;

procedure TForm4.ListBox1Click(Sender: TObject);
begin
    cxButton1.Enabled := cxListBox1.ItemIndex > -1;
    if cxButton1.Enabled then
        cxButton1.caption := 'Criar tipo de impressão a partir de '+cxListBox1.Items[cxListBox1.ItemIndex];
end;

procedure TForm4.Button1Click(Sender: TObject);
var
    ms : TMemoryStream;
    pn : pchar;
    BytesNeeded: Cardinal;
    //PI2: PPrinterInfo2;
begin
    ms := TMemoryStream.create;
    try
        pn := pchar(cxListBox1.Items[cxListBox1.ItemIndex]);
        SavePrinterInfo(pn, ms);

        //PI2 := AllocMem(BytesNeeded);
        ms.Seek(0,0);
        ms.SaveToFile('c:\pp.txt');
        //ms.Read(PChar(PI2)[0], ms.size);
        //cxMemo1.lines.add( pchar(PI2.pPrinterName) );
    finally
        ms.Free;
        //FreeMem(PI2, BytesNeeded);
    end;

end;

procedure TForm4.cxButton2Click(Sender: TObject);
var
    ms : TMemoryStream;
    pn : pchar;
    BytesNeeded: Cardinal;
    //PI2: PPrinterInfo2;
begin
    ms := TMemoryStream.create;
    try
        pn := pchar(cxListBox1.Items[cxListBox1.ItemIndex]);

        //PI2 := AllocMem(BytesNeeded);
        ms.LoadFromFile('c:\pp.txt');
        ms.Seek(0,0);
        LoadPrinterInfo(pn, ms);
        //ms.Read(PChar(PI2)[0], ms.size);
        //cxMemo1.lines.add( pchar(PI2.pPrinterName) );
    finally
        ms.Free;
        //FreeMem(PI2, BytesNeeded);
    end;

end;




end.
