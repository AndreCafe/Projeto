program InstallPrinterTeste;

uses
  Forms,
  Unit4 in 'Unit4.pas' {Form4},
  uZipUtils in '..\..\..\PrintComum\uZipUtils.pas',
  uCommonProc in '..\..\..\PrintComum\uCommonProc.pas',
  uDirUtils in '..\..\..\PrintComum\uDirUtils.pas',
  uHttpDownloader in '..\..\..\PrintComum\uHttpDownloader.pas',
  uDisplayUtils in '..\..\..\PrintComum\uDisplayUtils.pas',
  uFileBlockStream in '..\..\..\PrintComum\uFileBlockStream.pas',
  uPrintException in '..\..\..\PrintComum\uPrintException.pas',
  uPrinterInfo8 in '..\..\..\PrintComum\uPrinterInfo8.pas',
  uPrinterConstsAndTypes in '..\..\..\PrintComum\uPrinterConstsAndTypes.pas',
  uVersionInfo in 'C:\Comp\varios\uVersionInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
