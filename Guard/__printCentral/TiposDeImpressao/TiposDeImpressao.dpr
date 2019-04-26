program TiposDeImpressao;

uses
  Forms,
  uTiposDeImpressao in 'uTiposDeImpressao.pas' {FormTipoDeImpressao},
  ncgPrintInstall in '..\..\ncgPrintInstall.pas',
  ncShellStart in '..\..\..\Comp\ncShellStart.pas',
  uFormBackG1 in 'uFormBackG1.pas' {FormBackG1},
  uFormPasso1 in 'uFormPasso1.pas' {FormPasso1},
  uFormPasso2 in 'uFormPasso2.pas' {FormPasso2},
  uFormPassoQuerSair in 'uFormPassoQuerSair.pas' {FormPassoQuerSair},
  ncPrinters in '..\..\ncPrinters.pas',
  uFormPasso3 in 'uFormPasso3.pas' {FormPasso3},
  udmTipodeImpressao in 'udmTipodeImpressao.pas' {dmTipodeImpressao: TDataModule},
  uFormPasso4 in 'uFormPasso4.pas' {FormPasso4},
  uLogs in '..\..\uLogs.pas',
  uPrinterConstsAndTypes in '..\..\PrintComum\uPrinterConstsAndTypes.pas',
  uPrinterInfo8 in '..\..\PrintComum\uPrinterInfo8.pas',
  uPrintException in '..\..\PrintComum\uPrintException.pas',
  uCommonProc in '..\..\PrintComum\uCommonProc.pas',
  uVersionInfo in 'C:\Comp\varios\uVersionInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmTipodeImpressao, dmTipodeImpressao);
  Application.CreateForm(TFormTipoDeImpressao, FormTipoDeImpressao);
  Application.CreateForm(TFormBackG1, FormBackG1);
  Application.CreateForm(TFormPasso1, FormPasso1);
  Application.CreateForm(TFormPasso2, FormPasso2);
  Application.CreateForm(TFormPassoQuerSair, FormPassoQuerSair);
  Application.CreateForm(TFormPasso3, FormPasso3);
  Application.CreateForm(TFormPasso4, FormPasso4);
  Application.Run;
end.
