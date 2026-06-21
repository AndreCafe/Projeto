program InterfacesExplorer;

uses
  Forms,
  ExplorerForm in 'ExplorerForm.pas' {InterfacesExplorerForm},
  PlainInterfaceSample in 'PlainInterfaceSample.pas',
  LoggerIntf in 'LoggerIntf.pas',
  LoggerImpl in 'LoggerImpl.pas',
  MethodResolutionSample in 'MethodResolutionSample.pas',
  OwnerAndPetSample in 'OwnerAndPetSample.pas',
  ShowRefCountSample in 'ShowRefCountSample.pas',
  ConstNonConstSample in 'ConstNonConstSample.pas',
  SelfishSample in 'SelfishSample.pas',
  InterfaceInheritanceSample in 'InterfaceInheritanceSample.pas',
  DelegationSample in 'DelegationSample.pas',
  ContainmentSample in 'ContainmentSample.pas',
  ThreadSample in 'ThreadSample.pas',
  CircularReferenceSample in 'CircularReferenceSample.pas',
  CircularFundamentalSample in 'CircularFundamentalSample.pas',
  Fundamentals in 'Fundamentals.pas',
  Guards in 'Guards.pas',
  WinThreadGuard in 'WinThreadGuard.pas',
  ParseFundamentalSampleIntf in 'ParseFundamentalSampleIntf.pas',
  ParseFundamentalSample in 'ParseFundamentalSample.pas',
  ParseFundamentalSelfDestructSample in 'ParseFundamentalSelfDestructSample.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TInterfacesExplorerForm, InterfacesExplorerForm);
  Application.Run;
end.
