unit uImp_Dario1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, dateutils, StrUtils;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxSE: TnxServerEngine;
    PB: TProgressBar;
    Button1: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Memo1: TMemo;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
    tCliSexo: TStringField;
    tCliObs: TnxMemoField;
    tCliCpf: TStringField;
    tCliRg: TStringField;
    tCliTelefone: TStringField;
    tCliEmail: TnxMemoField;
    tCliMinutos: TFloatField;
    tCliPassaportes: TFloatField;
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
    tCliTitEleitor: TStringField;
    tCliFidPontos: TFloatField;
    tCliFidTotal: TFloatField;
    tCliFidResg: TFloatField;
    tCliAniversario: TStringField;
    tCliCotaImpEspecial: TBooleanField;
    tCliCotaImpDia: TIntegerField;
    tCliCotaImpMes: TIntegerField;
    tCliSemFidelidade: TBooleanField;
    tCliTemCredito: TBooleanField;
    tCliNaoGuardarCredito: TBooleanField;
    tCliPermiteLoginSemCred: TBooleanField;
    tCliCHorario: TIntegerField;
    tCliOpCHorario: TWordField;
    tCliHP1: TIntegerField;
    tCliHP2: TIntegerField;
    tCliHP3: TIntegerField;
    tCliHP4: TIntegerField;
    tCliHP5: TIntegerField;
    tCliHP6: TIntegerField;
    tCliHP7: TIntegerField;
    tCliInativo: TBooleanField;
    tCliTipoAcessoPref: TIntegerField;
    tCliFornecedor: TBooleanField;
    tCliValorCred: TCurrencyField;
    tCliRecVer: TIntegerField;
    tCliID: TIntegerField;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

function StrToCurrency(S: String): Currency;
var 
  Code, P : Integer;
  Res: Real;
begin
  P := Pos(',', S);
  if P>0 then S[P] := '.';
  Result := 0;
  if (Trim(S)>'') then begin
    Val(S, Res, Code);
    if Code=0 then
      REsult := Res;
  end;
end;

function CodStr(I: Integer): String;
begin
  Result := IntToStr(I);
  while length(result)<3 do
    result := '0'+result;
end;

