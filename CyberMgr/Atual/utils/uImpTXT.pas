unit uImpTXT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, nxdb, nxsdServerEngine,
  nxreRemoteServerEngine, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxllComponent;

type
  TFrmPri = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    nxWinsockTransport1: TnxWinsockTransport;
    nxRSE: TnxRemoteServerEngine;
    T: TnxTable;
    TCodigo: TAutoIncField;
    TNome: TStringField;
    TEndereco: TStringField;
    TBairro: TStringField;
    TCidade: TStringField;
    TUF: TStringField;
    TCEP: TStringField;
    TNasc: TDateTimeField;
    TSexo: TStringField;
    TObs: TMemoField;
    TCpf: TStringField;
    TRg: TStringField;
    TTelefone: TStringField;
    TEmail: TMemoField;
    TCreditoM: TIntegerField;
    TTempoTotal: TIntegerField;
    TTempoInicial: TIntegerField;
    TIsento: TBooleanField;
    TUsername: TStringField;
    TPai: TStringField;
    TMae: TStringField;
    TSenha: TStringField;
    TUltVisita: TDateTimeField;
    TDebito: TCurrencyField;
    TEscola: TStringField;
    TEscolaHI: TDateTimeField;
    TEscolaHF: TDateTimeField;
    TNickName: TStringField;
    TDataNasc: TDateTimeField;
    TCelular: TStringField;
    TTemDebito: TBooleanField;
    TLimiteDebito: TCurrencyField;
    TFoto: TGraphicField;
    TIncluidoEm: TDateTimeField;
    TAlteradoEm: TDateTimeField;
    TIncluidoPor: TStringField;
    TAlteradoPor: TStringField;
    TInativo: TBooleanField;
    TTipoAcessoPref: TIntegerField;
    btnImp: TButton;
    PB: TProgressBar;
    TT: TnxTable;
    TTNumero: TAutoIncField;
    TTCaixaI: TIntegerField;
    TTCaixaF: TIntegerField;
    TTCaixaP: TIntegerField;
    TTTipoAcesso: TWordField;
    TTInicio: TDateTimeField;
    TTFim: TDateTimeField;
    TTDataPagto: TDateTimeField;
    TTContato: TIntegerField;
    TTNome: TStringField;
    TTMaquina: TWordField;
    TTTipo: TWordField;
    TTFuncI: TStringField;
    TTFuncF: TStringField;
    TTTempo: TDateTimeField;
    TTTempoCobrado: TDateTimeField;
    TTCredUsado: TIntegerField;
    TTCredAnterior: TIntegerField;
    TTDesconto: TCurrencyField;
    TTProdutos: TCurrencyField;
    TTValor: TCurrencyField;
    TTObs: TMemoField;
    TTIsento: TBooleanField;
    TTNaoUsarPacote: TBooleanField;
    TTCodPacote: TWordField;
    TTSinal: TCurrencyField;
    TTTransacaoVinculada: TIntegerField;
    TTValorFinalAcesso: TCurrencyField;
    TTDescontoProduto: TCurrencyField;
    TTNumDoc: TStringField;
    TTStatusPagto: TWordField;
    TTT0: TFloatField;
    TTT1: TFloatField;
    TTT2: TFloatField;
    TTT3: TFloatField;
    TTT4: TFloatField;
    TTT5: TFloatField;
    TTT6: TFloatField;
    TTT7: TFloatField;
    TTT8: TFloatField;
    TTT9: TFloatField;
    TTT10: TFloatField;
    TTT11: TFloatField;
    TTT12: TFloatField;
    TTT13: TFloatField;
    TTT14: TFloatField;
    TTT15: TFloatField;
    TTT16: TFloatField;
    TTT17: TFloatField;
    TTT18: TFloatField;
    TTT19: TFloatField;
    TTT20: TFloatField;
    TTT21: TFloatField;
    TTT22: TFloatField;
    TTT23: TFloatField;
    procedure btnImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPri: TFrmPri;

  function ProxCampo(var S: String): String;

implementation

{$R *.dfm}

function ProxCampo(var S: String): String;
begin
  Result := Trim(Copy(S, 1, Pos(';', S)-1));
  Delete(S, 1, Pos(';', S));
end;

function StrToValor(S: String): Double;
var 
  S2: String;
  I: Integer;
begin
  S2 := '';
  for I := 1 to length(S) do
  if S[I] in ['0'..'9','-'] then
    S2 := S2 + S[I]
  else
  if S[I]=',' then
    S2 := S2 + '.';
  Val(S2, Result, I);
  if I<>0 then Result := 0;
end;

procedure TFrmPri.btnImpClick(Sender: TObject);
var 
  S: String;
  Arq: TextFile;
  I: Integer;
  Saldo: Double;
  Tempo: TDateTime;
begin
  T.Open;
  try
    T.EmptyTable;
    AssignFile(Arq, 'c:\crossfire.txt');
    Reset(Arq);
    I:=1;
    while not Eof(Arq) do begin
      Readln(Arq, S);
      PB.Position := I;
      T.Insert;
      Inc(I);
      TCodigo.AsString := Trim(Copy(S, 9, 7));
      TNome.Value := Trim(Copy(S, 22, 100));
      Readln(Arq, S);
      TEndereco.Value := Trim(Copy(S, 11, 100));
      Readln(Arq, S);
      TUF.Value := 'SP';
      TCidade.Value := 'São Paulo';
      TBairro.Value := Trim(Copy(S, 23, 100));
      Readln(Arq, S);
      TTelefone.Value := Trim(Copy(S, 11, 16));
      TRG.Value := Trim(Copy(S, 36, 16));
      TDataNasc.Value := StrToDateDef(Trim(Copy(S, 65, 10)), 0);
      Readln(Arq, S);
      Readln(Arq, S);
      Readln(Arq, S);
      if Copy(S, 17, 5)<>'00:00' then begin
        Tempo := StrToTime(Copy(S, 17, 5)+':00');
        TCreditoM.Value := Trunc(Tempo * 24 * 60 * 60 * 1000);
      end;
      Readln(Arq, S);
      Readln(Arq, S);
      TIncluidoEm.Value := Now;
      TAlteradoEm.Value := TIncluidoEm.Value;
      TUsername.Value := TCodigo.AsString;
      T.Post;
    end;
  finally
    T.Close;
    CloseFile(Arq);
  end;
end;

end.
