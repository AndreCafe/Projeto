unit uEditrosSkins;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uEditors, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, DB, ADODB, cxClasses,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxDBEdit,
  cxDropDownEdit, cxCalendar, cxImageComboBox, cxImage, StdCtrls,
  cxButtons, ExtCtrls, cxCheckBox, cxTextEdit, cxMaskEdit, cxButtonEdit, dxFrames,
  FrameIDs, cxLabel;

type
  TframeSkinsEditors = class(TframeEditors)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

initialization
  dxFrameManager.RegisterFrame(EditorsSkinsFrameID, TframeSkinsEditors,
    EditorSkinsFrameName, EditorsSkinsImageIndex, ExpressEditorsGroupIndex, -1, -1);


end.
