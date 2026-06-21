unit uEditors;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxGraphics, cxEdit,
  dxDBFrame, Db, DBTables, ExtCtrls, StdCtrls, ImgList, cxCheckBox,
  cxButtonEdit, cxHyperLinkEdit, cxMemo, cxDBEdit, cxImage, cxContainer,
  cxCurrencyEdit, cxCalendar, cxMaskEdit, cxImageComboBox,
  cxControls, cxDropDownEdit, cxTextEdit, cxLookupEdit, cxDBLookupEdit,
  cxButtons, ADODB, cxLookAndFeelPainters, dxOperationTypes,
  cxDBLookupComboBox, dxPSCore, cxLookAndFeels, Menus, cxClasses, cxLabel;

type
  TframeEditors = class(TdxDBFrame)
    pnCustomize: TPanel;
    Bevel3: TBevel;
    Label114: TLabel;
    Label115: TLabel;
    edButtonTransparence: TLabel;
    Label117: TLabel;
    Label2: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel6: TBevel;
    Label5: TLabel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    pnlStyleControllerProperties: TPanel;
    lblStyleControllerProperties: TLabel;
    ColorDialog: TColorDialog;
    pnForm: TPanel;
    PaintBox: TPaintBox;
    lbFirstName: TLabel;
    Label16: TLabel;
    edFirstName: TcxDBTextEdit;
    edGender: TcxDBImageComboBox;
    StyleController: TcxEditStyleController;
    edBirthDate: TcxDBDateEdit;
    edBiorgaphy: TcxDBMemo;
    edBorderColor: TcxButtonEdit;
    edBorderStyle: TcxComboBox;
    edButtonViewStyle: TcxComboBox;
    ButtonTransparence: TcxComboBox;
    cbLeft: TcxCheckBox;
    cbRight: TcxCheckBox;
    cbTop: TcxCheckBox;
    cbBottom: TcxCheckBox;
    cbHotTrack: TcxCheckBox;
    cbShadow: TcxCheckBox;
    cbNativeStyle: TcxCheckBox;
    Label19: TLabel;
    edColor: TcxButtonEdit;
    edBirthName: TcxDBTextEdit;
    edNickName: TcxDBTextEdit;
    edCountry: TcxDBLookupComboBox;
    dsPhotos: TDataSource;
    Label9: TLabel;
    edFilmImage: TcxDBImage;
    btnPrevFilm: TcxButton;
    btnNextFilm: TcxButton;
    edFilmCaption: TcxDBTextEdit;
    edTagLine: TcxDBTextEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edYear: TcxDBTextEdit;
    edRuntime: TcxDBTextEdit;
    Label15: TLabel;
    edPlotOutline: TcxDBMemo;
    lbBiography: TcxLabel;
    lbDetails: TcxLabel;
    lbFilm: TcxLabel;
    procedure edBorderColorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edBorderColorDblClick(Sender: TObject);
    procedure edBorderStyleChange(Sender: TObject);
    procedure edButtonViewStyleChange(Sender: TObject);
    procedure ButtonTransparenceChange(Sender: TObject);
    procedure cbLeftChange(Sender: TObject);
    procedure cbRightChange(Sender: TObject);
    procedure cbTopChange(Sender: TObject);
    procedure cbBottomChange(Sender: TObject);
    procedure cbHotTrackChange(Sender: TObject);
    procedure cbShadowChange(Sender: TObject);
    procedure cbNativeStyleChange(Sender: TObject);
    procedure edColorButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edColorDblClick(Sender: TObject);
    procedure btnPrevFilmClick(Sender: TObject);
    procedure btnNextFilmClick(Sender: TObject);
  protected
    procedure AddBars; override;
    procedure AddOperations; override;
    function GetHint: string; override;
    function GetPrintableComponent: TComponent; override;
    procedure PrepareLink(AReportLink: TBasedxReportLink); override;
    procedure InitCustomizationPanel;
    function GetDataSet: TDataSet; override;
    procedure UpdateOperations; override;
    procedure LookAndFeelChanged; override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  MainData, uStrsConst, dxPsContainerLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers;

{$R *.DFM}

constructor TframeEditors.Create(AOwner: TComponent);
begin
  inherited;
  pnlSeparator.Color := clBtnFace;
  InitCustomizationPanel;
end;

procedure TframeEditors.AddBars;
begin
  inherited;
  BarList.AddBar(btStandard);
end;

procedure TframeEditors.AddOperations;
  procedure AddFileOperations;
  begin
    with Operations do
    begin
      AddOperation(otExportTo, nil);
      AddOperation(otExportToHTML, nil);
      AddOperation(otExportToXML, nil);
      AddOperation(otExportToExcel, nil);
      AddOperation(otExportToText, nil);
      AddOperation(otPrintStyles, nil);
      AddOperation(otDefinePrintStyles, nil);
      AddOperation(otPrintPreview, nil);
      AddOperation(otPrint, nil);
      AddOperation(otStyles, nil);
    end;
  end;

begin
  inherited;
  AddFileOperations;
end;

procedure TframeEditors.btnNextFilmClick(Sender: TObject);
begin
  dmMain.cdsMovies.Next;
end;

procedure TframeEditors.btnPrevFilmClick(Sender: TObject);
begin
  dmMain.cdsMovies.Prior;
