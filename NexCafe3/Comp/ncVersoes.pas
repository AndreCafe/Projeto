unit ncVersoes;

interface

uses SysUtils, Classes, Windows;

type

  TncVersao = record
    veNumero : Word;
    veData : TDateTime;
  end;

  TncRecurso = record
    reVersao : Word;
    reNomeRec : String;
  end;

  TArrayVersao = Array of TncVersao;
  TArrayRecurso = Array of TncRecurso;

  TncVersoes = class
  private
    FVersaoAtual: Word;
    FVersoes  : TArrayVersao;
    FRecursos : TArrayRecurso;
  public
    constructor Create;
    
    procedure AddVersao(aNumero: Word; aData: TDateTime);
    function AddRecurso(aVersao: Word; aNomeRec: String): Integer;

    procedure AjustaVersaoAtual(aDireito: TDateTime);

    function PodeUsar(idre: Integer): Boolean;

    property Versao: Word
      read FVersaoAtual write FVersaoAtual; 
  end;

var
  Versoes : TncVersoes;                                             

  idre_Fidelidade,
  idre_ligarmaq,
  idre_listaespera,
  idre_bloqueiosite,
  idre_caixaemail,
  idre_chat,
  idre_tipoacessomaq,
  idre_listaprocessos : Integer;

implementation

{ TncVersoes }

function TncVersoes.AddRecurso(aVersao: Word; aNomeRec: String): Integer;
begin
  Result := Length(FRecursos);
  SetLength(FRecursos, Result+1);
  FRecursos[Result].reVersao := aVersao;
  FRecursos[Result].reNomeRec := aNomeRec;
end;

procedure TncVersoes.AddVersao(aNumero: Word; aData: TDateTime);
var I : Integer;
begin
  I := Length(FVersoes);
  SetLength(FVersoes, I+1);
  FVersoes[I].veNumero := aNumero;
  FVersoes[I].veData := aData;
end;

procedure TncVersoes.AjustaVersaoAtual(aDireito: TDateTime);
var I : Integer;
begin
  for I := Length(FVersoes)-1 downto 0 do
    if aDireito>=FVersoes[I].veData then begin
      FVersaoAtual := FVersoes[I].veNumero;
      Exit;
    end;
  FVersaoAtual := FVersoes[0].veNumero;
end;

constructor TncVersoes.Create;
begin
  FVersaoAtual := 200;
  SetLength(FRecursos, 0);
  SetLength(FVersoes, 0);
end;

function TncVersoes.PodeUsar(idre: integer): Boolean;
begin
  Result := (idre<Length(FRecursos)) and (FRecursos[idre].reVersao <= FVersaoAtual);
end;

initialization
  Versoes := TncVersoes.Create;
  Versoes.AddVersao(200, EncodeDate(2005, 1, 1));
  Versoes.AddVersao(250, EncodeDate(2006, 1, 1));
  Versoes.AddVersao(300, EncodeDate(2008, 10, 1));
  
  Versoes.Versao := 300;
  
  idre_listaespera := Versoes.AddRecurso(250, 'Lista de Espera');
  idre_bloqueiosite := Versoes.AddRecurso(250, 'Bloqueio de Sites');
  idre_caixaemail := Versoes.AddRecurso(250, 'Envio automático de relatório de caixa por E-mail');
  idre_chat := Versoes.AddRecurso(250, 'Chat entre atendentes e clientes');
  idre_listaprocessos := Versoes.AddRecurso(250, 'Lista de processos: Ver / Fechar programas das máquinas clientes, através do servidor');
  idre_tipoacessomaq := Versoes.AddRecurso(250, 'Tarifas específicas por máquina');
  idre_ligarmaq := Versoes.AddRecurso(300, 'Ligar máquinas clientes');
  idre_fidelidade := Versoes.AddRecurso(300, 'Fidelidade')

finalization
  Versoes.Free;  

end.
