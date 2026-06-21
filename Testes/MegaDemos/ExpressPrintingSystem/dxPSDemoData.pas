unit dxPSDemoData;

interface

uses
  SysUtils, Classes, DB, cxEditRepositoryItems, cxEdit, dxmdaset;

type
  TdmPrinting = class(TDataModule)
    EditRepository: TcxEditRepository;
    EditRepositoryImage: TcxEditRepositoryImageItem;
    EditRepositoryMemo: TcxEditRepositoryMemoItem;
    EditRepositoryHyperLink: TcxEditRepositoryHyperLinkItem;
    EditRepositoryPrice: TcxEditRepositoryCurrencyItem;
    EditRepositoryAutomatic: TcxEditRepositoryCheckBoxItem;
    dsCars: TDataSource;
    dxMemData1: TdxMemData;
    dxMemData1PurchaseDate: TDateTimeField;
    dxMemData1Orders_Time: TDateTimeField;
    dxMemData1PaymentType: TStringField;
    dxMemData1PaymentAmount: TFloatField;
    dxMemData1Quantity: TIntegerField;
    dxMemData1FirstName: TStringField;
    dxMemData1LastName: TStringField;
    dxMemData1Company: TStringField;
    dxMemData1Prefix: TStringField;
    dxMemData1Title: TStringField;
    dxMemData1Address: TStringField;
    dxMemData1City: TStringField;
    dxMemData1State: TStringField;
    dxMemData1ZipCode: TStringField;
    dxMemData1Source: TStringField;
    dxMemData1Customer: TStringField;
    dxMemData1HomePhone: TStringField;
    dxMemData1FaxPhone: TStringField;
    dxMemData1Spouse: TStringField;
    dxMemData1Occupation: TStringField;
    dxMemData1Email: TStringField;
    dxMemData1Trademark: TStringField;
    dxMemData1Model: TStringField;
    dxMemData1HP: TSmallintField;
    dxMemData1Liter: TFloatField;
    dxMemData1Cyl: TSmallintField;
    dxMemData1TransmissSpeedCount: TSmallintField;
    dxMemData1TransmissAutomatic: TStringField;
    dxMemData1MPG_City: TSmallintField;
    dxMemData1MPG_Highway: TSmallintField;
    dxMemData1Category: TStringField;
    dxMemData1Cars_Description: TMemoField;
    dxMemData1Hyperlink: TStringField;
    dxMemData1Picture: TBlobField;
    dxMemData1Price: TFloatField;
    dxMemData1Customers_ID: TIntegerField;
    dxMemData1Orders_ID: TIntegerField;
    dxMemData1Cars_ID: TIntegerField;
    dsOrders: TDataSource;
    mdsCars: TdxMemData;
    dxMemData1ID: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    SmallintField1: TSmallintField;
    FloatField1: TFloatField;
    SmallintField2: TSmallintField;
    SmallintField3: TSmallintField;
    StringField3: TStringField;
    SmallintField4: TSmallintField;
    SmallintField5: TSmallintField;
    StringField4: TStringField;
    dxMemData1Description: TMemoField;
    StringField5: TStringField;
    BlobField1: TBlobField;
    FloatField2: TFloatField;
    dxMemData1FuelEconomy: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrinting: TdmPrinting;

implementation

{$R *.dfm}

end.
