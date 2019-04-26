unit ncaPlusParceiro;
{
    ResourceString: Dario 11/03/13
    Nada para fazer
}

interface

uses
  SysUtils,
  Classes;

type

  TncPlusParceiro = class
  public
    function obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro, aToken: String): String; virtual; abstract;
    function validaChaveSessaoNex(aIDSessaoNex, aChave: String): Boolean; virtual; abstract;
    function obtemChaveSessaoParceiro(aIDSessaoParceiro: String): String; virtual; abstract;
    class function CodigoParceiro: String; virtual; abstract;
  end;

  TncPlusParceiroClass = class of TncPlusParceiro;

  TncPlusParceiroTeste = class ( TncPlusParceiro )
    function obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro, aToken: String): String; override;
    function validaChaveSessaoNex(aIDSessaoNex, aChave: String): Boolean; override;
    function obtemChaveSessaoParceiro(aIDSessaoParceiro: String): String; override;
    class function CodigoParceiro: String; override;
  end;

  TncPlusPaymentez = class ( TncPlusParceiro )
    function obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro, aToken: String): String; override;
    function validaChaveSessaoNex(aIDSessaoNex, aChave: String): Boolean; override;
    function obtemChaveSessaoParceiro(aIDSessaoParceiro: String): String; override;
    class function CodigoParceiro: String; override;
  end;

  TncPlusEprepag = class ( TncPlusParceiro )
    function obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro, aToken: String): String; override;
    function validaChaveSessaoNex(aIDSessaoNex, aChave: String): Boolean; override;
    function obtemChaveSessaoParceiro(aIDSessaoParceiro: String): String; override;
    class function CodigoParceiro: String; override;
  end;

  TncPlusDrMicro = class ( TncPlusParceiro )
    function obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro, aToken: String): String; override;
    function validaChaveSessaoNex(aIDSessaoNex, aChave: String): Boolean; override;
    function obtemChaveSessaoParceiro(aIDSessaoParceiro: String): String; override;
    class function CodigoParceiro: String; override;
  end;

  TncPlusConsultaOK = class ( TncPlusParceiro )
    function obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro, aToken: String): String; override;
    function validaChaveSessaoNex(aIDSessaoNex, aChave: String): Boolean; override;
    function obtemChaveSessaoParceiro(aIDSessaoParceiro: String): String; override;
    class function CodigoParceiro: String; override;
  end;  

  TncPlusMurale = class ( TncPlusParceiro )
    function obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro, aToken: String): String; override;
    function validaChaveSessaoNex(aIDSessaoNex, aChave: String): Boolean; override;
    function obtemChaveSessaoParceiro(aIDSessaoParceiro: String): String; override;
    class function CodigoParceiro: String; override;
  end;   
  
  TncPlusParceiros = class
  private
    FItens : TList;

    function _AchaParceiro(aCodigo: String): TncPlusParceiro;
    function AchaParceiro(aCodigo: String): TncPlusParceiro;
  public
    constructor Create; 
    destructor Destroy; override;
    procedure RegistraParceiro(aClasse: TncPlusParceiroClass);

    function obtemCalcToken(aCodParceiro, aIDSessaoParceiro, aIDLojaParceiro, aToken: String): String; 
    function validaChaveSessaoNex(aCodParceiro, aIDSessaoNex, aChave: String): Boolean; 
    function obtemChaveSessaoParceiro(aCodParceiro, aIDSessaoParceiro: String): String; 
  end;

var
  gpParceiros : TncPlusParceiros;

implementation

uses md5, ncaK;

// START resource string wizard section
resourcestring
  SOCódigoDeParceiro = 'O código de parceiro ';
  SNãoéVálido = 'não é válido';

// END resource string wizard section


{ TncPlusParceiros }

function TncPlusParceiros.obtemCalcToken(aCodParceiro, aIDSessaoParceiro, aIDLojaParceiro,
  aToken: String): String;
begin
  Result := AchaParceiro(aCodParceiro).obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro, aToken);
end;

constructor TncPlusParceiros.Create;
begin
  FItens := TList.Create;
end;

destructor TncPlusParceiros.Destroy;
begin
  while FItens.Count > 0 do begin
    TObject(FItens[0]).Free;
    FItens.Delete(0);
  end;
  inherited;
end;

function TncPlusParceiros.obtemChaveSessaoParceiro(aCodParceiro,
  aIDSessaoParceiro: String): String;
begin
  Result := AchaParceiro(aCodParceiro).obtemChaveSessaoParceiro(aIDSessaoParceiro);
end;

function TncPlusParceiros.AchaParceiro(aCodigo: String): TncPlusParceiro;
begin
  Result := _AchaParceiro(aCodigo);
  if Result=nil then
    raise exception.Create(SOCódigoDeParceiro+aCodigo+SNãoéVálido);
end;

procedure TncPlusParceiros.RegistraParceiro(aClasse: TncPlusParceiroClass);
begin
  if _AchaParceiro(aClasse.CodigoParceiro)=nil then
    FItens.Add(aClasse.Create);
end;

function TncPlusParceiros.validaChaveSessaoNex(aCodParceiro, aIDSessaoNex,
  aChave: String): Boolean;
begin
  Result := AchaParceiro(aCodParceiro).validaChaveSessaoNex(aIDSessaoNex, aChave);
end;

function TncPlusParceiros._AchaParceiro(aCodigo: String): TncPlusParceiro;
var I : Integer;
begin
  for I := 0 to FItens.Count-1 do begin
    if SameText(TncPlusParceiro(FItens[i]).CodigoParceiro, aCodigo) then begin
      Result := TncPlusParceiro(FItens[i]);
      Exit;
    end;
  end;
  Result := nil;
