unit ncServBase;

interface

{$I Nex.Inc}

uses
  ulogs,
  kbmMemtable,
  ncServBD,
  WinSock,
  WinProcs,
  ncServAtualizaLic_Indy,
  Classes,
  SysUtils,
  ExtCtrls,
  Windows,
  Messages,
  IniFiles,
  Variants,
  Db,
  nxdb,
  nxsdTypes,
  nxdbBase,
  FileCtrl,
  SyncObjs,
  Forms,
  ClasseCS,
  ncErros,
  ScktComp,
  uLicEXECryptor,
  ncMsgCom,
  ncEspecie,
  ncMovEst,
  ncDebito,
  ncCredTempo,
  ncClassesBase,
  ncPassaportes,
  ncTarifador,
  ncTran,
  ncImpressao,
  ncSessao,
  ncJob,
  ncListaID,
  ncIDRecursos,
  ncVersionInfo,
  ncCommPlusIndy,
  ncPrintMon,
  ncTipoImp,
  ncsPrintPDF,
  ncPrintDoc,
  ncUploadMain;
  
type  
  THackTMClasse = class ( TncClasse );

  TncServidor = class ( TncServidorBase )
  private
    FMonitor      : TncPrintersMonitor;
    
    FAtualizaLic  : TThreadAtualizaLic;
    FFuncAtual    : String;
    FServErro     : String;
    FServAtivo    : Boolean;

    FMaquinas     : TncListaMaquinas;
    FUsuarios     : TncListaUsuarios;
    FSessoes      : TncSessoes;
    FJobs         : TncJobs;
    FPrintDocs    : TncPrintDocs;
    FPrintDocsP   : TStrings;
    FTimerRecalcP : TTimer;
    FTimerPlus    : TTimer;
    FTimerApek    : TTimer;
    FiniApek      : TIniFile;
    FNotifyHWND   : HWND;

    FUpLoad : TncUploadThread;

    FPDFPrintMgr  : TncPDFPrintManager;

    procedure EnviaEventoStreamObj(Mensagem: Integer; Obj: TncClasse);
    function EnviarEventos: Boolean; override;

    procedure OnTerminouUpdAll(Sender: TObject);
    procedure OnTimerUpdAll(Sender: TObject);
    procedure OnTimerApek(Sender: TObject);

    procedure CriaTimerUpdAll(aInterval: Cardinal);

    procedure OnRefreshUrls(Sender: TObject);

    function AtualizaMaquinaBD(Maq: TncMaquina): Integer;
    function AtualizaUsuarioBD(Usuario: TncUsuario): Integer;
    function AtualizaTipoImpBD(T: TncTipoImp): Integer;
    function AtualizaEspecieBD(E: TncEspecie): Integer;
    function AtualizaSessaoBD(Sessao: TncSessao): Integer;
    function AtualizaTipoAcessoBD(TA: TncTipoAcesso): Integer;
    function AtualizaTarifaBD(T: TncTarifa): Integer;
    function AtualizaConfigBD: Integer;

    procedure OnTimerRecalcP(Sender: TObject);
    procedure OnTimerPlus(Sender: TObject);

    procedure JobNotification( const jobinfo: TncJob );
    procedure _JobNotification( const jobinfo: TncJob );


    procedure RefreshJobs;

  protected

    procedure AoCriarObj(Obj: TncClasse); virtual;
    procedure AoAlterarObj(Obj: TncClasse); virtual;
    procedure AoDestruirObj(Obj: TncClasse); virtual;

    function ObtemLista(aTipoClasse: Integer): TListaClasseCS; override;

    procedure SetAtivo(Valor: Boolean); override;

    procedure CriaServidorBD;
    procedure DestroiServidorBD;

    procedure LoadPrintDocs;

    procedure Notificacao(Obj: TncClasse; TipoNot: TTipoNotificacao);

    procedure AoRemoverCliente(Cliente: TncCliente); override;
    procedure LeMaquinaBD(Maq: TncMaquina);
    procedure LeSessaoBD(Sessao: TncSessao);
    procedure CorrigeAutoInc;
    procedure StartRecVer;

    procedure wmRegistraPaginasImpressas(var Msg: TMessage); message wm_registrapag;
    procedure wmProcessaCotas(var Msg: TMessage); message wm_processacotas;
    procedure wmSiteBloqueado(var Msg: TMessage); message ncmc_SiteBloqueado;
    procedure wmProcessaPlus(var Msg: TMessage); message wm_processaplus;
    procedure wmAbreServ(var Msg: TMessage); message wm_abreserv;
    procedure wmAlterouCHorario(var Msg: TMessage); message wm_alterouchorario;
    procedure wmRemoveSession(var Msg: TMessage); message wm_removesession;
    procedure wmAutoPrintPDF(var Msg: TMessage); message wm_autoprintpdf;
    procedure wmRefreshUrls(var Msg: TMessage); message wm_refreshurls;


    procedure CriaNotifyWindow;

    procedure LigaMaq(M: TncMaquina);

    procedure LoadCotas(J: TncJob);
    procedure ProcessaCotas(J: TncJob);

    function RegistraPaginasImpressasEsp(aJobID: Cardinal; aMaq: Word; aPaginas: Integer; aImp, aDoc: String; aForce: Boolean): Integer;

  public


    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CriaClasseCS(TipoClasse: Integer): TClasseCS;
    function CriaMaquina(InsereLista: Boolean): TncMaquina; virtual;
    function CriaSessao(InsereLista: Boolean): TncSessao; virtual;
    function CriaUsuario(InsereLista: Boolean): TncUsuario; virtual;
    function CriaTipoAcesso(InsereLista: Boolean): TncTipoAcesso; virtual;
    function CriaTarifa(InsereLista: Boolean): TncTarifa; virtual;
    function CriaJob(InsereLista: Boolean): TncJob; virtual;
    function CriaPrintDoc(InsereLista: Boolean): TncPrintDoc; virtual;
    function CriaTipoImp(InsereLista: Boolean): TncTipoImp; virtual;
    function CriaEspecie(InsereLista: Boolean): TncEspecie; virtual;
    function BDAtivo : Boolean;

    function ArqFundoEnviado(NomeArq: String): Integer; override;
    function ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer; override;
    function SalvaSenhaCli(Codigo: Integer; Senha: String): Integer; override;
    function LimpaFundo(Desktop: Boolean): Integer; override;

    function SalvaApp(aApp: String): Integer; override;

    procedure ImpCacheTimer(Sender: TObject);

    function SalvaClientPages(aPrinter: String; aJobID: Cardinal; aMaquina, aPaginas: Word): integer; override;
    function JobControl(aPrinterIndex: Integer; aJobID: Cardinal; aControl: Byte): integer; override;
    
    function AbreCaixa(aFunc: String; aSaldo: Currency; var NovoCx: Integer): Integer; override;
    function FechaCaixa(aFunc: String; aSaldo: Currency; aID: Integer): Integer; override;
    function CorrigeDataCaixa(aFunc: String; aID: Integer; aNovaAbertura, aNovoFechamento: TDateTime): integer; override;
    function AjustaPontosFid(aFunc: String; aCliente: Integer; aFator: Smallint; aPontos: Double; aObs: String): Integer; override;
    
    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; override;
    function ObtemStreamAvisos(S: TStream): Integer; override;
    function ObtemStreamConfig(S: TStream): Integer; override;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; override;
    function DisableAD(aSessao: Integer; aDisable: Boolean): Integer; override;

    function SalvaLogAppUrl(S: TStream): Integer; override;

    function ApagaMsgCli(aID: Integer): Integer; override;

    function SalvaProcessos(aIDCliente, aRequest: Integer; aSL: TStrings): Integer; override;

    function ObtemSitesBloqueados(var S: String): Integer; override;
    function PermitirDownload(aSessao: Integer; aExe, aPermitir: Boolean): Integer; override;

    function DesativarFWSessao(aSessao: Integer; aDesativar: Boolean): Integer; override;

    function DesktopSincronizado(aSessao: Integer): Integer; override;
    
    function ShutdownMaq(aMaq, aOper: Word): integer; override;
    function SuporteRem(aMaq, aTec: Word): Integer; override;
    
    function EnviarMsg(const aDe, aPara: Integer; const aTexto: String): Integer; override;
    
    function ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer; S: TStream): Integer; override;
    
    function Login(aUsername, 
                   aSenha: String; 
                   aMaq: Word;
                   aFuncAtual: Boolean;
                   aRemoto: Boolean; 
                   aWndHandle: HWND; 
                   aProxyHandle: Integer; 
                   aSocket: Integer;
                   aSessionID: Integer;
                   aIP: String;
                   var Handle: Integer): Integer; override;

    function LoginMaq(aSessao: TObject): Integer; override;
    function AlteraSessao(aSessao: TObject): Integer; override;
    function CancelaTran(aID: Integer; aFunc: String): Integer; override;
    function ForceRefreshSessao(aSessao: Integer): Integer; override;

    function SalvaCredTempo(aObj: TObject): Integer; override;
    function SalvaMovEst(aObj: TObject): Integer; override;
    function SalvaDebito(aObj: TObject): Integer; override;
    function SalvaImpressao(aObj: TObject): Integer; override;
    function SalvaLancExtra(aObj: TObject): Integer; override;
    function SalvaDebTempo(aObj: TObject): Integer; override;

    function ObtemPatrocinios(aSL: TStrings): Integer; override;
    
    function AdicionaPassaporte(aMaq: Word; aSenha: String): Integer; override;

    function RegistraPaginasImpressas(aJobID: Cardinal; aMaq: Word; aPaginas: Integer; aImp, aDoc: String): Integer; override;
                      
    function LogoutMaq(aMaq: Word): Integer; override;
    
    function PararTempoMaq(aMaq: Word; aParar: Boolean): Integer; override;

    function TransferirMaq(aOrigem, aDestino: Word): Integer; override;

    function ModoManutencao(aMaq: Word; aUsername, aSenha: String; aEntrar: Boolean): Integer; override;
    
    function PreLogoutMaq(aMaq: Word): Integer; override;
    function CancLogoutMaq(aMaq: Word): Integer; override;

    function Permitido(U: TncUsuario; TipoAcesso: Integer): Boolean;
    function TodosPerm(TipoAcesso: Integer): Boolean;

    function RefreshPrecos: integer; override;
    function RefreshEspera: Integer; override;

    function SalvaLic(aLic: String): Integer; override;

    function ObtemVersaoGuard(var Versao: Integer): Integer; override;

    function StartPrintTransfer(aArqInfo: TStrings; var aPos: Int64): Integer; override;
    function SendPTBlock(aArq: TGUID; aLast: Boolean; aTamanho: Integer; aPos: Int64; aBlock: Pointer): Integer; override;
    function PrintDocControl(aInfo: TStrings): integer; override;

    function GetPrintDocStream(aArq: TGUID; aPos: Integer; var aTamTotal, aTamBlock: Int64; var aLast: Boolean; aStream: TStream): integer; override;
    function PrintDoc(aArqInfo: TStrings): integer; override;
    
    procedure ChecaNumMaq(QtdL: Integer; aConta, aCodEquip: String; aSC: TStatusConta);

    procedure AtualizaPubPar(P : TmsgPubPar);

    property ErroBD: String
      read FServErro;

    property Maquinas: TncListaMaquinas
      read FMaquinas;  

    property Usuarios: TncListaUsuarios
      read FUsuarios;  

    property Sessoes: TncSessoes
      read FSessoes;  
  end;

  TncImpCache = record
   icJobID: Cardinal; 
   icMaq: Word; 
   icPaginas: Integer; 
   icImp : String;
   icDoc : String
  end;
  PncImpCache = ^TncImpCache;

  
const
  WndClassName = 'TncServBaseClassName';  
  
var
  CCP_Off : Boolean = False; // CCP = Cadastro Colaborativo de Produtos ... 


resourcestring
  rsPretoEBranco = 'Preto e Branco';
  rsDinheiro = 'Dinheiro';
  rsCartaoCred = 'Cartão de Crédito';
  rsCartaoDeb = 'Cartão de Débito';
  rsCheque = 'Cheque';
  
  

implementation

uses
  nxllStreams,
  WinSpool,
  ncFrmProgress,
  ncTableDefs,
  ncAuxPassaporte, 
  kbmUtils,
  ncDMServ, 
  ncDMCaixa, 
  ncDMProcEmail, 
  ncLancExtra, 
  ncDebTempo, 
  ncVersoes, 
  ncDebug, 
  ncDMEmail, 
  ncSyncLic,
  synamisc,
  {ncsRecalcPass,} ncAppUrlLog, ncDMcommPlus, ncPRConsts,
  nxsrServerEngine, nxptBasePooledTransport, nexUrls;


{ TncServidor }

function ApekFName: String;
begin
  Result := ExtractFilePath(ParamStr(0))+'apek_gc_status.ini';
end;

procedure TncServidor.Notificacao(Obj: TncClasse; TipoNot: TTipoNotificacao);
begin
  DebugMsg('TncServidor.Notificacao 1');
  case TipoNot of
    tnCriacao   : AoCriarObj(Obj);
    tnAlteracao : AoAlterarObj(Obj);
    tnDestruicao: AoDestruirObj(Obj);
  end;
  DebugMsg('TncServidor.Notificacao 2');
end;

constructor TncServidor.Create(AOwner: TComponent);
var S : String;
begin
  inherited;
  DebugMsg('TncSevidor.Create - 1');
  FiniApek := nil;

  gUrls.KeepRefreshing;
  gUrls.OnRefresh := OnRefreshUrls;
  
  FTimerApek := TTimer.Create(nil);
  FTimerApek.OnTimer := OnTimerApek;
  FTimerApek.Enabled := False;
  FTimerApek.Interval := 5000;
  FPDFPrintMgr  := TncPDFPrintManager.Create;
  FServErro := '';
  LadoServidor := True;
  FMonitor := nil;
  S := ExtractFilePath(ParamStr(0)) + 'Atualiza';
  DebugMsg('TncSevidor.Create - 2 - '+S);
  
  if not DirectoryExists(S) then
    MkDir(S);

  DebugMsg('TncSevidor.Create - 3');
    
  
  FFuncAtual     := '';

  THackTMClasse(gConfig).ProcNotificar := Notificacao;

  DebugMsg('TncSevidor.Create - 4');
  
  
  FTimerRecalcP := TTimer.Create(nil);
  FTimerRecalcP.Interval := 5*60*1000;
  FTimerRecalcP.Enabled := False;
  FTimerRecalcP.OnTimer := OnTimerRecalcP;

  FTimerPlus := TTimer.Create(nil);
  FTimerPlus.Interval := 10000;
  FTimerPlus.Enabled := False;
  FTimerPlus.OnTimer := OnTimerPlus;
  

  DebugMsg('TncSevidor.Create - 5');
  
  FSessoes       := TncSessoes.Create(tcSessao);
  FSessoes.CriaClasse := CriaClasseCS;

  DebugMsg('TncSevidor.Create - 6');
  
  
  FMaquinas      := TncListaMaquinas.Create;
  FMaquinas.CriaClasse := CriaClasseCS;

  DebugMsg('TncSevidor.Create - 7');
  
  
  FUsuarios      := TncListaUsuarios.Create;
  FUsuarios.CriaClasse := CriaClasseCS;

  DebugMsg('TncSevidor.Create - 8');
  

  FJobs := TncJobs.Create(tcJob);
  FJobs.CriaClasse := CriaClasseCS;

  FPrintDocs := TncPrintDocs.Create(tcPrintDoc);
  FPrintDocs.CriaClasse := CriaClasseCS;

  FPrintDocsP := TStringList.Create;

  gTiposImp.CriaClasse := CriaClasseCS;

  gEspecies.CriaClasse := CriaClasseCS;

  DebugMsg('TncSevidor.Create - 9');
  

  gTiposAcesso.CriaClasse := CriaClasseCS;

  gTarifas.CriaClasse := CriaClasseCS;

  CriaNotifyWindow;

  DebugMsg('TncSevidor.Create - 10');
  
end;

destructor TncServidor.Destroy;
begin
  DebugMsg('TncServidor.Destroy - 1');
  Lock;
  try

    gUrls.OnRefresh := nil;
    DebugMsg('TncServidor.Destroy - 2');
    DestroyWindow(FNotifyHWND);
    THackTMClasse(gConfig).ProcNotificar := nil;
    DebugMsg('TncServidor.Destroy - 3');
    FMaquinas.Limpa;
    FTimerApek.Free;
    if Assigned(FiniApek) then FreeAndNil(FiniApek);
    DebugMsg('TncServidor.Destroy - 4');
    FMaquinas.Free;
    DebugMsg('TncServidor.Destroy - 5');
    FUsuarios.Limpa;
    DebugMsg('TncServidor.Destroy - 6');
    FUsuarios.Free;
    DebugMsg('TncServidor.Destroy - 7');
    FJobs.Free;
    FPrintDocs.Free;
    DebugMsg('TncServidor.Destrou - 8');
    DestroiServidorBD;
    DebugMsg('TncServidor.Destroy - 9');
    FTimerRecalcP.Free;
    FTimerPlus.Free;
    FPDFPrintMgr.Free;
    FPrintDocsP.Free;
  finally
    Unlock;
  end;
  inherited;
end;

function TncServidor.ObtemLista(aTipoClasse: Integer): TListaClasseCS;
begin
  case aTipoClasse of
    tcMaquina : Result := Maquinas;
    tcUsuario : Result := Usuarios;
    tcTipoAcesso : Result := gTiposAcesso;
    tcTarifa : Result := gTarifas;
    tcSessao : Result := Sessoes;
    tcJob : Result := FJobs;
    tcPrintDoc : Result := FPrintDocs;
    tcTipoImp : Result := gTiposImp;
    tcEspecie : Result := gEspecies;
  else
    Result := nil;
  end;    
end;

function TncServidor.ObtemPatrocinios(aSL: TStrings): Integer;
begin
  result := 0;
  DM.ObtemPatrocinios(aSL);
