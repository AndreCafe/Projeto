program nexCafe5PrintCentral;

uses
  Forms,
  gPanel in 'C:\Comp\GPanel\gPanel.pas',
  ncgPrintInstall in '..\..\ncgPrintInstall.pas',
  ncPrinters in '..\..\ncPrinters.pas',
  uLogs in '..\..\uLogs.pas',
  uJSON in 'C:\Comp\varios\uJSON.pas',
  uFormBackG1 in 'uFormBackG1.pas' {FormBackG1},
  uFormPasso2 in 'uFormPasso2.pas' {FormPasso2},
  uFormPasso10 in 'uFormPasso10.pas' {FormPasso10},
  uFormPassoQuerSair in 'uFormPassoQuerSair.pas' {FormPassoQuerSair},
  uFormPasso20 in 'uFormPasso20.pas' {FormPasso20},
  uFormPasso1 in 'uFormPasso1.pas' {FormPasso1},
  Int64List in 'C:\Comp\varios\Int64List.pas',
  ncNomeMaquina in '..\..\ncNomeMaquina.pas',
  uNexCafe5PrintMan in 'uNexCafe5PrintMan.pas' {FormNexCafe5PrintMan},
  ncShellStart in '..\..\..\Comp\ncShellStart.pas',
  IPInfo in 'C:\Comp\varios\IPInfo.pas',
  IPHelperDef in 'C:\Comp\varios\IPHelperDef.pas',
  madKernel in 'C:\Comp\madCollection\madKernel\Sources\madKernel.pas',
  dxSkinProject1 in '..\..\PrintComum\DX_VCL Skins\dxSkinProject1\dxSkinProject1.pas',
  uThumbsScrollBox in '..\..\PrintComum\uThumbsScrollBox.pas',
  uDeleteFiles in '..\..\PrintComum\uDeleteFiles.pas',
  uDirUtils in '..\..\PrintComum\uDirUtils.pas',
  uImagem in '..\..\PrintComum\uImagem.pas',
  uImagesScrollBox in '..\..\PrintComum\uImagesScrollBox.pas',
  uPagesScrollBox in '..\..\PrintComum\uPagesScrollBox.pas',
  uPrintManBaseClasses in '..\..\PrintComum\uPrintManBaseClasses.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormNexCafe5PrintMan, FormNexCafe5PrintMan);
  Application.CreateForm(TFormPasso20, FormPasso20);
  Application.CreateForm(TFormPassoQuerSair, FormPassoQuerSair);
  Application.CreateForm(TFormBackG1, FormBackG1);
  Application.CreateForm(TFormPasso10, FormPasso10);
  Application.CreateForm(TFormPasso2, FormPasso2);
  Application.CreateForm(TFormPasso1, FormPasso1);
  Application.Run;
end.