function SoDig(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9', '-'] then
      result := result + s[i];
end;

function SoDig2(S: String): String;
var i: integer;
begin
  result := '';
  for i := 1 to length(S) do
    if s[i] in ['0'..'9'] then
      result := result + s[i];
end;

function LimpaRG(S: String): String;
var I: Integer;
begin
  Result := '';
  while (Length(S)>0) and (not (S[1] in ['0'..'9'])) do
    Delete(S, 1, 1);
  Result := Trim(S);  
end;

function MeuTrim(S: String): String;
var 
   I: Integer; 
begin
  Result := '';
  for I := 1 to Length(S) do 
    if Ord(S[i])=160 then
      Result := Result + ' ' else
      Result := Result + S[i];
end;

function zero4(S: String): String;
begin
  Result := S;
  while Length(Result) < 4 do Result := '0' + Result;
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, J, Min, Cod: Integer;
  S, s2, s3, sDoc, s4, s5: String;
  Mon : Currency;
  DT: TDateTime;
  aCNPJ, aIE, aEndereco, aNum, aComplemento, aTaxaEntrega, aTipoMoradia : String;

function ProxCampo: String;
var 
  P: Integer;
  C: Char;
begin
  if S='' then begin
    Result := '';
    Exit;
  end;
  
  if S[1]='"' then begin
    while (S>'') and (S[1]='"') do Delete(S, 1, 1);
    C := '"';
  end else 
    C := ',';
  
  P := Pos(C, S);
  if P>0 then begin
    Result := Trim(Copy(S, 1, P-1));
    Delete(S, 1, P);
  end else begin
    Result := Trim(S);
    S := '';
  end;
  S := Trim(S);
  if (C='"') and (S>'') and (S[1]=',') then Delete(S, 1, 1);

  for P := Length(Result) downto 1 do 
    if Result[P]='"' then Delete(Result, P, 1);
  Result := Trim(MeuTrim(Result));
end;

procedure proxn(n: Integer);
begin
  while n>0 do begin
    ProxCampo;
    dec(n);
  end;
end;

function DDDTel(aTel, aDDD: String): String;
begin
  if (aTel>'') and (aDDD>'') then
    Result := '('+aDDD+') '+aTel else
    Result := aTel;
end;

function Endereco: String;
begin
  Result := aEndereco;
  if (Result>'') and (aNum>'') then
    Result := Result + ' ' + aNum;

  if (Result>'') and (aComplemento>'') then
    Result := Result + ' ' + aComplemento;
end;

procedure endereco1(fld:TStringField; aNum, aComple:string);
var
     s : string;
begin
    s := fld.Value;

    if (trim(s)='') and (trim(aNum)<>'') then
          s := aNum;

    if (trim(s)<>'') and (trim(aNum)<>'') then
          s := s + ', ' + aNum;

    if (trim(s)='') and (trim(aComple)<>'') then
          s := aComple;

    if (trim(s)<>'') and (trim(aComple)<>'') then
          s := s + ', ' + aComple;

    fld.Value := s;

end;

procedure estado1(fld:TStringField; aCampo:string);
var
    s: string;
begin
    s := aCampo;
    if aCampo = 'Acre' then s := 'AC';
    if aCampo = 'Alagoas' then s := 'AL';
    if aCampo = 'Amazonas' then s := 'AM';
    if aCampo = 'Bahia' then s := 'BA';
    if aCampo = 'Ceará' then s := 'CE';
    if aCampo = 'Distrito Federal' then s := 'DF';
    if aCampo = 'Espírito Santo' then s := 'ES';
    if aCampo = 'Goiás' then s := 'GO';
    if aCampo = 'Mato Grosso' then s := 'MT';
    if aCampo = 'Mato Grosso do Sul' then s := 'MS';
    if aCampo = 'Minas Gerais' then s := 'MG';
    if aCampo = 'Paraná' then s := 'PR';
    if aCampo = 'Paraíba' then s := 'PB';
    if aCampo = 'Pará' then s := 'PA';
    if aCampo = 'Pernambuco' then s := 'PE';
    if aCampo = 'Rio Grande do Sul' then s := 'RS';
    if aCampo = 'Rio de Janeiro' then s := 'RJ';
    if aCampo = 'Santa Catarina' then s := 'SC';
    if aCampo = 'Sergipe' then s := 'SE';
    if aCampo = 'São Paulo' then s := 'SP';
    if aCampo = 'Tocantins' then s := 'TO';
    if aCampo = 'sp' then s := 'SP';



    fld.Value := s;
end;

procedure minutos1(fld:TFloatField; aCampo:string);
var
    AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word;
    s, s2 : string;
begin


    AHour :=0;
    AMinute :=0;
    ASecond :=0;
    AMilliSecond := 0;

    if pos(':', aCampo)> 0 then begin
         s := copy(aCampo, 1, pos(':', aCampo)-1);
         AHour := strtoint(s);
         s := copy(aCampo, pos(':', aCampo)+1, maxint);
         if pos(':', s)> 0 then begin
             s2 := copy(s, 1, pos(':', s)-1);
             AMinute := strtoint(s2);
             s := copy(s, pos(':', s)+1, maxint);
             ASecond := strtoint(s);
             fld.Value := AHour * 60 + AMinute +  ASecond / 60;
          end;
    end;
end;

function Memo2Str(s:string) :string;
begin
    while pos('/n', s)>0 do
        s := stringReplace(s, '/n',#13#10, []);
end;

procedure data1(fld:TDateTimeField; aCampo:string);
var
    AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond: Word;
    s, s2 : string;
begin


    AHour :=0;
    AMinute :=0;
    ASecond :=0;
    AMilliSecond := 0;

    if pos('/', aCampo)> 0 then begin
         s := copy(aCampo, 1, pos('/', aCampo)-1);
         ADay := strtoint(s);
         s := copy(aCampo, pos('/', aCampo)+1, maxint);
         if pos('/', s)> 0 then begin
             s2 := copy(s, 1, pos('/', s)-1);
             AMonth := strtoint(s2);
             s := copy(s, pos('/', s)+1, maxint);
             if pos(' ', s)>0 then begin
                 s2 := copy(s, 1, pos(' ', s)-1);
                 AYear := strtoint(s2);
                 s := copy(s, pos(' ', s)+1, maxint);
                 if pos(':', s)>0 then begin
                    s2 := copy(s, 1, pos(':', s)-1);
                    AHour := strtoint(s2);
                    s := copy(s, pos(':', s)+1, 2);
                    AMinute := strtoint(s);
                 end;
             end else
                AYear := strtoint(s);
             fld.Value := dateutils.EncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
          end;
    end;
end;

procedure AddObs(aCampo, aValor: String);
begin
  if Trim(aValor)>'' then begin
    if tCliObs.Value>'' then tCliObs.Value := tCliObs.Value + sLineBreak;
    tCliObs.Value := tCliObs.Value + aCampo + ' = ' + aValor;
  end;
end;

var
    id:integer;

begin
  SL := TStringList.Create;
  SL.LoadFromFile('Z:\sharedVMs\nc\BACK UP CADASTRO RCMS INTERNET EXPRESS.csv');
  PB.Max := SL.Count;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
  tCli.IndexName := 'IUsername';
  Application.ProcessMessages;
  //FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
//  for J := 1 to 2 do

// "CÓDIGO","NOME","NICK","SENHA","RG","CPF","CRÉDITO","DATA CADASTRO","EMAIL","D.NASCIMENTO","ENDEREÇO","TELEFONE","NÚMERO","COMPLEMENTO","BAIRRO","CIDADE","ESTADO"

// "iCliID","iCodigo","iGCID","sNome","sNick","sSenha","sRG","sCPF","mCredito","dCredito","dCadastro","iUsuID","sEmail","dNascimento","sEndereco","sFone","sObs","bAtivo","dInativacao","bAviso","bCusto","bAutorizacao","bLogar","sPai","sMae","sCEP","sNumero","sComplemento","sBairro","sCidade","sEstado","iTurnoID","bMensal","iCliIndicado","dIndicado","sEscola","dInicioAula","dFinalAula"



  for I := 1 to SL.Count-1 do begin
  //for I := 1 to 4 do begin
    try
        PB.Position := I + 1;
        Application.ProcessMessages;
        S := SL[I];

        tCli.Insert;
        id := strtoint(ProxCampo);   // "iCliID",
        Label1.caption := inttostr(id);
        tCliID.Value := id;
        ProxCampo; //"iCodigo",
        ProxCampo; //"iGCID",
        tCliUsername.Value := ProxCampo; // "sNome",
        tCliNickName.Value := ProxCampo; // "sNick",
        tCliSenha.Value := ProxCampo;    // "sSenha",
        tCliRg.Value := ProxCampo;       // "sRG",
        tCliCpf.Value := ProxCampo;      // "sCPF",
        ProxCampo; //"mCredito",
        minutos1(tCliMinutos, ProxCampo);  // "dCredito",
        data1(tCliIncluidoEm, ProxCampo);  // "dCadastro",
        ProxCampo; //"iUsuID",
        tCliIncluidoPor.Value := 'importacao';
        tCliEmail.Value := ProxCampo;    // "sEmail",
        data1(tCliDataNasc, ProxCampo);  // "dNascimento",
        tCliEndereco.Value := ProxCampo; // "sEndereco",
        tCliTelefone.Value := ProxCampo; // "sFone",

        // "sObs",
        tCliObs.Value := Memo2Str(ProxCampo);

        //"bAtivo","dInativacao","bAviso","bCusto","bAutorizacao","bLogar",
        ProxCampo; ProxCampo; ProxCampo; ProxCampo; ProxCampo; ProxCampo;

        tCliPai.Value := ProxCampo; //"sPai",
        tCliMae.Value := ProxCampo; //"sMae",
        tCliCEP.Value := ProxCampo; // "sCEP",
        endereco1(tCliEndereco, ProxCampo, ProxCampo); // "sNumero","sComplemento",
        tCliBairro.Value := ProxCampo;   // "sBairro",
        tCliCidade.Value := ProxCampo;   // "sCidade",

        //tCliCidade.Value := ProxCampo;   // "sEstado",   
        estado1(tCliUF, ProxCampo);      // "sEstado",

        //"iTurnoID","bMensal","iCliIndicado","dIndicado",
        ProxCampo; ProxCampo; ProxCampo; ProxCampo;

        tCliEscola.Value := ProxCampo; // "sEscola",
        data1(tCliEscolaHI, ProxCampo); // "dInicioAula",
        data1(tCliEscolaHF, ProxCampo); // "dFinalAula"

    except
        on e:exception  do begin
            tCliID.Value := id;
        end;
    end;
    tCli.Post;


  end;
  ShowMessage('Fim');
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  tCli.Open;
end;

end.