end;

function TncServidor.ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer;
  S: TStream): Integer;
var 
  L : TListaClasseCS;  
  P : String;
begin
  P := '0';
  try
    P := '1';
    L := ObtemLista(TipoClasse);
    P := '2';
    if L = nil then
      Result := ncerrTipoClasseInvalido
    else begin
      P := '3';
      L.SalvaStream(S);
      P := '4';
      Result := 0;
      P := '5';
    end;  
  except
    on e: exception do begin
      DebugMsg('TncServidor.ObtemStreamListaObj - Cliente: ' + IntToStr(Cliente) +
               ' - TipoClasse: ' + IntToStr(TipoClasse) +
               ' - Exception '+P+': ' + E.Message);
       Result := ncerrExcecaoNaoTratada_TncServidor_ObtemStreamListaObj;
       glog.LogCriticalException(self,Result, e, 'TncServidor.ObtemStreamListaObj - Cliente: ' + IntToStr(Cliente) +
               ' - TipoClasse: ' + IntToStr(TipoClasse));
    end;
  end;    
end;

function TncServidor.ObtemVersaoGuard(var Versao: Integer): Integer;
begin
  Result := 0;
  Versao := GetVersionBuild(GetVersionInfo(ExtractFilePath(ParamStr(0)) + 'Atualiza\nexguard.exe'));
end;

procedure TncServidor.OnRefreshUrls(Sender: TObject);
begin
  PostMessage(FNotifyHWND, wm_refreshurls, 0, 0);
end;

procedure TncServidor.OnTerminouUpdAll(Sender: TObject);
var 
  aInterval: Cardinal;
  UA : TplusReqUpdateAll;
begin
  UA := TplusReqUpdateAll(Sender);
  if UA.Sucesso and Self.Ativo then begin
    DebugMsg('TncServidor.OnTerminouUpdAll - Sucesso = True');
    TThreadUpdateAll.Create(UA, dmServidorBD.ServerEngine);
  end else
  try
    DebugMsg('TncServidor.OnTerminouUpdAll - Sucesso = '+BoolStr[UA.Sucesso] + ' - Ativo: '+BoolStr[Ativo]);
    if UA.Tag = 2000 then Exit;
    aInterval := UA.Tag + 10000;
    if aInterval > 600000 then aInterval := 600000;
    CriaTimerUpdAll(aInterval);
  finally
    TplusReqUpdateAll(Sender).Destruir;
  end;
end;

function Cripta(Entrada: string): string;
var
   aux: string;
   i, j, k: integer;
begin
     aux:= '';
     randomize;
     i:= 1;
     while i<= length(entrada) do
     begin
          j:= 0;
          k:= random(9);
          case k of
          0: j:= 3;
          1: j:= 4;
          2: j:= 5;
          3: j:= 0;
          4: j:= 2;
          5: j:= 1;
          6: j:= 8;
          7: j:= 6;
          8: j:= 9;
          9: j:= 7;
          end;
          aux:= aux+inttostr(j)+chr(ord(entrada[i])+k);
          i:= i+1;
     end;
     cripta:= aux;
end;

procedure TncServidor.OnTimerApek(Sender: TObject);
var 
  I : Integer;
  S : TncSessao;
  sl : TStrings;
begin
  FTimerApek.Enabled := False;
  SL := TStringList.Create;
  if not Assigned(FiniApek) then Exit;
  try
    Lock;
    try
      for I := 0 to FMaquinas.Count - 1 do begin
        S := FSessoes.PorMaq[FMaquinas[I].Numero];
        if (S=nil) or S.Encerrou or (S.MotivoPausa<>mpNaoEstaPausado) then
          sl.Values[IntToStr(FMaquinas[I].Numero)] := '0' else
          sl.Values[IntToStr(FMaquinas[I].Numero)] := '1';
      end;
    finally
      Unlock;
    end;
    FiniApek.WriteString('GERAL','chave',cripta(FormatDateTime('ddmmyyyy',Date)+FormatDateTime('hhmm',Time)));
    for I := 0 to sl.Count-1 do 
      FiniApek.WriteString('Maquinas', sl.Names[I], sl.ValueFromIndex[i]);
  finally
    Sl.Free;
    FTimerApek.Enabled := True;
  end;
end;

procedure TncServidor.OnTimerPlus(Sender: TObject);
var Msg: TMessage;
begin
  DebugMsg('TncServidor.OnTimerPlus');
  FTimerPlus.Enabled := False;
  Exit;
  
  wmProcessaPlus(Msg);
end;

procedure TncServidor.OnTimerRecalcP(Sender: TObject);
begin
  Lock;
  try
    FTimerRecalcP.Enabled := False;
    try
      //TThreadRecalcPass.Create(False).FreeOnTerminate := True;
    finally
      FTimerRecalcP.Interval := 5*60*1000;
      FTimerRecalcP.Enabled := FServAtivo;
    end;
  finally
    Unlock;
  end;
end;

procedure TncServidor.OnTimerUpdAll(Sender: TObject);
begin
  DebugMsg('TncServidor.OnTimerUpdAll');
  try
    with TplusReqUpdateAll.Create do begin
      OnTerminate := OnTerminouUpdAll;
      Tag := TTimer(Sender).Interval;
      Executar;
      if Tag=2090 then Exit;
    end;
  finally
    Sender.Free;
  end;
end;

procedure TncServidor.AoDestruirObj(Obj: TncClasse);
var 
  Msg : PmsgDestroiObj;
begin
  try DebugMsg('TncServidor.AoDestruirObj - TipoClasse: '+IntToStr(Obj.TipoClasse)); except end;
  
  case Obj.TipoClasse of
    tcMaquina     : FMaquinas.Remove(Obj);
    tcUsuario     : FUsuarios.Remove(Obj);
    tcTipoAcesso  : gTiposAcesso.Remove(Obj);
    tcTarifa      : gTarifas.Remove(Obj);
    tcSessao      : FSessoes.Remove(Obj);
    tcJob         : FJobs.Remove(Obj);
    tcPrintDoc    : FPrintDocs.Remove(Obj);
    tcTipoImp     : gTiposImp.Remove(Obj);
    tcEspecie     : gEspecies.Remove(Obj);
  end;  
  
  if not Ativo then Exit;

  try DebugMsg('TncServidor.AoDestruirObj - Chave: '+IntToStr(Obj.TipoClasse)); except end;
   
  New(Msg);
  Msg^.msgTipoClasse := Obj.TipoClasse;
  Msg^.msgChave := Obj.Chave;
  EnviaEvento(ncmc_DestroiObj, Msg);
  
  inherited;
end;

procedure TncServidor.EnviaEventoStreamObj(Mensagem: Integer; Obj: TncClasse);
var 
  S : TStream;
  Chave : String;
  T : Byte;
  TipoClasse : Integer;
begin
  DebugMsg('TncServidor.EnviaEventoStreamObj 1');
  if (not Ativo) or (not EnviarEventos) then Exit;
  DebugMsg('TncServidor.EnviaEventoStreamObj 2');
  S := TMemoryStream.Create;
  DebugMsg('TncServidor.EnviaEventoStreamObj 3');
  Chave := Obj.Chave;
  DebugMsg('TncServidor.EnviaEventoStreamObj 4');
  TipoClasse := Obj.TipoClasse;
  DebugMsg('TncServidor.EnviaEventoStreamObj 5');
  T := Length(Chave);
  DebugMsg('TncServidor.EnviaEventoStreamObj 6');
  S.Write(TipoClasse, SizeOf(TipoClasse));
  DebugMsg('TncServidor.EnviaEventoStreamObj 7');
  S.Write(T, SizeOf(Byte));
  DebugMsg('TncServidor.EnviaEventoStreamObj 8');
  S.Write(Pointer(Chave)^, T);
  DebugMsg('TncServidor.EnviaEventoStreamObj 9');
  Obj.SalvaStream(S, (Mensagem<>ncmc_NovoObj));
  DebugMsg('TncServidor.EnviaEventoStreamObj 10');
  Obj.AtualizaCache;
  DebugMsg('TncServidor.EnviaEventoStreamObj 11');
  EnviaEvento(Mensagem, S);
  DebugMsg('TncServidor.EnviaEventoStreamObj 12');
end;

function TncServidor.EnviarEventos: Boolean;
begin
  Result := True;
end;

function TncServidor.EnviarMsg(const aDe, aPara: Integer;
  const aTexto: String): Integer;
var 
  S: TStream;
  SL: TStrings;  
begin
  try
    DM.SalvaMsgChat(aDe, aPara, aTexto);
    SL := TStringList.Create;
    try
      S := TMemoryStream.Create;
      SL.Values['de'] := IntToStr(aDe);
      SL.Values['para'] := IntToStr(aPara);
      SL.Values['datahora'] := FormatDateTime('dd/mm/yyyy hh:mm:ss', DM.tChatDataHora.Value);
      SL.Values['id'] := DM.tChatID.AsString;
      SL.Add(aTexto);
      SL.SaveToStream(S);
      S.Position := 0;
      EnviaEvento(ncmc_ChatEv, S);
    finally
      SL.Free;
    end;
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_EnviarMsg;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.FechaCaixa(aFunc: String; aSaldo: Currency; aID: Integer): Integer;
var 
  U : TncUsuario;
  DMC : TdmCaixa;
begin
  try
    U := Usuarios.PorUsername[aFunc];
    if U = nil then begin
      Result := ncerrUsuarioInexistente;
      Exit;
    end;

    if not Permitido(U, daCaiAbrirFechar) then begin
      Result := ncerrAcessoNaoPermitido;
      Exit;
    end;

    DMC := TdmCaixa.Create(nil);
    try
      DMC.nxSession.Active := False;
      DMC.nxSession.ServerEngine := dmServidorBD.ServerEngine;
      DMC.nxDB.AliasName := 'nexcafe';
      DMC.AbreConn;
      Result := DMC.FechaCaixa(aFunc, aSaldo, aID, False);
      if Result=0 then begin
        if gConfig.EmailEnviarCaixa then begin
          DMC.tCriar.Open;
          DMC.tCriar.Insert;
          DMC.tCriarTipo.Value := teFechamentoCaixa;
          DMC.tCriarDestino.Value := gConfig.EmailDestino;
          DMC.tCriarParametros.Value := IntToStr(aID);
          DMC.tCriar.Post;
        end;
        EnviaEvento(ncmc_AbriuFechouCaixa, nil);
      end;
    finally
      DMC.Free;
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_FechaCaixa;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.ForceRefreshSessao(aSessao: Integer): Integer;
var 
  I : Integer;
  S : TncSessao;
begin
  Result := 0;
  try
    for I := 0 to Sessoes.Count-1 do
    if ((aSessao=-1) or (Sessoes[I].ID=aSessao)) and (not Sessoes[I].Encerrou) then
    begin
      S := Sessoes[I];
      S.MinTicksUsados := S.TempoUsado.Ticks;
      S.MinTicksTotal  := S.TicksTotal;
      S.PausaFimTempo(False);
      S.StrPausas    := S.StrPausas;
      if DM.tSessao.Locate('ID', S.ID, []) then begin
        DM.tSessao.Edit;
        S.SalvaDataset(DM.tSessao);
        DM.tSessao.Post;
      end;
  
      DM.RefreshSessao(S);
  
      S.Notificar(tnAlteracao);
      
      if aSessao>0 then Exit;
    end;
  except
  end;
end;

function TncServidor.GetPrintDocStream(aArq: TGUID; aPos: Integer;
  var aTamTotal, aTamBlock: Int64; var aLast: Boolean; aStream: TStream): integer;
var
  F : TFileStream;  
  A : String;
const
  MaxBlockSize = 1024 * 1000;  
begin
  Result := 0;
  try
    A := PRFolder('s') + GuidToString(aArq) + '.pdf';
    if not FileExists(A) then begin
      Result := ncerrArqNaoEncontrado;
      Exit;
    end;
    F := TFileStream.Create(A, fmOpenRead);
    try
      aTamTotal := F.Size;
      if aPos > aTamTotal then begin
        aTamBlock := 0;
        aLast := True;
        Exit;
      end;

      aTamBlock := aTamTotal - aPos;
      if aTamBlock>MaxBlockSize then 
        aTamBlock := MaxBlockSize;

      F.Position := aPos;
      aStream.Size := aTamBlock;
      F.Read(TMemoryStream(aStream).Memory^, aTamBlock);  
    finally
      F.Free;
    end;
  except
    Result := 2;
  end;

end;

procedure TncServidor.ImpCacheTimer(Sender: TObject);
var P : PncImpCache;
begin
  try
    try
      DebugMsg('TncServidor.ImpCacheTimer');
      Lock;
      try
        if not Ativo then Exit;

        P := PncImpCache(TTimer(Sender).Tag);
        try
          RegistraPaginasImpressasEsp(P^.icJobID, P^.icMaq, P^.icPaginas, P^.icImp, P^.icDoc, True);
        finally
          Dispose(P);
        end;
      finally
        Unlock;
      end;
    finally
      Sender.Free;
    end;
  except
    on E: Exception do 
      DebugMsg('TncServidor.ImpCacheTimer - E.Message: ' + E.Message);
  end;
end;

function JobStatusStr(JS : Byte): String;
begin
  case JS of 
    jsNone : Result := 'None';
    jsNew : result := 'New';
    jsProcessing : Result := 'Processing';
    jsPaused : Result := 'Paused';
    jsResumed : Result := 'Resumed';
    jsAborted : Result := 'Aborted';
    jsCompleted : Result := 'Completed';
    jsError : Result := 'Error';
    jsPrinting : Result := 'Printing';
  end;
end;  

function TncServidor.JobControl(aPrinterIndex: Integer; aJobID: Cardinal; aControl: Byte): integer;
var 
  J : TncJob;
  M : TncMaquina;
begin
  Result := 0;
  if FMonitor=nil then Exit;
  J := FJobs.PorJobID[aPrinterIndex, aJobID];
  if (J=nil) then Exit;
  try
    if (J.Maquina=0) then begin
      M := FMaquinas.PorComputerName(J.Computer, True);
      if M<>nil then 
        J.Maquina := M.Numero 
      else begin
        M := FMaquinas.PorIP(J.Computer);
        if M<>nil then
          J.Maquina := M.Numero;
      end;
    end;

    if (J.Liberacao=jlPendente) or ((aControl=jc_resume) and (J.Liberacao=jlCancelar)) then
      DM.SalvaJobControl(J, aControl);
  finally
    case aControl of
      jc_pause : FMonitor.JobControl(aPrinterIndex, aJobID, JOB_CONTROL_PAUSE);
      jc_resume : FMonitor.JobControl(aPrinterIndex, aJobID, JOB_CONTROL_RESUME);
      jc_delete : begin
        J.Deleted := True;
        FMonitor.JobControl(aPrinterIndex, aJobID, JOB_CONTROL_DELETE);
      end;
    end;
  end;
end;

procedure TncServidor.JobNotification(const jobinfo: TncJob);
begin
  if gConfig.DetectarImpServ or (gConfig.ControlaImp>ciDesativado) then
  try
    _JobNotification(jobinfo);
  except 
    on e: exception do 
      DebugMsgEsp('TncServidor.JobNotification - Exception: '+E.Message, False, True);
  end;
end;

procedure TncServidor._JobNotification(const jobinfo: TncJob);
var 
  Oper : Byte;
  J : TncJob;
  M : TncMaquina;

function FiltraBar(S: String): String;
var i: Integer;
begin
  Result := '';
  for i := 1 to length(S) do 
    if S[i]<>'\' then
      Result := Result + S[i];
end;

function NomeDocInvalido(sNome: String): Boolean;
begin
  sNome := Trim(sNome);
  Result := (sNome='') or
            (Pos('Documento de nível', sNome)>0) or 
            (Pos('Downlevel document', sNome)>0);
