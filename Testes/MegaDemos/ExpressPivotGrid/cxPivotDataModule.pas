unit cxPivotDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, ImgList, Controls, cxStyles, cxClasses;

type
  TdmPivot = class(TDataModule)
    dsProductReports: TDataSource;
    dsCustomerReports: TDataSource;
    dsOrderReports: TDataSource;
    dqCustomerReports: TADOQuery;
    dqProductReports: TADOQuery;
    dqOrderReports: TADOQuery;
    dsSalesPerson: TDataSource;
    dqSalesPerson: TADOQuery;
    imgCategories: TImageList;
    imgHeaders: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    stSelectedField: TcxStyle;
    stField: TcxStyle;
    stBlueFont: TcxStyle;
    stRedFont: TcxStyle;
    stBoldFont: TcxStyle;
    stGreenFont: TcxStyle;
    stBKImage: TcxStyle;
    stDefaultFontStyle: TcxStyle;
    dsSalesReports: TDataSource;
    dpSalesReports: TADOQuery;
    dqSalesPersonOrderID: TAutoIncField;
    dqSalesPersonCountry: TWideStringField;
    dqSalesPersonFirstName: TWideStringField;
    dqSalesPersonLastName: TWideStringField;
    dqSalesPersonProductName: TWideStringField;
    dqSalesPersonCategoryName: TWideStringField;
    dqSalesPersonOrderDate: TDateTimeField;
    dqSalesPersonUnitPrice: TBCDField;
    dqSalesPersonQuantity: TSmallintField;
    dqSalesPersonDiscount: TFloatField;
    dqSalesPersonExtendedPrice: TBCDField;
    dqSalesPersonSalesPerson: TWideStringField;
    dpSalesReportsOrderID: TAutoIncField;
    dpSalesReportsCountry: TWideStringField;
    dpSalesReportsFirstName: TWideStringField;
    dpSalesReportsLastName: TWideStringField;
    dpSalesReportsProductName: TWideStringField;
    dpSalesReportsCategoryName: TWideStringField;
    dpSalesReportsOrderDate: TDateTimeField;
    dpSalesReportsUnitPrice: TBCDField;
    dpSalesReportsQuantity: TSmallintField;
    dpSalesReportsDiscount: TFloatField;
    dpSalesReportsExtendedPrice: TBCDField;
    dpSalesReportsSalesPerson: TWideStringField;
    dqOrderReportsOrderID: TIntegerField;
    dqOrderReportsProductID: TIntegerField;
    dqOrderReportsProductName: TWideStringField;
    dqOrderReportsUnitPrice: TBCDField;
    dqOrderReportsQuantity: TSmallintField;
    dqOrderReportsDiscount: TFloatField;
    dqOrderReportsExtendedPrice: TBCDField;
    dqCustomerReportsProductName: TWideStringField;
    dqCustomerReportsCompanyName: TWideStringField;
    dqCustomerReportsOrderDate: TDateTimeField;
    dqCustomerReportsProductAmount: TBCDField;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  dmPivot: TdmPivot;
  
implementation

{$R *.dfm}

uses
  Windows, Registry, dxCore;

constructor TdmPivot.Create(AOwner: TComponent);
var
  I: Integer;
begin
  inherited Create(AOwner);
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDataSet then
      (Components[I] as TDataSet).Active := False;
  end;
end;

end.
