unit cxTreeListDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmTreeList = class(TDataModule)
    acBiolife: TADOConnection;
    atBiolife: TADOTable;
    dsBiolife: TDataSource;
    acIssuesList: TADOConnection;
    dsTasksAndUsers: TDataSource;
    aqTasksAndUsers: TADOQuery;
    acCars: TADOConnection;
    atCars: TADOTable;
    dsCars: TDataSource;
    atBiolifeID: TIntegerField;
    atBiolifeSpeciesName: TWideStringField;
    atCarsPicture: TBlobField;
    atCarsID: TAutoIncField;
    atCarsParentID: TIntegerField;
    atCarsModel: TWideStringField;
    atCarsHP: TSmallintField;
    atCarsLiter: TFloatField;
    atCarsCyl: TWordField;
    atCarsTransmissSpeedCount: TWordField;
    atCarsTransmissAutomatic: TBooleanField;
    atCarsMPG_City: TWordField;
    atCarsMPG_Highway: TWordField;
    atCarsHyperlink: TWideStringField;
    atCarsPrice: TBCDField;
    atCarsSmallPicture: TBlobField;
    atBiolifeParentID: TIntegerField;
    atBiolifeSpeciesNo: TIntegerField;
    atBiolifeLengthcm: TFloatField;
    atBiolifeCategory: TWideStringField;
    atBiolifeCommonName: TWideStringField;
    atBiolifeNotes: TWideStringField;
    atBiolifeMark: TBooleanField;
    atBiolifeRecordDate: TDateTimeField;
    atCarsDescription: TMemoField;
  private
    { Private declarations }
  public
    procedure SetParentValue(AValue: Variant);
  end;

var
  dmTreeList: TdmTreeList;

implementation

{$R *.dfm}

procedure TdmTreeList.SetParentValue(AValue: Variant);
begin
  if atCars.State in [dsEdit, dsInsert] then
    atCars.FindField('ParentID').Value := AValue;
end;

end.
