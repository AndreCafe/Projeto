unit cmFFDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ffdb, ffllcomm, fflllgcy, ffllcomp, fflleng, ffsrintm, ffclreng,
  ffllbase, ffdbbase, ffsreng;

type
  TFFDataModule = class
    FFClient: TffClient;
    FFSE: TffSession;
  private
    { Private declarations }
    FFEng: TffServerEngine;
  public
    constructor Create(aFFEng: TffServerEngine);
    destructor Destroy; override;
    { Public declarations }
  end;

implementation

constructor TffDataModule.Create(aFFEng: TffServerEngine);
begin
  inherited Create;
  FFEng := aFFEng;
  FFClient := TffClient.Create(nil);
  FFClient.ServerEngine := FFEng;
  FFClient.AutoClientName := True;
  FFClient.Active := True;
  FFSE := TffSession.Create(nil);
  FFSE.AutoSessionName := True;
  FFSE.ClientName := FFClient.ClientName;
  FFSE.Active := True;
end;

destructor TffDataModule.Destroy;
begin
  FFSE.Active := False;
  FFClient.Active := False;
  FFSE.Free;
  FFClient.Free;
  inherited;
end;

end.
