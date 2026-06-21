unit UEditorsStd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uEditors, cxContainer, cxEdit, ImgList, cxImage, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxMemo, cxDropDownEdit, cxCalendar,
  cxImageComboBox, ExtCtrls, cxCheckBox, cxControls, cxTextEdit,
  cxMaskEdit, cxButtonEdit, StdCtrls, DB, ADODB, cxButtons, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Menus, cxClasses, cxLabel,
  cxDBLookupComboBox;

type
  TframeStdEditors = class(TframeEditors)
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
  dxFrameManager.RegisterFrame(EditorsNativeFrameID, TframeStdEditors,
    EditorNativeFrameName, EditorsNativeImageIndex, EditorsNativeImageIndex, EditorsSideBarGroupIndex);

end.
