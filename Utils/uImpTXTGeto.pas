unit uImpTXTGeto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    nxSE: TnxServerEngine;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliNasc: TDateTimeField;
    tCliSexo: TStringField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliMinutos: TFloatField;
    tCliMinutosUsados: TFloatField;
    tCliMinutosIniciais: TFloatField;
    tCliIsento: TBooleanField;
    tCliUsername: TStringField;
    tCliPai: TStringField;
    tCliMae: TStringField;
    tCliSenha: TStringField;
    tCliUltVisita: TDateTimeField;
    tCliDebito: TCurrencyField;
    tCliEscola: TStringField;
    tCliEscolaHI: TDateTimeField;
    tCliEscolaHF: TDateTimeField;
    tCliNickName: TStringField;
    tCliDataNasc: TDateTimeField;
    tCliCelular: TStringField;
    tCliTemDebito: TBooleanField;
    tCliLimiteDebito: TCurrencyField;
    tCliFoto: TGraphicField;
    tCliIncluidoEm: TDateTimeField;
    tCliAlteradoEm: TDateTimeField;
    tCliIncluidoPor: TStringField;
    tCliAlteradoPor: TStringField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliValorCred: TCurrencyField;
    PB: TProgressBar;
    Button1: TButton;
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

function FilterSt(S: String; Filter: String): String;
var I : integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if Pos(S[I], Filter)>0 then
      Result := Result + S[I];
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, ID: Integer;
  S, S2: String;

function ProxCampo: String;
var P: Integer;
begin
  P := Pos(';', S);
  if P>0 then begin
    Result := Trim(Copy(S, 1, P-1));
    Delete(S, 1, P);
  end else begin
    Result := Trim(S);
    S := '';
  end;  
  if Copy(Result, 1, 1)='"' then
    Delete(Result, 1, 1);
  if Copy(Result, Length(Result), 1)='"' then
    Delete(Result, Length(Result), 1);
end;  

begin
  SL := TStringList.Create;
  SL.LoadFromFile('c:\meus programas\nexcafe\member.csv');
  
{  I := 1;
  while I<SL.Count do begin
    S := SL[I];
    S := ProxCampo;
    if StrToIntDef(S, 0)=0 then begin
      S := SL[I];
      SL[I-1] := SL[I-1] + S;
      SL.Delete(I);
    end else
      Inc(I);
  end;

  SL.SaveToFile('c:\meus programas\nexcafe\member.csv');


  ShowMessage('fim');
  Exit;}
    
  PB.Max := SL.Count;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  ShortDateFormat := 'DD-MM-yyyy';
  for I := 0 to SL.Count-1 do begin
    S := SL[I];
    PB.Position := I + 1;
    Application.ProcessMessages;
    tCli.Insert;
    S2 := ProxCampo;
    ID := StrToIntDef(S2, 0);
    if ID>0 then 
      tCliID.Value := ID else
      ShowMessage(S2+'---'+S);
    ProxCampo;
    ProxCampo;
    tCliNome.Value := ProxCampo;
    ProxCampo;
    ProxCampo;
    tCliDataNasc.Value := StrToDateDef(FilterSt(ProxCampo, '0123456789/'), 0);
    if tCliDataNasc.Value=0 then tCliDataNasc.Clear;
    S2 := ProxCampo;
    if SameText(Copy(S2, 1, 2), 'rg')  then begin
      Delete(S2, 1, 2);
      while (Length(S2)>0) and (not (S2[1] in ['0'..'9'])) do Delete(S2, 1, 1);
    end;
    tCliRG.Value := Trim(S2);
    tCliEndereco.Value := ProxCampo;
    tCliTelefone.Value := ProxCampo;
    try
      tCli.Post;
    except
      ShowMessage(IntToStr(ID)+'-'+tCliNome.Value);
      tCli.Cancel; 
    end;   
  end;
end;

end.
