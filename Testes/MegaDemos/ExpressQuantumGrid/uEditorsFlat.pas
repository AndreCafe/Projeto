unit uEditorsFlat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uEditors, DB, ADODB, cxContainer, cxEdit, StdCtrls, cxButtons,
  cxImage, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxMemo, cxDropDownEdit,
  cxCalendar, cxImageComboBox, ExtCtrls, cxCheckBox, cxControls,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters,
  cxDBLookupComboBox, cxGraphics, cxLookAndFeels, Menus, cxClasses, cxLabel;

type
  TframeFlatEditors = class(TframeEditors)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
  dxFrames, FrameIDs;

initialization
  dxFrameManager.RegisterFrame(EditorsFlatFrameID, TframeFlatEditors,
    EditorFlatFrameName, EditorsFlatImageIndex, ExpressEditorsGroupIndex, -1, -1);

end.
