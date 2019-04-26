unit uImpCSVBradesco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, ncClassesBase, nxreRemoteServerEngine, ExtCtrls;

type
  TForm16 = class(TForm)
    nxSession1: TnxSession;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    nxTCP: TnxWinsockTransport;
    tCliID: TAutoIncField;
    tCliNome: TStringField;
    tCliEndereco: TStringField;
    tCliBairro: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliCEP: TStringField;
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
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    DataSource1: TDataSource;
    nxRSE: TnxRemoteServerEngine;
    Button2: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    lbErro: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;
  PImp : Cardinal = 0;

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
   
function date_from_ymd(s: String): TDateTime;
begin
  if Length(s)>9 then
    Result := EncodeDate(StrToInt(Copy(S, 1, 4)),
                         StrToInt(Copy(S, 6, 2)),
                         StrToInt(Copy(S, 9, 2)))
 else
   Result := 0;
end;

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, J, Min, Cod: Integer;
  S, s2, s3, sDoc, sNome, sUser: String;
  Mon : Currency;
  DT: TDateTime;

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
    Delete(S, 1, 1);
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
  if (C='"') and (S>'') and (S[1]='') then Delete(S, 1, 1);

  Result := Trim(Result);
end;

procedure proxn(n: Integer);
begin
  while n>0 do begin
    ProxCampo;
    dec(n);
  end;
end;

begin
  SL := TStringList.Create;
  sl.LoadFromFile(ExtractFilePath(ParamStr(0))+'export-users.csv');
  tCli.Open;
  ShortDateFormat := 'yyyy-mm-dd';
  I := 0;
  PB.Max := sl.Count;
  PB.Position := 0;
  for I := 1 to sl.Count-1 do begin
    Application.ProcessMessages;
    S := SL[I];
    proxn(4);
    PB.Position := PB.Position + 1;
    sUser := SoDig2(ProxCampo);
    S := SL[I];
    proxn(2);
    if tCli.FindKey([sUSer]) then 
      tCli.Edit else
      tCli.Insert;

    tCliUsername.Value := sUser;
    tCliNome.Value := Trim(Trim(ProxCampo)+' '+Trim(ProxCampo));
    ProxCampo;
//    tCliDataNasc.AsString := ProxCampo;
    tCliCPF.Value := sUser;
    tCliSexo.Value := ProxCampo;
    
    try
      tCliDataNasc.Value := date_from_ymd(Trim(ProxCampo));
      if tCliDataNasc.Value=0 then tCliDataNasc.Clear;
    except
      tCliDataNasc.Clear;
    end;
    
    if tCliDataNasc.IsNull then
      tCliSenha.Value := sUser else
      tCliSenha.Value := FormatDateTime('ddmmyyyy', tCliDataNasc.Value);
      
    tCliCidade.Value := ProxCampo;
    tCliUF.Value := ProxCampo;
    tCliEmail.Value := ProxCampo;
    tCliIsento.Value := False;
    tCliIncluidoEm.Value := Date;
    tCliIncluidoPor.Value := 'admin';
    tCliInativo.Value := False;
    tCli.Post;
  end;
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm16.FormCreate(Sender: TObject);
begin
  Label1.Hint := ExtractFilePath(ParamStr(0))+'export-users.csv';
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  tCli.Open;
end;

procedure TForm16.Timer1Timer(Sender: TObject);
begin
  if (GetTickCount>=PImp) then begin
    lbErro.Visible := False;
    Label1.Caption := 'Importando dados de '+Label1.Hint;
    Timer1.Enabled := False;
    try
      nxTCP.Active := False;
      try
        Button1Click(nil);
      except
        on E: Exception do begin
          lbErro.Visible := True;
          lbErro.Caption := E.Message;
        end;
      end;
    finally
      PImp := GetTickCount+60000;
      Timer1.Enabled := True;
    end;
  end else
    Label1.Caption := 'Próxima importação em ' + IntToStr((PImp-GetTickCount) div 1000)+'s';
end;


end.
