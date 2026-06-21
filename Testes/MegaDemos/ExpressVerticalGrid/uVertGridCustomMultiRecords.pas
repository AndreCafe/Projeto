unit uVertGridCustomMultiRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxVertGridFrame, cxStyles, cxGraphics, cxEdit, cxSpinEdit,
  cxBlobEdit, cxHyperLinkEdit, cxCurrencyEdit, cxImage, cxVGrid, cxDBVGrid,
  cxControls, cxInplaceContainer, StdCtrls, ExtCtrls, cxDropDownEdit,
  ImgList, cxImageComboBox;

type
  TfrmCustomVertGridMultiRecords = class(TVerticalGridFrame)
    cxDBVerticalGrid: TcxDBVerticalGrid;
    cxDBVerticalGridID: TcxDBMultiEditorRow;
    fldTrademark: TcxDBEditorRow;
    fldModel: TcxDBEditorRow;
    fldCategory: TcxDBEditorRow;
    rowPerformance_Attributes: TcxCategoryRow;
    fldHP: TcxDBEditorRow;
    fldLiter: TcxDBEditorRow;
    fldCyl: TcxDBEditorRow;
    fldTransmissSpeedCount: TcxDBEditorRow;
    fldTransmissAutomatic: TcxDBEditorRow;
    cxDBVerticalGrid1DBMultiEditorRow1: TcxDBMultiEditorRow;
    rowNotes: TcxCategoryRow;
    fldDescription: TcxDBEditorRow;
    fldHyperlink: TcxDBEditorRow;
    rowOthers: TcxCategoryRow;
    fldPrice: TcxDBEditorRow;
    fldIcon: TcxDBEditorRow;
    ImageList: TImageList;
    fldPicture: TcxDBEditorRow;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  maindata;

{$R *.dfm}


end.
