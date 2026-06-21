program DataEntryDemo;

{$R 'Default.res' 'Default.rc'}

uses
  Forms,
  FlyingMain in 'FlyingMain.pas' {FlyingMainForm},
  FlyingSeatCalc in 'FlyingSeatCalc.pas' {FlyingSeatCalcForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressSpreadSheet Demo';
  Application.CreateForm(TFlyingMainForm, FlyingMainForm);
  Application.Run;
end.
