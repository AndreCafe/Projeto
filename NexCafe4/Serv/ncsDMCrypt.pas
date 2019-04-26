unit ncsDMCrypt;

interface

uses
  SysUtils, Classes, LMDCustomComponent, LMDBaseController, LMDCustomContainer,
  LMDGenericList;

type
  TdmCrypt = class(TDataModule)
    glCrypt: TLMDGenericList;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Extract;
  end;

var
  dmCrypt: TdmCrypt;

procedure ExtractEmailDlls;

implementation

{$R *.dfm}

procedure ExtractEmailDlls;
var DM: TdmCrypt;
begin
  try
    Dm := TdmCrypt.Create(nil);
    try
       Dm.Extract;
    finally
      DM.Free;
    end;
  except
  end;
end;

{ TdmCrypt }

procedure TdmCrypt.Extract;
var S: String;
begin
  S := ExtractFilePath(ParamStr(0));
  glCrypt.Items[0].SaveToFile(S+'ssleay32.dll');
  glCrypt.Items[1].SaveToFile(S+'libeay32.dll');
end;

end.
