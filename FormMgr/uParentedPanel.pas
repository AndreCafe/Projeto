unit uParentedPanel;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls;

type
  TOnParentModifiedEvent = procedure(Sender: TObject; aParent:TWinControl) of object;

  TParentedPanel = class(TPanel)
  private
   FOnParentModified : TOnParentModifiedEvent;
    { Private declarations }
  protected
    procedure SetParent(AParent: TWinControl); override;
    { Protected declarations }
  published
    { Public declarations }
    property OnParentModified : TOnParentModifiedEvent read 
      FOnParentModified write FOnParentModified;
  end;

implementation

{ TParentedPanel }

procedure TParentedPanel.SetParent(AParent: TWinControl);
begin
  inherited;
  if assigned(FOnParentModified) then
     FOnParentModified(Self, AParent);
end;

end.