end;

function TframeEditors.GetDataSet: TDataSet;
begin
  Result := dmMain.cdsMovieStars;
end;

procedure TframeEditors.UpdateOperations;
begin
  inherited  UpdateOperations;
  Operations.Items[otStyles].Enabled := False;
end;

function TframeEditors.GetHint: string;
begin
  {$IFNDEF PS3}
  Result := sdxFrameEditorHint;
  {$ELSE}
  Result := inherited GetHint;
  {$ENDIF}
end;

function TframeEditors.GetPrintableComponent: TComponent;
begin
  Result := pnForm;
end;

procedure TframeEditors.PrepareLink(AReportLink: TBasedxReportLink);
begin
  inherited;
  TdxCustomContainerReportLink(AReportLink).HideComponents([PaintBox, btnPrevFilm, btnNextFilm]);
end;

procedure TframeEditors.InitCustomizationPanel;
begin
  edBorderColor.Style.Color := StyleController.Style.BorderColor;
  edColor.Style.Color := StyleController.Style.Color;
  edBorderStyle.ItemIndex := Integer(StyleController.Style.BorderStyle);
  edButtonViewStyle.ItemIndex := Integer(StyleController.Style.ButtonStyle);
  ButtonTransparence.ItemIndex := Integer(StyleController.Style.ButtonTransparency);
  cbHotTrack.Checked := StyleController.Style.HotTrack;
  cbShadow.Checked := StyleController.Style.Shadow;
  cbLeft.Checked := bLeft in StyleController.Style.Edges;
  cbRight.Checked := bRight in StyleController.Style.Edges;
  cbTop.Checked := bTop in StyleController.Style.Edges;
  cbBottom.Checked := bBottom in StyleController.Style.Edges;
  cbNativeStyle.Checked := StyleController.Style.LookAndFeel.NativeStyle;
end;

procedure TframeEditors.edBorderColorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  ColorDialog.Color := edBorderColor.Style.Color;
  if ColorDialog.Execute then
  begin
    edBorderColor.Style.Color := ColorDialog.Color;
    edBorderColor.Style.Font.Color := ColorToRGB(edBorderColor.Style.Color) xor $FFFFFF;
    StyleController.Style.BorderColor := edBorderColor.Style.Color;
  end;
end;

procedure TframeEditors.edBorderColorDblClick(Sender: TObject);
begin
  inherited;
  edBorderColorButtonClick(nil, 0);
end;

procedure TframeEditors.edBorderStyleChange(Sender: TObject);
begin
  inherited;
  StyleController.Style.BorderStyle := TcxEditBorderStyle(edBorderStyle.ItemIndex);
end;

procedure TframeEditors.edButtonViewStyleChange(Sender: TObject);
begin
  inherited;
  StyleController.Style.ButtonStyle := TcxEditButtonStyle(edButtonViewStyle.ItemIndex);
end;

procedure TframeEditors.ButtonTransparenceChange(Sender: TObject);
begin
  inherited;
  StyleController.Style.ButtonTransparency := TcxEditButtonTransparency(ButtonTransparence.ItemIndex);
end;

procedure TframeEditors.cbLeftChange(Sender: TObject);
begin
  inherited;
  with StyleController.Style do
    if cbLeft.Checked then
      Edges := Edges + [bLeft]
    else
      Edges := Edges - [bLeft];
end;

procedure TframeEditors.cbRightChange(Sender: TObject);
begin
  inherited;
  with StyleController.Style do
    if cbRight.Checked then
      Edges := Edges + [bRight]
    else
      Edges := Edges - [bRight];
end;

procedure TframeEditors.cbTopChange(Sender: TObject);
begin
  inherited;
  with StyleController.Style do
    if cbTop.Checked then
      Edges := Edges + [bTop]
    else
      Edges := Edges - [bTop];
end;

procedure TframeEditors.cbBottomChange(Sender: TObject);
begin
  inherited;
  with StyleController.Style do
    if cbBottom.Checked then
      Edges := Edges + [bBottom]
    else
      Edges := Edges - [bBottom];
end;

procedure TframeEditors.cbHotTrackChange(Sender: TObject);
begin
  inherited;
  StyleController.Style.HotTrack := cbHotTrack.Checked;
end;

procedure TframeEditors.cbShadowChange(Sender: TObject);
begin
  inherited;
  StyleController.Style.Shadow := cbShadow.Checked;
end;

procedure TframeEditors.cbNativeStyleChange(Sender: TObject);
begin
  inherited;
  StyleController.Style.LookAndFeel.NativeStyle := cbNativeStyle.Checked;
end;

procedure TframeEditors.edColorButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  ColorDialog.Color := edColor.Style.Color;
  if ColorDialog.Execute then
  begin
    edColor.Style.Color := ColorDialog.Color;
    edColor.Style.Font.Color := ColorToRGB(edColor.Style.Color) xor $FFFFFF;
    StyleController.Style.Color := edColor.Style.Color;
  end;
end;

procedure TframeEditors.edColorDblClick(Sender: TObject);
begin
  inherited;
  edColorButtonClick(nil, 0);
end;

procedure TframeEditors.LookAndFeelChanged;
begin
  inherited LookAndFeelChanged;
end;

end.
