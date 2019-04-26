unit uTesteRemovePrinter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LMDCustomComponent, LMDSysInfo, Printers, winspool;

type
  TForm33 = class(TForm)
    SI: TLMDSysInfo;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form33: TForm33;

implementation

{$R *.dfm}


procedure GetPrinterList(List: TStrings);
var
  Buffer, PrinterInfo: PChar;
  Flags, Count, NumInfo: DWORD;
  i: Integer;
  Level: Byte;
begin
  List.Clear;
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 4;
  end
  else
  begin
    Flags := PRINTER_ENUM_LOCAL;
    Level := 5;
  end;
  Count := 0;
  EnumPrinters(Flags, nil, Level, nil, 0, Count, NumInfo);
  if Count > 0 then
  begin
    GetMem(Buffer, Count);
    try
      if not EnumPrinters(Flags, nil, Level, PByte(Buffer), Count, Count, NumInfo) then
        Exit;

      PrinterInfo := Buffer;

      for i := 0 to NumInfo - 1 do
      begin
        if Level = 4 then
        begin
          List.Add(PPrinterInfo4(PrinterInfo)^.pPrinterName);
          Inc(PrinterInfo, SizeOf(TPrinterInfo4));
        end
        else
        begin
          List.Add(PPrinterInfo5(PrinterInfo)^.pPrinterName);
          Inc(PrinterInfo, SizeOf(TPrinterInfo5));
        end;
      end;
    finally
      FreeMem(Buffer, Count);
    end;
  end;
end;

procedure TForm33.Button1Click(Sender: TObject);
begin
  GetPrinterList(Memo1.Lines);
end;

procedure TForm33.FormShow(Sender: TObject);
begin
//  Memo1.Lines.Text := SI.AllPrinters.Text;
end;

end.
