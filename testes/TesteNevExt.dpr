program TesteNevExt;

uses
  Forms,
  uTesteNavExt in 'uTesteNavExt.pas' {Form21},
  ncCheckWin64 in '..\Comp\ncCheckWin64.pas',
  ncBrowserUtils in '..\Comp\ncBrowserUtils.pas',
  ncChromeExt in '..\Comp\ncChromeExt.pas' {dmChromeExt: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TdmChromeExt, dmChromeExt);
  Application.Run;
end.
