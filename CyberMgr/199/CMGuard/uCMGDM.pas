unit uCMGDM;

interface

uses
  SysUtils, Classes, LMDCustomComponent, LMDOneInstance;

type
  TDataModule1 = class(TDataModule)
    LMDOneInstance1: TLMDOneInstance;
    procedure LMDOneInstance1Custom(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;
  MaisDeUm : Boolean = False;

implementation

{$R *.dfm}

procedure TDataModule1.LMDOneInstance1Custom(Sender: TObject);
begin
  MaisDeUm := True;
end;

end.