end;

      
begin
  Lock;         
  try
    with JobInfo do 
        DebugMsg('JOBNOTIFICATION:'+sLineBreak+
                 '            JobID = ' + IntToStr(JobID) + sLineBreak + 
                 '            JobCliID = ' + IntToStr(JobCliID) + sLineBreak + 
                 '            User = ' + User + sLineBreak + 
                 '            PrinterServer = ' + PrinterServer +
                 '            PrinterShare = ' + PrinterShare + 
                 '            PrinterIndex = ' + IntToStr(PrinterIndex) + 
                 '            Computer = ' + Computer + sLineBreak +
                 '            Status = ' + JobStatusStr(Status) + sLineBreak +
                 '            Deleted = ' + BoolStr[Deleted] + sLineBreak +
                 '            Pages = ' + IntToStr(Pages) + sLineBreak +
                 '            Copies = ' + IntToStr(Copies) +sLineBreak +
                 '            TotalPages = ' + IntToStr(TotalPages) + sLineBreak +
                 '            PrinterName = ' + PrinterName + sLineBreak +
                 '            Document = ' +JObInfo.Document +  sLineBreak);

    J := FJobs.PorJobID[JobInfo.PrinterIndex, JobInfo.JobID];
    
    if (J<>nil) then begin
      if NomeDocInvalido(JobInfo.Document) and (not NomeDocInvalido(J.Document)) then begin
        DebugMsg('JobNotification NomDocInvalido');
        JobInfo.Document := J.Document;
      end;
        
      J.Document := JobInfo.Document;
      
      if (JobInfo.Status=jsPaused) and JobInfo.Doc_NexCafe then begin
        FMonitor.JobControl(JobInfo.PrinterIndex, JobInfo.JobID, JOB_CONTROL_RESUME);
        J.Pausou := False;
        J.Liberacao := jlNaoPausou;
        JobInfo.Pausou := False;
        JobInfo.Liberacao := jlNaoPausou;
        DM.SalvaJobControl(J, jc_resume);
      end;
    end;

    if JobInfo.Status=jsCompleted then
      Oper := 2
    else  
    if (JobInfo.Status in [jsCompleted, jsError, jsDeleted]) then
      Oper := 2
    else

    if J<>nil then begin
      Oper := 1;
      JobInfo.ImpID := J.ImpID;
      JobInfo.Liberacao := J.Liberacao;
      JobInfo.ClientPages := J.ClientPages;
      JobInfo.Maquina := J.Maquina;
      if JobInfo.Pausou then 
        if (J.Liberacao=jlNaoPausou) then 
          JobInfo.Liberacao := jlPendente;

      {** NEW **}
      if gConfig.PausarJobs then
      if (not JobInfo.Doc_NexCafe) and 
         gNaoPausar.Pausar(JobInfo.Computer) and
         (JobInfo.Status = jsProcessing) and 
         (not JobInfo.StatusPaused) and
         (J.Liberacao in [jlNaoPausou, jlPendente]) and (FMonitor<>nil) then
      begin   
        FMonitor.JobControl(J.PrinterIndex, J.JobID, JOB_CONTROL_PAUSE);
        Sleep(50);
        FMonitor.JobControl(J.PrinterIndex, J.JobID, JOB_CONTROL_PAUSE);
        Sleep(100);
        FMonitor.JobControl(J.PrinterIndex, J.JobID, JOB_CONTROL_PAUSE);
      end;
      {******}
    end else begin         
      Oper := 0;
      if JobInfo.Pausou then 
        JobInfo.Liberacao := jlPendente;
        
      if gConfig.PausarJobs and 
         (not JobInfo.Doc_NexCafe) and
         JobInfo.Pausou and 
         gNaoPausar.Pausar(JobInfo.Computer) and (FMonitor<>nil) 
      then
        FMonitor.JobControl(JobInfo.PrinterIndex, JobInfo.JobID, JOB_CONTROL_PAUSE);
    end;
    
    if (JobInfo.Status=jsCompleted) and (J<>nil) and (J.Liberacao=jlPendente) then begin
      if (J.Maquina=0) then begin
        M := FMaquinas.PorComputerName(J.Computer, True);
        if M<>nil then 
          J.Maquina := M.Numero
        else begin
          M := FMaquinas.PorIP(J.Computer);
          if M<>nil then
            J.Maquina := M.Numero;
        end;
      end;
    
      DM.SalvaJobControl(J, jc_Resume);
    end else begin
      if (JobInfo.Maquina=0) then begin
        M := FMaquinas.PorComputerName(JobInfo.Computer, True);
        if M<>nil then
          JobInfo.Maquina := M.Numero
        else begin
          M := FMaquinas.PorIP(JobInfo.Computer);
          if M<>nil then
            JobInfo.Maquina := M.Numero;
        end;  
      end;
    end;

    if FPrintDocsP.IndexOf(JobInfo.Document)=-1 then
      try DM.SalvaJobNotification(JobInfo, Oper); except end;

    case Oper of
      0 : begin
        J := CriaJob(True);
        J.Assign(JobInfo);
        J.LimpaCache;
        J.Notificar(tnCriacao);
      end;
      
      1 : begin
        J.AtualizaCache;
        J.Assign(JobInfo);
        J.Notificar(tnAlteracao);
      end;
      
      2 : J.Free;
    end;
  finally
    Unlock;
  end;
end;

function TncServidor.DisableAD(aSessao: Integer; aDisable: Boolean): Integer;
var S: TncSessao;
begin
  Result := 0;
  try
    S := Sessoes.PorID[aSessao];
    if S=nil then Exit;
    with DM do begin
      InitTran([tSessao], True);
      try
        tSessao.IndexName := 'IID';
        if tSessao.FindKey([aSessao]) then begin
          tSessao.Edit;
          tSessaoDisableAD.Value := aDisable;
          tSessao.Post;
        end;
        nxDB.Commit;
      except 
        nxDB.Rollback;
      end;
      S.AtualizaCache;
      S.DisableAD := aDisable;
      S.Notificar(tnAlteracao);
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_DisableAD;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.AlteraSessao(aSessao: TObject): Integer;
var 
  S: TncSessao;
begin
  try
    S := Sessoes.PorID[TncSessao(aSessao).ID];
    if S<>nil then begin
      S.MinTicksUsados := S.TempoUsado.Ticks;
      S.MinTicksTotal  := S.TicksTotal;
      if not S.Encerrou then begin
        S.PausaFimTempo(False);
        TncSessao(aSessao).StrPausas    := S.StrPausas;
      end;
      with DM do
      if tSessao.Locate('ID', S.ID, []) then begin
        tSessao.Edit;
        tSessaoMinTicksUsados.Value := S.MinTicksUsados;
        tSessaoMinTicksTotal.Value := S.MinTicksTotal;
        tSessao.Post;
      end;
      TncSessao(aSessao).AjustaTicksI(S.TicksI);
      TncSessao(aSessao).MinTicksUsados := S.MinTicksUsados;
      TncSessao(aSessao).MinTicksTotal  := S.MinTicksTotal;
      TncSessao(aSessao).StrPausas := S.StrPausas;
    end;

    Result := DM.AlteraSessao(TncSessao(aSessao), UsernameAtual, Sessoes);
    
    if Result=0 then begin
      if S<>nil then begin
        S.Assign(TClasseCS(aSessao));
        S.LimpaCache;
        if S.Encerrou and (S.CaixaF>0) then
          S.Free else 
          S.Notificar(tnAlteracao);
      end;
    end;
    
    try
      DM.RefreshEspera(Sessoes, Maquinas);
    except
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AlteraSessao;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

procedure TncServidor.AoAlterarObj(Obj: TncClasse);
begin
  EnviaEventoStreamObj(ncmc_AtualizaObj, Obj);
end;

procedure TncServidor.AoCriarObj(Obj: TncClasse);
begin
  EnviaEventoStreamObj(ncmc_NovoObj, Obj);
end;

procedure ApagaNXTemp;
var 
  SR: TSearchRec;
  S : String;
begin
  Exit;
  
  S := ExtractFilePath(ParamStr(0))+'Dados\';
  if FindFirst(S+'*.nx$', faAnyFile, SR)=0 then 
  try
    repeat
      DeleteFile(PChar(S+SR.Name));
    until (FindNext(SR)<>0);
  finally
    SysUtils.FindClose(SR);
  end;
end;

procedure TncServidor.CorrigeAutoInc;
var 
  AI, MaxValue: Cardinal;
  Tab : TnxTable;

procedure Ajusta(aName, aIndex, aCampo: String; aAI: Integer = 0);
begin
  Tab.TableName := aName;
  Tab.IndexName := aIndex;
  Tab.Active := True;
  
  Tab.Last;
  if Tab.FieldByName(aCampo).AsInteger>aAI then
    aAI := Tab.FieldByName(aCampo).AsInteger;

  Tab.First;
  if Tab.FieldByName(aCampo).AsInteger>aAI then
    aAI := Tab.FieldByName(aCampo).AsInteger;
    
  Tab.GetAutoIncValue(AI);
  
  if (aAI>AI) then Tab.SetAutoIncValue(aAI);
  
  Tab.Active := False;  
end;

procedure SetMaxValue(aName, aIndex, aCampo: String);
begin
  Tab.TableName := aName;
  Tab.IndexName := aIndex;
  Tab.Active := True;
  Tab.Last;
  with Tab.FieldByName(aCampo) do
  if AsInteger>MaxValue then
    MaxValue := AsInteger;
  Tab.Active := False;  
end;
  
begin
  Tab := TnxTable.Create(Self);
  Tab.Session := CreateSession;
  try
    Tab.AliasName := 'NexCafe';
    Ajusta('Chat', 'IID', 'ID');
    Ajusta('EmailCorpo', 'IID', 'ID');
    Ajusta('EmailCriar', 'IID', 'ID');
    Ajusta('EmailEnvio', 'IID', 'ID');
    Ajusta('Espera', 'IID', 'ID');
    Ajusta('FiltroWeb', '', 'ID');
    Ajusta('HCred', 'IID', 'ID');
    Ajusta('HPass', 'IID', 'ID');
    
    Tab.TableName := 'Impressao';
    Tab.IndexName := 'IID';
    Tab.Open;
    Tab.First;
    Tab.GetAutoIncValue(AI);
    if Tab.FieldByName('ID').AsInteger > AI then
      Tab.SetAutoincValue(Tab.FieldByName('ID').AsInteger);
    Tab.Close;  
    
    Ajusta('Impressao', 'IID', 'ID');
    Ajusta('ITran', 'IID', 'ID');
    Ajusta('Log', 'IID', 'ID');
    Ajusta('MovEst', 'IID', 'ID');
    Ajusta('Ocupacao', '', 'ID');
    Ajusta('Pacote', 'IID', 'ID');
    Ajusta('Passaporte', 'IID', 'ID');
    Ajusta('Recibo', '', 'ID');
    Ajusta('Tempo', 'IID', 'ID');
    Ajusta('TipoPass', 'IID', 'ID');

    maxValue := 0;
    SetMaxValue('Tran', 'ICliID', 'Cliente');
    SetMaxValue('ITran', 'IClienteID', 'Cliente');
    Ajusta('Cliente', 'IID', 'ID', MaxValue);

    maxValue := 0;
    SetMaxValue('MovEst', 'IProduto', 'Produto');
    Ajusta('Produto', 'IID', 'ID', MaxValue);

    MaxValue := 0;
    SetMaxValue('Tran', 'ICaixaID', 'Caixa');
    SetMaxValue('ITran', 'ICaixaCancelado', 'Caixa');
    Ajusta('Caixa', 'IID', 'ID');

    MaxValue := 0;
    SetMaxValue('ITran', 'ITranID', 'Tran');
    Ajusta('Tran', 'IID', 'ID', MaxValue);
    MaxValue := 0;
    SetMaxValue('MovEst', 'ISessaoID', 'Sessao');
    SetMaxValue('Impressao', 'ISessaoID', 'Sessao');
    SetMaxValue('Tempo', 'ISessaoID', 'Sessao');
    SetMaxValue('Passaporte', 'ISessao', 'Sessao');
    SetMaxValue('HPass', 'ISessaoPass', 'Sessao');
    SetMaxValue('Tran', 'ISessao', 'Sessao');
    Ajusta('Sessao', 'IID', 'ID', MaxValue);
  finally
    Tab.Active := False;
    Tab.Session.Free;
    Tab.Free;
  end;
end;


procedure TncServidor.StartRecVer;
var 
  Tab : TnxTable;
  DB : TnxDatabase;
  SS : TnxSession;
  SL : TStrings;
  I, C, T : Integer;
  RV: Cardinal;
  Status: TnxTaskStatus;
  Cancel : Boolean;
begin
  SS := CreateSession;
  DB := CreateDB(SS);
  Tab := TnxTable.Create(Self);
  Tab.Session := SS;
  Tab.Database := DB;
  Cancel := False;
  SL := TStringList.Create;
  try
    DB.Connected := True;
    DB.GetTableNames(SL);
    I := SL.IndexOf('plusP');
    SL.Delete(I);
    I := SL.IndexOf('plusT');
    SL.Delete(I);
    gRecVerManager.Clear;
    for I := SL.Count - 1 downto 0 do begin
      Tab.Active := False;
      Tab.IndexName := '';
      Tab.TableName := SL[I];
      Tab.Active := True;
      if Tab.FindField('RecVer')<>nil then begin
        RV := 0;
        if (not Tab.IsEmpty) then begin
          Tab.IndexName := 'IRecVer';
          Tab.Last;
          with Tab.FieldByName('RecVer') do
            if not IsNull then RV := Value;
        end;
        gRecVerManager.StartRecVer(SL[I], RV)
      end else
        SL.Delete(I);
    end;  

    OpenProgressForm;
    try
      for I := 0 to SL.Count - 1 do begin
        Tab.Active := False;
        Tab.TableName := Sl[I];
        Tab.IndexName := 'IRecVer';
        Tab.Open;
        Tab.SetRange([null], [null]);
        Status.tsStartTime := GetTickCount;
        Status.tsSnapshotTime := 0;
        Status.tsTotalRecs := Tab.RecordCount;
        Status.tsRecsRead := 0;
        Status.tsRecsWritten := 0;
        Status.tsErrorCode := 0;
        Status.tsFinished := False;
        Status.tsErrorMessage := '';
        Cancel := False;
        Tab.First;
        while not (Tab.Eof and Tab.Bof) do begin
          Inc(Status.tsRecsRead);
          Status.tsRecsWritten := Status.tsRecsRead;
          Status.tsFinished := (Status.tsRecsRead>=Status.tsTotalRecs);
          Status.tsPercentDone := Trunc((Status.tsRecsRead / Status.tsTotalRecs)*100);
          FrmProg.OnProgress(Sl[I], Status, Cancel);
          Tab.Edit;
          Tab.FieldByName('RecVer').Value := -1;
          Tab.Post;
        end;
      end;
    finally
      FechaProgressForm;
    end;

  finally
    SL.Free;
    Tab.Free;
    DB.Free;
    SS.Free;
  end;
end;



procedure TncServidor.CriaServidorBD;
var
  I : Integer;
  T : Cardinal;
  aSessao  : TnxSession;
  aDB : TnxDatabase;
  Q : TnxQuery;
  aCE, aSN: String;
  aMin, aMax : Currency;
  S: String;
  IsEof : Boolean;
begin


  DebugMsg('CriaServidorBD 1');
  FAtualizaLic := nil;
  EncerrarThreads := False;
  Lock;
  try
    DebugMsg('CriaServidorBD 2');
    DestroiServidorBD;
    FServAtivo := False;
    DebugMsg('CriaServidorBD 3');

    if FileExists(ApekFName) then begin
      FiniApek := TIniFile.Create(ApekFName);
      FTimerApek.Enabled := True;
    end else
      if Assigned(FiniApek) then
        FreeAndNil(FiniApek);

    try
      ApagaNXTemp;
      DebugMsg('CriaServidorBD 4');


{      if FileExists(S) then
        TFrmImpNX2.Create(Self).ShowModal;}

      Application.CreateForm(TdmServidorBD, dmServidorBD);
      DebugMsg('CriaServidorBD 5');

//      IniciaServidorBD;

      CliNotifyHandle := FNotifyHWND;

      aSessao := CreateSession;
      DebugMsg('CriaServidorBD 6');

      aDB := TnxDatabase.Create(Self);
      aDB.Session  := aSessao;
      aDB.AliasName    := 'NexCafe';
      aDB.Connected := True;
      aDB.Timeout := 30000;
      DebugMsg('CriaServidorBD 7');

