program DelphiRESTClient;

uses
  Forms,
  RestClientForm in 'RestClientForm.pas' {RestForm},
  BabelGoogle in 'BabelGoogle.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TRestForm, RestForm);
  Application.Run;
end.
