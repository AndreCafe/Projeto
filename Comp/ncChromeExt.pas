unit ncChromeExt;

interface

uses
  SysUtils, Classes, LMDCustomComponent, LMDBaseController, LMDCustomContainer,
  LMDGenericList;

type
  TdmChromeExt = class(TDataModule)
    GL: TLMDGenericList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure ExtractChromeExt;

var
  dmChromeExt: TdmChromeExt;

implementation

{$R *.dfm}

procedure ExtractChromeExt;
var dm: TdmChromeExt;
begin
  dm := TdmChromeExt.Create(nil);
  try
    dm.gl.Items[0].SaveToFile(ExtractFilePath(ParamStr(0))+'chrome_ext.crx');
  finally
    dm.Free;
  end;
end;


end.