//      if aDB.TableExists(  remoteQueryResult_tablename ,'')  then
//             aDB.DeleteTable( remoteQueryResult_tablename ,'');

      try
        OpenProgressForm;
        ProgTables.Clear;
        try

          DebugMsg('CriaServidorBD 7.1');
          ncTableDefs.BuildAndEvolveDatabase(aDB, FrmProg.OnProgress, 'toromalbec');
          DebugMsg('CriaServidorBD 7.2');

        except
          on E: Exception do begin
            DebugMsg('CriaServidorBD - BuildAndEvolve - E.Message: '+E.Message);
            Raise;
          end;
        end;
        DebugMsg('CriaServidorBD 7.2');
        if ProgTables.Count>0 then begin
          Q := TnxQuery.Create(Self);
          Q.Timeout := 600000;
          Q.Session := aSessao;
          Q.Database := aDB;
          try
            for I := 0 to ProgTables.Count - 1 do begin
              S := GetTableAutoField(ProgTables[I]);
              if S>'' then begin
                Q.SQL.Text := 'update "'+ProgTables[I]+'" set ' + S + '=null';
                Q.ExecSQL;
                Q.Active := False;
              end;
            end;
          finally
            Q.Free;
          end;
        end;
        DebugMsg('CriaServidorBD 7.3');

      finally
        FechaProgressForm;
        aDB.Free;
        aSessao.Free;
      end;

      DebugMsg('CriaServidorBD 7.4');

      CorrigeAutoInc;
      DebugMsg('CriaServidorBD 7.4.1');
      StartRecVer;

      DebugMsg('CriaServidorBD 7.5');

      TThreadPopulateCategUnid.Create(False).FreeOnTerminate := True;

      Application.CreateForm(TDM, DM);
      DM.FSessoes := Sessoes;

      DebugMsg('CriaServidorBD 7.6');

      DM.nxSession.ServerEngine := dmServidorBD.ServerEngine;
      DM.Open;
      DM.tRec.EmptyTable;

      DebugMsg('CriaServidorBD 7.7');

      with DM do
      if tUsuario.RecordCount = 0 then begin
        tUsuario.Insert;
        tUsuarioUsername.Value := 'admin';
        tUsuarioNome.Value := 'Administrador';
        tUsuarioAdmin.Value := True;
        tUsuarioSenha.Value := '';
        tUsuario.Post;
      end;

      DebugMsg('CriaServidorBD 7.8');

      Usuarios.LeDataset(DM.tUsuario);

      DebugMsg('CriaServidorBD 7.9');

      with DM do
      if tMaq.RecordCount=0 then begin
        tMaq.Insert;
        tMaqNumero.Value := 1;
        tMaqNome.Value:= 'Máquina 1';
        tMaq.Post;

        tMaq.Insert;
        tMaqNumero.Value := 2;
        tMaqNome.Value := 'Máquina 2';
        tMaq.Post;
      end else begin
        tMaq.First;
        S := '';
        while not tMaq.Eof do begin
          if Pos('|'+tMaqNumero.AsString+'|', S)=0 then begin
            S := S + '|'+tMaqNumero.AsString + '|';
            tMaq.Next;
          end else  begin
            tMaq.Next;
            IsEof := tMaq.Eof;
            tMaq.Prior;
            tMaq.Delete;
            if IsEof then Break;
          end;
        end;
      end;

      DebugMsg('CriaServidorBD 7.10');

      Maquinas.LeDataset(DM.tMaq);

      DebugMsg('CriaServidorBD 7.11');

      with DM do begin
        if tConfig.RecordCount > 0 then begin
          gConfig.LeDataset(tConfig);
        end else begin
          tConfig.Insert;
          gConfig.SalvaDataset(tConfig);
          tConfig.Post;
        end;

        if gConfig.ChecaCores then begin
          tConfig.Edit;
          gConfig.SalvaDataset(tConfig);
          tConfig.Post;
        end;
        ObtemValorMinMaxImp(aMin, aMax);
        gConfig.PMValorMin := aMin;
        gConfig.PMValorMax := aMax;

        gNaoPausar.SetNaoPausar(gConfig.PMNaoPausar);
        gNaoPausar.SetPausarEsteComp(gConfig.PMPausarServ);
      end;

      DebugMsg('CriaServidorBD 7.12');

      with DM do
      if not tTipoImp.FindKey([1]) then begin
        tTipoImp.Insert;
        tTipoImpID.Value := 1;
        tTipoImpNome.Value := rsPretoEBranco;
        tTipoImp.Post;
      end;

      with DM do begin
        if tEspecie.IsEmpty then begin
          tEspecie.Insert;
          tEspecieID.Value := 1;
          tEspecieNome.Value := rsDinheiro;
          tEspeciePermiteTroco.Value := True;
          tEspeciePermiteVarios.Value := False;
          tEspeciePermiteCred.Value := True;
          tEspecieTipo.Value := tipoesp_dinheiro;
          tEspecieImg.Value := 0;
          tEspecie.Post;

          tEspecie.Insert;
          tEspecieID.Value := 2;
          tEspecieNome.Value := rsCartaoCred;
          tEspeciePermiteTroco.Value := False;
          tEspeciePermiteVarios.Value := True;
          tEspeciePermiteCred.Value := True;
          tEspecieTipo.Value := tipoesp_cartao;
          tEspecieImg.Value := 1;
          tEspecie.Post;

          tEspecie.Insert;
          tEspecieID.Value := 3;
          tEspecieNome.Value := rsCartaoDeb;
          tEspeciePermiteTroco.Value := False;
          tEspeciePermiteVarios.Value := True;
          tEspeciePermiteCred.Value := True;
          tEspecieTipo.Value := tipoesp_cartao;
          tEspecieImg.Value := 2;
          tEspecie.Post;

          tEspecie.Insert;
          tEspecieID.Value := 4;
          tEspecieNome.Value := rsCheque;
          tEspeciePermiteTroco.Value := False;
          tEspeciePermiteVarios.Value := True;
          tEspeciePermiteCred.Value := True;
          tEspecieTipo.Value := tipoesp_cheque;
          tEspecieImg.Value := 3;
          tEspecie.Post;
        end;
        gEspecies.Limpa;
        gEspecies.LeDataset(tEspecie);
      end;

      DebugMsg('CriaServidorBD 7.13');

      RefreshPrecos;

      DebugMsg('CriaServidorBD 7.14');

      with DM do
      try
        Sessoes.Limpa;
        tSessao.IndexName := 'IEncerrou';
        tSessao.SetRange([False], [False]);
        Sessoes.LeDataset(tSessao);
        tSessao.SetRange([True, 0], [True, 0]);
        Sessoes.LeDataset(tSessao);
        for I := 0 to FSessoes.Count - 1 do with FSessoes[I] do begin
          if Encerrou=False then begin
            if Now < Inicio then
              T := 0 else
              T := DateTimeToTicks(Now - Inicio);
            if T<MinTicksTotal then
              T := MinTicksTotal;
            AjustaTicksI(GetTickCount - T);
          end;
          RefreshSessao(FSessoes[I]);
        end;

      finally
        tSessao.IndexName := 'IID';
        tSessao.CancelRange;
      end;

      DebugMsg('CriaServidorBD 7.15');

      try
        DM.RefreshEspera(Sessoes, Maquinas);
      except
        on E: Exception do
          DebugMsgEsp('TncServidor.CriaServidorBD ERRO DM.RefreshEspera: '+E.Message, False, True);
      end;

      DebugMsg('CriaServidorBD 7.16');

      FMonitor := nil;

//      if gConfig.DetectarImpServ or gConfig.PMPausaAutomatica then
      try
        if Win32Platform = VER_PLATFORM_WIN32_NT	then begin
          try
            FMonitor:= TncPrintersMonitor.Create( self );
            FMonitor.OnNewJob := JobNotification;
            FMonitor.OnJobChange := JobNotification;
            FMonitor.OnJobComplete := JobNotification;
            FMonitor.Active := true;
            DebugMsg('Monitor de impressoes criado');
          except
            on E: EOSError do
              DebugMsg('Falha na criação do PrinterMonitor: '+E.Message);
            on E: Exception do
              DebugMsg('Falha na criação do PrinterMonitor: '+E.Message);
          end;
        end else
          DebugMsg('Monitor de impressoes não foi criado');
      except
        on E: Exception do begin
          DebugMsgEsp('TncSevidor.CriaServidorBD ERRO FMonitor.Create: '+E.Message, False, True);
          FMonitor := nil;
        end;
      end;

      DebugMsg('CriaServidorBD 7.17');

      FJobs.Limpa;
      with DM do
        while tPM.FindKey([null]) do
          tPM.Delete;
      FJobs.LeDataset(DM.tPM);

      DebugMsg('CriaServidorBD 7.18');

      FPrintDocs.Limpa;
      try
        LoadPrintDocs;
      except
        on E: Exception do
          DebugMsgEsp('TncServidor.Create - LoadPrintDocs - Exception: ' + E.Message, False, True);
      end;

      DebugMsg('CriaServidorBD 7.19');

      gTiposImp.Limpa;
      gTiposImp.LeDataset(DM.tTipoImp);

      DebugMsg('CriaServidorBD 7.20');

      DM.AtualizaSiteProg(FMaquinas, FSessoes);

      DebugMsg('CriaServidorBD 7.21');

      DM.RefreshPontosPremioAuto;

      DM.GravaLog(2, 0, 'ENTROU');

      DebugMsg('CriaServidorBD 8');
      with RegistroGlobal do begin
        CodEquipSerial(aCE, aSN);
        DebugMsg('CriaServidorBD 9');
        ChecaNumMaq(LicencasValidas(False, aCE, aSN), Conta, aCE, RegistroGlobal.Status);
        DebugMsg('CriaServidorBD 10');
      end;

      FAtualizaLic := TThreadAtualizaLic.Create;

      with gConfig do
{      if EmailEnviarCaixa then   }
        InicializaProcEmail(EmailMetodo, EmailServ, EmailUsername, EmailSenha);

      if Assigned(FMonitor) then
        RefreshJobs;

      DebugMsg('CriaServidorBD 11');

//      if not CCP_Off then TdmProdClient.Iniciar(registroGlobal.GetCodEquip(registroGlobal.GetSerialHD), registroGlobal.Email, '');

      DebugMsg('CriaServidorBD 12');

      dmServidorBD.NexPlugin.NexServ := Self;
      dmServidorBD.ListenClients;

      DebugMsg('CriaServidorBD 13');

      // DARIO upload2009 X211

      //Glog.active := true;
      fUpLoad := TncUploadThread.Create;
      fUpLoad.Email := gconfig.Conta; // 'oEmailAli@gmail.com';
      fUpLoad.ServerEngine := DM.nxRSE;
      fUpLoad.Resume;

      DebugMsg('CriaServidorBD 14');


      FServAtivo := True;
      FServErro := '';

//      OnTimerRecalcP(nil);
    except
      on E: Exception do begin
        DebugMsgEsp('TncServidor.CriaServidorBD - ERRO: '+E.Message, False, True);
        FServErro := E.Message;
        DestroiServidorBD;
      end;
    end;

    DebugMsg('CriaServidorBD 14');

  finally
    Unlock;
  end;
end;

function TncServidor.DesativarFWSessao(aSessao: Integer;
  aDesativar: Boolean): Integer;
var S : TncSessao;
begin
  try
    Result := 0;
    S := Sessoes.PorID[aSessao];
    if (S=nil) or S.Encerrou or (S.FiltrarWeb=(not aDesativar)) then Exit;
    if not DM.tSessao.FindKey([S.ID]) then Exit;
    DM.DesativarFWSessao(S, aDesativar);
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_DesativarFWSessao;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.DesktopSincronizado(aSessao: Integer): Integer;
var S : TncSessao;
begin
  try
    Result := 0;
    S := Sessoes.PorID[aSessao];
    if (S=nil) or S.DesktopSinc then Exit;
    if not DM.tSessao.FindKey([S.ID]) then Exit;
    DM.DesktopSincronizado(S);
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_DesktopSincronizado;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

procedure TncServidor.DestroiServidorBD;

begin
{  DebugMsg('TncServidor.DestroiServidorBD - 1');
  Lock;}
  try
//    try TdmProdClient.Finalizar; except end;

    // DARIO upload2009
    //  finalizar threads
    DebugMsg('TncServidor.DestroiServidorBD - 1');
    if fUpload<>nil then begin
        if not fUpLoad.Terminated then begin
            fUpLoad.Terminate;
            fUpLoad.WaitFor;
        end;
        fUpLoad.Free;
        fUpLoad := nil;
    end;


    FTimerApek.Enabled := False;
    DebugMsg('TncServidor.DestroiServidorBD - 2');
    FTimerRecalcP.Enabled := False;
    FTimerPlus.Enabled := False;
    FServAtivo := False;
    if dmServidorBD <> nil then begin
      FreeAndNil(FiniApek);
      DebugMsg('TncServidor.DestroiServidorBD - 3');
      dmServidorBD.NexPlugin.NexServ := nil;
      DebugMsg('TncServidor.DestroiServidorBD - 4');
      if (Win32Platform = VER_PLATFORM_WIN32_NT) and Assigned(FMonitor) then
        FreeAndNil(FMonitor);
      DebugMsg('TncServidor.DestroiServidorBD - 5');
      try
        if FAtualizaLic<>nil then begin
          DebugMsg('TncServidor.DestroiServidorBD - 6');
          FAtualizaLic.Terminate;
          DebugMsg('TncServidor.DestroiServidorBD - 7');
          FAtualizaLic := nil;
        end;
      except
      end;

      DebugMsg('TncServidor.DestroiServidorBD - 8');
      try FinalizaProcEmail; except end;
      DebugMsg('TncServidor.DestroiServidorBD - 9');

      if DM<>nil then begin
        DebugMsg('TncServidor.DestroiServidorBD - 10');
        try DM.Close; except end;
        try FreeAndNil(DM); except end;
      end;

      try
//        FinalizaServidorBD;
        DebugMsg('TncServidor.DestroiServidorBD - 11');
        dmServidorBD.Shutdown;
        DebugMsg('TncServidor.DestroiServidorBD - 12');
        FreeAndNil(dmServidorBD);
        DebugMsg('TncServidor.DestroiServidorBD - 13');
      except
      end;
    end;
    DebugMsg('TncServidor.DestroiServidorBD - 14');

  except
    on E: Exception do
      DebugMsgEsp('DestroiServidorBD Exception: '+E.Message, False, True);
//    Unlock;
  end;
end;

procedure ProcessMessages;
var Msg : TMsg;
begin
  while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do  begin
    TranslateMessage(Msg);
    DispatchMessage(Msg);
  end;
end;

function TncServidor.SendPTBlock(aArq: TGUID; aLast: Boolean; aTamanho: Integer; aPos: Int64;
  aBlock: Pointer): Integer;
var 
  F : TFileStream;  
  A : String;
  S : TncSessao;
  P : TncPrintDoc;
  T : TncTipoImp;
  M : TncMaquina;
begin
  Result :=0;
  try
    A := PRFolder('s');
    if not DirectoryExists(A) then ForceDirectories(A);
    A := A + GuidToString(aArq);
    if FileExists(A+'.pend') then
      F := TFileStream.Create(A+'.pend', fmOpenWrite) else
      F := TFileStream.Create(A+'.pend', fmCreate);
    try  
      F.Position := aPos;
      F.Write(aBlock^, aTamanho);
    finally
      F.Free;
    end;
    if aLast then begin
      RenameFile(A+'.pend', A+'.pdf');
      if FileExists(A+'.ini') then begin
        P := CriaPrintDoc(True);
        P.DocInfo.LoadFromFile(A+'.ini');
        S := FSessoes.PorID[StrToIntDef(P.DocInfo.Values['Sessao'], 0)];
        if S<>nil then begin
          P.DocInfo.Values['Maquina'] := IntToStr(S.Maq);
          M := FMaquinas.PorNumero[S.Maq];
          if M<>nil then
            P.DocInfo.Values['Computer'] := M.ComputerName;
        end;
        P.LimpaCache;
        P.Notificar(tnCriacao);
        if not gConfig.ConfirmarImpAdmin then
          PostMessage(FNotifyHWND, wm_AutoPrintPDF, Integer(P), 0);
      end;
    end;
  except
    on E: Exception do begin
      Result := 2;
      DebugMsg('TncServidor.SendPTBlock  - Arq: ' + A + ' - Exception: ' + E.Message);
    end;
  end;
end;

function TncServidor.PrintDocControl(aInfo: TStrings): integer; 
var 
  I: TncImpressao;
  P: TncPrintDoc;
  T: TncTipoImp;
  S, sDest: String;
begin
  Result := 0;
  try
    DebugMsg('TncServidor.PrintDocControl 1 - ' + aInfo.Text);
    if aInfo.Values['Control']='' then Exit;
    DebugMsg('TncServidor.PrintDocControl 2 - ' + aInfo.Text);
    P := FPrintDocs.PorArq[aInfo.Values['Arq']];
    if P=nil then exit;
    if SameText(aInfo.Values['Control'], 'cancelar') then begin
      try
        S := PRFolder('s');
        if FileExists(S+P.ArqStr+'.pdf') then DeleteFile(PAnsiChar(S+P.ArqStr+'.pdf'));
        if FileExists(S+P.ArqStr+'.ini') then DeleteFile(PAnsiChar(S+P.ArqStr+'.ini'));
      finally
        P.Free;
      end;
    end else 
    if SameText(aInfo.Values['Control'], 'liberar') then begin
      S := PRFolder('s');
      if not FileExists(S+P.ArqStr+'.pdf') then begin
        DebugMsg('TncServidor.PrintDocControl - Arquivo não encontrado: ' + S+P.ArqStr+'.pdf');
        if FileExists(S+P.ArqStr+'.ini') then DeleteFile(PAnsiChar(S+P.ArqStr+'.ini'));
        P.Free;
        Exit;
      end;
      P.DocInfo.Values['Tipo'] := aInfo.Values['Tipo'];
      P.DocInfo.Values['NaoImp'] := aInfo.Values['NaoImp'];
      T := gTiposImp.PorID[P.Tipo];
      if T=nil then begin
        Result := ncerrTipoImpNaoExiste;
        DebugMsg('TncServidor.PrintDocControl - Tipo Não Encontrado: ');
        Exit;
      end;
      I := TncImpressao.Create;
      try
        sDest := PRFolder('p');
        ForceDirectories(sDest);
        CopyFile(PAnsiChar(S+P.ArqStr+'.pdf'), PAnsiChar(sDest+P.ArqStr+'.pdf'), False);
        
        I._Operacao := osIncluir;
        I.impSessao := StrToIntDef(aInfo.Values['Sessao'], 0);
        DebugMsg('TncServidor.PrintDocControl - Sessao: ' + IntToStr(I.impSessao));
        I.impMaquina := StrToIntDef(aInfo.Values['Maquina'], 0);
        I.impPaginas := P.CalcPages;
        I.impComputador := aInfo.Values['Computer'];
        I.impDocumento := aInfo.Values['DocTitle'];
        I.impQuant[P.Tipo] := I.impPaginas;
        I.impValor[P.Tipo] := T.Valor;
        
        Result := DM.SalvaImpressao(I, aInfo, nil, FSessoes);
        DebugMsg('TncServidor.PrintDocControl/DM.SalvaImpressao - Result: ' + IntToStr(Result));
        if Result = 0 then begin
          FPrintDocsP.Add(P.ArqStr+'.pdf');
          FPDFPrintMgr.Print(sDest+P.ArqStr+'.pdf', aInfo.Values['NaoImp'], T.PrinterDevMode, T.Impressora, P.TotPages, P.Retrato);
          if FileExists(S+P.ArqStr+'.pdf') then DeleteFile(PAnsiChar(S+P.ArqStr+'.pdf'));
          if FileExists(S+P.ArqStr+'.ini') then DeleteFile(PAnsiChar(S+P.ArqStr+'.ini'));
          P.Free;
        end;
      finally
        I.Free;
      end;
    end;
  except
    on E: Exception do begin
      DebugMsgEsp('TncServidor.PrintDocControl - Exception: ' + E.Message + sLineBreak + aInfo.Text, False, True);
      Result := 2;
    end;
  end;
end;

procedure TncServidor.SetAtivo(Valor: Boolean);
var T: Cardinal;
begin

  DebugMsg('TncServidor.SetAtivo - 1');
  if (Valor = FAtivo) or (csLoading in ComponentState) then Exit;
  DebugMsg('TncServidor.SetAtivo - 2');
{  if FAtivo then 
  try
    DebugMsg('TncServidor.SetAtivo - 3');
    DebugMsg('TncServidor.SetAtivo - 4');
  except
    on E: Exception do begin
      DebugMsg('TncServidor.SetAtivo 6 - E.Exception: '+E.Message);
    end;
  end;}
  if not Valor then begin
    ServidorAtivo := False;
    TerminarProcEmail := True;
  end else
    TerminarProcEmail := False;

  DebugMsg('TncServidor.SetAtivo - 7');
  Lock;
  try
    DebugMsg('TncServidor.SetAtivo - 8');
    if Valor then begin
      DebugMsg('TncServidor.SetAtivo - 9');
      try
        CriaServidorBD;
        ServidorAtivo := FServAtivo;
      except
        on E: Exception do begin
          DebugMsgEsp('TnxServidor.SetAtivo ERRO: ' + E.Message, False, True);
          DestroiServidorBD;
        end;
      end;
      if FServAtivo then begin
        inherited;
        CriaTimerUpdAll(2000);
      end;
        
    end else begin
      FAtivo := False;
