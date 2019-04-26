unit uDMBaseImpNX2;

interface

uses
  SysUtils, Classes, DB;

type

  TAndamento = procedure ( Total, Atual: Integer ) of object;

  TdmBaseImpNX2 = class(TDataModule)
    { Private declarations }
  public
    procedure Inicializa(PathDB: String); virtual; abstract;
    procedure Importa(aNomeTab: String; aDestino: TDataset; aAndamento: TAndamento); virtual; abstract;
    { Public declarations }
  end;

var
  dmBaseImpNX2: TdmBaseImpNX2;

implementation

{$R *.dfm}

end.
