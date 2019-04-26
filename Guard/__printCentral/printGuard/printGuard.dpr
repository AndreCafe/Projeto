program printGuard;

uses
  Forms,
  uPrintGuard in 'uPrintGuard.pas' {FormPrintGuard},
  uLogs in '..\..\uLogs.pas',
  uOlhaPasta in 'uOlhaPasta.pas',
  madKernel in 'C:\Comp\madCollection\madKernel\Sources\madKernel.pas',
  uDirWatch in 'uDirWatch.pas',
  udmPrintGuard in 'udmPrintGuard.pas' {dmPrintGuard: TDataModule},
  uFormPassoB in 'uFormPassoB.pas' {FormPassoB},
  uFormBackG1 in 'uFormBackG1.pas' {FormBackG1},
  uFormPassoA in 'uFormPassoA.pas' {FormPassoA},
  uFormPassoQuerSair in 'uFormPassoQuerSair.pas' {FormPassoQuerSair},
  ncPrinters in '..\..\ncPrinters.pas',
  ncgPrintInstall in '..\..\ncgPrintInstall.pas',
  ncShellStart in '..\..\..\Comp\ncShellStart.pas',
  uPrinterConstsAndTypes in '..\..\PrintComum\uPrinterConstsAndTypes.pas',
  uPrinterInfo8 in '..\..\PrintComum\uPrinterInfo8.pas',
  uPrintException in '..\..\PrintComum\uPrintException.pas',
  uCommonProc in '..\..\PrintComum\uCommonProc.pas',
  uNexCafe5PrintCentral in 'uNexCafe5PrintCentral.pas' {FormNexCafe5PrintCentral},
  gPanel in 'C:\Comp\GPanel\gPanel.pas',
  Int64List in 'C:\Comp\varios\Int64List.pas',
  ncNomeMaquina in '..\..\ncNomeMaquina.pas',
  uThumbsScrollBox in '..\..\PrintComum\uThumbsScrollBox.pas',
  uDeleteFiles in '..\..\PrintComum\uDeleteFiles.pas',
  uDirUtils in '..\..\PrintComum\uDirUtils.pas',
  uImagem in '..\..\PrintComum\uImagem.pas',
  uPrintManBaseClasses in '..\..\PrintComum\uPrintManBaseClasses.pas',
  uFormPasso10 in 'uFormPasso10.pas' {FormPasso10},
  uPagesScrollBox in '..\..\PrintComum\uPagesScrollBox.pas',
  uImagesScrollBox in '..\..\PrintComum\uImagesScrollBox.pas',
  dxSkinProject1 in '..\..\PrintComum\DX_VCL Skins\dxSkinProject1\dxSkinProject1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPrintGuard, dmPrintGuard);
  Application.CreateForm(TFormPrintGuard, FormPrintGuard);
  Application.CreateForm(TFormPassoB, FormPassoB);
  Application.CreateForm(TFormBackG1, FormBackG1);
  Application.CreateForm(TFormPassoA, FormPassoA);
  Application.CreateForm(TFormPassoQuerSair, FormPassoQuerSair);
  Application.CreateForm(TFormNexCafe5PrintCentral, FormNexCafe5PrintCentral);
  Application.CreateForm(TFormPasso10, FormPasso10);
  Application.Run;
end.