//      dmServidorBD.Shutdown(False);
      DebugMsg('TncServidor.SetAtivo - 10');
      try
        DM.SalvaPosAtualSessoes(Sessoes);
      except
      end;
      DebugMsg('TncServidor.SetAtivo - 11');
      EncerrarThreads := True;
      try
        Maquinas.Limpa;
      except
      end;
      DebugMsg('TncServidor.SetAtivo - 12');
      try
        Usuarios.Limpa;
      except
      end;
      DebugMsg('TncServidor.SetAtivo - 13');
      try
        gTiposAcesso.Limpa;
      except
      end;
      DebugMsg('TncServidor.SetAtivo - 14');
      try
        gTarifas.Limpa;
      except
      end;
      
      DebugMsg('TncServidor.SetAtivo - 15');
      try Sessoes.Limpa; except end;
      DebugMsg('TncServidor.SetAtivo - 16');
      inherited;
    end;
  finally
    Unlock;
    if not Valor then 
      try DestroiServidorBD except end;
  end;
  DebugMsg('TncServidor.SetAtivo - 18');
end;

procedure TncServidor.LeMaquinaBD(Maq: TncMaquina);
begin
  with DM do begin
    if (tMaq=nil) or (not tMaq.Active) then Exit;
    if tMaq.FindKey([Maq.Numero]) then 
      Maq.LeDataset(tMaq);
  end;    
end;

procedure TncServidor.LeSessaoBD(Sessao: TncSessao);
begin
  with DM do begin
    if (tSessao=nil) or (not tSessao.Active) then Exit;
    if tSessao.FindKey([Sessao.ID]) then 
      Sessao.LeDataset(tSessao);
  end;
end;

function TncServidor.AtualizaUsuarioBD(Usuario: TncUsuario): Integer;
begin
  try
    DM.SalvaUsuario(Usuario);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AtualizaUsuarioBD;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.BDAtivo: Boolean;
begin
  Result := Assigned(dmServidorBD);
end;

procedure TncServidor.AtualizaPubPar(P : TmsgPubPar);
begin
  gConfig.AtualizaCache;
  
  if P.pbBRT<>null then
    gConfig.BRT := P.pbBRT;

  if P.pbDTol<>null then
    gConfig.DTol := P.pbDTol; 

  if P.pbPreLib<>null then
    gConfig.PreLib := P.pbPreLib;

  if P.pbDVA<>null then
    gConfig.DVA := P.pbDVA;

  if P.pbAlertaAss<>null then
    gConfig.AlertaAssinatura := P.pbAlertaAss; 

  if P.pbHPOpenBef <> null then
    gConfig.HPOpenBef := P.pbHPOpenBef;

  if P.pbExCookie <> null then
    gConfig.ExCookie := P.pbExCookie;  

  if P.pbHPUrl <> null then 
    gConfig.HomePage_URL := P.pbHPUrl;

  if P.pbHPTab <> null then
    gConfig.HomePage_Tab := P.pbHPTab;

  if P.pbSkyUrl <> null then
    gConfig.Sky_Url := P.pbSkyUrl; 

  if P.pbTbUrl <> null then
    gConfig.Toolbar_Url := P.pbTbUrl;   

  if P.pbBotoes <> null then
    gConfig.Botoes := P.pbBotoes;

  if P.pbBanners <> null then
    gConfig.Banners := P.pbBanners;

  gConfig.HomePage_LastUrl := Now;  
  
  try
    DebugMsg('TncServidor.AtualizaPubBar 1');
    DM.SalvaConfigPB(p);
    DebugMsg('TncServidor.AtualizaPubBar 2');
  finally
    gConfig.Notificar(tnAlteracao);
  end;
end;

function TncServidor.AtualizaConfigBD: Integer;
begin
  try
    DM.SalvaConfig(gConfig);
    gNaoPausar.SetNaoPausar(gConfig.PMNaoPausar);
    gNaoPausar.SetPausarEsteComp(gConfig.PMPausarServ);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AtualizaConfigBD;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.AtualizaEspecieBD(E: TncEspecie): Integer;
begin
  try
    DM.SalvaEspecie(E);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AtualizaEspecieBD;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.AtualizaTarifaBD(T: TncTarifa): Integer;
begin
  try
    DM.SalvaTarifa(T);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AtualizaTarifaBD;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.AtualizaTipoAcessoBD(TA: TncTipoAcesso): Integer;
begin
  try
    DM.SalvaTipoAcesso(TA);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AtualizaTipoAcessoBD;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.AtualizaTipoImpBD(T: TncTipoImp): Integer;
begin
  try
    DM.SalvaTipoImp(T);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AtualizaTipoImpBD;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.SalvaCredTempo(aObj: TObject): Integer;
var 
  S: TncSessao;
  CT: TncCredTempo;
  MTU, MTT : Integer;
  AumentouDeb: Boolean;

procedure FinalizaTran;
begin
  with DM do 
  if nxDB.InTransaction then begin
    nxDB.Rollback;
    TableCancel(tCli);
    TableCancel(tTempo);
    TableCancel(tTran);
    TableCancel(tSessao);
    TableCancel(tITran);
  end;
end;
  
begin
  with DM do
  try
    S := nil;
    CT := TncCredTempo(aObj);
    if CT.teSessao>0 then begin
      S := Sessoes.PorID[CT.teSessao];
      if S=nil then begin
        Result :=  ncerrTransacaoSoPodeAlterarViaFimSessao;
        Exit;
      end;
    end else
    if CT.teCliente>0 then 
      S := Sessoes.PorCliente[CT.teCliente];

    if S<>nil then
      CT.teSessao := S.ID;
    
    InitTran([tConfig, tCaixa, tCli, tTipoPass, tPacote, tPassaporte, tTempo, tTran, tSessao, tITran, tEsp], False);
    try
      if NumCaixaAberto=0 then begin
        Result := ncerrCaixaFechado;
        Exit;
      end;
      if CT.teFunc='' then
        CT.teFunc := UsernameAtual;
        
      if S<>nil then begin
        MTU := S.TempoUsado.Ticks;
        MTT := S.TicksTotal;
        CT.teMaq := S.Maq;
        if tSessao.FindKey([S.ID]) then begin
          S.PausaFimTempo(False);
          tSessao.Edit;
          tSessaoMinTicksUsados.Value := MTU;
          tSessaoMinTicksTotal.Value  := MTT;
          tSessaoStrPausas.Value      := S.StrPausas;
          tSessao.Post;
        end;
      end;
      Result := SalvaCredTempo(CT, AumentouDeb, Sessoes);
      if Result<>0 then Exit;
      
      if (CT.teCliente>0) and tCli.FindKey([CT.teCliente]) then begin
        tCli.Edit;
        tCliDebito.Value := TotalDeb(CT.teCliente);
        tCli.Post;
{        if AumentouDeb and (tCliDebito.Value>LimiteDeb) then
          Result := ncerrLimiteDebitoExcedido;}
      end;

      if not DM.FidControl.CanCommit then begin
        Result := ncerrSaldoFidInsuficiente;
        Exit;
      end;

      if S<>nil then begin
        S.AtualizaCache;
        S.MinTicksUsados := MTU;
        S.MinTicksTotal  := MTT;
{        S.PausaFimTempo(False);
        with DM do
        if tSessao.FindKey([S.ID]) then begin
          tSessao.Edit;
          tSessaoMinTicksUsados.Value := MTU;S.SalvaDataset(DM.tSessao);
          DM.tSessao.Post;
        end;}
        DM.RefreshSessao(S);
        S.LimpaCache;
        S.Notificar(tnAlteracao);
      end;

      try
        DM.RefreshEspera(Sessoes, Maquinas);
      except
      end;
      nxDB.Commit;
      Result := 0;
    finally
      FinalizaTran;
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaCredTempo;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
  if DM.nxDB.InTransaction then
    DM.nxDB.Rollback;
end;

function TncServidor.SalvaDebito(aObj: TObject): Integer;
begin
  try
    TncDebito(aObj).Func := UsernameAtual;
    Result := DM.SalvaPagDebito(TncDebito(aObj));
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaDebito;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.SalvaDebTempo(aObj: TObject): Integer;
begin
  try
    Result := DM.SalvaDebTempo(TncDebTempo(aObj), Sessoes)
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaDebTempo;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.SalvaImpressao(aObj: TObject): Integer;
var Imp: TncImpressao;
begin
  Imp := TncImpressao(aObj);
  try
    Result := DM.SalvaImpressao(Imp, nil, nil, Sessoes);
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaImpressao;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.SalvaApp(aApp: String): Integer;
begin

end;

function TncServidor.SalvaClientPages(aPrinter: String; aJobID: Cardinal; aMaquina, aPaginas: Word): integer;
var 
  J : TncJob;
  aPrinterIndex: Integer;
  Maq : TncMaquina;
begin
  Result := 0;
  try
    if not Assigned(FMonitor) then Exit;
    aPrinterIndex := FMonitor.GetPrinterIndexByName(aPrinter);

    if (aPrinterIndex<0) and (aMaquina>0) then begin
      Maq := FMaquinas.PorNumero[aMaquina];
      if Maq<>nil then
        aPrinterIndex := FJobs.PrinterIndexByComputer(Maq.ComputerName);
    end;
    
    if aPrinterIndex=-1 then Exit;
    J := FJobs.PorJobID[aPrinterIndex, aJobID];
      
    if J<>nil then begin
      if DM.SalvaClientPages(J, aMaquina, aPaginas) then
      if gConfig.PMPausaAutomatica and gConfig.PMCotas then begin
        LoadCotas(J);
        if aPaginas>0 then
          PostMessage(FNotifyHWND, wm_processacotas, J.PrinterIndex, J.JobID);
      end;
    end;
  except
    on e: exception do begin
       DebugMsg('TncServidor.SalvaJobMaq - E.Message: ' + E.Message);
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaClientPages;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.SalvaLancExtra(aObj: TObject): Integer;
begin
  try
    Result := DM.SalvaLancExtra(TncLancExtra(aObj));
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaLancExtra;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.SalvaLic(aLic: String): Integer;
var 
  sl : TStrings;
  s  : String;
begin
  Result := 0;
  sl := TStringList.Create;
  try
    sl.Text := aLic;
    if sl.IndexOfName('chaves')>=0 then begin
      if (RegistroGlobal.StringChaves=sl.Values['chaves']) and 
         ((sl.IndexOfName('conta')=0) or (RegistroGlobal.Conta=sl.Values['conta'])) then Exit;
      RegistroGlobal.StringChaves := sl.Values['chaves'];
      if sl.IndexOfName('conta')>=0 then
        RegistroGlobal.Conta := sl.Values['conta'];   
    end else begin
      if RegistroGlobal.StringChaves=aLic then Exit;
      if not RegistroGlobal.ChavesOk(aLic) then Exit;
      RegistroGlobal.StringChaves := aLic;
    end;
    RegistroGlobal.SalvaArqPadrao;
    PostMessage(handleFrmPri, wm_user+1, 0, 0);
  except
    sl.free;
  end;
end;

function TncServidor.SalvaLogAppUrl(S: TStream): Integer;
var L : TncAppUrlLog;
begin
  try
    L := TncAppUrlLog.Create;
    try
      L.LoadFromStream(S);
      DM.SalvaLogAppUrl(L, FMaquinas, FSessoes);
      Result := 0;
    finally
      L.Free;
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaLogAppUrl;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.SalvaMovEst(aObj: TObject): Integer;
var S : TncSessao;
begin
  try
    with TncMovEst(aObj) do begin
      if (Operacao=osIncluir) and (Func='') then
        Func := UsernameAtual;
      if Sessao>0 then begin
        S := Sessoes.PorID[Sessao];
        if S=nil then begin
          Result := ncerrSessaoJaEncerrou;
          Exit;
        end;
      end else
        S := nil;
      if (S=nil) and (Cliente>0) then
        S := Sessoes.PorCliente[Cliente];
      with DM do   
      if (S<>nil) and tSessao.Locate('ID', S.ID, []) then begin
        tSessao.Edit;
        tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
        tSessaoMinTicksTotal.Value  := S.TicksTotal;
        tSessao.Post;
        S.MinTicksUsados := tSessaoMinTicksUsados.Value;
        S.MinTicksTotal  := tSessaoMinTicksTotal.Value;
      end;
    end;

    Result := DM.SalvaMovEst(TncMovEst(aObj));

    if S<>nil then begin
      DM.RefreshSessao(S);
      S.Notificar(tnAlteracao);
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaMovEst;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.SalvaProcessos(aIDCliente, aRequest: Integer;
  aSL: TStrings): Integer;
begin
  try
    DM.SalvaProcessos(aIDCliente, aRequest, aSL);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaProcessos;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.SalvaSenhaCli(Codigo: Integer; Senha: String): Integer;
begin
  try
    Result := DM.SalvaSenhaCli(Codigo, Senha);
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaSenhaCli;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.AtualizaSessaoBD(Sessao: TncSessao): Integer;
begin
  try
    DM.SalvaSessao(Sessao);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AtualizaSessaoBD;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.AtualizaMaquinaBD(Maq: TncMaquina): Integer;
begin
  try
    DM.SalvaMaq(Maq);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AtualizaMaquinaBD;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.ApagaMsgCli(aID: Integer): Integer;
var
  aCliente: Integer;
  S : TncSessao;
begin
  try
    if DM.RemoveMsgCliByID(aID, aCliente) then begin
      S := FSessoes.PorCliente[aCliente];
      S.AtualizaCache;
      DM.LoadMsgCliList(S.Cliente, S.MsgCliList);
      S.StrMsgCliList := S.StrMsgCliList;
      S.Notificar(tnAlteracao);
    end;
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_ApagaMsgCli;
       DebugMsgEsp('TncServidor.ApagaMsgCli - E.Message: ' + E.Message, False, True);
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): integer;
var
  Lista: TListaClasseCS;
  Obj  : TClasseCS;
begin
  try
    Lista := ObtemLista(TipoClasse);
      
    if Lista=nil then begin
      Result := ncerrTipoClasseInvalido;
      Exit;
    end;
    Obj := Lista.ItemPorChave[Chave];
    if Obj = nil then begin
      Result := ncerrItemInexistente;
      Exit;
    end;

    with DM do 
    case TipoClasse of
      tcUsuario :      
        if tUsuario.FindKey([Chave]) then tUsuario.Delete;
        
      tcMaquina : 
        if tMaq.FindKey([Chave]) then tMaq.Delete;

      tcTarifa : begin
        tTarifa.IndexName := 'ICor';
        if tTarifa.FindKey([Chave]) or ((Chave='0') and tTarifa.FindKey([null])) then 
          tTarifa.Delete;
      end;

      tcTipoAcesso :
        if tTipoAcesso.FindKey([Chave]) then tTipoAcesso.Delete;

      tcTipoImp : 
        if tTipoImp.FindKey([Chave]) then tTipoImp.Delete;  

      tcEspecie : 
        if tEspecie.FindKey([Chave]) then tEspecie.Delete;  
    end;
    Obj.Free;
//    if TipoClasse = tcMaquina then ChecaNumMaq;
    
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_ApagaObj;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

procedure TncServidor.LigaMaq(M: TncMaquina);
begin
  if M=nil then Exit;
  if M.IDCliente>0 then Exit;
  if M.MacAddress='' then Exit;

  if not gConfig.AutoLigarMaqCli then Exit;
  if not Versoes.PodeUsar(idre_ligarmaq) then Exit;

  try WakeOnLan(M.MacAddress, ''); except end;
end;

function TncServidor.LimpaFundo(Desktop: Boolean): Integer;
var 
  SAnt: String;
begin
  Result:= 0;
  with DM do
  try
    InitTran([tConfig], True);
    try
      gConfig.AtualizaCache;
      if Desktop then begin
        SAnt := gConfig.NomeArqDesktop;
        gConfig.TipoFDesktop := '';
        tConfig.Edit;
        tConfigTipoFDesktop.Value := '';
        tConfig.Post;
      end else begin
        SAnt := gConfig.NomeArqLogin;
        gConfig.TipoFLogin := '';
        tConfig.Edit;
        tConfigTipoFLogin.Value := '';
        tConfig.Post;
      end;  
      if (SAnt<>'') and FileExists(SAnt) then
        TThreadRename.Create(SAnt, '');
      nxDB.Commit;
      gConfig.Notificar(tnAlteracao);
    except
      tConfig.Cancel;
      nxDB.Rollback;
      Raise;
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_LimpaFundo;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.ArqFundoEnviado(NomeArq: String): Integer;
var 
  S: String; 
  aDesktop: Boolean;
begin
  Result:= 0;
  try
    NomeArq := UpperCase(ExtractFilePath(ParamStr(0))+NomeArq);
    if not FileExists(NomeArq) then begin
      Result := ncerrArqNaoEncontrado;
      Exit;
    end;

    aDesktop := (Pos('DESKTOP_', ExtractFileName(NomeArq))=1);
    if aDesktop then begin
      S := ExtractFileExt(NomeArq);
      if not SameText(S, '.JPG') then begin
        Result := ncerrFundoTemQueSerJPG;
        Exit;
      end;
    end else begin
      S := Copy(ExtractFileExt(NomeArq), 2, 3);
      if (not SameText(S, 'JPG')) and (not SameText(S, 'GIF')) then begin
        Result := ncerrFundoTemQueSerJPGouGIF;
        Exit;
      end;
    end;

    DM.SalvaArqFundo(aDesktop, NomeArq, gConfig);
    Result := 0;
  except
    Result := ncerrExcecaoNaoTratada_TncServidor_ArqFundoEnviado;
  end;
end;

