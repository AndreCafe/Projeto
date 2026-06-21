unit maindata;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ImgList, cxDBEditRepository, cxEditRepositoryItems, cxEdit,
  DBClient;

type
  TdmMain = class(TDataModule)
    NavBarSmallImages: TImageList;
    BarManagerImages: TImageList;
    dsUsers: TDataSource;
    dsDepartment: TDataSource;
    dsItems: TDataSource;
    dsProjects: TDataSource;
    dsProjectTeam: TDataSource;
    imMain: TImageList;
    edrepMain: TcxEditRepository;
    edrepUserLookup: TcxEditRepositoryLookupComboBoxItem;
    edrepPhoneItem: TcxEditRepositoryMaskItem;
    edrepProjectLookup: TcxEditRepositoryLookupComboBoxItem;
    edrepTypeImageCombo: TcxEditRepositoryImageComboBoxItem;
    edrepPriorityImageCombo: TcxEditRepositoryImageComboBoxItem;
    edrepStatusImageCombo: TcxEditRepositoryImageComboBoxItem;
    dsDXCustomers: TDataSource;
    dsDXProducts: TDataSource;
    edrepDXProductLookup: TcxEditRepositoryLookupComboBoxItem;
    edrepDXPaymentTypeImageCombo: TcxEditRepositoryImageComboBoxItem;
    dsMovieStars: TDataSource;
    dsMovieContries: TDataSource;
    dsMovieStarsPhotos: TDataSource;
    edrepMovieCountryLookupCombo: TcxEditRepositoryLookupComboBoxItem;
    dsPersonsLine: TDataSource;
    edrepGenderImageCombo: TcxEditRepositoryImageComboBoxItem;
    edrepMoviePersonsLineLookupCombo: TcxEditRepositoryLookupComboBoxItem;
    dsMovies: TDataSource;
    edrepDepartmentLookup: TcxEditRepositoryLookupComboBoxItem;
    NavBarLargeImages: TImageList;
    dsTasks: TDataSource;
    dsCars: TDataSource;
    dsCarsOrders: TDataSource;
    dsOrders: TDataSource;
    dsCustomers: TDataSource;
    cdsUsers: TClientDataSet;
    cdsUsersID: TAutoIncField;
    cdsUsersFNAME: TWideStringField;
    cdsUsersMNAME: TWideStringField;
    cdsUsersLNAME: TWideStringField;
    cdsUsersEMAIL: TWideStringField;
    cdsUsersPHONE: TWideStringField;
    cdsUsersDepartmentName: TStringField;
    cdsUsersDEPARTMENTID: TIntegerField;
    cdsUsersFullName: TStringField;
    cdsDepartaments: TClientDataSet;
    cdsDepartamentsID: TAutoIncField;
    cdsDepartamentsNAME: TWideStringField;
    cdsItems: TClientDataSet;
    cdsItemsID: TAutoIncField;
    cdsItemsNAME: TWideStringField;
    cdsItemsTYPE: TBooleanField;
    cdsItemsPROJECTID: TIntegerField;
    cdsItemsPRIORITY: TSmallintField;
    cdsItemsSTATUS: TSmallintField;
    cdsItemsCREATORID: TIntegerField;
    cdsItemsCREATEDDATE: TDateTimeField;
    cdsItemsOWNERID: TIntegerField;
    cdsItemsLASTMODIFIEDDATE: TDateTimeField;
    cdsItemsFIXEDDATE: TDateTimeField;
    cdsItemsDESCRIPTION: TMemoField;
    cdsItemsRESOLUTION: TMemoField;
    cdsProjects: TClientDataSet;
    cdsProjectTeam: TClientDataSet;
    cdsProjectsID: TAutoIncField;
    cdsProjectsNAME: TWideStringField;
    cdsProjectsMANAGERID: TIntegerField;
    cdsProjectTeamID: TAutoIncField;
    cdsProjectTeamPROJECTID: TIntegerField;
    cdsProjectTeamUSERID: TIntegerField;
    cdsProjectTeamFUNCTION: TWideStringField;
    cdsTasks: TClientDataSet;
    cdsTasksID: TAutoIncField;
    cdsTasksNAME: TWideStringField;
    cdsTasksPARENTID: TIntegerField;
    cdsTasksUSERID: TIntegerField;
    cdsTasksSTARTDATE: TDateTimeField;
    cdsTasksENDDATE: TDateTimeField;
    cdsTasksDONE: TBooleanField;
    cdsTasksPRIORITY: TIntegerField;
    cdsTasksCOMPLETE: TIntegerField;
    cdsTasksTOTALCOST: TCurrencyField;
    cdsTasksTOTALREVENUES: TCurrencyField;
    cdsTasksEMAIL: TStringField;
    cdsTasksDONEINDEX: TIntegerField;
    cdsCustomers: TClientDataSet;
    cdsProducts: TClientDataSet;
    cdsOrders: TClientDataSet;
    cdsCustomersID: TIntegerField;
    cdsCustomersFirstName: TWideStringField;
    cdsCustomersLastName: TWideStringField;
    cdsCustomersCompany: TWideStringField;
    cdsCustomersPrefix: TWideStringField;
    cdsCustomersTitle: TWideStringField;
    cdsCustomersAddress: TWideStringField;
    cdsCustomersCity: TWideStringField;
    cdsCustomersState: TWideStringField;
    cdsCustomersZipCode: TWideStringField;
    cdsCustomersSource: TWideStringField;
    cdsCustomersCustomer: TWideStringField;
    cdsCustomersHomePhone: TWideStringField;
    cdsCustomersFaxPhone: TWideStringField;
    cdsCustomersSpouse: TWideStringField;
    cdsCustomersOccupation: TWideStringField;
    cdsCustomersDescription: TMemoField;
    cdsCustomersEmail: TWideStringField;
    cdsProductsID: TIntegerField;
    cdsProductsName: TWideStringField;
    cdsProductsDescription: TMemoField;
    cdsProductsPlatform: TWideStringField;
    cdsProductsLogo: TBlobField;
    cdsProductsLink: TMemoField;
    cdsOrdersID: TAutoIncField;
    cdsOrdersCustomerID: TIntegerField;
    cdsOrdersProductID: TIntegerField;
    cdsOrdersPurchaseDate: TDateTimeField;
    cdsOrdersPaymentType: TStringField;
    cdsOrdersPaymentAmount: TCurrencyField;
    cdsOrdersDescription: TMemoField;
    cdsOrdersQuantity: TIntegerField;
    cdsOrdersProductName: TStringField;
    cdsOrdersCustomer: TStringField;
    cdsCars: TClientDataSet;
    cdsCarsOrder: TClientDataSet;
    cdsCarsOrderPurchaseDate: TDateTimeField;
    cdsCarsOrderTime: TDateTimeField;
    cdsCarsOrderPaymentType: TWideStringField;
    cdsCarsOrderPaymentAmount: TBCDField;
    cdsCarsOrderQuantity: TIntegerField;
    cdsCarsOrderFirstName: TWideStringField;
    cdsCarsOrderLastName: TWideStringField;
    cdsCarsOrderCompany: TWideStringField;
    cdsCarsOrderPrefix: TWideStringField;
    cdsCarsOrderTitle: TWideStringField;
    cdsCarsOrderAddress: TWideStringField;
    cdsCarsOrderCity: TWideStringField;
    cdsCarsOrderState: TWideStringField;
    cdsCarsOrderZipCode: TWideStringField;
    cdsCarsOrderSource: TWideStringField;
    cdsCarsOrderCustomer: TWideStringField;
    cdsCarsOrderHomePhone: TWideStringField;
    cdsCarsOrderFaxPhone: TWideStringField;
    cdsCarsOrderSpouse: TWideStringField;
    cdsCarsOrderOccupation: TWideStringField;
    cdsCarsOrderEmail: TWideStringField;
    cdsCarsOrderTrademark: TWideStringField;
    cdsCarsOrderModel: TWideStringField;
    cdsCarsOrderHP: TSmallintField;
    cdsCarsOrderLiter: TFloatField;
    cdsCarsOrderCyl: TSmallintField;
    cdsCarsOrderTransmissSpeedCount: TSmallintField;
    cdsCarsOrderTransmissAutomatic: TWideStringField;
    cdsCarsOrderMPG_City: TSmallintField;
    cdsCarsOrderMPG_Highway: TSmallintField;
    cdsCarsOrderCategory: TWideStringField;
    cdsCarsOrderCars_Description: TMemoField;
    cdsCarsOrderHyperlink: TWideStringField;
    cdsCarsOrderPicture: TBlobField;
    cdsCarsOrderPrice: TBCDField;
    cdsCarsID: TAutoIncField;
    cdsCarsTrademark: TWideStringField;
    cdsCarsModel: TWideStringField;
    cdsCarsHP: TSmallintField;
    cdsCarsLiter: TFloatField;
    cdsCarsCyl: TSmallintField;
    cdsCarsTransmissSpeedCount: TSmallintField;
    cdsCarsTransmissAutomatic: TWideStringField;
    cdsCarsMPG_City: TSmallintField;
    cdsCarsMPG_Highway: TSmallintField;
    cdsCarsCategory: TWideStringField;
    cdsCarsDescription: TMemoField;
    cdsCarsHyperlink: TWideStringField;
    cdsCarsSmallPicture: TBlobField;
    cdsCarsPicture: TBlobField;
    cdsCarsPrice: TBCDField;
    cdsDXCustomers: TClientDataSet;
    cdsDXProducts: TClientDataSet;
    cdsDXCustomersID: TAutoIncField;
    cdsDXCustomersFIRSTNAME: TWideStringField;
    cdsDXCustomersLASTNAME: TWideStringField;
    cdsDXCustomersCOMPANYNAME: TWideStringField;
    cdsDXCustomersPAYMENTTYPE: TIntegerField;
    cdsDXCustomersPRODUCTID: TIntegerField;
    cdsDXCustomersCUSTOMER: TBooleanField;
    cdsDXCustomersPURCHASEDATE: TDateTimeField;
    cdsDXCustomersPAYMENTAMOUNT: TBCDField;
    cdsDXCustomersCOPIES: TIntegerField;
    cdsDXProductsID: TAutoIncField;
    cdsDXProductsName: TWideStringField;
    cdsMovieStars: TClientDataSet;
    cdsMovieCountries: TClientDataSet;
    cdsMovieStarsPhotos: TClientDataSet;
    cdsMoviePersonsLine: TClientDataSet;
    cdsMovies: TClientDataSet;
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
    cdsMovieCountriesID: TAutoIncField;
    cdsMovieCountriesName: TWideStringField;
    cdsMovieCountriesAcronym: TWideStringField;
    cdsMovieStarsPhotosID: TAutoIncField;
    cdsMovieStarsPhotosPersonID: TIntegerField;
    cdsMovieStarsPhotosPhoto: TBlobField;
    cdsMovieStarsPhotosIcon: TBlobField;
    cdsMoviePersonsLineID: TAutoIncField;
    cdsMoviePersonsLineName: TWideStringField;
    cdsSales: TClientDataSet;
    cdsSalesName: TWideStringField;
    cdsSalesAmount: TFloatField;
    cdsSalesByQuarter: TClientDataSet;
    cdsSalesByQuarterName: TWideStringField;
    cdsSalesByQuarterAmount: TFloatField;
    cdsSalesProducts: TClientDataSet;
    cdsSalesProductsCustomerID: TIntegerField;
    cdsSalesProductsName: TWideStringField;
    cdsSalesProductsQuantity: TFloatField;
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
    procedure DataModuleCreate(Sender: TObject);
    procedure UsersCalcFields(DataSet: TDataSet);
    procedure TasksCalcFields(DataSet: TDataSet);
  private
    procedure LoadData(ADataSet: TClientDataSet);
  public
    function GetProductName(AID: Integer): string;
  end;

var
  dmMain: TdmMain;

implementation

{$R *.DFM}

uses
  SysConst;

const
  sInvalidData = 'Invalid data in %s dataset.';

function TdmMain.GetProductName(AID: Integer): string;
begin
  if cdsProducts.Locate('ID', AID, []) then
    Result := cdsProducts.FieldValues['Name']
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
  AFileName := ExtractFilePath(Application.EXEName) + 'Data_cds\' + AFileName + '.cds';
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
  for I := ComponentCount -1 downto 0 do
    if Components[I] is TClientDataSet then
      LoadData(TClientDataSet(Components[I]));
end;

procedure TdmMain.UsersCalcFields(DataSet: TDataSet);
begin
  cdsUsersFullName.AsString := Format('%s %s %s', [cdsUsersFName.AsString,
    cdsUsersMName.AsString, cdsUsersLName.AsString]);
end;

procedure TdmMain.TasksCalcFields(DataSet: TDataSet);
begin
  if DataSet.FindField('DONE').AsBoolean then
    DataSet.FindField('DONEINDEX').AsInteger := 1
  else DataSet.FindField('DONEINDEX').AsInteger := 0;
end;

end.
