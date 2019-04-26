unit uExpEmail;

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

procedure _Add(sl: TStrings; sEmail: String);
begin
  if (Pos('@', sEmail)>0) and (Pos('.', sEmail)>0) then
  if (sEmail>'') and (SL.IndexOf(sEmail)<0) then
    SL.Add(sEmail);
end;
  
procedure AddEmail(sl: TStrings; sEmail: String);
var P: Integer;
begin
  while Trim(sEmail)>'' do begin
    P := Pos(',', sEmail);
    if P=0 then P := Pos(';', sEmail);
    if P=0 then P := Pos(' ', sEmail);
    
    if P>0 then begin
      _Add(sl, Trim(Copy(sEmail, 1, P-1)));
      Delete(sEmail, 1, P);
    end else begin
      _Add(sl, Trim(sEmail));
      sEmail := '';
    end;
  end;
end;

procedure AddEmails(sl: TStrings; s: String);
var sl3: TStrings; n: integer;
begin
  if trim(s)='' then Exit;
  sl3 := TStringList.Create;
  try
    sl3.Text := s;
    for n := 0 to sl3.Count - 1 do
      if Trim(sl3[n])>'' then
        AddEmail(sl, sl3[n]);
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
    PB.Max := tCli.RecordCount;
    tCli.First;
    while not tCli.Eof do begin
      PB.Position := PB.Position + 1;
      if tAut.FindKey([tCliCodigo.Value]) and (tAutTipo.Value in [taDefinitiva, taLocacao]) then begin
        AddEmails(sl1, tCliEmailReg.Value);
        AddEmails(sl1, tCliEmailTec.Value);
        AddEmails(sl1, tCliMessenger.Value);
      end else
      if tAutTipo.Value <> taFreePremium then begin
        AddEmails(sl2, tCliEmailReg.Value);
        AddEmails(sl2, tCliEmailTec.Value);
        AddEmails(sl2, tCliMessenger.Value);
      end;  
      tCli.Next;
      Application.ProcessMessages;
    end;
    for I := sl2.Count - 1 downto 0 do
      if sl1.IndexOf(sl2[i])>=0 then
        sl2.Delete(i);
    sl2.SaveToFile('c:\meus programas\nexcafe\emails_nexcafe.txt');    
    ShowMessage('E-mails Exportados = ' + IntToStr(sl2.Count));
  finally
    sl1.Free;
    sl2.Free;
  end;
end;

end.
