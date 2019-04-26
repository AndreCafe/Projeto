unit uExpEmail2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, nxdb, nxseAutoComponent, nxllTransport, nxptBasePooledTransport,
  nxtwWinsockTransport, nxsdServerEngine, nxreRemoteServerEngine, nxllComponent,
  StdCtrls, ComCtrls;

type
  TfrmPri = class(TForm)
    nxSession: TnxSession;
    nxRSE: TnxRemoteServerEngine;
    nxTCP: TnxWinsockTransport;
    nxseAllEngines1: TnxseAllEngines;
    nxDB: TnxDatabase;
    tCli: TnxTable;
    tAut: TnxTable;
    tCliCodigo: TAutoIncField;
    tCliTipo: TWordField;
    tCliSenha: TStringField;
    tCliCadastroEm: TDateTimeField;
    tCliCadastroPor: TStringField;
    tCliAtualizadoEm: TDateTimeField;
    tCliAtualizadoPor: TStringField;
    tCliLoja: TStringField;
    tCliRazaoSocial: TStringField;
    tCliPais: TStringField;
    tCliCidade: TStringField;
    tCliUF: TStringField;
    tCliEndereco: TnxMemoField;
    tCliCEP: TStringField;
    tCliBairro: TStringField;
    tCliSerieHD: TStringField;
    tCliCodEquip: TStringField;
    tCliNumMaq: TWordField;
    tCliCNPJ: TStringField;
    tCliIE: TStringField;
    tCliObs: TnxMemoField;
    tCliTelefones: TnxMemoField;
    tCliEmailReg: TnxMemoField;
    tCliFormaPagto: TnxMemoField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliManInicio: TDateField;
    tCliManVenc: TDateField;
    tCliProprietarios: TnxMemoField;
    tCliGerente: TStringField;
    tCliTipoLoja: TWordField;
    tCliEmailTec: TnxMemoField;
    tCliValor: TCurrencyField;
    tCliValorRec: TCurrencyField;
    tCliEmitirNF: TBooleanField;
    tCliMessenger: TnxMemoField;
    tCliICQ: TnxMemoField;
    tCliUObtemLic: TDateTimeField;
    tCliUVersao: TStringField;
    tCliNegociacao: TWordField;
    tCliStatus: TIntegerField;
    tCliContatarEm: TDateTimeField;
    tCliPrograma: TWordField;
    tCliBloqueado: TBooleanField;
    tCliCliente: TBooleanField;
    tCliAtivado: TBooleanField;
    tCliCodAtivacao: TStringField;
    tCliEmailConta: TStringField;
    tCliAtivadoEm: TDateTimeField;
    tCliTipoConta: TWordField;
    tCliPremiumAte: TDateTimeField;
    Button1: TButton;
    PB: TProgressBar;
    tAutID: TAutoIncField;
    tAutPrograma: TWordField;
    tAutLoja: TIntegerField;
    tAutAutorizacao: TStringField;
    tAutVencimento: TDateField;
    tAutCodigoEquip: TStringField;
    tAutMaquinas: TWordField;
    tAutTipo: TWordField;
    tAutCriadaEm: TDateTimeField;
    tAutCriadaPor: TStringField;
    tAutInativadaEm: TDateTimeField;
    tAutInativadaPor: TStringField;
    tAutAtiva: TBooleanField;
    tAutObs: TnxMemoField;
    tAutGerar: TBooleanField;
    tAutEnviouCli: TBooleanField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPri: TfrmPri;

implementation

uses nrAutorizacao;

{$R *.dfm}

procedure TfrmPri.Button1Click(Sender: TObject);
var 
  C1, C2, C3, c4: integer;
  sl1, sl2 : TStrings;
  I : Integer;

function TipoCli: String;
begin
  Result := 'I';
  if tAut.FindKey([tCliCodigo.Value, True]) then 
  case tAutTipo.Value of
    taDefinitiva : Result := 'D';
    taLocacao    : Result := 'P';
    taFreePremium : begin
      if (not tAutVencimento.IsNull) and (tAutVencimento.Value > (Date-7)) then
        Result := 'P' 
      else
      if tCliUObtemLic.Value > (Date - 5) then
        Result := 'F';
    end;
  end;
end;

procedure _Add(sEmail: String);
var Ind: Integer;
begin
  if (Pos('@', sEmail)>0) and (Pos('.', sEmail)>0) and (sEmail>'') then begin
    Ind := sl2.IndexOf(sEmail);
    if Ind = -1 then begin
      sl2.Add(sEmail);
      sl1.Add(sEmail+';'+TipoCli);
    end else
      sl1[Ind] := sEmail + ';' + TipoCli;
  end;  
end;
  
procedure AddEmail(sEmail: String);
var P: Integer;
begin
  while Trim(sEmail)>'' do begin
    P := Pos(',', sEmail);
    if P=0 then P := Pos(';', sEmail);
    if P=0 then P := Pos(' ', sEmail);
    
    if P>0 then begin
      _Add(Trim(Copy(sEmail, 1, P-1)));
      Delete(sEmail, 1, P);
    end else begin
      _Add(Trim(sEmail));
      sEmail := '';
    end;
  end;
end;

procedure AddEmails(s: String);
var sl3: TStrings; n: integer;
begin
  if trim(s)='' then Exit;
  sl3 := TStringList.Create;
  try
    sl3.Text := s;
    for n := 0 to sl3.Count - 1 do
      if Trim(sl3[n])>'' then
        AddEmail(sl3[n]);
  finally
    sl3.Free;
  end;
end;

begin
  sl1 := TStringList.Create;
  sl2 := TStringList.Create;
  try
    tCli.Open;
    tAut.Open;
    PB.Position := 0;
    PB.Max := tCli.RecordCount;
    tCli.First;
    while not tCli.Eof do begin
      PB.Position := PB.Position + 1;
      AddEmails(tCliEmailReg.Value);
      AddEmails(tCliEmailTec.Value);
      AddEmails(tCliMessenger.Value);
      AddEmails(tCliEmailConta.Value);
      tCli.Next;
      Application.ProcessMessages;
    end;
    sl1.SaveToFile('c:\nexreg\emails_nexcafe.txt');    
    ShowMessage('E-mails Exportados = ' + IntToStr(sl2.Count));
  finally
    sl1.Free;
    sl2.Free;
  end;
end;

end.
