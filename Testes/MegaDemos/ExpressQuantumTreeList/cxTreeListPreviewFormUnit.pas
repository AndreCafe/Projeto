unit cxTreeListPreviewFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTreeListBiolifeFormUnit, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxMaskEdit, cxCheckBox, cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxLookAndFeelPainters, cxTextEdit, cxDropDownEdit, cxLabel, ImgList, StdCtrls,
  ExtCtrls, cxContainer, cxEdit, cxGroupBox, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData;

type
  TfrmPreview = class(TfrmBiolife)
    cxGroupBox3: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    chkVisible: TcxCheckBox;
    cbPlace: TcxComboBox;
    cxLabel2: TcxLabel;
    cbColumn: TcxComboBox;
    procedure chkVisibleClick(Sender: TObject);
    procedure cbPlacePropertiesChange(Sender: TObject);
    procedure cbColumnPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure FillCombo;
    procedure Initialize;
  public
    class function GetID: Integer; override;
  end;

implementation

{$R *.dfm}

uses
  cxTreeListFeaturesDemoStrConsts;

class function TfrmPreview.GetID: Integer;
begin
  Result := 27;
end;

procedure TfrmPreview.FormCreate(Sender: TObject);
begin
  FillCombo;
  Initialize;
end;

procedure TfrmPreview.cbColumnPropertiesChange(Sender: TObject);
begin
  if cbColumn.ItemIndex <> -1 then
    TreeList.Preview.Column := TcxTreeListColumn(cbColumn.Properties.Items.Objects[cbColumn.ItemIndex]);
end;

procedure TfrmPreview.cbPlacePropertiesChange(Sender: TObject);
begin
  TreeList.Preview.Place := TcxTreeListPreviewPlace(cbPlace.ItemIndex);
end;

procedure TfrmPreview.chkVisibleClick(Sender: TObject);
begin
  TreeList.Preview.Visible := chkVisible.Checked;
end;

procedure TfrmPreview.FillCombo;
var
  I: Integer;
begin
  cbColumn.Clear;
  for I := 0 to 5 do
    if I <> 3 then
      cbColumn.Properties.Items.AddObject(TreeList.Columns[I].Caption.Text,
        TreeList.Columns[I]);
end;

procedure TfrmPreview.Initialize;
begin
  TreeList.BeginUpdate;
  try
    cbColumn.ItemIndex := 0;
    cbPlace.ItemIndex := 1;
    chkVisible.Checked := True;
  finally
    TreeList.EndUpdate;
  end;

end;

initialization
  TfrmPreview.Register;

end.