function TncServidor.ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer;
begin
  with DM do
  try
    tCli.IndexName := 'IID';
    if tCli.FindKey([Codigo]) then begin
      Senha := tCliSenha.Value;
      Result := 0;
    end else begin
      Senha := '';
      Result := ncerrClienteNaoEncontrado;
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_ObtemSenhaCli;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.ObtemSitesBloqueados(var S: String): Integer;
begin
  try
    S := DM.ObtemSitesBloqueados;
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_ObtemSitesBloqueados;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.ObtemStreamAvisos(S: TStream): Integer;
var 
  MT: TkbmMemtable;
  SF : TnxBlobStream;
begin
  with DM do 
  try
    tAvisos.Refresh;
    tAvisos.First;
    MT := CreateMemTableAndFields(nil, Campos_Avisos);
    try
      while not tAvisos.Eof do begin
        MT.Append;
        MT.FieldByName('Minutos').Value := tAvisosMinutos.Value;
        MT.FieldByName('AvisoTexto').Value := tAvisosAvisoTexto.Value;
        MT.FieldByName('SegAvisoTexto').Value := tAvisosSegAvisoTexto.Value;
        MT.FieldByName('PiscarAvisoTexto').Value := tAvisosPiscarAvisoTexto.Value;
        MT.FieldByName('Tipo').Value := tAvisosTipo.Value;
        MT.FieldByName('Som').Value := tAvisosSom.Value;
        MT.Post;
        
        tAvisos.Next;
      end;
      MT.First;  
      MT.SaveToStreamViaFormat(S, MT.AllDataFormat);
      S.Position := 0;
    finally
      SF.Free;
      MT.Free;
    end;    
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_ObtemStreamAvisos;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.ObtemStreamConfig(S: TStream): Integer;
begin
  try
//    gConfig.CodLoja := RegistroGlobal.CodLojaAsString;
    gConfig.VerPri  := Versoes.Versao;
    gConfig.SalvaStream(S, False);
    S.Position := 0;
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_ObtemStreamConfig;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;


function TncServidor.SalvaStreamObj(Novo: Boolean; S: TStream): Integer;
var 
  Lista: TListaClasseCS;
  Obj  : TClasseCS;
  T : Byte;
  Cliente, 
  TipoClasse : Integer;
  Chave: String;
  V : Variant;

procedure Incluir;
begin
  if Obj <> nil then begin
    Result := ncerrItemJaExiste;
    Exit;
  end else begin
    Obj := CriaClasseCS(TipoClasse);
    Lista.Add(Obj);
    Obj.LeStream(S);
    case TipoClasse of
      tcMaquina    : AtualizaMaquinaBD(TncMaquina(Obj));
      tcUsuario    : AtualizaUsuarioBD(TncUsuario(Obj));
      tcSessao     : AtualizaSessaoBD(TncSessao(Obj));
      tcTipoAcesso : AtualizaTipoAcessoBD(TncTipoAcesso(Obj));
      tcTarifa     : AtualizaTarifaBD(TncTarifa(Obj));
      tcTipoImp    : AtualizaTipoImpBD(TncTipoImp(Obj));
      tcEspecie    : AtualizaEspecieBD(TncEspecie(Obj));
    end;  
    TncClasse(Obj).Notificar(tnCriacao);
    Result := 0;
  end;
end;

procedure Alterar;
var 
  Str : String;
begin
  if (Obj = nil) then begin
    Result := ncerrItemInexistente;
    Exit;
  end;
  
  Obj.LeStream(S);
  case TipoClasse of
    tcMaquina : AtualizaMaquinaBD(TncMaquina(Obj));
    tcTipoAcesso : AtualizaTipoAcessoBD(TncTipoAcesso(Obj));
    tcUsuario : AtualizaUsuarioBD(TncUsuario(Obj));
    tcSessao : AtualizaSessaoBD(TncSessao(Obj));
    tcTarifa : AtualizaTarifaBD(TncTarifa(Obj));
    tcTipoImp : AtualizaTipoImpBD(TncTipoImp(Obj));
    tcEspecie : AtualizaEspecieBD(TncEspecie(Obj));
  end;  
  TncClasse(Obj).Notificar(tnAlteracao);
  Result := 0;
end;
  
begin
  try
    S.Read(Cliente, SizeOf(Cliente));
    S.Read(TipoClasse, SizeOf(TipoClasse));
    S.Read(T, SizeOf(Byte));
    SetString(Chave, PChar(nil), T);
    S.Read(Pointer(Chave)^, T);
    V := Chave;
    
    if TipoClasse = tcConfig then begin
      gConfig.LeStream(S);
      AtualizaConfigBD;
      gConfig.Notificar(tnAlteracao);
      Result := 0;
      Exit;
    end;
      
    Lista := ObtemLista(TipoClasse);
    if (Lista=nil) then begin
      Result := ncerrTipoClasseInvalido;
      Exit;
    end;
    Lista.Lock;
    try
      Obj := Lista.ItemPorChave[V];
      if Novo then 
        Incluir else
        Alterar;
    finally
      Lista.Unlock;
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SalvaStreamObj;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.ShutdownMaq(aMaq, aOper: Word): integer;
var Msg : PmsgShutdown;
begin
  Result := 0;
  try
    if not Ativo then Exit;
    New(Msg);
    Msg^.msgMaq := aMaq;
    Msg^.msgOper := aOper;
    EnviaEvento(ncmc_Shutdown, Msg);
  except  
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_ShutdownMaq;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function GetFileSize(S: String): Int64;
var SR: TSearchRec;
begin
  if FindFirst(S, faAnyFile, SR)=0 then
  begin
    Result := SR.Size;
    SysUtils.FindClose(SR);
  end else
    Result := 0;
end;

function TncServidor.StartPrintTransfer(aArqInfo: TStrings;
  var aPos: Int64): Integer;
var S: String;  
begin
  S := PRFolder('s') + aArqInfo.Values['Arq'];
  aPos := GetFileSize(S+'.pend');
  aArqInfo.SaveToFile(S+'.ini');
  Result := 0;
end;

function TncServidor.SuporteRem(aMaq, aTec: Word): Integer;
var Msg : PmsgSuporteRemEv;
begin
  Result := 0;
  try
    if not Ativo then Exit;
    New(Msg);
    Msg^.msgMaq := aMaq;
    Msg^.msgTec := aTec;
    EnviaEvento(ncmc_SuporteRemEv, Msg);
  except  
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_SuporteRem;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.RefreshEspera: Integer;
begin
  try
    DM.RefreshEspera(Sessoes, Maquinas);
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_RefreshEspera;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

procedure TncServidor.RefreshJobs;
var 
  JL : TJobList;
  I, T : Integer;
begin
  if (FMonitor=nil) then Exit;
  try
    JL := FMonitor.GetJobList;
    T := JL.Count;
    if T=1000 then Exit;
    
    try
      for I := FJobs.Count-1 downto 0 do 
        if not JL.Exists(FJobs[i].PrinterIndex, FJobs[I].JobID) then begin
          DM.SalvaJobNotification(FJobs[I], 2);
          FJobs[I].Free;
        end;
  
      for I := 0 to JL.Count - 1 do begin
        LoadCotas(JL.Jobs[I]);
        JobNotification(JL.Jobs[I]);
        with JL.Jobs[I] do
        if Status=jlPendente then
          PostMessage(FNotifyHWND, wm_processacotas, JL.Jobs[I].PrinterIndex, JL.Jobs[I].JobID);
      end;
    finally
      JL.Free;
    end;
  except
    on E: Exception do 
      DebugMsg('TncServidor.RefreshJobs - Exception: ' + E.Message);
  end;
end;

function TncServidor.RefreshPrecos: integer;
var 
  I, TA: Integer;
begin
  try
    DM.RefreshPrecos;
    for I := 0 to Sessoes.Count - 1 do 
    with Sessoes[I] do begin
      TA := TipoAcesso;
      TipoAcesso := -1;
      TipoAcesso := TA;
    end;
    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_RefreshPrecos;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.RegistraPaginasImpressas(aJobID: Cardinal; aMaq: Word; aPaginas: Integer; aImp, aDoc: String): Integer;
begin
  Result := RegistraPaginasImpressasEsp(aJobId, aMaq, aPaginas, aImp, aDoc, False);
end;

function TncServidor.RegistraPaginasImpressasEsp(aJobID: Cardinal; aMaq: Word;
  aPaginas: Integer; aImp, aDoc: String; aForce: Boolean): Integer;
var
  Sessao: TncSessao;
  Maq : TncMaquina;
  aPrinterIndex : Integer;
  J : TncJob;
  P : PncImpCache;
  T : TTimer;
begin
  Result := 0;
  if aPaginas<1 then begin
    DebugMsg('TncServidor.RegistraPaginasImpressasEsp - aPaginas: 0');
    Exit;
  end;
  
  if aMaq=0 then 
    Sessao := nil else
    Sessao := Sessoes.PorMaq[aMaq];

  J := nil;

  if gConfig.PMPausaAutomatica and (aJobID>0) and (FMonitor<>nil) then begin
    aPrinterIndex := FMonitor.GetPrinterIndexByName(aImp);
    DebugMsg('TncServidor.RegistraPaginasImpressasEsp - 1 - aPrinterIndex: '+ IntToStr(aPrinterIndex));
    
    if (aPrinterIndex<0) and (aMaq>0) then begin
      Maq := FMaquinas.PorNumero[aMaq];
      if Maq<>nil then
        aPrinterIndex := FJobs.PrinterIndexByComputer(Maq.ComputerName);
      DebugMsg('TncServidor.RegistraPaginasImpressasEsp - 2 - aPrinterIndex: '+ IntToStr(aPrinterIndex));
    end;
    
    if aPrinterIndex>=0 then 
      J := FJobs.PorJobID[aPrinterIndex, aJobID];
      
    if (J=nil) and (aForce) then 
      J := FJobs.JobMaqCliID(aMaq, 0);
      
    if J<>nil then begin
      DebugMsg('TncServidor.RegistraPaginasImpressasEsp - 3 - J<>nil');
    
      J.JobCliID := aJobID;
      if DM.SalvaClientPages(J, aMaq, aPaginas) then begin
        LoadCotas(J);
        PostMessage(FNotifyHWND, wm_processacotas, J.PrinterIndex, J.JobID);
      end;
      
      Exit;
    end else 
    if (not aForce) and (FMonitor<>nil) then begin
      DebugMsg('TncServidor.RegistraPaginasImpressas - J = nil');
      New(P);
      P^.icJobID := aJobId;
      P^.icMaq := aMaq;
      P^.icPaginas := aPaginas;
      P^.icImp := aImp;
      P^.icDoc := aDoc;
      PostMessage(FNotifyHWND, wm_registrapag, Integer(P), 0);
      Exit;
    end;
  end;
    

  if gConfig.PMPausaAutomatica and (not aForce) and (FMonitor<>nil) and gNaoPausar.Pausar(J.Computer) then Exit;

  if (Sessao<>nil) and gConfig.NaoCobrarImpFunc and (Sessao.TipoCli=tcManutencao) then begin
    DebugMsg('TncServidor.RegistraPaginasImpressas - Cobrança de impressões de funcionários DESATIVADA');
    Exit;
  end;
  
  if aMaq=0 then
    Maq := nil else
    Maq := Maquinas.PorNumero[aMaq];
    
  try
    DM.SalvaPaginasImpressas(J, aMaq, Maq, Sessao, aPaginas, aImp, aDoc, gConfig.ControlaImp);
  except
  end;
end;

function TncServidor.ModoManutencao(aMaq: Word; aUsername, aSenha: String; aEntrar: Boolean): Integer;
var 
  Usuario: TncUsuario;  
  Maq    : TncMaquina;
  Sessao : TncSessao;
  I, Q   : Integer;
  NumCx  : Integer;
begin
  Sessoes.Lock;
  Usuarios.Lock;
  Maquinas.Lock;
  try
    
    Maq := Maquinas.PorNumero[aMaq];
    if Maq = nil then begin
      DebugMsg('TncServidor.ModoManutencao - aUsername: ' + 
                aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] + 
                ' - ncerrMaquinaInexistente');
                                                                                       
      Result := ncerrMaquinaInexistente;
      Exit;
    end;

    Sessao := Sessoes.PorMaq[aMaq];
    
    if aEntrar then begin
      if (Sessao<>nil) then begin
        Result := ncerrAcessoEmAndamento;
        DebugMsg('TncServidor.ModoManutencao - aUsername: ' + 
                  aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] + 
                  ' - ncerrAcessoEmAndamento');
        Exit;
      end;  

      if Maq.Direito=dmNenhum then begin
        Result := ncerrMaqNaoLic;
        DebugMsg('TncServidor.ModoManutencao - aUsername: ' + 
                  aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] + 
                  ' - ncerrMaqNaoLic');
        Exit;
      end;
    end else
    if (Sessao=nil) or (Sessao.TipoCli<>tcManutencao) then begin
      Result := ncerrMaqNaoEstaManutencao;
      Exit;
    end;

    NumCx := DM.NumCaixaAberto;
    
    Usuario := Usuarios.PorUsername[aUsername];
    if aEntrar then begin
      if (Usuario=nil) or (Copy(Usuario.Senha, 1, 10)<>aSenha) then begin
        Result := ncerrInfoLoginInvalida; 
        DebugMsg('TncServidor.ModoManutencao - aUsername: ' + 
                  aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] + 
                  ' - ncerrInfoLoginInvalida');
        
        Exit;
      end;

      if not Permitido(Usuario, daMaqModoManutencao) then begin
        Result := ncerrAcessoNaoPermitido;
        DebugMsg('TncServidor.ModoManutencao - aUsername: ' + 
                  aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] + 
                  ' - ncerrAcessoNaoPermitido');
        Exit;
      end;

      if not Usuario.Admin then
      if (Usuario.MaxMaqManut>0) and (Usuario.MaxMaqManut<Maquinas.Count) then begin
        Q := 0;
        for I := 0 to Sessoes.Count-1 do 
          if (Sessoes[I].TipoCli=tcManutencao) and (Sessoes[I].FuncI=aUsername) then
            Inc(Q);
        if Q>=Usuario.MaxMaqManut then begin
          Result := ncerrLimiteManutUsuario;
          DebugMsg('TncServidor.ModoManutencao - aUsername: ' + 
                   aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] + 
                   ' - ncerrLImiteManutUsuario');
          Exit;
        end;   
      end;

      if NumCx=0 then begin
        Result := ncerrCaixaFechado;
        DebugMsg('TncServidor.ModoManutencao - aUsername: ' + 
                 aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] + 
                 ' - ncerrCaixaFechado');
        Exit;
      end;

      DM.ModoManutencao(aMaq, aUsername, Usuario.Nome, True, NumCx, nil);

      if aEntrar then LigaMaq(Maq);

      Result := 0;
      
      Sessao := CriaSessao(True);
      Sessao.LeDataset(DM.tSessao);
      Sessao.Notificar(tnCriacao);

      DebugMsg('TncServidor.ModoManutencao - aUsername: ' + 
                aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] + 
                ' - OK');
    end else begin
      if Usuario<>nil then
        aSenha := Usuario.Nome else
        aSenha := '';
      DM.ModoManutencao(aMaq, aUsername, aSenha, False, NumCx, Sessao);
      DebugMsg('TncServidor.ModoManutencao - aUsername: ' + 
                aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] + 
                ' - OK');
      Result := 0;
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_ModoManutencao;
       DebugMsg('TncServidor.ModoManutencao - aUsername: ' +
               aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar] +
               ' - Exception: '+E.Message);
       glog.LogCriticalException(self,Result, e, 'TncServidor.ModoManutencao - aUsername: ' +
               aUsername + ' - aSenha: ' + aSenha + ' aEntrar: ' + BoolStr[aEntrar]);
    end;
  end;
  Sessoes.UnLock;
  Usuarios.UnLock;
  Maquinas.UnLock;
end;

function TncServidor.Permitido(U: TncUsuario; TipoAcesso: Integer): Boolean;
begin
  if not U.Admin then 
    Result := ItemTrueStr(U.Direitos, TipoAcesso)
  else
    Result := True;
end;

function TncServidor.PermitirDownload(aSessao: Integer; aExe, aPermitir: Boolean): Integer;
var S : TncSessao;
begin
  try
    Result := 0;
    S := Sessoes.PorID[aSessao];
    if (S=nil) or S.Encerrou then Exit;
    if not DM.tSessao.FindKey([S.ID]) then Exit;
    DM.PermitirDownload(S, aExe, aPermitir);
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_PermitirDownload;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.TodosPerm(TipoAcesso: Integer): Boolean;
var I : Integer;
begin
  Result := False;
  for I := 0 to Usuarios.Count-1 do
  if not Permitido(Usuarios[I], TipoAcesso) then
    Exit;
  Result := True;
end;

procedure TncServidor.ChecaNumMaq(QtdL: Integer; aConta, aCodEquip: String; aSC: TStatusConta);
var 
  I, NM, NMI, NMF, Q: Integer;
  M : TncMaquina;
begin
{$I crypt_start.inc}
//  if QtdL<1 then QtdL := 1;
    
  if (gConfig.Conta<>aConta) or 
     (gConfig.QtdLic<>QtdL) or
     (gConfig.StatusConta<>aSC) or
     (gConfig.CodEquip<>aCodEquip) then 
  begin
    gConfig.AtualizaCache;
    gConfig.Conta := aConta;
    gConfig.StatusConta := aSC;
    gConfig.QtdLic := QtdL;
    gConfig.CodEquip := aCodEquip;
    gConfig.Notificar(tnAlteracao);
  end;
  
  if BDAtivo and (Maquinas.Count < QtdL) then
  try
    DM.InitTran([DM.tMaq], True);
    with DM do 
    try
      NM := 0;
      NMF := 0;
      tMaq.IndexName := 'INumero';
      Q := tMaq.RecordCount;
      if Q>0 then begin
        tMaq.Last;
        NM := tMaqNumero.Value;
      end else
        NM := 0;
        
      NMI := NM+1;   
      for I := Q+1 to QtdL do begin
        Inc(NM);
        tMaq.Insert;
        tMaqNumero.Value := NM;
        tMaqNome.Value := 'Máquina' + IntToStr(NM);
        tMaq.Post;
        M := CriaMaquina(True);
        M.LeDataset(tMaq);
        NMF := NM;
      end;    
      nxDB.Commit;
  
      for I := NMI to NMF do begin
        M := Maquinas.PorNumero[I];
        if M <> nil then begin
          M.LimpaCache;
          M.Notificar(tnAlteracao);
        end;
      end;    
        
    except
      tMaq.Cancel;
      nxDB.Rollback;
    end;
  except  
  end;
{$I crypt_end.inc}
end;

