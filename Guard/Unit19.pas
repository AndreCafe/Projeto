unit Unit19;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, AcroPDFLib_TLB, gtPDFPrinter, gtPDFClasses,
  gtCstPDFDoc, gtExPDFDoc, gtExProPDFDoc, gtPDFDoc, frxClass, frxExportPDF;

type
  TForm19 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    gPDF: TgtPDFDocument;
    gPrint: TgtPDFPrinter;
    A: TAcroPDF;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

uses Unit1, ncPrinterInfo8;

{$R *.dfm}

procedure TForm19.Button1Click(Sender: TObject);
var M: TMemoryStream;
begin
  M := TMemoryStream.Create;
  try
    M.LoadFromFile('c:\meus programas\nexcafe\3.devmode');
    RestorePrinterInfo8(PAnsiChar('TX560WD'), M);
  finally
    M.Free;
  end;
  
  A.printPages(1, 1);
end;

procedure TForm19.Button2Click(Sender: TObject);
begin
  gPDF.LoadFromFile(   'c:\meus programas\testexyz.pdf');
  gPDF.FileName :=     'c:\meus programas\testexyz.pdf';
  gPDF.WorkFileName := 'c:\meus programas\testexyz.pdf';
  gPrint.PDFDocument := gPDF;
  gPrint.FromPage := 1;
  gPrint.ToPage := 1;
  gPrint.MaxPage := 1;
  gPrint.PrintDoc;
end;

procedure TForm19.FormShow(Sender: TObject);
begin
  A.src := 'c:\meus programas\testem.pdf';
  A.Width := 1;
  A.Height := 1;
end;

end.
