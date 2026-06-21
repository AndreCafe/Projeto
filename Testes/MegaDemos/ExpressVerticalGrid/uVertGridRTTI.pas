unit uVertGridRTTI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxVertGridFrame, StdCtrls, ExtCtrls, cxStyles, cxGraphics,
  cxEdit, ComCtrls, cxInplaceContainer, cxVGrid, cxOI, cxControls,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  TfrmVerticalGridRTTI = class(TVerticalGridFrame)
    pnlInspector: TPanel;
    pnlControls: TPanel;
    pnlObjectCombo: TPanel;
    cbSelectedObject: TcxComboBox;
    Inspector: TcxRTTIInspector;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    RichEdit1: TRichEdit;
    Splitter1: TSplitter;
    procedure cbSelectedObjectPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetDescription: string; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, uStrsConst;

{$R *.dfm}

{ TfrmVerticalGridRTTI }

constructor TfrmVerticalGridRTTI.Create(AOwner: TComponent);
var
  I: Integer;
begin
  inherited Create(AOwner);
  for I := 0 to pnlControls.ControlCount - 1 do
    cbSelectedObject.Properties.Items.Add(pnlControls.Controls[I].Name);
  if cbSelectedObject.Properties.Items.Count > 0 then
    cbSelectedObject.ItemIndex := 0;
end;

procedure TfrmVerticalGridRTTI.cbSelectedObjectPropertiesEditValueChanged(
  Sender: TObject);
begin
  Inspector.InspectedObject := FindComponent(cbSelectedObject.Text);
end;

function TfrmVerticalGridRTTI.GetDescription: string;
begin
  Result := sdxFrameVerticalGridRTTI;
end;

initialization
  dxFrameManager.RegisterFrame(VerticalGridInspectorFrameID, TfrmVerticalGridRTTI,
    VerticalGridRTTIName, VerticalGridRTTIImageIndex, VerticalGridRTTIImageIndex, VerticalGridSideBarGroupIndex);


end.