function TncServidor.CorrigeDataCaixa(aFunc: String; aID: Integer;
  aNovaAbertura, aNovoFechamento: TDateTime): integer;
var U : TncUsuario;  
begin
  try
    U := Usuarios.PorUsername[aFunc];
    if U = nil then begin
      Result := ncerrUsuarioInexistente;
      Exit;
    end;

    if not U.Admin then begin
      Result := ncerrAcessoNaoPermitido;
      Exit;
    end;
  
    Result := DM.CorrigeDataCaixa(aFunc, aID, aNovaAbertura, aNovoFechamento);
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_CorrigeDataCaixa;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

{ TncServidor }

function MaxInt(I1, I2: Integer): Integer;
begin
{$I crypt_start.inc}
  if I1>I2 then
    Result := I1
  else
    Result := I2;  
{$I crypt_end.inc}
end;

procedure TncServidor.LoadCotas(J: TncJob);
var S: TncSessao;
begin
  if gConfig.PMCotas and (J.Maquina>0) then begin
    J.AtualizaCache;
    if (not J.CotasLoaded) then begin
      J.CotasLoaded := True;
      S := FSessoes.PorMaq[J.Maquina];
      if (S<>nil) and (S.Cliente>0) then 
        DM.ObtemDadosCotas(S.Cliente, J)
      else begin
        J.MaxImpDia := 0;
        J.MaxImpMes := 0;
        J.ImpDia := 0;
        J.ImpMes := 0;
      end;
    end;
    J.Notificar(tnAlteracao);
  end else begin
    J.CotasLoaded := (not gConfig.PMCotas) or (J.Maquina>0);
    J.MaxImpDia := 0;
    J.MaxImpMes := 0;
    J.ImpDia := 0;
    J.ImpMes := 0;
  end;
end;

procedure TncServidor.LoadPrintDocs;
var 
  SR: TSearchRec;
  S, sIni : String;
  sl : TStrings;
  P: TncPrintDoc;
begin
  S := PRFolder('s');
  sl := TStringList.Create;
  try
    if FindFirst(S+'*.pdf', faAnyFile, SR)=0 then 
    try
      repeat
        sIni := S + Copy(SR.Name, 1, Length(SR.Name)-3) + 'ini';
        sl.Text := '';
        if FileExists(sIni) then begin
          sl.LoadFromFile(sIni);
          if (sl.Values['Sessao'] = '') or (FSessoes.PorID[StrToIntDef(sl.Values['Sessao'], 0)]<>nil) then begin
            P := CriaPrintDoc(True);
            P.DocInfo.Text := sl.Text;
            P.LimpaCache;
            P.Notificar(tnCriacao);
          end else begin
            DeleteFile(PChar(S+SR.Name));
            DeleteFile(PChar(sIni));
          end;
        end else 
          DeleteFile(PChar(S+SR.Name));
      until (FindNext(SR)<>0);
    finally
      SysUtils.FindClose(SR);
    end;

    S := PRFolder('p');
    if FindFirst(S+'*.*', faArchive, SR)=0 then 
    try
      repeat
        DeleteFile(PChar(S+SR.Name));
        DebugMsg('TncServidor.LoadPrintDocs - DeleteFile: ' + S + SR.Name);
      until (FindNext(SR)<>0);
    finally
      SysUtils.FindClose(SR);
    end;    
  finally
    sl.Free;
  end;
end;

function TncServidor.Login(aUsername, aSenha: String; aMaq: Word; aFuncAtual: Boolean; aRemoto: Boolean;
  aWndHandle: HWND; aProxyHandle: Integer; aSocket: integer; aSessionID: Integer; aIP: String; var Handle: Integer): Integer;
var 
  Usuario: TncUsuario;  
  Maq    : TncMaquina;
  Cli    : TncCliente;
  NumC   : Integer;
  S      : TncSessao;
begin
  try
    DebugMsg('TncServidor.Login(aUsername: '+aUsername+
             ', aSenha: '+aSenha+
             ', aMaq: '+IntToStr(aMaq)+
             ', aFuncAtual: '+BoolStr[aFuncAtual]+
             ', aRemoto: '+BoolStr[aRemoto]+
             ', aWndHandle: '+IntToStr(aWndHandle)+
             ', aProxyHandle: '+IntToStr(aProxyHandle)+
             ', aSocket: '+IntToStr(aSocket)+
             ', aSessionID: '+IntToStr(aSessionID)+
             ', aIP: '+aIP);
             
    if (gConfig.NomeArqDesktop>'') and (not FileExists(gConfig.NomeArqDesktop)) then
    begin
      DebugMsg('TncServidor.Login - gConfig.NomeArqDesktop: ' + gConfig.NomeArqDesktop + ' não existe.');
      gConfig.TipoFDesktop := '';
    end;

    DebugMsg('TncServidor.Login 2');

    if (gConfig.NomeArqLogin>'') and (not FileExists(gConfig.NomeArqLogin)) then
    begin
      DebugMsg('TncServidor.Login - gConfig.NomeArqLogin: ' + gConfig.NomeArqLogin + ' não existe.');
      gConfig.TipoFLogin := '';
    end;

    DebugMsg('TncServidor.Login 3');
    
    if aMaq>0 then begin
      Maq := Maquinas.PorNumero[aMaq];
      DebugMsg('TncServidor.Login 4');
      DM.InitTran([DM.tMaq], True);
      DebugMsg('TncServidor.Login 5');
      with DM do 
      try
        DebugMsg('TncServidor.Login 6');
      
        if not tMaq.Locate('Numero', aMaq, []) then begin
          tMaq.Insert;
          tMaqNumero.Value := aMaq;
          tMaqNome.Value := 'Máquina' + IntToStr(aMaq);
        end else
          tMaq.Edit;

        DebugMsg('TncServidor.Login 7');
        tMaqConnectTime.Value := Now;
        tMaqSessionID.Value := aSessionID;
        tMaq.Post;
        DebugMsg('TncServidor.Login 8');
        if Maq=nil then begin
          DebugMsg('TncServidor.Login 9');
          Maq := CriaMaquina(True);
          DebugMsg('TncServidor.Login 10');
          Maq.LeDataset(tMaq);
        end;
        DebugMsg('TncServidor.Login 11');
        nxDB.Commit;
      except
        on e: exception do begin
          DebugMsg('TncServidor.Login 12 - '+E.Message);
          tMaq.Cancel;
          nxDB.Rollback;
          Raise;
        end;
      end;
    end else
      Maq := nil;

    DebugMsg('TncServidor.Login 13');

    if (Maq<>nil) then begin
      DebugMsg('TncServidor.Login 14');
      S := FSessoes.PorMaq[aMaq];
      DebugMsg('TncServidor.Login 15');
      if S<>nil then begin
        DebugMsg('TncServidor.Login 16');
        DM.SalvaIPSessao(S, Maq.IP);
      end;
    end; 

    DebugMsg('TncServidor.Login 17');
    
    if (aUserName = ProxyUsername) then begin
      DebugMsg('TncServidor.Login 18');
      if aSenha = ProxySenha then begin
        Handle := ProximoHandle;
        DebugMsg('TncServidor.Login 19');
        Result := inherited Login(aUserName, aSenha, aMaq, aFuncAtual, aRemoto, aWndHandle, 
                                  aProxyHandle, aSocket, aSessionID, aIP, Handle);
        DebugMsg('TncServidor.Login 20');
        if (Result=0) and (Maq<>nil) then begin
          DebugMsg('TncServidor.Login 21');
          Maq.IDCliente := Handle;
          Maq.IP := aIP;
          DebugMsg('TncServidor.Login 22');
          Maq.LimpaCache;
          DebugMsg('TncServidor.Login 23');
          Maq.Notificar(tnAlteracao);
          DebugMsg('TncServidor.Login 24');
        end;  
      end else
        Result := ncerrInfoLoginInvalida;
        
      DebugMsg('TncServidor.Login 25');
      if aMaq > 0 then begin
        DebugMsg('TncServidor.Login 26');
        DM.GravaLog(0, aMaq, 'ENTROU');
      end;

      DebugMsg('TncServidor.Login 27');
      Exit;  
    end;

    DebugMsg('TncServidor.Login 28');
    Usuarios.Lock;
    try
      DebugMsg('TncServidor.Login 29');
      Usuario := Usuarios.PorUsername[aUsername];
      DebugMsg('TncServidor.Login 30');
      if (Usuario<>nil) and (Copy(Usuario.Senha, 1, 10)=aSenha) then begin
        DebugMsg('TncServidor.Login 31');
        Handle := ProximoHandle;
        DebugMsg('TncServidor.Login 32');
        DM.ApagaRec(Handle);
        DebugMsg('TncServidor.Login 33');
        Result := inherited Login(aUserName, aSenha, aMaq, aFuncAtual, aRemoto, aWndHandle, 
                                  aProxyHandle, aSocket, aSessionID, aIP, Handle);
        DebugMsg('TncServidor.Login 34');
        if Result = 0 then begin
          DebugMsg('TncServidor.Login 35');
          Usuario.NumClientes := Usuario.NumClientes + 1;
          DebugMsg('TncServidor.Login 36');
          Usuario.Notificar(tnAlteracao);
          DebugMsg('TncServidor.Login 37');
          if aFuncAtual then FFuncAtual := aUsername;
          DebugMsg('TncServidor.Login 38');
          if (Maq<>nil) then begin
            DebugMsg('TncServidor.Login 39');
            Maq.IDCliente := Handle;
            Maq.IP := aIP;
            Maq.LimpaCache;
            DebugMsg('TncServidor.Login 40');
            Maq.Notificar(tnAlteracao);
            DebugMsg('TncServidor.Login 41');
          end else begin
            DebugMsg('TncServidor.Login 42');
            DM.GravaLog(1, aMaq, 'ENTROU');
          end;
          DebugMsg('TncServidor.Login 43');
        end;                            
        DebugMsg('TncServidor.Login 44');
      end else
        Result := ncerrInfoLoginInvalida;   
    finally
      DebugMsg('TncServidor.Login 45');
      Usuarios.Unlock;
    end; 

    DebugMsg('TncServidor.Login 46');
    NumC := FMaquinas.NumConectados;
    DebugMsg('TncServidor.Login 47');
    if NumC>MaxMaquinas then MaxMaquinas := NumC;
    DebugMsg('TncServidor.Login 48');
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_Login;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

procedure TncServidor.CriaTimerUpdAll(aInterval: Cardinal);
begin
  DebugMsg('TncServidor.CriaTimerUpdAll - aInterval: '+IntToStr(aInterval));
  with TTimer.Create(nil) do begin
    Interval := aInterval;
    if Interval > 600000 then 
      Interval := 600000;
    OnTimer := OnTimerUpdAll;
    Enabled := True;  
  end;
end;

function TncServidor.CriaTipoAcesso(InsereLista: Boolean): TncTipoAcesso;
begin
  Result := TncTipoAcesso.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    gTiposAcesso.Add(Result);
end;

function TncServidor.CriaEspecie(InsereLista: Boolean): TncEspecie;
begin
  Result := TncEspecie.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    gEspecies.Add(Result);
end;

function TncServidor.CriaTipoImp(InsereLista: Boolean): TncTipoImp;
begin
  Result := TncTipoImp.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    gTiposImp.Add(Result);
end;

function TncServidor.CriaTarifa(InsereLista: Boolean): TncTarifa;
begin
  Result := TncTarifa.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    gTarifas.Add(Result);
end;

function TncServidor.CriaMaquina(InsereLista: Boolean): TncMaquina;
begin
  Result := TncMaquina.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FMaquinas.Add(Result);
end;

function WndMsgFunc(hWindow : Hwnd; Msg : UINT;
                    wParam : WPARAM;
                    lParam : LPARAM) : LRESULT; stdcall export;
var
  Obj : TncServidor;
  M : TMessage;
  
  function DefWndFunc : LongInt;
  begin
    DefWndFunc := DefWindowProc(hWindow, Msg, wParam, lParam);
  end;

begin
  Result := 0;

  case MSG of
    wm_queryendsession : Result := 1;
    wm_endsession : Result := 1;
  else  
    if MSG<>wm_Create then 
      Obj := TncServidor(GetWindowLong(hWindow, 0)) else
      Obj := nil;
      
    if Obj<>nil then begin
      try
        M.Msg := Msg;
        M.WParam := WParam;
        M.LParam := LParam;
        Obj.Dispatch(M);
        Result := M.Result;
      except
      end;
    end else
      Result := DefWndFunc;
  end;
end;

procedure TncServidor.CriaNotifyWindow;
var XClass : TWndClass;
begin
  inherited;
  XClass.hInstance := HInstance;
  with XClass do begin
    Style         := 0;
    lpfnWndProc   := @WndMsgFunc;
    cbClsExtra    := 0;
    cbWndExtra    := SizeOf(Pointer);
    hIcon         := LoadIcon(hInstance, 'DEFICON');
    hCursor       := LoadCursor(0, idc_Arrow);
    hbrBackground := 0;
    lpszMenuName  := nil;
    lpszClassName := WndClassName;
  end;
  WinProcs.RegisterClass(XClass);

  Self.FNotifyHWND :=
    CreateWindow(WndClassName,           {window class name}
                 '',                     {caption}
                 0,                      {window style}
                 0,                      {X}
                 0,                      {Y}
                 1,                      {width}
                 1,                      {height}
                 0,                      {parent}
                 0,                      {menu}
                 HInstance,              {instance}
                 nil);                   {parameter}
                 
  SetWindowLong(FNotifyHWND, 0, Longint(Self));
end;

function TncServidor.CriaSessao(InsereLista: Boolean): TncSessao;
begin
  Result := TncSessao.Create(False);
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FSessoes.Add(Result);
end;

function TncServidor.CriaUsuario(InsereLista: Boolean): TncUsuario;
begin
  Result := TncUsuario.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FUsuarios.Add(Result);
end;

function TncServidor.CriaClasseCS(TipoClasse: Integer): TClasseCS;
begin
  case TipoClasse of
    tcMaquina    : Result := CriaMaquina(False);
    tcUsuario    : Result := CriaUsuario(False);
    tcTipoAcesso : Result := CriaTipoAcesso(False);
    tcTarifa     : Result := CriaTarifa(False);
    tcSessao     : Result := CriaSessao(False);
    tcJob        : Result := CriaJob(False);
    tcPrintDoc   : Result := CriaPrintDoc(False);
    tcTipoImp    : Result := CriaTipoImp(False);
    tcEspecie    : Result := CriaEspecie(False);
  else
    Result := nil;  
  end;
end;

function TncServidor.CriaJob(InsereLista: Boolean): TncJob;
begin
  Result := TncJob.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FJobs.Add(Result);
end;

function TncServidor.CriaPrintDoc(InsereLista: Boolean): TncPrintDoc; 
begin
  Result := TncPrintDoc.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FPrintDocs.Add(Result);
end;

procedure TncServidor.AoRemoverCliente(Cliente: TncCliente);
var 
  U : TncUsuario;
  M : TncMaquina;
  S : TncSessao;
begin
  M := nil;
  inherited;
  if Cliente.Maquina>0 then begin
    Maquinas.Lock;
    try
      M := Maquinas.PorIDCliente[Cliente.Handle];
      if (M<>nil) then begin
        M.IDCliente := ObtemHandleClientePorMaq(M.Numero);
        M.LimpaCache;
        M.Notificar(tnAlteracao);
      end;
    finally
      Maquinas.UnLock;
    end;  

    DM.GravaLog(0, Cliente.Maquina, 'SAIU');

    if (M<>nil) then begin
      S := Sessoes.PorMaq[M.Numero];
      if (S<>nil) then begin
        if (S.TipoCli=tcManutencao) then
          LogoutMaq(M.Numero)
//          ModoManutencao(M.Numero, '', '', False)
        else
        if (S.FimTicksUsados>0) then
          LogoutMaq(M.Numero);
      end;
    end;
  end;  

  Usuarios.Lock;
  try
    U := Usuarios.PorUsername[Cliente.Username];
    if (U <> nil) and (U.NumClientes > 0) then begin
      U.NumClientes := U.NumClientes - 1;
      U.Notificar(tnAlteracao);

      if M<>nil then DM.GravaLog(1, 0, 'SAIU');
    end;  
  finally
    Usuarios.Unlock;
  end; 

  if Cliente.Maquina=0 then
    DM.ApagaRec(Cliente.Handle);
end;

function TncServidor.TransferirMaq(aOrigem, aDestino: Word): Integer;
var
  D : TncMaquina;  
  Sessao: TncSessao;
begin
  try
    Sessao := Sessoes.PorMaq[aOrigem];
      
    D := Maquinas.PorNumero[aDestino];
      
    if (Sessao = nil) or (D = nil) then begin
      Result := ncerrItemInexistente;
      Exit;
    end;
      
    if Sessao=nil then begin
      Result := ncerrMaquinaSemAcesso;
      Exit;
    end;

    if Sessao.Encerrou then begin
      Result := ncerrTransfAguardaPagto;
      Exit;
    end;

    if (Sessoes.PorMaq[aDestino]<>nil) then begin
      Result := ncerrAcessoEmAndamento;
      Exit;
    end;

    if D.Direito=dmNenhum then begin
      Result := ncerrMaqNaoLic;
      Exit;
    end;

    if D.IDCliente>0 then
      Sessao.AddIP(D.IP);

    DM.TransferirMaq(aOrigem, aDestino, Sessao, UsernameAtual);
    try
      DM.RefreshEspera(Sessoes, Maquinas);
    except
    end;

    Result := 0;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_TransferirMaq;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;


