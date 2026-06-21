unit uEditorsWeb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uEditors, DB, ADODB, cxContainer, cxEdit, StdCtrls, cxButtons,
  cxImage, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxMemo, cxDropDownEdit,
  cxCalendar, cxImageComboBox, ExtCtrls, cxCheckBox, cxControls,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxClasses, cxLabel, cxDBLookupComboBox;

type
  TframeWebEditors = class(TframeEditors)
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
  private
    procedure HideBevels;
    procedure PlaceShapes;
  protected
    procedure Loaded; override;
  public
    procedure ChangeVisibility(AShow: Boolean); override;  
  end;

implementation

{$R *.dfm}

uses
  dxFrames, FrameIDs;

procedure TframeWebEditors.ChangeVisibility(AShow: Boolean);
begin
  inherited;
  if AShow then
  begin
    lbDetails.BringToFront;
    lbBiography.BringToFront;
    lbFilm.BringToFront;
  end;
end;

procedure TframeWebEditors.Loaded;
begin
  inherited;
  HideBevels;
  PlaceShapes;
end;

procedure TframeWebEditors.HideBevels;
begin
end;

procedure TframeWebEditors.PlaceShapes;

  procedure PlaceShape(AShape: TShape; AHost: TControl; 
    AnInflateFactor, AnHorzOffsetFactor: Integer);
  var
    R: TRect;
  begin
    R := AHost.BoundsRect;
    InflateRect(R, AnInflateFactor, AnInflateFactor);
    OffsetRect(R, AnHorzOffsetFactor, 0);
    AShape.BoundsRect := R;
  end;

const
  LabelInflateFactor: Integer = 3;
  LabelOffsetFactor: Integer = 3;
begin
//  PlaceShape(Shape4, lbDetails, LabelInflateFactor, LabelOffsetFactor);
//  PlaceShape(Shape5, lbBiography, LabelInflateFactor, LabelOffsetFactor);
//  PlaceShape(Shape6, lbFilm, LabelInflateFactor, LabelOffsetFactor);
end;

initialization
  dxFrameManager.RegisterFrame(EditorsWebFrameID, TframeWebEditors,
    EditorWebFrameName, EditorsWebImageIndex, EditorsWebImageIndex, EditorsSideBarGroupIndex);

end.
