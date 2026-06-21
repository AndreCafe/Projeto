unit CalcIntf;

interface

uses
  nxllTypes,
  nxivTypes;

const
  CLSID_Calc : TnxGuid = '{AA97D66D-F493-4267-95B7-48D166E8B43D}';

type
  InxCalc = interface(InxInvokable)
    ['{5642D468-0B63-4ECF-B932-D33C41932528}']

    procedure Clear;

    procedure Add(const aValue: Extended);
    procedure Subtract(const aValue: Extended);
    procedure Multiply(const aValue: Extended);
    procedure Divide(const aValue: Extended);

    function GetResult: Extended;

    property Result: Extended
      read GetResult;
  end;

  InxCalcCallback = interface(InxInvokable)
    ['{07E8D1C8-2E39-40D0-8DAC-6669CC18C669}']

    procedure ResultChanged(const aResult: Extended);
  end;

  InxCalc2 = interface(InxCalc)
    ['{2D5DE830-4213-43C7-86D8-8EC3344CCCB9}']

    function GetCallback: InxCalcCallback;
    procedure SetCallback(const aCallback: InxCalcCallback);

    property Callback: InxCalcCallback
      read GetCallback
      write SetCallback;
  end;

implementation

initialization
  nxInvokeRegistry.RegisterInterface(TypeInfo(InxCalc));
  nxInvokeRegistry.RegisterInterface(TypeInfo(InxCalcCallback));
  nxInvokeRegistry.RegisterInterface(TypeInfo(InxCalc2));
end.