procedure TncServidor.wmAbreServ(var Msg: TMessage);
begin
  PostMessage(handleFrmPri, wm_user+3, Msg.WParam, 0);
end;

procedure TncServidor.wmAlterouCHorario(var Msg: TMessage);
begin
  DebugMsg('TncServidor.wmAlterouCHorario');
  try
    Lock;
    try
      DM.RefreshCHSessoes(Msg.wParam);
    finally
      Unlock;
    end;
  except
    on E: Exception do
      DebugMsgEsp('TncServidor.wmAlterouCHorario - Exception: '+E.Message, False, True);
  end;
end;

procedure TncServidor.wmAutoPrintPDF(var Msg: TMessage);
var 
  P : TncPrintDoc;
begin
  Lock;
  try
    P := TncPrintDoc(Msg.WParam);
    try
      P := FPrintDocs.PorArq[P.ArqStr];
      if P<>nil then begin
        P.DocInfo.Values['Control'] := 'liberar';
        PrintDocControl(P.DocInfo);
      end;
    except
    end;
  finally
    Unlock;
  end;
end;

procedure TncServidor.wmProcessaCotas(var Msg: TMessage);
var J: TncJob;
begin
  try
    DebugMsg('TncServidor.wmProcessaCotas');
    Lock;
    try
      if not Ativo then Exit;
      J := FJobs.PorJobID[Msg.WParam, Msg.LParam];
      if (J<>nil) then ProcessaCotas(J);
    finally
      Unlock;
    end;
  except
    on E: Exception do 
      DebugMsg('TncServidor.wmProcessaCotas');
  end;
end;

procedure TncServidor.wmProcessaPlus(var Msg: TMessage);
begin
  Exit;
  
  DebugMsg('TncServidor.wmProcessaPlus');
  try
    Lock;
    try
      if not DM.ProcessaPlus then
        FTimerPlus.Enabled := True;
    finally
      Unlock;
    end;
  except
    on E: Exception do
      DebugMsgEsp('TncServidor.wmProcessaPlus - Exception: '+E.Message, False, True);
  end;
end;

procedure TncServidor.wmRefreshUrls(var Msg: TMessage);
begin
  Lock;
  try
    if not Ativo then Exit;
    gConfig.AtualizaCache;
    gConfig.Urls := gUrls.AsString;
    gConfig.Notificar(tnAlteracao);
    DM.tConfig.Edit;
    DM.tConfigUrls.Value := gUrls.AsString;
    DM.tConfig.Post;
  finally
    Unlock;
  end;
end;

procedure TncServidor.wmRegistraPaginasImpressas(var Msg: TMessage);
var 
  P : PncImpCache;
  T : TTimer;
begin
  try
    DebugMsg('TncServidor.wmRegistraPaginasImpressas');
  
    Msg.Result := 0;
    P := PncImpCache(Msg.wParam);

    T := TTimer.Create(Self);
    T.Name := 'Timer' + IntToStr(Random(High(Integer)));
    T.Enabled := True;
    T.Interval := 5000;
    T.Tag := Integer(P);
    T.OnTimer := ImpCacheTimer;
  except
    on E: Exception do 
      DebugMsg('TncServidor.ImpCacheTimer - E.Message: ' + E.Message);
  end;
end;

procedure TncServidor.wmRemoveSession(var Msg: TMessage);
begin
  Lock;
  try
    if not Ativo then Exit;
    LogoutSession(Msg.WParam);
  finally
    Unlock;
  end;
end;

procedure TncServidor.wmSiteBloqueado(var Msg: TMessage);
begin
  EnviaEvento(ncmc_SiteBloqueado, Pointer(Msg.LParam));
end;

function TncServidor.PararTempoMaq(aMaq: Word; aParar: Boolean): Integer; 
var S: TncSessao;
begin
  Result := 0;
  try
    DebugMsg('PararTempoMaq - 1');
    S:= Sessoes.PorMaq[aMaq];
    DebugMsg('PararTempoMaq - 2');
    if S=nil then begin
      Result := ncerrMaquinaSemAcesso;
      Exit;
    end;
    DebugMsg('PararTempoMaq - 3');

    if S.Pausado=aParar then Exit;
    DebugMsg('PararTempoMaq - 4');

    if not DM.tSessao.FindKey([S.ID]) then begin
      Result := ncerrItemInexistente;
      Exit;
    end;
    DebugMsg('PararTempoMaq - 5');

    DM.PausarSessao(S, aParar);
    DebugMsg('PararTempoMaq - 6');
    Result := 0;
  except
    on e: exception do begin
       DebugMsg('PararTempoMaq - Exception: '+E.Message);
       Result := ncerrExcecaoNaoTratada_TncServidor_PararTempoMaq;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;


function TncServidor.AbreCaixa(aFunc: String; aSaldo: Currency; var NovoCx: Integer): Integer;
var
  U : TncUsuario;
  DMC : TdmCaixa;
begin
  try
    U := Usuarios.PorUsername[aFunc];
    if U = nil then begin
      Result := ncerrUsuarioInexistente;
      Exit;
    end;

    if not Permitido(U, daCaiAbrirFechar) then begin
      Result := ncerrAcessoNaoPermitido;
      Exit;
    end;

    DMC := TdmCaixa.Create(nil);
    try
      DMC.nxSession.Active := False;
      DMC.nxSession.ServerEngine := dmServidorBD.ServerEngine;
      DMC.AbreConn;
      Result := DMC.AbreCaixa(aFunc, aSaldo, gConfig.ManterSaldoCaixa, NovoCx);
      if Result=0 then
        EnviaEvento(ncmc_AbriuFechouCaixa, nil);
    finally
      DMC.Free;
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AbreCaixa;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.AdicionaPassaporte(aMaq: Word;
  aSenha: String): Integer;
var 
  S  : TncSessao;
  P  : TncPassaporte;
begin
  with DM do 
  try
    S := Sessoes.PorMaq[aMaq];

    if S=nil then begin
      Result := ncerrMaquinaSemAcesso;
      Exit;
    end;

    if not tPassaporte.Locate('Senha', aSenha, []) then begin
      Result := ncerrInfoLoginInvalida;
      Exit;
    end;

    P := TncPassaporte.Create;
    try
      P.LoadFromDataset(tPassaporte);
  
      if tHPass.Locate('Sessao; Passaporte', VarArrayOf([S.ID, P.pcID]), []) then begin
        Result := ncerrPassaporteEmUso;
        Exit;
      end;
  
      if Sessoes.PassaporteEmUso(P.pcID) then begin
        Result := ncerrPassaporteEmUso;
        Exit;
      end;
  
      if not tSessao.FindKey([S.ID]) then begin
        Result := ncerrItemInexistente;
        Exit;
      end;
  
      InitTran([tHPass, tSessao], True);
      try
        tHPass.Insert;
        tHPassSessao.Value := S.ID;
        tHPassDataHora.Value := S.Inicio;
        tHPassPassaporte.Value := P.pcId;
        tHPass.Post;
  
        S.LimpaCache;
        S.PausaFimTempo(False);
        S.MinTicksUsados := S.TempoUsado.Ticks;
        S.MinTicksTotal  := S.TicksTotal;
        S.Passaportes.NewPassaporte.AssignFrom(P);
        S.Tarifador.Reset;
        
        tSessao.Edit;
        tSessaoMinTicksUsados.Value := S.MinTicksUsados;
        tSessaoMinTicksTotal.Value := S.MinTicksTotal;
        tSessaoStrPausas.Value := S.StrPausas;
        tSessao.Post;
        nxDB.Commit;
        S.Notificar(tnAlteracao);
        Result := 0;
      except
        nxDB.Rollback;
        Raise;
      end;
      Result := 0;
    finally
      P.Free;
    end;
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AdicionaPassaporte;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;
  
function TncServidor.AjustaPontosFid(aFunc: String; aCliente: Integer;
  aFator: Smallint; aPontos: Double; aObs: String): Integer;
var 
  U : TncUsuario;  
  S : TncSessao;
  pAntes : Double;
  I : Integer;
begin
  try
    U := Usuarios.PorUsername[aFunc];
    if U = nil then begin
      Result := ncerrUsuarioInexistente;
      Exit;
    end;

    if not Permitido(U, daCorrigirFidelidade) then begin
      Result := ncerrAcessoNaoPermitido;
      Exit;
    end;

    if (aCliente<>0) then begin
      S := Sessoes.PorCliente[aCliente];
      if S<>nil then begin
        pAntes := S.PontosCli;
        S.AtualizaCache;
      end;
    
      Result := DM.AjustaPontosFid(aFunc, aCliente, aFator, aPontos, aObs, S);
      if (Result=0) and (S<>nil) and (S.PontosCli<>pAntes) then
        S.Notificar(tnAlteracao);
    end else begin
      Result := DM.AjustaPontosFid(aFunc, 0, 0, 0, aObs, nil);
      if Result=0 then
      for I := 0 to Sessoes.Count-1 do 
        if Abs(Sessoes[I].PontosCli)>0.0001 then begin
          Sessoes[I].AtualizaCache;
          Sessoes[I].Notificar(tnAlteracao);
        end;
    end;

  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_AjustaPontosFid;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.LoginMaq(aSessao: TObject): Integer;
var
  Maq  : TncMaquina; 
  S, NovaSessao : TncSessao; 
  U : TncUsuario;
begin
  Result := 0;
  S := TncSessao(aSessao);
  try
    {$ifdef LOJA}
    if S.Maq>0 then begin
      if (Maquinas.PorNumero[S.Maq]<>nil) then
        S.TipoMaq := tipomaq_maqmesa
      else
      if gConfig.ComandaValida(S.Maq) then
        S.TipoMaq := tipomaq_comanda
      else begin
        Result := ncerrcomandainvalida;
        Exit;
      end;
    end else
      S.TipoMaq := tipomaq_avulso;
    {$endif}
    
    if S.TipoMaq=tipomaq_maqmesa then begin
      Maq := Maquinas.PorNumero[S.Maq];

      if Maq = nil then begin
        Result := ncerrItemInexistente;
        DebugMsg('TncServidor.LoginMaq - Máquina nao existe');
        Exit;
      end;
      if Maq.Direito=dmNenhum then begin
        Result := ncerrMaqNaoLic;
        DebugMsg('TncServidor.LoginMaq - Maquina '+ IntToStr(S.Maq) + ' - ncerrMaqNaoLic');
        Exit;
      end;
      if Maq.EmManutencao then begin
        Result := ncerrMaquinaEmManutencao;
        DebugMsg('TncServidor.LoginMaq - Maquina '+ IntToStr(Maq.Numero) + ' - ncerrMaquinaEmManutencao');
        Exit;
      end;

      if Maq.IDCliente>0 then
        S.AddIP(Maq.IP);
        
      if Versoes.PodeUsar(idre_tipoacessomaq) then
      if (Maq.TipoAcesso>-1) and (gTiposAcesso.PorCodigo[Maq.TipoAcesso]<>nil) then
        S.TipoAcesso := Maq.TipoAcesso;
    end;  

    if S.TipoMaq in [tipomaq_maqmesa..tipomaq_comanda]  then
    if Sessoes.PorMaq[S.Maq]<>nil then begin
      DebugMsg('TncServidor.LoginMaq - Maquina '+ IntToStr(S.Maq) + ' - ncerrAcessoEmAndamento');
      Result := ncerrAcessoEmAndamento;
      Exit;
    end;
    
    U := FUsuarios.PorUsername[S.UsernameLogin];
    if (U<>nil) and (U.Senha=S.SenhaLogin) then begin
      Result := Self.ModoManutencao(S.Maq, S.UsernameLogin, S.SenhaLogin, True);
      DebugMsg('TncServidor.LoginMaq - Maquina '+ IntToStr(Maq.Numero) + ' - Res: ' + IntToStr(Result));
      Exit;
    end;  
    
    NovaSessao := CriaSessao(True);
    try
      NovaSessao.Assign(S);
      Result := DM.SalvaLoginMaq(NovaSessao, Sessoes, UsernameAtual, gConfig);
      DebugMsg('TncServidor.LoginMaq - Maquina '+ IntToStr(Maq.Numero) + ' - Res: ' + IntToStr(Result));
      
      if (Result=0) then begin
        {$ifdef LAN}
        LigaMaq(Maq);
        {$ENDIF}
        NovaSessao.LimpaCache;
        NovaSessao.Notificar(tnCriacao);
      end else
        NovaSessao.Free;

      {$ifdef LAN}  
      try
        if S.TipoMaq=0 then
          DM.RefreshEspera(Sessoes, Maquinas);
      except
      end;
      {$endif}
    except 
      NovaSessao.Free;
      Raise;
    end;
  except
    on e: exception do begin
       DebugMsg('TncServidor.LoginMaq - Exception: ' + E.Message);
       Result := ncerrExcecaoNaoTratada_TncServidor_LoginMaq;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.PreLogoutMaq(aMaq: Word): Integer; 
var S: TncSessao;
begin
  Result := 0;
  with DM do 
  try
    InitTran([tSessao], True);
    try
      tSessao.IndexName := 'IID';
      S := Sessoes.PorMaq[aMaq];
      if (S=nil) or (not tSessao.FindKey([S.ID])) then begin
        Result := ncerrItemInexistente;
        Exit;
      end;

      if S.Encerrou then Exit;

      tSessao.Edit;
      tSessaoFimTicksUsados.Value := S.TempoUsado.Ticks;
      tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
      tSessaoMinTicksTotal.Value  := S.TicksTotal;
      tSessao.Post;
      nxDB.Commit;

      S.AtualizaCache;
      S.FimTicksUsados := tSessaoFimTicksUsados.Value;
      S.MinTicksUsados := tSessaoMinTicksUsados.Value;
      S.MinTicksTotal  := tSessaoMinTicksTotal.Value;
      S.Notificar(tnAlteracao);
    except
      nxDB.Rollback;
      Raise;
    end; 
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_PreLogoutMaq;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.PrintDoc(aArqInfo: TStrings): integer;
begin

end;

procedure TncServidor.ProcessaCotas(J: TncJob);
begin
  if J.ControlarCotas and (not J.CotasProc) then begin
    J.AtualizaCache;
    if (J.PassouCota<=0) then begin
      if gConfig.PMCotasOpCota=opcota_liberarauto then
        JobControl(J.PrinterIndex, J.JobID, jc_resume);
    end else begin
      if (gConfig.PMCotasOpExcesso=opexcesso_cancelarauto) or
         ((gConfig.PMCotasMaxExcesso>0) and (J.PassouCota>gConfig.PMCotasMaxExcesso)) then
        JobControl(J.PrinterIndex, J.JobID, jc_delete); 
    end;
    J.CotasProc := True;
    J.Notificar(tnAlteracao);
  end;
end;

function TncServidor.CancelaTran(aID: Integer; aFunc: String): Integer;
begin
  try
    Result := DM.CancelarTran(aID, aFunc, Sessoes);
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_CancelaTran;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.CancLogoutMaq(aMaq: Word): Integer;
var S: TncSessao;
begin
  Result := 0;
  with DM do 
  try
    InitTran([tSessao], True);
    try
      S := Sessoes.PorMaq[aMaq];
      tSessao.IndexName := 'IID';
      if (S=nil) or (not tSessao.FindKey([S.ID])) then begin 
        Result := ncerrItemInexistente;
        Exit;
      end;

      if S.Encerrou then Exit;
      
      tSessao.Edit;
      tSessaoFimTicksUsados.Value := 0;
      tSessaoMinTicksUsados.Value := S.TempoUsado.Ticks;
      tSessaoMinTicksTotal.Value := S.TicksTotal;
      tSessao.Post;
      nxDB.Commit;

      S.AtualizaCache;
      S.FimTicksUsados := 0;
      S.MinTicksUsados := tSessaoMinTicksUsados.Value;
      S.MinTicksTotal  := tSessaoMinTicksTotal.Value;
      S.Notificar(tnAlteracao);
    except
      nxDB.Rollback;
      Raise;
    end; 
  except
    on e: exception do begin
       Result := ncerrExcecaoNaoTratada_TncServidor_CancLogoutMaq;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

function TncServidor.LogoutMaq(aMaq: Word): Integer;
var S   : TncSessao; 
   I1, I2 : Integer;
// Tempos : TArrayTempo;
begin
  Result := 0;
  with DM do 
  try
    S := Sessoes.PorMaq[aMaq];
      
    if S = nil then begin
      Result := 0;
//      Result := ncerrItemInexistente;
      Exit;
    end;
      
    if S.Encerrou  then begin
      Result := 0;
      Exit;
    end;

    tCli.IndexName := 'IID';
    if (S.Cliente>0) and (not tCli.FindKey([S.Cliente])) then
    begin
      S.Cliente := 0;
      S.MinutosCli := 0; 
    end;

    if (FPrintDocs.PorSessao[S.ID]<>nil) or FJobs.TemJobPend(S.Maq) then begin
      Result := ncerrImpressaoPendente;
      Exit;
    end;

    if not tSessao.FindKey([S.ID]) then begin
      Result := ncerrErroBD;
      Exit;
    end; 

    if tSessaoVersaoRegistro.Value <> S.VersaoRegistro then begin
      Result := ncerrAcessoAlteradoPorOutroUsuario;
      Exit;
    end;

    Result := DM.SalvaLogoutMaq(S, gConfig, UsernameAtual);
    try
      DM.RefreshEspera(Sessoes, Maquinas);
    except
    end;
  except
    on e: exception do begin
       nxDB.Rollback;
       Result := ncerrExcecaoNaoTratada_TncServidor_LogoutMaq;
       glog.LogCriticalException(self,Result, e);
    end;
  end;
end;

initialization
  Randomize;
  LadoServidor := True;

end.
