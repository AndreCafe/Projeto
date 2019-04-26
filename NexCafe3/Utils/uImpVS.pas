unit uImpVS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, nxdb, nx1xAllEngines, nxsdServerEngine, nxsrServerEngine,
  nxllTransport, nxptBasePooledTransport, nxtwWinsockTransport, nxllComponent,
  Grids, DBGrids, DBCtrls, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, cxPC,
  cxControls, Dbf, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

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
    tCliObs: TMemoField;
    tCliEmail: TMemoField;
    DataSource1: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    cxTabSheet3: TcxTabSheet;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    DBGrid3: TDBGrid;
    DataSource3: TDataSource;
    Panel2: TPanel;
    cbTab: TComboBox;
    btnABre: TButton;
    Button1: TButton;
    Button2: TButton;
    dbI: TnxDatabase;
    tRG: TnxTable;
    tRGIDPESSOA: TIntegerField;
    tRGREFERENCIA: TStringField;
    tDataNasc: TnxTable;
    tDataNascIDPESSOA: TIntegerField;
    tDataNascDATA: TDateTimeField;
    tPessoa: TnxTable;
    tPessoaIDPESSOA: TIntegerField;
    tPessoaNOMEFANTASIA: TStringField;
    tPessoaNOMECOMPLETO: TStringField;
    tPessoaTPPESSOA: TStringField;
    tPessoaBINATIVA: TSmallintField;
    tPessoaIDINC: TIntegerField;
    tPessoaDHINC: TDateTimeField;
    tPessoaIDALT: TIntegerField;
    tPessoaDHALT: TDateTimeField;
    tLogin: TnxTable;
    tLoginIDLOGIN: TIntegerField;
    tLoginLOGIN: TStringField;
    D: TDbf;
    DNOME: TStringField;
    DUSERNAME: TStringField;
    DCODIGO: TFloatField;
    DSTATUS: TStringField;
    DTIPO: TStringField;
    DDEBITO: TStringField;
    DCREDTEMPO: TStringField;
    DCREDVALOR: TStringField;
    DPASSAPORTE: TStringField;
    DDATANASC: TDateField;
    DTUSADO: TStringField;
    DSENHA: TStringField;
    DRG: TStringField;
    DENDERECO: TStringField;
    DBAIRRO: TStringField;
    DCIDADE: TStringField;
    DUF: TStringField;
    DCEP: TStringField;
    DSEXO: TStringField;
    DEMAIL: TStringField;
    DTELEFONE: TStringField;
    DESCOLA: TStringField;
    DNICKNAME: TStringField;
    DCELULAR: TStringField;
    DDTINC: TDateField;
    DLIMITEDEB: TStringField;
    DINCPOR: TStringField;
    DALTERACAO: TDateField;
    DALTERADOPO: TStringField;
    DTITELEITOR: TStringField;
    DPAI: TStringField;
    DPDISP: TStringField;
    DPACUMULADO: TStringField;
    DPRESG: TStringField;
    DMAE: TStringField;
    tSaldo: TnxTable;
    tSaldoIDCLI: TIntegerField;
    tSaldoSLD: TCurrencyField;
    cbZerar: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    OffSet: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses ncClassesBase;

{$R *.dfm}

function StrToCurrency(S: String): Currency;
var 
  Code : Integer;
  Res: Real;
begin
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

procedure TForm16.Button1Click(Sender: TObject);
var 
  SL: TStrings;
  I, Min, Cod: Integer;
  S, s2: String;
  Mon : Currency;
  DT: TDateTime;
  Code : Word;

function ProxCampo: String;
var P: Integer;
begin
  P := Pos(',', S);
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
  PB.Max := tPessoa.RecordCount;
  PB.Position := 0;
  tCli.Open;
  OffSet := 0;
  if cbZerar.Checked then
    tCli.EmptyTable
  else 
  if tCli.RecordCount>0 then begin
    tCli.IndexName := 'IID';
    tCli.Last;
    OffSet := tCliID.Value;
  end;
