unit ncaFrmWebPopup;
{
    ResourceString: Dario 11/03/13
    Nada pra fazer
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ncFrmWebPopup, ExtCtrls, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB, ncBaseWebApi, ncaBaseWebApi;

type
  TAdminFrmWebPopup = class(TFrmWebPopup)
  private
    { Private declarations }
  protected  
    function CreateApi: TncBaseWebApi; override;
  public
    { Public declarations }
  end;

  TncAdminPopupApi = class ( TncAdminBaseWebApi )
  published
    function CloseWindow: OleVariant; override;
    function FecharForm: OleVariant; 
  end;

var
  AdminFrmWebPopup: TAdminFrmWebPopup;

implementation

{$R *.dfm}

{ TncAdminPoupApi }

function TncAdminPopupApi.CloseWindow: OleVariant;
begin
  Result := FecharForm;
end;

function TncAdminPopupApi.FecharForm: OleVariant;
begin
  Result := 1;
  TAdminFrmWebPopup(Form).Fechar := True;
  Form.Close;
end;

{ TAdminFrmWebPopup }

function TAdminFrmWebPopup.CreateApi: TncBaseWebApi;
begin
  Result := TncAdminPopupApi.Create(Self, WB);
end;

initialization
  FrmWebPopupClass := TAdminFrmWebPopup;

end.
