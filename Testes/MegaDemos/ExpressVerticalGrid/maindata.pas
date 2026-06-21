unit maindata;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ImgList, cxDBEditRepository, ADODB, cxEditRepositoryItems, cxEdit,
  DBClient;

type
  TdmMain = class(TDataModule)
    NavBarSmallImages: TImageList;
    BarManagerImages: TImageList;
    acIssueList: TADOConnection;
    atUsers: TADOTable;
    atUsersID: TAutoIncField;
    atUsersFNAME: TWideStringField;
    atUsersMNAME: TWideStringField;
    atUsersLNAME: TWideStringField;
    atUsersEMAIL: TWideStringField;
    atUsersPHONE: TWideStringField;
    atUsersDEPARTMENTID: TIntegerField;
    atUsersDepartmentName: TStringField;
    atUsersFullName: TStringField;
    dsUsers: TDataSource;
    atDepartments: TADOTable;
    atDepartmentsID: TAutoIncField;
    atDepartmentsNAME: TWideStringField;
    dsDepartment: TDataSource;
    atItems: TADOTable;
    atItemsID: TAutoIncField;
    atItemsNAME: TWideStringField;
    atItemsTYPE: TBooleanField;
    atItemsPROJECTID: TIntegerField;
    atItemsPRIORITY: TWordField;
    atItemsSTATUS: TWordField;
    atItemsCREATORID: TIntegerField;
    atItemsCREATEDDATE: TDateTimeField;
    atItemsOWNERID: TIntegerField;
    atItemsLASTMODIFIEDDATE: TDateTimeField;
    atItemsFIXEDDATE: TDateTimeField;
    atItemsDESCRIPTION: TMemoField;
    atItemsRESOLUTION: TMemoField;
    dsItems: TDataSource;
    atProjects: TADOTable;
    atProjectsID: TAutoIncField;
    atProjectsNAME: TWideStringField;
    atProjectsMANAGERID: TIntegerField;
    dsProjects: TDataSource;
    atProjectTeam: TADOTable;
    atProjectTeamID: TAutoIncField;
    atProjectTeamPROJECTID: TIntegerField;
    atProjectTeamUSERID: TIntegerField;
    atProjectTeamFUNCTION: TWideStringField;
    dsProjectTeam: TDataSource;
    imMain: TImageList;
    edrepMain: TcxEditRepository;
    edrepUserLookup: TcxEditRepositoryLookupComboBoxItem;
    edrepPhoneItem: TcxEditRepositoryMaskItem;
    edrepProjectLookup: TcxEditRepositoryLookupComboBoxItem;
    edrepTypeImageCombo: TcxEditRepositoryImageComboBoxItem;
    edrepPriorityImageCombo: TcxEditRepositoryImageComboBoxItem;
    edrepStatusImageCombo: TcxEditRepositoryImageComboBoxItem;
    acDXCustomers: TADOConnection;
    atDXCustomers: TADOTable;
    atDXProducts: TADOTable;
    atDXProductsID: TAutoIncField;
    atDXProductsName: TWideStringField;
    atDXCustomersID: TAutoIncField;
    atDXCustomersFIRSTNAME: TWideStringField;
    atDXCustomersLASTNAME: TWideStringField;
    atDXCustomersCOMPANYNAME: TWideStringField;
    atDXCustomersPAYMENTTYPE: TIntegerField;
    atDXCustomersPRODUCTID: TIntegerField;
    atDXCustomersCUSTOMER: TBooleanField;
    atDXCustomersPURCHASEDATE: TDateTimeField;
    atDXCustomersPAYMENTAMOUNT: TBCDField;
    atDXCustomersCOPIES: TIntegerField;
    dsDXCustomers: TDataSource;
    dsDXProducts: TDataSource;
    edrepDXProductLookup: TcxEditRepositoryLookupComboBoxItem;
    edrepDXPaymentTypeImageCombo: TcxEditRepositoryImageComboBoxItem;
    edrepMovieCountryLookupCombo: TcxEditRepositoryLookupComboBoxItem;
    edrepGenderImageCombo: TcxEditRepositoryImageComboBoxItem;
    edrepMoviePersonsLineLookupCombo: TcxEditRepositoryLookupComboBoxItem;
    edrepDepartmentLookup: TcxEditRepositoryLookupComboBoxItem;
    NavBarLargeImages: TImageList;
    atTasks: TADOTable;
    dsTasks: TDataSource;
    atTasksID: TAutoIncField;
    atTasksNAME: TWideStringField;
    atTasksPARENTID: TIntegerField;
    atTasksUSERID: TIntegerField;
    atTasksSTARTDATE: TDateTimeField;
    atTasksENDDATE: TDateTimeField;
    atTasksDONE: TBooleanField;
    atTasksPRIORITY: TIntegerField;
    atTasksCOMPLETE: TIntegerField;
    atTasksTOTALCOST: TCurrencyField;
    atTasksTOTALREVENUES: TCurrencyField;
    atTasksEMAIL: TStringField;
    atCars: TADOTable;
    acCars: TADOConnection;
    dsCars: TDataSource;
    atCarsID: TAutoIncField;
    atCarsTrademark: TWideStringField;
    atCarsModel: TWideStringField;
    atCarsHP: TSmallintField;
    atCarsLiter: TFloatField;
    atCarsCyl: TWordField;
    atCarsTransmissSpeedCount: TWordField;
    atCarsTransmissAutomatic: TWideStringField;
    atCarsMPG_City: TWordField;
    atCarsMPG_Highway: TWordField;
    atCarsCategory: TWideStringField;
    atCarsDescription: TMemoField;
    atCarsHyperlink: TWideStringField;
    atCarsPicture: TBlobField;
    atCarsPrice: TBCDField;
    queCarsOrders: TADOQuery;
    queCarsOrdersPurchaseDate: TDateTimeField;
    queCarsOrdersTime: TDateTimeField;
    queCarsOrdersPaymentType: TWideStringField;
    queCarsOrdersPaymentAmount: TBCDField;
    queCarsOrdersQuantity: TIntegerField;
    queCarsOrdersFirstName: TWideStringField;
    queCarsOrdersLastName: TWideStringField;
    queCarsOrdersCompany: TWideStringField;
    queCarsOrdersPrefix: TWideStringField;
    queCarsOrdersTitle: TWideStringField;
    queCarsOrdersAddress: TWideStringField;
    queCarsOrdersCity: TWideStringField;
    queCarsOrdersState: TWideStringField;
    queCarsOrdersZipCode: TWideStringField;
    queCarsOrdersSource: TWideStringField;
    queCarsOrdersCustomer: TWideStringField;
    queCarsOrdersHomePhone: TWideStringField;
    queCarsOrdersFaxPhone: TWideStringField;
    queCarsOrdersSpouse: TWideStringField;
    queCarsOrdersOccupation: TWideStringField;
    queCarsOrdersEmail: TWideStringField;
    queCarsOrdersTrademark: TWideStringField;
    queCarsOrdersModel: TWideStringField;
    queCarsOrdersHP: TSmallintField;
    queCarsOrdersLiter: TFloatField;
    queCarsOrdersCyl: TWordField;
    queCarsOrdersTransmissSpeedCount: TWordField;
    queCarsOrdersTransmissAutomatic: TWideStringField;
    queCarsOrdersMPG_City: TWordField;
    queCarsOrdersMPG_Highway: TWordField;
    queCarsOrdersCategory: TWideStringField;
    queCarsOrdersCars_Description: TMemoField;
    queCarsOrdersHyperlink: TWideStringField;
    queCarsOrdersPicture: TBlobField;
    queCarsOrdersPrice: TBCDField;
    dsCarsOrders: TDataSource;
    atTasksDONEINDEX: TIntegerField;
    atCarsSmallPicture: TBlobField;
    tblCustomers: TADOTable;
    tblProducts: TADOTable;
    tblOrders: TADOTable;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersPaymentAmount: TCurrencyField;
    tblOrdersDescription: TMemoField;
    tblOrdersQuantity: TIntegerField;
    tblOrdersProductName: TStringField;
    tblOrdersCustomer: TStringField;
    dsOrders: TDataSource;
    dsCustomers: TDataSource;
    acOrders: TADOConnection;
    dsMovieStars: TDataSource;
    dsMovieContries: TDataSource;
    dsPersonsLine: TDataSource;
    dsMovies: TDataSource;
    cdsMovieStars: TClientDataSet;
    cdsMovieStarsID: TAutoIncField;
    cdsMovieStarsFIRSTNAME: TWideStringField;
    cdsMovieStarsSECONDNAME: TWideStringField;
    cdsMovieStarsBIRTHNAME: TWideStringField;
    cdsMovieStarsDATEOFBIRTH: TDateTimeField;
    cdsMovieStarsBIRTHCOUNTRY: TIntegerField;
    cdsMovieStarsLOCATIONOFBIRTH: TWideStringField;
    cdsMovieStarsBIOGRAPHY: TMemoField;
    cdsMovieStarsNICKNAME: TWideStringField;
    cdsMovieStarsGENDER: TBooleanField;
    cdsMovieStarsHOMEPAGE: TWideStringField;
    cdsMovieStarsatMovieStarsPhotos: TDataSetField;
    cdsMovieCountries: TClientDataSet;
    cdsMovieCountriesID: TAutoIncField;
    cdsMovieCountriesName: TWideStringField;
    cdsMovieCountriesAcronym: TWideStringField;
    cdsMoviePersonsLine: TClientDataSet;
    cdsMoviePersonsLineID: TAutoIncField;
    cdsMoviePersonsLineName: TWideStringField;
    cdsMovies: TClientDataSet;
    cdsMoviesID: TAutoIncField;
    cdsMoviesCAPTION: TStringField;
    cdsMoviesYEAR: TIntegerField;
    cdsMoviesTAGLINE: TStringField;
    cdsMoviesPLOTOUTLINE: TStringField;
    cdsMoviesRUNTIME: TIntegerField;
    cdsMoviesCOLOR: TStringField;
    cdsMoviesPHOTO: TBlobField;
    cdsMoviesICON: TBlobField;
    cdsMoviesWEBSITE: TStringField;
    cdsMovieStarsPhotos: TClientDataSet;
    cdsMovieStarsPhotosID: TAutoIncField;
    cdsMovieStarsPhotosPersonID: TIntegerField;
    cdsMovieStarsPhotosPhoto: TBlobField;
    cdsMovieStarsPhotosIcon: TBlobField;
    dsMovieStarsPhotos: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure atUsersCalcFields(DataSet: TDataSet);
    procedure atTasksCalcFields(DataSet: TDataSet);
  private
    procedure LoadData(ADataSet: TClientDataSet);
  public
    function GetProductName(AID: Integer): string;
  end;