//  ShortDateFormat := 'DD-MM-yyyy';
  tPessoa.Open;
  tPessoa.First;
  while not tPessoa.Eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := tPessoaIDPEssoa.Value + OffSet;
    tCliNome.Value := tPessoaNomeFantasia.Value + ' ' + tPessoaNomeCompleto.Value;
    tCliIncluidoEm.Value := Date;
    tCliIncluidoPor.Value := 'admin';
    tCliInativo.Value := False;
    tCliSexo.Value := 'M';
    tCli.Post;
    tPessoa.Next;
  end;

  PB.Position := 0;
  PB.Max := tLogin.RecordCount;
  tLogin.First;
  while not tLogin.Eof do begin
    PB.Position := PB.Position + 1;
    if tCli.FindKey([tLoginIDLogin.Value+OffSet]) then begin
      tCli.Edit;
      tCliUsername.Value := tLoginLogin.Value;
      tCli.Post;
    end;
    tLogin.Next;
  end;

  PB.Position := 0;
  PB.Max := tDataNasc.RecordCount;
  tDataNasc.First;
  while not tDataNasc.Eof do begin
    PB.Position := PB.Position + 1;
    if tCli.FindKey([tDataNascIDPessoa.Value+OffSet]) then begin
      tCli.Edit;
      tCliDataNasc.Value := tDataNascData.Value;
      tCli.Post;
    end;
    tDataNasc.Next;
  end;

  PB.Position := 0;
  PB.Max := tRG.RecordCount;
  tRG.First;
  while not tRG.Eof do begin
    PB.Position := PB.Position + 1;
    if tCli.FindKey([tRGIDPessoa.Value+OffSet]) then begin
      tCli.Edit;
      tCliRG.Value := tRGReferencia.Value;
      tCli.Post;
    end;
    tRG.Next;
  end;

  tSaldo.Open;
  PB.Position := 0;
  PB.Max := tSaldo.RecordCount;
  while not tSaldo.Eof do begin
    PB.Position := PB.Position + 1;
    if (tSaldoSld.Value>0.0000001) and tCli.FindKey([tSaldoIDCLI.Value+OffSet]) then begin
      tCli.Edit;
      tCliValorCred.Value := tSaldoSld.Value;
      tCli.Post;
    end;
    tSaldo.Next;
  end;

  ShowMessage('Fim de importação');
end;

procedure TForm16.Button2Click(Sender: TObject);
begin
  D.Open;
  PB.Max := D.RecordCount;
  PB.Position := 0;
  tCli.Open;
  tCli.EmptyTable;
//  ShortDateFormat := 'DD-MM-yyyy';
  D.First;
  while not D.Eof do begin
    PB.Position := PB.Position + 1;
    Application.ProcessMessages;
    tCli.Insert;
    tCliID.Value := Trunc(Dcodigo.Value);
    tCliNome.Value := DNome.Value;
    tCliEndereco.Value := DEndereco.Value;
    tCliBairro.Value := DBairro.Value;
    tCliCidade.Value := DCidade.Value;
    tCliUF.Value := DUF.Value;
    tCliCEP.Value := DCEP.Value;
    tCliNasc.Value := DDataNasc.Value;
    tCliSexo.Value := DSexo.Value;
    tCliRg.Value := DRG.Value;
    tCliTelefone.Value := DTelefone.Value;
    try
      tCliMinutos.Value := DCredTempo.AsFloat;
    except
    end;
    tCliIsento.Value := False;
    tCliUsername.Value := DUsername.Value;
    tCliPai.Value := DPai.Value;
    tCliMae.Value := DMae.Value;
    tCliSenha.Value := DSenha.Value;
    tCliEscola.Value := DEscola.Value;
    tCliNickName.Value := DNickName.Value;
    tCliDataNasc.Value := DDataNasc.Value;
    tCliCelular.Value := DCelular.Value;
    tCliTemDebito.Value := False;
    tCliInativo.Value := False;
    tCliTipoAcessoPref.Value := -1;
    tCliValorCred.Value := 0;
    tCliEmail.Value := DEmail.Value;
    tCli.Post;
    D.Next;
  end;
  ShowMessage('fim');
end;

end.
