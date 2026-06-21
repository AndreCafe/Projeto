unit uGridCustomDrawFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxFrame, StdCtrls, ExtCtrls, dxFrames, FrameIds, UnboundModeDemoMain,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel;

type
  TdxCustomDrawFrame = class(TdxFrame)
    plGameSite: TPanel;
  private
    FForm: TForm;
  public
    procedure ChangeVisibility(AShow: Boolean); override; 
  end;

implementation

{$R *.dfm}

procedure TdxCustomDrawFrame.ChangeVisibility(AShow: Boolean);
begin
  if FForm = nil then
     FForm := TUnboundModeDemoMainForm.Create(Application);
  FForm.Parent := plGameSite;
  if not AShow then
    FForm.Hide
  else
    FForm.Show;
  inherited ChangeVisibility(AShow);
end;

initialization
  dxFrameManager.RegisterFrame(GridCustomDrawFrameID, TdxCustomDrawFrame,
    GridCustomDrawFrameName, GridCustomDrawImageIndex, EntertainmentGroupIndex, -1, -1);

end.