var
  dmMain: TdmMain;

implementation

uses
  SysConst, Registry;

{$R *.DFM}

const
  sInvalidData = 'Invalid data in %s dataset.';

function TdmMain.GetProductName(AID: Integer): string;
begin
  if tblProducts.Locate('ID', AID, []) then
    Result := tblProducts.FieldValues['Name']
  else
    Result := '';
end;

procedure TdmMain.LoadData(ADataSet: TClientDataSet);
var
  I: Integer;
  AFileName: string;
begin
  if (ADataSet = nil) or ADataSet.Active then Exit;
  AFileName := ADataSet.Name;
  if Pos('cds', AFileName) = 1 then
   Delete(AFileName, 1, 3);
  AFileName := ExtractFilePath(Application.EXEName) + 'Data\' + AFileName + '.cds';
  if not FileExists(AFileName) then
    raise EFileStreamError.Create(@SFileNotFound, AFileName)
  else
  begin
    if ADataSet.MasterSource <> nil then
    LoadData(TClientDataSet(ADataSet.MasterSource.DataSet));
    for I := 0 to ADataSet.FieldCount - 1 do
      LoadData(ADataSet.Fields[I].LookupDataSet as TClientDataSet);
    ADataSet.LoadFromFile(AFileName);
    ADataSet.Active := True;
    if not ADataSet.Active then
      raise EDatabaseError.CreateFmt(sInvalidData, [ADataSet.Name]);
  end;
end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount -1 do
    if Components[I] is TADOConnection then
      with TADOConnection(Components[I]) do
      begin
        ConnectionString := Format(ConnectionString,
          [ExtractFilePath(Application.EXEName) + 'Data\']);
        Connected := True;
      end;

  for I := 0 to ComponentCount -1 do
    if Components[I] is TCustomADODataSet then
      TCustomADODataSet(Components[I]).Open;

  for I := ComponentCount -1 downto 0 do
    if Components[I] is TClientDataSet then
      LoadData(TClientDataSet(Components[I]));
end;

procedure TdmMain.atUsersCalcFields(DataSet: TDataSet);
begin
  atUsersFullName.AsString := Format('%s %s %s', [atUsersFName.AsString,
    atUsersMName.AsString, atUsersLName.AsString]);
end;

procedure TdmMain.atTasksCalcFields(DataSet: TDataSet);
begin
  if DataSet.FindField('DONE').AsBoolean then
    DataSet.FindField('DONEINDEX').AsInteger := 1
  else DataSet.FindField('DONEINDEX').AsInteger := 0;
end;

end.
