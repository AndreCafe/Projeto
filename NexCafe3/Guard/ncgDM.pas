unit ncgDM;

interface

uses
  SysUtils, Classes, LMDCustomComponent, LMDOneInstance, Forms;

type
  TdmOneInstance = class(TDataModule)
    LMDOneInstance1: TLMDOneInstance;
    procedure LMDOneInstance1Custom(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmOneInstance: TdmOneInstance;
  MaisDeUm : Boolean = False;

implementation

{$R *.dfm}

procedure TdmOneInstance.LMDOneInstance1Custom(Sender: TObject);
begin
  MaisDeUm := True;
  Application.Terminate;
end;

end.
