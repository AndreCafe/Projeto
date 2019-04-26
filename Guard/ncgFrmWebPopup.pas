unit ncgFrmWebPopup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncFrmWebPopup, ExtCtrls, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, ncBaseWebApi, ncgWebApi;

type
  TGuardFrmWebPopup = class(TFrmWebPopup)
  private
    { Private declarations }
  protected  
    function CreateApi: TncBaseWebApi; override;
  public
    { Public declarations }
  end;

  TncGuardPopupApi = class ( TncgWebApi )
  published
    function CloseWindow: OleVariant;
    procedure FecharForm; 
  end; 

var
  GuardFrmWebPopup: TGuardFrmWebPopup;

implementation

{$R *.dfm}

{ TncGuardPopupApi }

function TncGuardPopupApi.CloseWindow: OleVariant;
begin
  Result := 1;
  FecharForm;
end;

procedure TncGuardPopupApi.FecharForm;
begin
  TGuardFrmWebPopup(Form).Fechar := True;
  Form.Close;
end;

{ TGuardFrmWebPopup }

function TGuardFrmWebPopup.CreateApi: TncBaseWebApi;
begin
  Result := TncGuardPopupApi.Create(Self, WB);
end;

initialization
  FrmWebPopupClass := TGuardFrmWebPopup;

end.
