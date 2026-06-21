unit uVertGridInplaceEditors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxVertGridFrame, StdCtrls, ExtCtrls, cxStyles, cxGraphics,
  cxEdit, cxControls, cxInplaceContainer, cxVGrid,
  cxExtEditRepositoryItems, cxShellEditRepositoryItems,
  cxEditRepositoryItems, cxDBEditRepository, PropertiesPopup, jpeg,
  cxLookAndFeels, cxLookAndFeelPainters, cxClasses;

type
  TfrmVertGridInplaceEditors = class(TVerticalGridFrame)
    EditRepository: TcxEditRepository;
    EditRepositoryBlobItem: TcxEditRepositoryBlobItem;
    EditRepositoryButtonItem: TcxEditRepositoryButtonItem;
    EditRepositoryCalcItem: TcxEditRepositoryCalcItem;
    EditRepositoryCheckBoxItem: TcxEditRepositoryCheckBoxItem;
    EditRepositoryComboBoxItem: TcxEditRepositoryComboBoxItem;
    EditRepositoryCurrencyItem: TcxEditRepositoryCurrencyItem;
    EditRepositoryDateItem: TcxEditRepositoryDateItem;
    EditRepositoryHyperLinkItem: TcxEditRepositoryHyperLinkItem;
    EditRepositoryImageItem: TcxEditRepositoryImageItem;
    EditRepositoryImageComboBoxItem: TcxEditRepositoryImageComboBoxItem;
    EditRepositoryLookupComboBoxItem: TcxEditRepositoryLookupComboBoxItem;
    EditRepositoryMaskItem: TcxEditRepositoryMaskItem;
    EditRepositoryMemoItem: TcxEditRepositoryMemoItem;
    EditRepositoryMRUItem: TcxEditRepositoryMRUItem;
    EditRepositoryPopupItem: TcxEditRepositoryPopupItem;
    EditRepositoryRadioGroupItem: TcxEditRepositoryRadioGroupItem;
    EditRepositorySpinItem: TcxEditRepositorySpinItem;
    EditRepositoryTextItem: TcxEditRepositoryTextItem;
    EditRepositoryTimeItem: TcxEditRepositoryTimeItem;
    EditRepositoryProgressBar: TcxEditRepositoryProgressBar;
    EditRepositoryShellComboBoxItem: TcxEditRepositoryShellComboBoxItem;
    EditRepositoryTrackBar: TcxEditRepositoryTrackBar;
    EditRepositoryColorComboBox: TcxEditRepositoryColorComboBox;
    EditRepositoryFontNameComboBox: TcxEditRepositoryFontNameComboBox;
    EditRepositoryLabel: TcxEditRepositoryLabel;
    VerticalGrid: TcxVerticalGrid;
    VerticalGridCategoryRow1: TcxCategoryRow;
    VerticalGridCategoryRow2: TcxCategoryRow;
    VerticalGridCategoryRow3: TcxCategoryRow;
    VerticalGridCategoryRow4: TcxCategoryRow;
    VerticalGridCategoryRow5: TcxCategoryRow;
    vgButtonEditor: TcxEditorRow;
    vgCheckBoxEditor: TcxEditorRow;
    vgCurrencyEditor: TcxEditorRow;
    vgMaskEditor: TcxEditorRow;
    vgRadioGroupEditor: TcxEditorRow;
    vgSpintEditor: TcxEditorRow;
    vgTextEditor: TcxEditorRow;
    vgTimeEditor: TcxEditorRow;
    vgComboBoxEditor: TcxEditorRow;
    vgHyperLinkEditor: TcxEditorRow;
    vgImageComboBoxEditor: TcxEditorRow;
    vgLookupComboBoxEditor: TcxEditorRow;
    vgMRUEditor: TcxEditorRow;
    vgBlobEditor: TcxEditorRow;
    vgMemoEditor: TcxEditorRow;
    vgImageEditor: TcxEditorRow;
    vgCalcEditor: TcxEditorRow;
    vgDateEditor: TcxEditorRow;
    vgPopupEditor: TcxEditorRow;
    vgProgressBarEditor: TcxEditorRow;
    vgShellComboBoxEditor: TcxEditorRow;
    vgTrackBarEditor: TcxEditorRow;
    vgColorComboBoxEditor: TcxEditorRow;
    vgFontComboBoxEditor: TcxEditorRow;
    vgLabel: TcxEditorRow;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure EditRepositoryButtonItemPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure EditRepositoryPopupItemPropertiesInitPopup(Sender: TObject);
    procedure vgProgressBarEditorPropertiesGetEditingProperties(
      Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
      var AProperties: TcxCustomEditProperties);
  private
    fmPopupTree: TfmPopupTree;
  protected
    function GetDescription: string; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

uses
  maindata, dxFrames, FrameIDs, cxDropDownEdit, uStrsConst;

{$R *.dfm}

{ TfrmVertGridInplaceEditors }

constructor TfrmVertGridInplaceEditors.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fmPopupTree := TfmPopupTree.Create(nil);
  EditRepositoryPopupItem.Properties.PopupControl := fmPopupTree.pnPopupControl;

  vgLookupComboBoxEditor.Properties.Value := dmmain.atDXProducts.FindField('ID').AsInteger;
  vgImageEditor.Properties.Value :=  dmmain.cdsMovies.FindField('Photo').Value;
  vgMemoEditor.Properties.Value := sdxInpaceFrame_MemoItem;
  vgTimeEditor.Properties.Value := Now;
  vgDateEditor.Properties.Value := Date;
  vgColorComboBoxEditor.Properties.Value := clBlue;
  vgFontComboBoxEditor.Properties.Value := 'Arial';
  vgShellComboBoxEditor.Properties.Value := 'My Computer';
  VerticalGrid.LayoutStyle := ulsBandsView;
end;

destructor TfrmVertGridInplaceEditors.Destroy;
begin
  fmPopupTree.Free;
  inherited Destroy;
end;


procedure TfrmVertGridInplaceEditors.EditRepositoryButtonItemPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowMessage('This button can call your own code.');
end;

procedure TfrmVertGridInplaceEditors.EditRepositoryPopupItemPropertiesInitPopup(
  Sender: TObject);
begin
  fmPopupTree.PopupEdit := TcxPopupEdit(Sender);
end;

function TfrmVertGridInplaceEditors.GetDescription: string;
begin
  Result := sdxFrameVerticalGridInplaceEditors;
end;

procedure TfrmVertGridInplaceEditors.vgProgressBarEditorPropertiesGetEditingProperties(
  Sender: TcxCustomEditorRowProperties; ARecordIndex: Integer;
  var AProperties: TcxCustomEditProperties);
begin
  AProperties := EditRepositorySpinItem.Properties;

end;

initialization
  dxFrameManager.RegisterFrame(VerticalGridInplaceEditorsFrameID, TfrmVertGridInplaceEditors,
    VerticalGridInplaceEditorsName, VerticalGridInplaceEditorsImageIndex, VerticalGridInplaceEditorsImageIndex, VerticalGridSideBarGroupIndex);


end.
