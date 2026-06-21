unit cxPivotFieldsCustomizationFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxPivotSalesPersonFormUnit, cxCustomPivotGrid, cxDBPivotGrid,
  cxControls, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxClasses, cxGraphics, cxCustomData, cxStyles;

type
  TfrmFieldsCustomization = class(TfrmSalesPerson)
    pnlFilter: TPanel;
    cxbtnSetVisible: TcxButton;
    procedure PivotGridCustomization(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure cxbtnSetVisibleClick(Sender: TObject);
  private
    { Private declarations }
  public
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

class function TfrmFieldsCustomization.GetID: Integer;
begin
  Result := 10;
end;

procedure TfrmFieldsCustomization.PivotGridCustomization(
  Sender: TObject);
const
  AVisibility: array[Boolean] of string = 
  ('Show Customization Form', 'Hide Customization Form');
begin
  cxbtnSetVisible.Caption := AVisibility[PivotGrid.Customization.Visible];
end;

procedure TfrmFieldsCustomization.FormShow(Sender: TObject);
var
  ATopLeft: TPoint;
begin
  if Parent = nil then Exit;
  if IsRectEmpty(PivotGrid.Customization.FormBounds) then
  begin
     with PivotGrid.Customization do
     begin
       ATopLeft := Parent.ClientToScreen(Point(Parent.Width - Form.Width, Parent.Height - Form.Height));
       FormBounds := Rect(ATopLeft.X, ATopLeft.Y, ATopLeft.X + Form.Width, ATopLeft.Y + Form.Height);
     end;
  end;
  PivotGrid.Customization.Visible := True;
end;

procedure TfrmFieldsCustomization.FormHide(Sender: TObject);
begin
  PivotGrid.Customization.Visible := False;
end;

procedure TfrmFieldsCustomization.cxbtnSetVisibleClick(Sender: TObject);
begin
  PivotGrid.Customization.Visible := not PivotGrid.Customization.Visible;
end;

initialization
  TfrmFieldsCustomization.Register;

finalization


end.