end;

{ TncPlusParceiroTeste }

function TncPlusParceiroTeste.obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro,
  aToken: String): String;
begin
  Result := GetMD5Str('plus'+aIDSessaoParceiro+aIDLojaParceiro+aToken+'teste'); // do not localize
end;

class function TncPlusParceiroTeste.CodigoParceiro: String;
begin
  result := 'Teste'; // do not localize
end;

function TncPlusParceiroTeste.obtemChaveSessaoParceiro(
  aIDSessaoParceiro: String): String;
begin
  Result := GetMD5Str('plus'+aIDSessaoParceiro+'teste'); // do not localize
end;

function TncPlusParceiroTeste.validaChaveSessaoNex(aIDSessaoNex,
  aChave: String): Boolean;
begin
//  Result := SameText(GetMD5Str('plus'+aIDSessaoNex+'teste'), aChave);
  Result := True;
end;

{ TncPlusPaymentez }

class function TncPlusPaymentez.CodigoParceiro: String;
begin
  Result := 'paymentez'; // do not localize
end;

function TncPlusPaymentez.obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro,
  aToken: String): String;
begin
  Result := nexGetKH(2, aIDLojaParceiro+aToken+aIDSessaoParceiro, '', '');
end;

function TncPlusPaymentez.obtemChaveSessaoParceiro(
  aIDSessaoParceiro: String): String;
begin
  Result := nexGetKH(2, aIDSessaoParceiro, '', '');
end;

function TncPlusPaymentez.validaChaveSessaoNex(aIDSessaoNex,
  aChave: String): Boolean;
begin
  Result := (nexGetKH(2, aIDSessaoNex, '', aChave)='');
end;

{ TncPlusEprepag }

class function TncPlusEprepag.CodigoParceiro: String;
begin
  Result := 'eprepag'; // do not localize
end;

function TncPlusEprepag.obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro,
  aToken: String): String;
begin
  Result := nexGetKH(3, aIDLojaParceiro+aToken+aIDSessaoParceiro, '', '');
end;

function TncPlusEprepag.obtemChaveSessaoParceiro(
  aIDSessaoParceiro: String): String;
begin
  Result := nexGetKH(3, aIDSessaoParceiro, '', '');
end;

function TncPlusEprepag.validaChaveSessaoNex(aIDSessaoNex,
  aChave: String): Boolean;
begin
  Result := (nexGetKH(3, aIDSessaoNex, '', aChave)='');
end;

{ TncPlusDrMicro }

class function TncPlusDrMicro.CodigoParceiro: String;
begin
  result := 'drmicro'; // do not localize
end;

function TncPlusDrMicro.obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro,
  aToken: String): String;
begin
  Result := nexGetKH(4, aIDLojaParceiro+aToken+aIDSessaoParceiro, '', '');
end;

function TncPlusDrMicro.obtemChaveSessaoParceiro(
  aIDSessaoParceiro: String): String;
begin
  Result := nexGetKH(4, aIDSessaoParceiro, '', '');
end;

function TncPlusDrMicro.validaChaveSessaoNex(aIDSessaoNex,
  aChave: String): Boolean;
begin
  Result := (nexGetKH(4, aIDSessaoNex, '', aChave)='');
end;

{ TncPlusConsultaOK }

class function TncPlusConsultaOK.CodigoParceiro: String;
begin
  result := 'consultaok'; // do not localize
end;

function TncPlusConsultaOK.obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro,
  aToken: String): String;
begin
  Result := nexGetKH(5, aIDLojaParceiro+aToken+aIDSessaoParceiro, '', '');
end;

function TncPlusConsultaOK.obtemChaveSessaoParceiro(
  aIDSessaoParceiro: String): String;
begin
  Result := nexGetKH(5, aIDSessaoParceiro, '', '');
end;

function TncPlusConsultaOK.validaChaveSessaoNex(aIDSessaoNex,
  aChave: String): Boolean;
begin
  Result := (nexGetKH(5, aIDSessaoNex, '', aChave)='');
end;

{ TncPlusMurale }

class function TncPlusMurale.CodigoParceiro: String;
begin
  result := 'murale'; // do not localize
end;

function TncPlusMurale.obtemCalcToken(aIDSessaoParceiro, aIDLojaParceiro,
  aToken: String): String;
begin
  Result := nexGetKH(6, aIDLojaParceiro+aToken+aIDSessaoParceiro, '', '');
end;

function TncPlusMurale.obtemChaveSessaoParceiro(
  aIDSessaoParceiro: String): String;
begin
  Result := nexGetKH(6, aIDSessaoParceiro, '', '');
end;

function TncPlusMurale.validaChaveSessaoNex(aIDSessaoNex,
  aChave: String): Boolean;
begin
  Result := (nexGetKH(6, aIDSessaoNex, '', aChave)='');
end;

initialization
  gpParceiros := TncPlusParceiros.Create;
  gpParceiros.RegistraParceiro(TncPlusParceiroTeste);
  gpParceiros.RegistraParceiro(TncPlusPaymentez);
  gpParceiros.RegistraParceiro(TncPlusEprepag);
  gpParceiros.RegistraParceiro(TncPlusDrMicro);
  gpParceiros.RegistraParceiro(TncPlusConsultaOk);
  gpParceiros.RegistraParceiro(TncPlusMurale);

finalization
  gpParceiros.Free;

end.



