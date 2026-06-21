unit ursDMOpen;

interface

uses
  SysUtils, Classes, nxdb, nxllComponent, DB;

const
  MaxOpenItems = 20;  

type
  TCacheOpen = record
    aIP: String;
    aDT: TDateTime;
  end;
  
  TdmOpen = class(TDataModule)
    tIPLoja: TnxTable;
    tIPLojaIP: TStringField;
    tIPLojaLoja: TIntegerField;
    tIPLojaDH: TDateTimeField;
    nxSession: TnxSession;
    nxDB: TnxDatabase;
    tOpenStatL: TnxTable;
    tCli: TnxTable;
    tCliCodigo: TAutoIncField;
    tCliRedirU: TDateTimeField;
    tCliRedirT: TIntegerField;
    tCliRedirI: TDateTimeField;
    tOpenStatH: TnxTable;
    tOpenStatLLoja: TIntegerField;
    tOpenStatLAno: TWordField;
    tOpenStatLMes: TWordField;
    tOpenStatLDia: TWordField;
    tOpenStatHH: TWordField;
    tOpenStatHAno: TWordField;
    tOpenStatHMes: TWordField;
    tOpenStatHDia: TWordField;
    tOpenStatLQtd: TWordField;
    tOpenStatHQtd: TIntegerField;
    tCliEmailConta: TStringField;
  private
    { Private declarations }
    procedure CheckOpen;
    procedure _IncOpen(aIP, aConta: String; DT: TDateTime);
    procedure IncOpen2(aIPs: String);
  public
    procedure IncOpen(aIP, aConta: String);
    { Public declarations }
  end;

var
  dmOpen: TdmOpen;

implementation

uses uObjPool, nr_db_conn, nrDebug, NR_WebServ_DM;

{$R *.dfm}

procedure TdmOpen.CheckOpen;
begin
  if nxSession.ServerEngine=nil then begin
    nxDB.AliasName := 'Registro';
    Start_DBConn(nxSession);
  end;
    
  try
    tOpenStatL.Active := False;
    tOpenStatH.Active := False;
    tIPLoja.Active := False;
    tCli.Active := False;
    tOpenStatL.Active := True;
    tOpenStatH.Active := True;
    tIPLoja.Active := True;
    tCli.Active := True;
  except
    Start_DBConn(nxSession, True);
    tOpenStatL.Active := True;
    tOpenStatH.Active := True;
    tIPLoja.Active := True;
    tCli.Active := True;
  end;
end;

procedure TdmOpen.IncOpen(aIP, aConta: String);
begin
  CheckOpen;

  InitTran(nxDB, [tOpenStatL, tOpenStatH, tCli, tIPLoja], True);
  try
    _IncOpen(aIP, aConta, Now);
    nxDB.Commit;
  finally
    if nxDB.InTransaction then 
      nxDB.Rollback;
  end;
end;

procedure TdmOpen.IncOpen2(aIPs: String);
var 
  D: TDateTime;
  H, M, S, MS: Word;
begin
{  CheckOpen;
  InitTran(nxDB, [tOpenStat], True);
  try
    D := Date;
    tIPLoja.Active := True;
    tOpenStat.Active := True;
    DecodeTime(Now, H, M, S, MS);
    if not tOpenStat.FindKey([D, aIP, H]) then begin
      tOpenStat.Insert;
      tOpenStatData.Value := D;
      tOpenStatIP.Value := aIP;
      tOpenStatH.Value := H;
  
    end else
      tOpenStat.Edit;
      
    if (tOpenStatLoja.Value=0) and tIPLoja.FindKey([aIP]) then
      tOpenStatLoja.Value := tIPLojaLoja.Value;
      
    tOpenStatQtd.value := tOpenStatQtd.Value + 1;
    tOpenStat.Post;
    nxDB.Commit;
  finally
    if nxDB.InTransaction then 
      nxDB.Rollback;
  end;}
end;

const
  BoolStr : Array[Boolean] of String = ('N', 'S');
  
procedure TdmOpen._IncOpen(aIP, aConta: String; DT: TDateTime);
var 
  D: TDateTime;
  Dia, Mes, Ano: Word;
  H, M, S, MS : Word;
  Loja: Cardinal;
  Achou : Boolean;
begin
  if gDebugIncOpen then
    DebugMsg('TdbOpen._IncOpen - aIP: ' + aIP + ' - aConta: ' + aConta);
  D := Int(DT);
  tIPLoja.Active := True;
  tOpenStatL.Active := True;
  tOpenStatH.Active := True;
  tCli.Active := True;
  DecodeTime(DT, H, M, S, MS);
  DecodeDate(DT, Ano, Mes, Dia); 
  if Ano>2000 then
    Ano := Ano - 2000 else
    Ano := 0;
  if not tOpenStatH.FindKey([Ano, Mes, Dia, H]) then begin
    tOpenStatH.Insert;
    tOpenStatHAno.Value := Ano;
    tOpenStatHMes.Value := Mes;
    tOpenStatHDia.Value := Dia;
    tOpenStatHH.Value := H;
  end else
    tOpenStatH.Edit;
  tOpenStatHQtd.Value := tOpenStatHQtd.Value + 1;
  tOpenStatH.Post;

  Achou := False;
  if aConta>'' then begin
    tCli.IndexName := 'IEmailConta';
    Achou := tCli.FindKey([aConta]);
    if gDebugIncOpen then
      DebugMsg('TdbOpen._IncOpen - Achou 1: ' + BoolStr[Achou]);
  end;

  if not Achou then    
  if tIPLoja.FindKey([aIP]) then begin
    Loja := tIPLojaLoja.Value;
    tCli.IndexName := 'ICodigo';
    Achou := tCli.FindKey([Loja]);
    if gDebugIncOpen then
      DebugMsg('TdbOpen._IncOpen - Achou 2: ' + BoolStr[Achou]);
  end;

  if Achou then begin  
    Loja := tCliCodigo.Value;
    if gDebugIncOpen then
      DebugMsg('TdbOpen._IncOpen - Achou 3 - Loja: ' + IntToStr(Loja));
    tCli.Edit;
    tCliRedirU.Value := Now;
    tCliRedirT.Value := tCliRedirT.Value + 1;
    if tCliRedirI.IsNull then 
      tCliRedirI.Value := tCliRedirU.Value;
    tCli.Post;
    if gDebugIncOpen then
      DebugMsg('TdbOpen._IncOpen - Achou 4 - Loja: ' + IntToStr(Loja));
  end else begin
    Loja := 0;
    if gDebugIncOpen then
      DebugMsg('TdbOpen._IncOpen - Nao Achou');
  end;

  if not tOpenStatL.FindKey([Loja, Ano, Mes, Dia]) then begin
    tOpenStatL.Insert;
    tOpenStatLLoja.Value := Loja;
    tOpenStatLAno.Value := Ano;
    tOpenStatLMes.Value := Mes;
    tOpenStatLDia.Value := Dia;
  end else
    tOpenStatL.Edit;
  tOpenStatLQtd.value := tOpenStatLQtd.Value + 1;
  tOpenStatL.Post;
end;

end.
