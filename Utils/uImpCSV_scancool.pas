unit uImpCSV_scancool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nxseAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, ncClassesBase, nxreRemoteServerEngine;

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
    Button1: TButton;
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    tDeb: TnxTable;
    tDebData: TDateTimeField;
    tDebCliente: TIntegerField;
    tDebValor: TCurrencyField;
    tDebTipo: TWordField;
    tDebID: TIntegerField;
    nxRSE: TnxRemoteServerEngine;
    tMovEst: TnxTable;
    tMovEstID: TAutoIncField;
    tMovEstTran: TIntegerField;
    tMovEstProduto: TIntegerField;
    tMovEstQuant: TFloatField;
    tMovEstUnitario: TCurrencyField;
    tMovEstTotal: TCurrencyField;
    tMovEstCustoU: TCurrencyField;
    tMovEstItem: TWordField;
    tMovEstDesconto: TCurrencyField;
    tMovEstPago: TCurrencyField;
    tMovEstPagoPost: TCurrencyField;
    tMovEstDescPost: TCurrencyField;
    tMovEstDataHora: TDateTimeField;
    tMovEstEntrada: TBooleanField;
    tMovEstCancelado: TBooleanField;
    tMovEstEstoqueAnt: TFloatField;
    tMovEstCliente: TIntegerField;
    tMovEstCaixa: TIntegerField;
    tMovEstCategoria: TStringField;
    tMovEstNaoControlaEstoque: TBooleanField;
    tMovEstITran: TIntegerField;
    tMovEstTipoTran: TWordField;
    tMovEstSessao: TIntegerField;
    tMovEstFidResgate: TBooleanField;
    tMovEstFidPontos: TFloatField;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cbCiente: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, J, Min, Cod: Integer;
  S, s2, s3, sDoc: String;
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
    C := ';';
  
  P := Pos(C, S);
  if P>0 then begin
    Result := Trim(Copy(S, 1, P-1));
    Delete(S, 1, P);
  end else begin
    Result := Trim(S);
    S := '';
  end;
  S := Trim(S);
  if (C='"') and (S>'') and (S[1]=';') then Delete(S, 1, 1);

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

begin
  if not cbCiente.Checked then begin
    ShowMessage('É necessário marcar a opção que está ciente que essa operação vai apagar os clientes que já tem cadastrado.');
    Exit;
  end;
  ShowMessage('É necessário ter um arquivo com nome "clientes.csv" nessa mesma pasta onde está o programa de importação: "' + ExtractFilePath(ParamStr(0))+'"');
  S := ExtractFilePath(ParamStr(0))+'clientes.csv';
  if not FileExists(S) then begin
    ShowMessage('Arquivo de importação não encontrado');
    Exit;
  end;
  SL := TStringList.Create;
  SL.LoadFromFile(S);
  PB.Max := SL.Count;
  PB.Position := 0;
  tMovEst.Open;
  tCli.Open;
  tCli.DeleteRecords;
  tDeb.Open;
  tDeb.DeleteRecords;
  ShortDateFormat := 'dd/mm/yyyy';
//  for J := 1 to 2 do 
  for I := 1 to SL.Count-1 do begin
    PB.Position := I + 1;
    Application.ProcessMessages;
    S := SL[I];
    S2 := Trim(ProxCampo);
    Cod := StrToIntDef(S2, 0);
    if Cod>0 then begin
      tCli.Insert;
      tCliID.Value := Cod;
      tCliNome.Value := ProxCampo;
      tCliEndereco.Value := ProxCampo;
      tCliCidade.Value := ProxCampo;
      tCliUF.Value := ProxCampo;
      tCliTelefone.Value := ProxCampo;
      s2 := SoDig(ProxCampo);
      if Length(s2)=11 then
        tCliCPF.Value := s2 else
        tCliRG.Value := s2;
      try
        tCliDataNasc.AsString := ProxCampo;
      except
      end;
      tCliUsername.Value := tCliID.AsString;
  
  {    if J=2 then begin
        tCliNome.Value := tCliNome.Value + ' 2';
        tCliUsername.Value := tCliUsername.Value + '_2';
      end;  }                                                                         
      tCliEmail.Value := ProxCampo;
      tCliSenha.Value := Trim(ProxCampo);
      Mon := StrToCurrency(ProxCampo);
      if Mon > 0.009 then
        tCliValorCred.Value := Mon;
{     else
      if Abs(Mon) >= 0.01 then begin
        tMovEst.Insert;
        tMovEstTotal.Value := -1 * Mon;
        tMovEstDataHora.Value := Now;
        tMovEstCaixa.Value := -1;
        tMovEstTipoTran.Value := trEstVenda;
        tMovEstFidResgate.Value := False;
        tMovEstEntrada.Value := False;
        tMovEstNaoControlaEstoque.Value := True;
        tMovEstPago.Value := 0;
        tMovEstDesconto.Value := 0;
        tMovEstCancelado.Value := False;
        tMovEst.Post;
        
        tDeb.Insert;
        tDebCliente.Value := tCliID.Value;
        tDebData.Value := Date;
        tDebValor.Value := -1 * Mon;
        tDebTipo.Value := itMovEst;
        tDebID.Value := tMovEstID.Value;
        tDeb.Post;
        tCliDebito.Value := tDebValor.Value;
      end;}
       
      tCliIsento.Value := False;
      tCliIncluidoEm.Value := Date;
      tCliIncluidoPor.Value := 'admin';
      tCliInativo.Value := False;
      try
        tCli.Post;
      except
        tCli.Cancel;
        ShowMessage('Erro importando cliente cod.: ' + IntToStr(Cod) + ' Linha: ' + IntToStr(I));
      end;
    end;
  end;
  tCli.IndexName := 'IID';
  tCli.Last;
  tCli.SetAutoIncValue(tCliID.Value);

  ShowMessage('Dados importados com sucesso!');
  Close;
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm16.FormShow(Sender: TObject);
begin
  tCli.Open;
end;

end.
