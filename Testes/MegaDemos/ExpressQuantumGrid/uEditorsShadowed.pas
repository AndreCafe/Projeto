unit uEditorsShadowed;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uEditors, DB, cxContainer, cxEdit, StdCtrls, cxButtons,
  cxImage, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxMemo, cxDropDownEdit,
  cxCalendar, cxImageComboBox, ExtCtrls, cxCheckBox, cxControls,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxDBLookupComboBox, dxSkinsCore, cxClasses,
  cxLabel, ADODB;

type
  TframeShadowedEditors = class(TframeEditors)
    procedure PaintBoxPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
  cxGridDemoUtils, dxFrames, FrameIDs;

procedure TframeShadowedEditors.PaintBoxPaint(Sender: TObject);
begin
  with Sender as TPaintBox do
    FillGrayGradientRect(PaintBox.Canvas, PaintBox.ClientRect, PaintBox.Color);
end;

initialization
  dxFrameManager.RegisterFrame(EditorsShadowedFrameID, TframeShadowedEditors,
    EditorShadowedFrameName, EditorsShadowedImageIndex, ExpressEditorsGroupIndex, -1, -1);

end.
