unit uImpVSCyber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Dbf, nxdb, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxllComponent,
  StdCtrls;

type
  TForm16 = class(TForm)
    Button1: TButton;
    nxSe: TnxSession;
    Tab: TnxTable;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    nxDB: TnxDatabase;
    tPessoa: TDbf;
    tLogin: TDbf;
    tCred: TDbf;
    tPessoaIDPESSOA: TFloatField;
    tPessoaNOMEFANTAS: TStringField;
    tPessoaNOMECOMPLE: TStringField;
    tPessoaTPPESSOA: TStringField;
    tPessoaBINATIVA: TFloatField;
    tPessoaIDINC: TFloatField;
    tPessoaDHINC: TDateField;
    tPessoaIDALT: TFloatField;
    tPessoaDHALT: TDateField;
    tLoginIDLOGIN: TFloatField;
    tLoginLOGIN: TStringField;
    tCredIDCLI: TFloatField;
    tCredSLD: TFloatField;
    TabCodigo: TAutoIncField;
    TabNome: TStringField;
    TabEndereco: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabUF: TStringField;
    TabCEP: TStringField;
    TabNasc: TDateTimeField;
    TabSexo: TStringField;
    TabObs: TMemoField;
    TabCpf: TStringField;
    TabRg: TStringField;
    TabTelefone: TStringField;
    TabEmail: TMemoField;
    TabCreditoM: TIntegerField;
    TabTempoTotal: TIntegerField;
    TabTempoInicial: TIntegerField;
    TabIsento: TBooleanField;
    TabUsername: TStringField;
    TabPai: TStringField;
    TabMae: TStringField;
    TabSenha: TStringField;
    TabUltVisita: TDateTimeField;
    TabDebito: TCurrencyField;
    TabEscola: TStringField;
    TabEscolaHI: TDateTimeField;
    TabEscolaHF: TDateTimeField;
    TabNickName: TStringField;
    TabDataNasc: TDateTimeField;
    TabCelular: TStringField;
    TabTemDebito: TBooleanField;
    TabLimiteDebito: TCurrencyField;
    TabFoto: TGraphicField;
    TabIncluidoEm: TDateTimeField;
    TabAlteradoEm: TDateTimeField;
    TabIncluidoPor: TStringField;
    TabAlteradoPor: TStringField;
    TabInativo: TBooleanField;
    TabTipoAcessoPref: TIntegerField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

function ProxCampo(var S: String): String;
var I: integer;
begin
  I := Pos(';', S);
  if I>0 then begin
    Result := copy(S, 1, I-1);
    Delete(S, 1, I);
  end else begin
    Result := S;
    S := '';
  end;
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I: Integer;
  S, S2: String;
  Code: integer;
  Saldo: Extended;
begin
  SL := TStringList.Create;
  SL.LoadFromFile('c:\meus programas\cybermgr\pessoa.csv');
  

  for I := 0 to SL.Count - 1 do begin
    S := SL[I];
    Tab.Insert;
    TabCodigo.AsString := ProxCampo(S);
    TabNome.Value := Trim(Trim(ProxCampo(S)) + ' ' + Trim(ProxCampo(S)));
    TabIncluidoEm.AsString := ProxCampo(S);
    Tab.Post;
  end;

  SL.LoadFromFile('c:\meus programas\cybermgr\login.csv');
  
  for I := 0 to SL.Count - 1 do begin
    S := SL[I];
    if Tab.FindKey([StrToInt(ProxCampo(S))]) then begin
      Tab.Edit;
      TabUsername.Value := LowerCase(ProxCampo(S));
      Tab.Post;
    end;
  end;

  SL.LoadFromFile('c:\meus programas\cybermgr\sldcli.csv');
  for I := 0 to SL.Count - 1 do begin
    S := SL[I];
    S2 := ProxCampo(S);
    S := ProxCampo(S);
    Val(S, Saldo, Code);
    if (Code=0) and (Saldo>0.009) then
    if Tab.FindKey([StrToInt(S2)]) then begin
      Tab.Edit;
      TabCreditoM.Value := Trunc((Saldo / 1.5) * 1000 * 60 * 60);
      Tab.Post;
    end;
  end;

  ShowMessage('Pronto!');
end;

end.
