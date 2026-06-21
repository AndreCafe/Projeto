unit uEditorsUltraFlat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uEditors, DB, ADODB, cxContainer, cxEdit, StdCtrls, cxButtons,
  cxImage, cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxMemo, cxDropDownEdit,
  cxCalendar, cxImageComboBox, ExtCtrls, cxCheckBox, cxControls,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxClasses, cxDBLookupComboBox, cxLabel;

type
  TframeUltaFlatEditors = class(TframeEditors)
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
  dxFrameManager.RegisterFrame(EditorsUltraFlatFrameID, TframeUltaFlatEditors,
    EditorUltraFlatFrameName, EditorsUltraFlatImageIndex, ExpressEditorsGroupIndex, -1, -1);

end.
