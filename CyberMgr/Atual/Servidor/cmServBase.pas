unit cmServBase;

interface

uses
  kbmMemtable,
  cmServBD,
  cmServAtualizaLic,
  Classes,
  SysUtils,                         
  Windows,
  Variants,
  Db,
  nxdb,
  nxdbBase,
  FileCtrl,
  SyncObjs,
  
  ClasseCS,
  cmErros,
  ScktComp,
  cmClassesBase,
  cmMsgCom,
  cmListaID,
  cmIDRecursos;
  

type  
  THackTMClasse = class ( TCMClasse );

{  TJobImp = record
    jiID     : Cardinal;
    jiStatus : TPBJobStatus;
    jiTicks  : Cardinal;
  end;
  PJobImp = ^TJobImp;}

  TCMServidor = class ( TCMServidorBase )
  private
    FSession      : TnxSession;
    FDB           : TnxDatabase;
    FTUsuario     : TnxTable;
    FTMaquina     : TnxTable;
    FTGrupo       : TnxTable;
    FTContato     : TnxTable;
    FTTran        : TnxTable;
    FTConfig      : TnxTable;
    FTHoraCor     : TnxTable;
    FTCor         : TnxTable;
    FTCorPrecos   : TnxTable;
    FTCaixa       : TnxTable;
    FTTipoAcesso  : TnxTable;
    FTLog         : TnxTable;
    FTImp         : TnxTable;
    FTMovEst      : TnxTable;
    FTProduto     : TnxTable;
    FTPassaporte  : TnxTable;
    FTHistPass    : TnxTable;
    FTAvisos      : TnxTable;
    FTChat        : TnxTable;
{    FMonitor      : TPBPrintersMonitor;
    FJobs         : TList;}
    
    
    FServidorBD   : TCMServidorBD;
    FAtualizaLic  : TThreadAtualizaLic;
    FFuncAtual    : String;
    FChaveLib     : String;
    
    FMaquinas     : TCMListaMaquinas;
    FUsuarios     : TCMListaUsuarios;
    FGrupos       : TCMListaGrupos;
    FTiposAcesso  : TCMListaTipoAcesso;
    FCorPrecos    : TCMListaCorPreco;
    
    FBDSync       : TCriticalSection; 
    FConfig       : TCMConfig;

    procedure EnviaEventoStreamObj(Mensagem: Integer; Obj: TCMClasse);

    function AtualizaMaquinaBD(Maq: TCMMaquina): Integer;
    function AtualizaUsuarioBD(Usuario: TCMUsuario): Integer;
    function AtualizaGrupoBD(Grupo: TCMGrupo): Integer;
    function AtualizaTipoAcessoBD(TA: TCMTipoAcesso): Integer;
    function AtualizaConfigBD: Integer;

    procedure GravaLog(Programa, Maq: Integer; Operacao: String);

  protected  
    procedure AoCriarObj(Obj: TCMClasse); virtual; 
    procedure AoAlterarObj(Obj: TCMClasse); virtual; 
    procedure AoDestruirObj(Obj: TCMClasse); virtual; 
    
    function ObtemLista(TipoClasse: Integer): TListaClasseCS;
  
    procedure SetAtivo(Valor: Boolean); override;

    procedure CriaServidorBD;
    procedure DestroiServidorBD;               

    procedure Notificacao(Obj: TCMClasse; TipoNot: TTipoNotificacao);

    procedure AoRemoverCliente(Cliente: TCMCliente); override;
    procedure LeMaquinaBD(Maq: TCMMaquina);

    function NumCaixaAberto: Integer;

    procedure SalvaSinal(Maq: TCMMaquina);

  public  
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function CriaClasseCS(TipoClasse: Integer): TClasseCS;
    function CriaMaquina(InsereLista: Boolean): TCMMaquina; virtual;
    function CriaUsuario(InsereLista: Boolean): TCMUsuario; virtual;
    function CriaGrupo(InsereLista: Boolean): TCMGrupo; virtual;
    function CriaTipoAcesso(InsereLista: Boolean): TCMTipoAcesso; virtual;
    function CriaCorPreco(InsereLista: Boolean): TCMCorPreco; virtual;

    function ObtemLicenca(var LicencaStr: TLicencaStr): Integer; override;
    function SalvaLicenca(LicencaStr: String): Integer; override;

    function ArqFundoEnviado(NomeArq: String): Integer; override;
    function ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer; override;
    function SalvaSenhaCli(Codigo: Integer; Senha: String): Integer; override;
    function LimpaFundo(Desktop: Boolean): Integer; override;
    
    
    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; override;
    function ObtemStreamAvisos(S: TStream): Integer; override;
    function ObtemStreamConfig(S: TStream): Integer; override;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; override;
    
    function CapturaTelaMaq(aMaq: Byte; S: TMemoryStream): integer; override;
    function SalvaTelaMaq(aMaq: Byte; S: TMemoryStream): integer; override;
    function ShutdownMaq(aMaq, aOper: Byte): integer; override;
    function EnviarMsg(const aDe, aPara: Integer; const aTexto: String): Integer; override;
    
    function ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer; S: TStream): Integer; override;
    
    function Login(aUsername, 
                   aSenha: String; 
                   aMaq: Byte;
                   aFuncAtual: Boolean;
                   aRemoto: Boolean; 
                   aWndHandle: HWND; 
                   aProxyHandle: Integer; 
                   aSocket: Integer;
                   var Handle: Integer): Integer; override;

    function LoginMaq(aMaq: Byte; 
                      aContato: Integer;
                      aUserName, aSenha, aNome, aObsAcesso: String; 
                      aLimiteTempo: Cardinal; 
                      aSinal: Double; 
                      aTipoAcesso: Word): Integer; override;

    function AdicionaPassaporte(aMaq: Byte; aSenha: String): Integer; override;

    function RegistraPaginasImpressas(aMaq: Byte; aPaginas: Integer; aImp, aDoc: String): Integer; override;
                      
    function LogoutMaq(aMaq: Byte): Integer; override;
    
    function PararTempoMaq(aMaq: Byte; aParar: Boolean): Integer; override;

    function LiberarAlemPacote(aMaq: Byte): Integer; override;

    function TransferirMaq(aOrigem, aDestino: Byte): Integer; override;

    function ModoManutencao(aMaq: Byte; aUsername, aSenha: String; aEntrar: Boolean): Integer; override;
    
    function PreLogoutMaq(aMaq: Byte): Integer; override;
    function CancLogoutMaq(aMaq: Byte): Integer; override;

    function Permitido(U: TCMUsuario; TipoAcesso: Integer): Boolean;
    function TodosPerm(TipoAcesso: Integer): Boolean;

    function RefreshPrecos: integer; override;

    procedure ChecaNumMaq;

    procedure RefreshCorPrecos;

    property ServidorBD: TCMServidorBD
      read FServidorBD; 
      
    property Maquinas: TCMListaMaquinas
      read FMaquinas;  

    property Usuarios: TCMListaUsuarios
      read FUsuarios;  

    property TiposAcesso: TCMListaTipoAcesso
      read FTiposAcesso;  

    property CorPrecos: TCMListaCorPreco
      read FCorPrecos;  

    property Grupos: TCMListaGrupos
      read FGrupos;  
  end;

  TThreadRename = class ( TThread )
  private
    FArqNovo: String;
    FArqVelho: String;
  public
    constructor Create(aArqNovo, aArqVelho: String);

    procedure Execute; override;
  end;
  
var
  VersaoCMServer : String = '';  
  EncerrarThreads : Boolean = False;

implementation

uses cmChecaBD, LMDStarter, cmConverteArq, cmAuxPassaporte, uLicenca, kbmUtils;

{ TCMServidor }

constructor TThreadRename.Create(aArqNovo, aArqVelho: String);
begin
  FreeOnTerminate := True;
  FArqNovo := aArqNovo;
  FArqVelho := aArqVelho;
  inherited Create(False);
end;

procedure TThreadRename.Execute;
var 
  Ok: Boolean;
begin
  Ok := False;
  if FileExists(FArqNovo) then
  while (not Ok) and (not Terminated) and (not EncerrarThreads) do begin
    Ok := DeleteFile(PChar(FArqNovo));
    if not OK then Sleep(100);
  end;

  Ok := False;
  if (FArqVelho<>'') then
  while (not Ok) and (not Terminated) and (not EncerrarThreads) do begin
    Ok := RenameFile(FArqVelho, FArqNovo);
    if not OK then Sleep(100);
  end;
end;


procedure TCMServidor.Notificacao(Obj: TCMClasse; TipoNot: TTipoNotificacao);
begin
  case TipoNot of
    tnCriacao   : AoCriarObj(Obj);
    tnAlteracao : AoAlterarObj(Obj);
    tnDestruicao: AoDestruirObj(Obj);
  end;
end;

procedure ImportaFF;
var 
  S : String;
  L : TLmdStarter;
begin
  S := ExtractFilePath(ParamStr(0));
  if not FileExists(S+'Dados\Acesso.nx1') 
     and FileExists(S+'Dados\Acesso.ff2') 
     and FileExists(S+'ImportaArqV1.exe') then 
  try
    L := TLmdStarter.Create(nil);
    L.Wait := True;
    L.Command := S + 'ImportaArqV1.exe';
    L.Execute;
  finally
    L.Free;
  end;
end;

constructor TCMServidor.Create(AOwner: TComponent);
var S : String;
begin
  inherited;
{  FMonitor := nil;
  FJobs := nil;}
  S := ExtractFilePath(ParamStr(0)) + 'Atualiza';
  if not DirectoryExists(S) then
    MkDir(S);
  
  FFuncAtual     := '';
  FSession       := nil;
  FDB            := nil;
  FServidorBD    := nil;
  FAtualizaLic   := nil;
  FTMaquina      := nil;
  FTContato      := nil;
  FTUsuario      := nil;
  FTGrupo        := nil;
  FTTran         := nil;
  FTCaixa        := nil;
  FTConfig       := nil;
  FTCor          := nil;
  FTHoraCor      := nil;
  FTCorPrecos    := nil;
  FTTipoAcesso   := nil;
  FTLog          := nil;
  FTImp          := nil;
  FTMovEst       := nil;
  FTProduto      := nil;
  FTPassaporte   := nil;
  FTHistPass     := nil;
  FTAvisos       := nil;
  FTChat         := nil;

  FConfig := TCMConfig.Create;
  THackTMClasse(FConfig).ProcNotificar := Notificacao;
  
  FMaquinas      := TCMListaMaquinas.Create;
  FMaquinas.CriaClasse := CriaClasseCS;
  
  FUsuarios      := TCMListaUsuarios.Create;
  FUsuarios.CriaClasse := CriaClasseCS;

  FGrupos        := TCMListaGrupos.Create;
  FGrupos.CriaClasse := CriaClasseCS;

  FTiposAcesso   := TCMListaTipoAcesso.Create;
  FTiposAcesso.CriaClasse := CriaClasseCS;

  FCorPrecos     := TCMListaCorPreco.Create;
  FCorPrecos.CriaClasse := CriaClasseCS;
  
  FBDSync        := TCriticalSection.Create;
end;

destructor TCMServidor.Destroy;
begin
  FConfig.Free;
  
  FMaquinas.Limpa;
  FMaquinas.Free;
  
  FUsuarios.Limpa;
  FUsuarios.Free;
  
  FGrupos.Limpa;
  FGrupos.Free;
  
  DestroiServidorBD;
  FBDSync.Free;
  inherited;
end;

function TCMServidor.ObtemLista(TipoClasse: Integer): TListaClasseCS;
begin
  case TipoClasse of
    tcMaquina : Result := Maquinas;
    tcUsuario : Result := Usuarios;
    tcGrupo   : Result := Grupos;
    tcTipoAcesso : Result := TiposAcesso;
    tcCorPreco : Result := CorPrecos;
  else
    Result := nil;
  end;    
end;

function TCMServidor.ObtemStreamListaObj(Cliente: Integer; TipoClasse: Integer;
  S: TStream): Integer;
var
  L : TListaClasseCS;  
begin
  try
    L := ObtemLista(TipoClasse);
    if L = nil then
      Result := cmerrTipoClasseInvalido
    else begin
      L.SalvaStream(S);
      Result := 0;
    end;  
  except
    Result := cmerrExcecaoNaoTratada;  
  end;    
end;

procedure TCMServidor.AoDestruirObj(Obj: TCMClasse);
var 
  Msg : PmsgDestroiObj;
begin
  if not Ativo then Exit;
  
  case Obj.TipoClasse of
    tcMaquina : FMaquinas.Remove(Obj);
    tcUsuario : FUsuarios.Remove(Obj);
    tcGrupo   : FGrupos.Remove(Obj);
    tcTipoAcesso : FTiposAcesso.Remove(Obj);
    tcCorPreco : FCorPrecos.Remove(Obj);
  end;  
   
  New(Msg);
  Msg^.msgTipoClasse := Obj.TipoClasse;
  Msg^.msgChave := Obj.Chave;
  EnviaEvento(cmmc_DestroiObj, 0, Integer(Msg));
  
  inherited;
end;

procedure TCMServidor.EnviaEventoStreamObj(Mensagem: Integer; Obj: TCMClasse);
var 
  S : TStream;
  Chave : String;
  T : Byte;
  TipoClasse : Integer;
begin
  if (not Ativo) or (not EnviarEventos) then Exit;
  S := TMemoryStream.Create;
  Chave := Obj.Chave;
  TipoClasse := Obj.TipoClasse;
  T := Length(Chave);
  S.Write(TipoClasse, SizeOf(TipoClasse));
  S.Write(T, SizeOf(Byte));
  S.Write(Pointer(Chave)^, T);
  Obj.SalvaStream(S, (Mensagem<>cmmc_NovoObj));
  Obj.AtualizaCache;
  EnviaEvento(Mensagem, 0, Integer(S));
end;

function TCMServidor.EnviarMsg(const aDe, aPara: Integer;
  const aTexto: String): Integer;
var 
  S: TStream;
  SL: TStrings;  
  DH: TDateTime;
begin
  try
    FBDSync.Enter;
    try
      InitTran(FDB, [FTChat], True);
      try
        DH := Now;
        FTChat.Insert;
        FTChat.FieldByName('De').AsInteger := aDe;
        FTChat.FieldByName('Para').AsInteger := aPara;
        FTChat.FieldByName('DataHora').AsDateTime := DH;
        FTChat.FieldByName('Texto').AsString := aTexto;
        FTChat.Post;
        FDB.Commit;
      except
        FDB.Rollback;
        Raise;
      end;
    finally
      FBDSync.Leave;
    end;
    SL := TStringList.Create;
    try
      S := TMemoryStream.Create;
      SL.Values['de'] := IntToStr(aDe);
      SL.Values['para'] := IntToStr(aPara);
      SL.Values['datahora'] := FormatDateTime('dd/mm/yyyy hh:mm:ss', DH);
      SL.Values['id'] := FTChat.FieldByName('NumSeq').AsString;
      SL.Add(aTexto);
      SL.SaveToStream(S);
      S.Position := 0;
      EnviaEvento(cmmc_ChatEv, 0, Integer(S));
    finally
      SL.Free;
    end;
    Result := 0;
  except
    Result := cmerrExcecaoNaoTratada;
  end;
end;

procedure TCMServidor.AoAlterarObj(Obj: TCMClasse);
begin
  EnviaEventoStreamObj(cmmc_AtualizaObj, Obj);
end;

procedure TCMServidor.AoCriarObj(Obj: TCMClasse);
begin
  EnviaEventoStreamObj(cmmc_NovoObj, Obj);
end;

procedure TCMServidor.GravaLog(Programa, Maq: Integer; Operacao: String);
var 
  Dif,
  HoraAnt, 
  HoraAtu : TDateTime;
  Dias : Integer;
  H, M, S, MS : Word;
  
begin
  FTLog.SetRange([Programa, Maq], [Programa, Maq]);
  if FTLog.Eof and FTLog.Bof then 
    HoraAnt := 0
  else begin  
    FTLog.Last;
    HoraAnt := FTLog.FieldByName('DiaHora').AsDateTime;
  end;  
  
  HoraAtu := Now;
  FTLog.Insert;
  FTLog.FieldByName('DiaHora').AsDateTime := HoraAtu;
  FTLog.FieldByName('Maquina').AsInteger := Maq;
  FTLog.FieldByName('Programa').AsInteger := Programa;
  FTLog.FieldByName('Operacao').AsString := Operacao;

  if (HoraAnt > 0) and (HoraAtu>HoraAnt) then 
    Dif := HoraAtu - HoraAnt
  else
    Dif := 0;

  Dias := Trunc(Dif);
  DecodeTime(Dif, H, M, S, MS);
     
  FTLog.FieldByName('Horas').AsDateTime := EncodeTime(H, M, S, MS);
  FTLog.FieldByName('Dias').AsInteger := Dias;
    
  FTLog.Post;
  FTLog.CancelRange;
end;  

procedure ApagaFFTemp;
var 
  SR: TSearchRec;
  S : String;
begin
  Exit;
  
  S := ExtractFilePath(ParamStr(0))+'Dados\';
  if FindFirst(S+'*.FF$', faAnyFile, SR)=0 then 
  try
    repeat
      DeleteFile(PChar(S+SR.Name));
    until (FindNext(SR)<>0);
  finally
    SysUtils.FindClose(SR);
  end;
end;

procedure TCMServidor.CriaServidorBD;
var 
  I : Integer;
  H, M, S, MS: Word;
  T : Cardinal;
  Dir : String;

procedure CriaTab(var T : TnxTable; Nome, Indice: String);
begin
  T := TnxTable.Create(nil);
  T.Session      := FSession;
  T.Database     := FDB;
  T.TableName    := Nome;
  T.IndexName    := Indice;
  T.Open;
end;
  
begin
  EncerrarThreads := False;
  FBDSync.Enter;
  try
    DestroiServidorBD;

    ImportaFF;

    ApagaFFTemp;

    FServidorBD := nil;
    FServidorBD := TCMServidorBD.Create;
    while FServidorBD.Running=0 do Sleep(5);

    if FServidorBD.Running=-1 then begin
      FreeAndNil(FServidorBD);
      Exit;
    end;  
    

    FSession := CreateSession;
  
    FDB := TnxDatabase.Create(Self);
    FDB.Session  := FSession;
    FDB.AliasName    := 'CyberMgr';
    FDB.Connected := True;
    FDB.Timeout := 

    TFrmConv.Create(Self).ShowModal;

    RestructureCybermgrDatabase(FDB);
    
    CriaTab(FTUsuario, 'Usuario', 'IUsername');

    if FTUsuario.RecordCount = 0 then begin
      FTUsuario.Insert;
      FTUsuario.FieldByName('Username').AsString := 'admin';
      FTUsuario.FieldBYName('Nome').AsString := 'Administrador';
      FTUsuario.FieldByName('Admin').AsBoolean := True;
      FTUsuario.FieldByName('Senha').AsString := '';
      FTUsuario.Post;
    end;

    Usuarios.LeDataset(FTUsuario);

    CriaTab(FTTran, 'Transacao', 'INumero');
  
    CriaTab(FTMaquina, 'Maquina', 'INumero');
    if FTMaquina.RecordCount=0 then begin
      FTMaquina.Insert;
      FTMaquina.FieldByName('Numero').AsInteger := 1;
      FTMaquina.FieldByName('Nome').AsString := 'Máquina 1';
      FTMaquina.Post;

      FTMaquina.Insert;
      FTMaquina.FieldByName('Numero').AsInteger := 2;
      FTMaquina.FieldByName('Nome').AsString := 'Máquina 2';
      FTMaquina.Post;
    end;

    Maquinas.LeDataset(FTMaquina);

    for I := 0 to pred(Maquinas.Count) do with Maquinas[I] do begin
      T := LimiteTempo;
      if T > 0 then begin
        LimiteTempo := T + 1;
        LimiteTempo := T;
      end;  
      if Manutencao or (Acesso>0) then begin
        DecodeTime(Now-Inicio, H, M, S, MS);
        T := (H * (1000 * 60 * 60)) + (M * (1000 * 60)) + (S * 1000) + MS;
        InicioTicks := (GetTickCount - T);
      end;
        
      if (Acesso>0) then
      if FTTran.FindKey([Acesso]) then begin
        if AguardaPagto then
           FimTicks := DateTimeToTicks(FTTran.FieldByName('Tempo').AsDateTime)
      end else
        ZeraInfoAcesso;
    end;   
  
    CriaTab(FTCor, 'Cor', 'IPrim');
    CriaTab(FTCorPrecos, 'CorPrecos', 'IPrim');
    CriaTab(FTHoraCor, 'HoraCor', 'IPrim');
    CriaTab(FTConfig, 'Config', 'INumSeq');

    if FTConfig.RecordCount > 0 then 
      FConfig.LeDataset(FTConfig)
    else begin
      FTConfig.Insert;
      FConfig.SalvaDataset(FTConfig);
      FTConfig.Post;
    end;  
    if FConfig.ChecaCores then begin
      FTConfig.Edit;
      FConfig.SalvaDataset(FTConfig);
      FTConfig.Post;
    end;  

    CriaTab(FTContato, 'Contato', 'IUsername');
    CriaTab(FTGrupo, 'Grupo', 'INome');
    CriaTab(FTCaixa, 'Caixa', 'IAberto');
    CriaTab(FTLog, 'Log', 'IProgramaMaq');
    CriaTab(FTImp, 'Impressao', 'IDataHora');
    CriaTab(FTMovEst, 'MovEst', 'ITranItem');
    CriaTab(FTProduto, 'Produto', 'ICodigo');
    CriaTab(FTTipoAcesso, 'TipoAcesso', 'ICodigo');
    CriaTab(FTPassaporte, 'Passaporte', 'ICliExpNumero');
    CriaTab(FTHistPass, 'HistPass', 'IPassTran');
    CriaTab(FTAvisos, 'Aviso', 'IMinutos');
    CriaTab(FTChat, 'Chat', 'INumSeq');

    RefreshPrecos;

{    if Win32Platform = VER_PLATFORM_WIN32_NT	then begin
      FMonitor:= TPBPrintersMonitor.Create( self );
      FMonitor.OnNewJob := JobNotification;
      FMonitor.OnJobChange := JobNotification;
      FMonitor.OnJobComplete := JobNotification;
      FMonitor.Active := true;
      FJobs := TList.Create;
    end;  }

    Grupos.LeDataset(FTGrupo);

    GravaLog(2, 0, 'ENTROU');

    ChecaNumMaq;

    FAtualizaLic := nil;
    FAtualizaLic := TThreadAtualizaLic.Create(False);

  finally
    FBDSync.Leave;
  end;    
end;

procedure TCMServidor.DestroiServidorBD;
begin
  FBDSync.Enter;
  try
    if FServidorBD <> nil then begin
{      if Win32Platform = VER_PLATFORM_WIN32_NT then begin
        FreeAndNil(FMonitor);
        while FJobs.Count > 0 do begin
          Dispose(PJobImp(FJobs[0]));
          FJobs.Delete(0);
        end;
        FreeAndNil(FJobs);
      end;    }

      FAtualizaLic.Terminate;
      FAtualizaLic.WaitFor;
      FreeAndNil(FAtualizaLic);

      if FTUsuario <> nil then begin
        FTUsuario.Close;
        FreeAndNil(FTUsuario);
      end;
  
      if FTMaquina <> nil then begin
        FTMaquina.Close;
        FreeAndNil(FTMaquina);
      end;

      if FTTran <> nil then begin
        FTTran.Close;
        FreeAndNil(FTTran);
      end; 

      if FTCaixa <> nil then begin
        FTCaixa.Close;
        FreeAndNil(FTCaixa);
      end;

      if FTTipoAcesso <> nil then begin
        FTTipoAcesso.Close;
        FreeAndNil(FTTipoAcesso);
      end;  

      if FTImp <> nil then begin
        FTImp.Close;
        FreeAndNil(FTImp);
      end;  

      if FTMovEst <> nil then begin
        FTMovEst.Close;
        FreeAndNil(FTMovEst);
      end;  

      if FTProduto <> nil then begin
        FTProduto.Close;
        FreeAndNil(FTProduto);
      end;

      if FTPassaporte <> nil then begin
        FTPassaporte.Close;
        FreeAndNil(FTPassaporte);
      end;

      if FTHistPass <> nil then begin
        FTHistPass.Close;
        FreeAndNil(FTHistPass);
      end;

      if FTAvisos <> nil then begin
        FTAvisos.Close;
        FreeAndNil(FTAvisos);
      end;

      if FTChat <> nil then begin
        FTChat.Close;
        FreeAndNil(FTChat);
      end;

      if FTLog <> nil then begin
        try
          GravaLog(2, 0, 'SAIU');
        except
        end;  
        FTLog.Close;
        FreeAndNil(FTLog);
      end;  
      
      if FTCor <> nil then begin
        FTCor.Close;
        FreeAndNil(FTCor);
      end;

      if FTCorPrecos <> nil then begin
        FTCorPrecos.Close;
        FreeAndNil(FTCorPrecos);
      end;  

      if FTHoraCor <> nil then begin
        FTHoraCor.Close;
        FreeAndNil(FTHoraCor);
      end;  
        
      if FTConfig <> nil then begin
        FTConfig.Close;
        FreeAndNil(FTConfig);
      end;  

      if FTContato <> nil then begin
        FTContato.Close;
        FreeAndNil(FTContato);
      end;  

      if FTGrupo <> nil then begin
        FTGrupo.Close;
        FreeAndNil(FTGrupo);
      end;   
      
      if FDB <> nil then begin
        FDB.Connected := False;
        FreeAndNil(FDB);
      end;  
        
      if FSession <> nil then FreeAndNil(FSession);  
  
      if not FServidorBD.Terminated then begin
        FServidorBD.Terminate;
        FServidorBD.WaitFor;
      end;  
      
      FreeAndNil(FServidorBD);
    end;  
  finally
    FBDSync.Leave;
  end;    
end;

procedure TCMServidor.SetAtivo(Valor: Boolean);
begin
  if (Valor = FAtivo) or (csLoading in ComponentState) then Exit;
  
  inherited;

  if Valor then
    CriaServidorBD
  else begin
    EncerrarThreads := True;
    Maquinas.Limpa;
    Usuarios.Limpa;
    Grupos.Limpa;
    TiposAcesso.Limpa;
    CorPrecos.Limpa;
    DestroiServidorBD;  
  end;  

end;

procedure TCMServidor.LeMaquinaBD(Maq: TCMMaquina);
begin
  FBDSync.Enter;
  try
    if (FTMaquina=nil) or (not FTMaquina.Active) then Exit;
    
    if FTMaquina.FindKey([Maq.Numero]) then 
      Maq.LeDataset(FTMaquina);
      
  finally
    FBDSync.Leave;
  end;
end;

function TCMServidor.AtualizaUsuarioBD(Usuario: TCMUsuario): Integer;
begin
  FBDSync.Enter;
  try
    FDB.StartTransactionWith([FTUsuario]);
    try
      if (FTUsuario=nil) or (not FTUsuario.Active) then begin
        Result := cmerrErroBD;
        Exit;
      end;
      
      if FTUsuario.FindKey([Usuario.Username]) then 
        FTUsuario.Edit
      else
        FTUsuario.Insert;
        
      Usuario.SalvaDataset(FTUsuario);
      FTUsuario.Post;
      FDB.Commit;
      Result := 0;
    except
      FDB.Rollback;
      Raise;
    end;
      
  except
    Result := cmerrExcecaoNaoTratada;
  end;  
  FBDSync.Leave;
end;

function TCMServidor.AtualizaGrupoBD(Grupo: TCMGrupo): Integer;
begin
  FBDSync.Enter;
  try
    FDB.StartTransactionWith([FTGrupo]);
    try
      if (FTGrupo=nil) or (not FTGrupo.Active) then begin
        Result := cmerrErroBD;
        Exit;
      end;
      
      if FTGrupo.FindKey([Grupo.Nome]) then 
        FTGrupo.Edit
      else
        FTGrupo.Insert;
        
      Grupo.SalvaDataset(FTGrupo);
      FTGrupo.Post;
  
      FDB.Commit;
      Result := 0;
    except
      FDB.Rollback;
      Raise;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;    
  FBDSync.Leave;
end;

function TCMServidor.AtualizaConfigBD: Integer;
begin
  try
    try
      if (FTConfig=nil) then begin
        Result := cmerrErroBD;
        Exit;
      end;

      FBDSync.Enter;

      FDB.StartTransactionWith([FTConfig]);
      try
        if not FTConfig.Active then 
          FTConfig.Open;
  
        if FTConfig.RecordCount>0 then begin
          FTConfig.First;
          FTConfig.Edit;
        end else
          FTConfig.Insert;  
        FConfig.SalvaDataset(FTConfig);
        FTConfig.Post;
        FDB.Commit;
      except
        FDB.Rollback;
        Raise;
      end;    
      Result := 0;
    finally
      FBDSync.Leave;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;  
end;

function TCMServidor.AtualizaTipoAcessoBD(TA: TCMTipoAcesso): Integer;
begin
  FBDSync.Enter;
  try
    try
      if (FTTipoAcesso=nil) or (not FTTipoAcesso.Active) then begin
        Result := cmerrErroBD;
        Exit;
      end;
      
      FDB.StartTransactionWith([FTTipoAcesso]);
      try
        if FTTipoAcesso.FindKey([TA.Codigo]) then 
          FTTipoAcesso.Edit
        else
          FTTipoAcesso.Insert;
        TA.SalvaDataset(FTTipoAcesso);
        FTTipoAcesso.Post;
        FDB.Commit;
      except
        FDB.Rollback;
        Raise;
      end;  
      Result := 0;
    finally
      FBDSync.Leave;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;  
end;

function TCMServidor.SalvaSenhaCli(Codigo: Integer; Senha: String): Integer;
begin
  try
    FBDSync.Enter;
    try
      FTContato.IndexName := 'ICodigo';
      InitTran(FDB, [FTContato], True);
      try
        if FTContato.FindKey([Codigo]) then begin
          FTContato.Edit;
          FTContato.FieldByName('Senha').AsString := Senha;
          FTContato.Post;
          Result := 0;
        end else
          Result := cmerrClienteNaoEncontrado;
        FDB.Commit;
      except
        FDB.Rollback;
        Raise;
      end;
    finally
      FBDSync.Leave;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;
end;

procedure TCMServidor.SalvaSinal(Maq: TCMMaquina);
var 
  Dif: Double;
begin
  if (Maq.Acesso<1) then Exit;
  if FTTran.Locate('TransacaoVinculada', Maq.Acesso, []) then begin
    if NumCaixaAberto<>FTTran.FieldByName('CaixaP').AsInteger then
      Maq.Sinal := FTTran.FieldByName('Valor').AsFloat
    else begin
      Dif := Maq.Sinal - FTTran.FieldByName('Valor').AsFloat;
      FTTran.Edit;
      FTTran.FieldByName('TipoAcesso').AsInteger := Maq.TipoAcesso;
      FTTran.FieldByName('Nome').AsString := Maq.NomeMostrar;
      FTTran.FieldByName('Valor').AsFloat := Maq.Sinal;
      FTTran.FieldByName('ValorFinalAcesso').AsFloat := Maq.Sinal;
      FTTran.Post;
    end;  
  end else
  if (Maq.Sinal > 0.009) and (NumCaixaAberto>0) then begin
    FTTran.Insert;
    FTTran.FieldByName('TransacaoVinculada').AsInteger := Maq.Acesso;
    FTTran.FieldByName('Maquina').AsInteger := Maq.Numero;
    FTTran.FieldByName('CaixaI').AsInteger := FTCaixa.FieldByName('Numero').AsInteger;
    FTTran.FieldByName('CaixaF').AsInteger := FTCaixa.FieldByName('Numero').AsInteger;
    FTTran.FieldByName('CaixaP').AsInteger := FTCaixa.FieldByName('Numero').AsInteger;
    FTTran.FieldByName('FuncI').AsString := FTCaixa.FIeldByName('Usuario').AsString;
    FTTran.FieldByName('FuncF').AsString := FTCaixa.FIeldByName('Usuario').AsString;
    FTTran.FieldByName('TipoAcesso').AsInteger := Maq.TipoAcesso;
    FTTran.FieldByName('Tipo').AsInteger := ttSinal;
    FTTran.FieldByName('Nome').AsString := Maq.NomeMostrar;
    FTTran.FieldByName('StatusPagto').AsInteger := spPago;
    FTTran.FieldByName('Inicio').AsDateTime := Now;
    FTTran.FieldByName('Fim').AsDateTime := Now;
    FTTran.FieldByName('DataPagto').AsDateTime := Now;
    FTTran.FieldByName('Contato').AsInteger := Maq.Contato;
    FTTran.FieldByName('Valor').AsFloat := Maq.Sinal;
    FTTran.FieldByName('ValorFinalAcesso').AsFloat := Maq.Sinal;
    FTTran.FieldByName('Isento').AsBoolean := False;
    FTTran.Post;
  end;
end;

function TCMServidor.AtualizaMaquinaBD(Maq: TCMMaquina): Integer;
begin
  try
    FBDSync.Enter;
    try
      FDB.StartTransactionWith([FTMaquina, FTTran, FTCaixa]);
      try
        if (FTMaquina=nil) or (not FTMaquina.Active) then begin
          Result := cmerrErroBD;
          Exit;
        end;

        if FTMaquina.FindKey([Maq.Numero]) then 
          FTMaquina.Edit
        else
          FTMaquina.Insert;
          
        Maq.SalvaDataset(FTMaquina);
        FTMaquina.Post;
  
        if (Maq.Acesso>0) and FTTran.FindKey([Maq.Acesso]) then begin
          FTTran.Edit;
          FTTran.FieldByName('Nome').AsString := Maq.NomeMostrar;
          FTTran.FieldByName('TipoAcesso').AsInteger := Maq.TipoAcesso;
          FTTran.FieldByName('Sinal').AsFloat := Maq.Sinal;
          FTTran.FieldByName('ValorFinalAcesso').AsFloat := 
            CalcAcesso(FTTran.FieldByName('Valor').AsFloat, 
                       FTTran.FieldByName('Sinal').AsFloat,
                       FTTran.FieldByName('Desconto').AsFloat);
            
          FTTran.Post;
        end;
        FDB.Commit;
        Result := 0;
      except
        FTTran.Cancel;
        FTMaquina.Cancel;
        FTCaixa.Cancel;
        FDB.Rollback;
        Raise;
      end;    
    finally
      FBDSync.Leave;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;  
end;

function TCMServidor.ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): integer;
var
  Lista: TListaClasseCS;
  Obj  : TClasseCS;
  I    : Integer;
begin
  try
    Lista := ObtemLista(TipoClasse);
      
    if Lista=nil then begin
      Result := cmerrTipoClasseInvalido;
      Exit;
    end;
    Lista.Lock;
    try
      Obj := Lista.ItemPorChave[Chave];
      if Obj = nil then begin
        Result := cmerrItemInexistente;
        Exit;
      end;
      FBDSync.Enter;
      try
        case TipoClasse of
          tcUsuario : begin
            if FTUsuario.FindKey([Chave]) then FTUsuario.Delete;
            for I := 0 to pred(FGrupos.Count) do with FGrupos[I] do
            if ListaContemStr(Usuarios, Chave) then begin
              Usuarios := ListaRemoveStr(Usuarios, Chave);
              if FTGrupo.FindKey([Nome]) then begin
                FTGrupo.Edit;
                SalvaDataset(FTGrupo);
                FTGrupo.Post;
              end;
              Notificar(tnAlteracao);
            end;
          end;
            
          tcGrupo   : begin
            if FTGrupo.FindKey([Chave]) then FTGrupo.Delete;
            for I := 0 to pred(FUsuarios.Count) do with FUsuarios[I] do
            if ListaContemStr(Grupos, Chave) then begin
              Grupos := ListaRemoveStr(Grupos, Chave);
              if FTUsuario.FindKey([Username]) then begin
                FTUsuario.Edit;
                SalvaDataset(FTUsuario);
                FTUsuario.Post;
              end;
              Notificar(tnAlteracao);
            end;
          end;

          tcMaquina :
          if FTMaquina.FindKey([Chave]) then FTMaquina.Delete;

          tcTipoAcesso :
          if FTTipoAcesso.FindKey([Chave]) then FTTipoAcesso.Delete;

        end;
        Obj.Free;
        Result := 0;
      finally
        FBDSync.Leave;
      end;
    finally
      Lista.Unlock;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;  
end;

function TCMServidor.LimpaFundo(Desktop: Boolean): Integer; 
var 
  S, 
  SAnt: String;
begin
  Result:= 0;
  try
    FBDSync.Enter;
    try
      InitTran(FDB, [FTConfig], True);
      try
        FConfig.AtualizaCache;
        if Desktop then begin
          SAnt := FConfig.NomeArqDesktop;
          FConfig.TipoFDesktop := '';
          FTConfig.Edit;
          FTConfig.FieldByName('TipoFDesktop').AsString := '';
          FTConfig.Post;
        end else begin
          SAnt := FConfig.NomeArqLogin;
          FConfig.TipoFLogin := '';
          FTConfig.Edit;
          FTConfig.FieldByName('TipoFLogin').AsString := '';
          FTConfig.Post;
        end;  
        if (SAnt<>'') and FileExists(SAnt) then
          TThreadRename.Create(SAnt, '');
        FDB.Commit;
        FConfig.Notificar(tnAlteracao);
      except
        FDB.Rollback;
        Raise;
      end;
    finally
      FBDSync.Leave;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;
end;

function TCMServidor.ArqFundoEnviado(NomeArq: String): Integer;
var 
  S, 
  SAnt: String;
  aDesktop: Boolean;
begin
  Result:= 0;
  try
    NomeArq := UpperCase(ExtractFilePath(ParamStr(0))+'DADOS\'+NomeArq);
    if not FileExists(NomeArq) then begin
      Result := cmerrArqNaoEncontrado;
      Exit;
    end;

    FBDSync.Enter;
    try
      aDesktop := (Pos('DESKTOP_', ExtractFileName(NomeArq))=1);
      if aDesktop then begin
        S := ExtractFileExt(NomeArq);
        if not SameText(S, '.JPG') then begin
          Result := cmerrFundoTemQueSerJPG;
          Exit;
        end;
  
        InitTran(FDB, [FTConfig], True);
        try
          SAnt := FConfig.NomeArqDesktop;
          FConfig.AtualizaCache;
          FConfig.NumFDesktop := FConfig.NumFDesktop + 1;
          FConfig.TipoFDesktop := 'JPG';
          FTConfig.Edit;
          FTConfig.FieldByName('NumFDesktop').AsInteger := FConfig.NumFDesktop;
          FTConfig.FieldByName('TipoFDesktop').AsString := 'JPG';
          FTConfig.Post;
          S := FConfig.NomeArqDesktop;
          TThreadRename.Create(S, NomeArq);
          if (SAnt<>'') and FileExists(SAnt) then
            TThreadRename.Create(SAnt, '');
          FDB.Commit;
          FConfig.Notificar(tnAlteracao);
        except
          FDB.Rollback;
          Raise;
        end;
      end else begin
        S := Copy(ExtractFileExt(NomeArq), 2, 3);
        if (not SameText(S, 'JPG')) and (not SameText(S, 'GIF')) then begin
          Result := cmerrFundoTemQueSerJPGouGIF;
          Exit;
        end;
        InitTran(FDB, [FTConfig], True);
        try  
          SAnt := FConfig.NomeArqLogin;
          FConfig.AtualizaCache;
          FConfig.NumFLogin := FConfig.NumFLogin + 1;
          FConfig.TipoFLogin := S;
          FTConfig.Edit;
          FTConfig.FieldByName('NumFLogin').AsInteger := FConfig.NumFLogin;
          FTConfig.FieldByName('TipoFLogin').AsString := S;
          FTConfig.Post;
          
          S := FConfig.NomeArqLogin;
          TThreadRename.Create(S, NomeArq);
          if (SAnt<>'') and FileExists(SAnt) then
            TThreadRename.Create(SAnt, '');
          FDB.Commit;
          FConfig.Notificar(tnAlteracao);
        except
          FDB.Rollback;
          Raise;
        end;
      end;
    finally
      FBDSync.Leave;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;
end;

function TCMServidor.ObtemSenhaCli(Codigo: Integer; var Senha: String): Integer;
begin
  try
    FBDSync.Enter;
    try
      FTContato.IndexName := 'ICodigo';
      if FTContato.FindKey([Codigo]) then
        Senha := FTContato.FieldByName('Senha').AsString
      else begin
        Senha := '';
        Result := cmerrClienteNaoEncontrado;
        Exit;
      end;
    finally
      FBDSync.Leave;
    end;
    Result := 0;  
  except
    Result := cmerrExcecaoNaoTratada;
  end;
end;

function TCMServidor.ObtemStreamAvisos(S: TStream): Integer;
var 
  MT: TkbmMemtable;
  SF : TnxBlobStream;
  SD : TkbmBlobStream;
begin
  try
    FTAvisos.Refresh;
    FTAvisos.First;
    MT := CreateMemTableAndFields(nil, Campos_Avisos);
    try
      while not FTAvisos.Eof do begin
        MT.Append;
        MT.FieldByName('Minutos').Value := FTAvisos.FieldByName('Minutos').Value;
        MT.FieldByName('AvisoTexto').Value := FTAvisos.FieldByName('AvisoTexto').Value;
        MT.FieldByName('SegAvisoTexto').Value := FTAvisos.FieldByName('SegAvisoTexto').Value;
        MT.FieldByName('PiscarAvisoTexto').Value := FTAvisos.FieldByName('PiscarAvisoTexto').Value;
        MT.FieldByName('TocarSom').Value := FTAvisos.FieldByName('TocarSom').Value;
        MT.FieldByName('Som').Value := FTAvisos.FieldByName('Som').Value;
        MT.Post;
        FTAvisos.Next;
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
    Result := cmerrExcecaoNaoTratada;
  end;
end;

function TCMServidor.ObtemStreamConfig(S: TStream): Integer;
begin
  try
    FConfig.CodLoja := LicencaGlobal.CodLojaAsString;
    FConfig.SalvaStream(S, False);
    S.Position := 0;
    Result := 0;
  except
    Result := cmerrExcecaoNaoTratada;
  end;
end;


function TCMServidor.SalvaStreamObj(Novo: Boolean; S: TStream): Integer;
var 
  Lista: TListaClasseCS;
  Obj  : TClasseCS;
  T : Byte;
  Cliente, 
  TipoClasse : Integer;
  Chave, Str, StrAnt: String;
  V : Variant;

procedure Incluir;
var I : Integer;
begin
  if Obj <> nil then begin
    Result := cmerrItemJaExiste;
    Exit;
  end else begin
    if (TipoClasse=tcMaquina) and (Lista.Count>2) and LicencaGlobal.EmModoDemo then begin
      Result := cmerrEmModoDemo;
      Exit;
    end; 
    
    Obj := CriaClasseCS(TipoClasse);
    Lista.Add(Obj);
    Obj.LeStream(S);
    case TipoClasse of
      tcMaquina : AtualizaMaquinaBD(TCMMaquina(Obj));
      
      tcUsuario : begin
        AtualizaUsuarioBD(TCMUsuario(Obj));
        Str := TCMUsuario(Obj).Grupos;
        for I := 0 to pred(FGrupos.Count) do with FGrupos[I] do
        if ListaContemStr(Str, Nome) then begin
          Usuarios := ListaAddStr(Usuarios, Obj.Chave);
          Result := AtualizaGrupoBD(FGrupos[I]);
          if Result <> 0 then Exit;
          Notificar(tnAlteracao);
        end;
      end;

      tcGrupo : begin
        AtualizaGrupoBD(TCMGrupo(Obj));
        Str := TCMGrupo(Obj).Usuarios;
        for I := 0 to pred(FUsuarios.Count) do with FUsuarios[I] do
        if ListaContemStr(Str, Username) then begin
          Grupos := ListaAddStr(Grupos, Obj.Chave);
          Result := AtualizaUsuarioBD(FUsuarios[I]);
          if Result <> 0 then Exit;
          Notificar(tnAlteracao);
        end;
      end;  

      tcTipoAcesso : AtualizaTipoAcessoBD(TCMTipoAcesso(Obj));
    end;  
    TCMClasse(Obj).Notificar(tnCriacao);
    Result := 0;
  end;
end;

procedure Alterar;
var 
  I : Integer;
  Str : String;
begin
  if (Obj = nil) then begin
    Result := cmerrItemInexistente;
    Exit;
  end;
  
  case TipoClasse of
    tcUsuario : StrAnt := TCMUsuario(Obj).Grupos;
    tcGrupo : StrAnt := TCMGrupo(Obj).Usuarios;
  end;  
  
  Obj.LeStream(S);
  case TipoClasse of
    tcMaquina : begin
      Str := UpperCase(Obj.PropriedadesAlteradas);
      if (Str>'') and (Str<>'PROGRAMAATUAL') then 
        AtualizaMaquinaBD(TCMMaquina(Obj)); 
    end;    
      
    tcTipoAcesso : AtualizaTipoAcessoBD(TCMTipoAcesso(Obj));
    tcUsuario : begin
      AtualizaUsuarioBD(TCMUsuario(Obj));
       Str := ListaRemovidos(StrAnt, TCMUsuario(Obj).Grupos);
      if Str > '' then
        for I := 0 to pred(FGrupos.Count) do with FGrupos[I] do
        if ListaContemStr(Str, Nome) then begin
          Usuarios := ListaRemoveStr(Usuarios, Obj.Chave);
          Result := AtualizaGrupoBD(FGrupos[I]);
          if Result <> 0 then Exit;
          Notificar(tnAlteracao);
        end;
       Str := ListaAdicionados(StrAnt, TCMUsuario(Obj).Grupos);
      if Str > '' then
        for I := 0 to pred(FGrupos.Count) do with FGrupos[I] do
        if ListaContemStr(Str, Nome) then begin
          Usuarios := ListaAddStr(Usuarios, Obj.Chave);
          Result := AtualizaGrupoBD(FGrupos[I]);
          if Result <> 0 then Exit;
          Notificar(tnAlteracao);
        end;
    end;  
    
    tcGrupo : begin
      AtualizaGrupoBD(TCMGrupo(Obj));
      
      Str := ListaRemovidos(StrAnt, TCMGrupo(Obj).Usuarios);
      if Str > '' then
        for I := 0 to pred(FUsuarios.Count) do with FUsuarios[I] do
        if ListaContemStr(Str, Username) then begin
          Grupos := ListaRemoveStr(Grupos, Obj.Chave);
          Result := AtualizaUsuarioBD(FUsuarios[I]);
          if Result <> 0 then Exit;
          Notificar(tnAlteracao);
        end;
       Str := ListaAdicionados(StrAnt, TCMGrupo(Obj).Usuarios);
      if Str > '' then
        for I := 0 to pred(FUsuarios.Count) do with FUsuarios[I] do
        if ListaContemStr(Str, Username) then begin
          Grupos := ListaAddStr(Grupos, Obj.Chave);
          Result := AtualizaUsuarioBD(FUsuarios[I]);
          if Result <> 0 then Exit;
          Notificar(tnAlteracao);
        end;
     end;  
    
  end;  
  TCMClasse(Obj).Notificar(tnAlteracao);
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
      FConfig.LeStream(S);
      AtualizaConfigBD;
      FConfig.Notificar(tnAlteracao);
      Result := 0;
      Exit;
    end;
      
    Lista := ObtemLista(TipoClasse);
    if (Lista=nil) then begin
      Result := cmerrTipoClasseInvalido;
      Exit;
    end;
    Lista.Lock;
    try
      Obj := Lista.ItemPorChave[V];
      if Novo then 
        Incluir
      else
        Alterar;
    finally
      Lista.Unlock;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;
end;

function TCMServidor.CapturaTelaMaq(aMaq: Byte; S: TMemoryStream): integer;
var 
  Maq : TCMMaquina;
begin
  try
    Maquinas.Lock;
    try
      Maq := Maquinas.PorNumero[aMaq];
      if Maq = nil then begin
        Result := cmerrMaquinaInexistente;
        Exit;
      end;
      if Maq.UserObj<>nil then begin
        Result := 0;
        Maq.PediuTela := False;
        S.Clear;
        S.LoadFromStream(TMemoryStream(Maq.UserObj));
        Maq.UserObj.Free;
        Maq.UserObj := nil;
        
      end else begin
        if not Maq.PediuTela then begin
          Maq.PediuTela := True;
          EnviaEvento(cmmc_PedeTela, aMaq, 0);
        end;
        Result := cmerrTelaNaoDisponivel;
      end;  
    finally
      Maquinas.Unlock;
    end;    
  except
    Result := cmerrExcecaoNaoTratada;
  end;    
end;

function TCMServidor.SalvaTelaMaq(aMaq: Byte; S: TMemoryStream): integer;
var Maq : TCMMaquina;
begin
  try
    Maquinas.Lock;
    try
      Maq := Maquinas.PorNumero[aMaq];
      if Maq = nil then begin
        Result := cmerrMaquinaInexistente;
        Exit;
      end;
      Maq.PediuTela := False;
      S.Position := 0;
      Maq.UserObj := TMemoryStream.Create;
      TMemoryStream(Maq.UserObj).LoadFromStream(S);
      
      Result := 0;
    finally
      Maquinas.Unlock;
    end;    
  except
    Result := cmerrExcecaoNaoTratada;
  end;    
end;

function TCMServidor.ShutdownMaq(aMaq, aOper: Byte): integer; 
var Msg : PmsgShutdown;
begin
  Result := 0;
  try
    if not Ativo then Exit;
    New(Msg);
    Msg^.msgMaq := aMaq;
    Msg^.msgOper := aOper;
    EnviaEvento(cmmc_Shutdown, 0, Integer(Msg));
  except  
    Result := cmerrExcecaoNaoTratada;
  end;    
end;

function TCMServidor.ObtemLicenca(var LicencaStr: TLicencaStr): Integer; 
begin
  try
    LicencaStr := LicencaGlobal.AsString;
    Result := 0;
  except
    Result := cmerrExcecaoNaoTratada;
  end;    
end;

function TCMServidor.SalvaLicenca(LicencaStr: String): Integer;
begin
  try
    LicencaGlobal.AsString := LicencaStr;
    LicencaGlobal.LeSerialHD;
    LicencaGlobal.SalvaArquivoPadrao;
    ChecaNumMaq;
    Result := 0;
  except
    Result := cmerrExcecaoNaoTratada;
  end;    
end;

procedure TCMServidor.RefreshCorPrecos;
var I, N : Integer;
begin
  FCorPrecos.Limpa;
  FCorPrecos.LeDataset(FTCor);

  for I := 0 to pred(FCorPrecos.Count) do 
  with FTCorPrecos, FCorPrecos[I] do begin
    SetRange([TipoAcesso, Cor], [TipoAcesso, Cor]);
    SetLength(PPrecos^, FTCorPrecos.RecordCount);
    try
      N := 0;
      First;
      while not Eof do with PPrecos^[N] do begin
        prTempo := DateTimeToTicks(FieldByName('Tempo').AsDateTime);
        prValor := FieldByName('Valor').AsFloat;
        prValorMin := FieldByName('ValorMin').AsFloat;
        prTolerancia := DateTimeToTicks(FieldByName('Tolerancia').AsDateTime);
        Next;
        Inc(N);
      end;
      PrecosStr := PrecosStr;
      LimpaCache;
      Notificar(tnAlteracao);
    finally
      CancelRange;
    end;
  end;  
end;

function TCMServidor.RefreshPrecos: integer;
var 
  H, Dia, I : Integer;
  HC : TCMHoraCor;
begin
  try
    FBDSync.Enter;
    try
      FTTipoAcesso.Refresh;
      FTHoraCor.Refresh;
      FTCor.Refresh;
      FTCorPrecos.Refresh;

      FTiposAcesso.Limpa;
      FTiposAcesso.LeDataset(FTTipoAcesso);

      RefreshCorPrecos;

      for I := 0 to pred(FTiposAcesso.Count) do 
      with FTiposAcesso.Itens[I] do begin     
        for Dia := 1 to 7 do
        for H := 0 to 23 do begin
          if FTHoraCor.FindKey([Codigo, Dia, H]) and
             FTCor.FindKey([Codigo, FTHoraCor.FieldByName('Cor').AsInteger]) then 
            HC[Dia, H] := FTHoraCor.FieldByName('Cor').AsInteger
          else
            HC[Dia, H] := 0;  
        end;  
        PHoraCor^ := HC;  
        LimpaCache;
        Notificar(tnAlteracao);
      end;  
      Result := 0;
    finally
      FBDSync.Leave;
    end;  
  except
    Result := cmerrExcecaoNaoTratada;
  end;  
end;

function TCMServidor.NumCaixaAberto: Integer;
begin
  FBDSync.Enter;
  try
    FTCaixa.Refresh;
    if FTCaixa.FindKey([True]) then 
      Result := FTCaixa.FieldByName('Numero').AsInteger
    else
      Result := 0;  
  finally
    FBDSync.Leave;
  end;
end;

function TCMServidor.RegistraPaginasImpressas(aMaq: Byte; aPaginas: Integer; aImp, aDoc: String): Integer;
var
  Maq : TCMMaquina;
  S : String;
  NumItem : Integer;

begin
  Result := 0;
  if aPaginas<1 then Exit;
  
  FBDSync.Enter;
  Maq := nil;
  with FTImp do
  Try
    FDB.StartTransactionWith([FTImp, FTTran, FTProduto, FTMovEst, FTMaquina]);
    try
      Insert;
      FieldByName('DataHora').AsDateTime := Now;
      Maq := Maquinas.PorNumero[aMaq];
      if Maq<>nil then
        FieldByName('Computador').AsString := Maq.ComputerName;
      FieldByName('Impressora').AsString := aImp;
      FieldByName('Documento').AsString := aDoc;
      FieldByName('Paginas').AsInteger := aPaginas;
      if Maq <> nil then begin
        FieldByName('Maquina').AsInteger := aMaq;
        FieldByName('Acesso').AsInteger := Maq.Acesso;
      end;  
      
      FieldByName('Resultado').AsInteger := 0;
        
      FTProduto.Refresh;
      FTMaquina.Refresh;
      FTTran.Refresh;
      FTMovEst.Refresh;
      if (Maq<>nil) and (Maq.Acesso>0) and (FConfig.ProdutoImpressao>'') and
         FTProduto.FindKey([FConfig.ProdutoImpressao]) and
         FTMaquina.FindKey([Maq.Numero]) and
         FTTran.FindKey([Maq.Acesso]) and
         (FTTran.FieldByName('StatusPagto').AsInteger=spEmAndamento) then
      begin
        FTMovEst.SetRange([Maq.Acesso], [Maq.Acesso]);
        NumItem := FTMovEst.RecordCount + 1;  
        FTTran.Edit;
        FTMaquina.Edit;
        with FTTran.FieldByName('Produtos') do begin
          AsFloat := AsFloat + (FTProduto.FieldByName('Preco').AsFloat * aPaginas);
          FTMaquina.FieldByName('Vendas').AsFloat := AsFloat;
        end;  
            
        FTTran.Post;  
        FTMaquina.Post;
          
        FTMovEst.Insert;
        FTMovEst.FieldByName('Transacao').AsInteger := Maq.Acesso;
        FTMovEst.FieldByName('Produto').AsString    := FConfig.ProdutoImpressao;
        FTMovEst.FieldByName('Quant').AsFloat       := aPaginas;
        FTMovEst.FieldByName('Unitario').AsFloat    := FTProduto.FieldByName('Preco').AsFloat;
        FTMovEst.FieldByName('Total').AsFloat       := (FTProduto.FieldByName('Preco').AsFloat * aPaginas);
        FTMovEst.FieldByName('Item').AsInteger      := NumItem;
        FTMovEst.FieldByName('Cancelado').AsBoolean := False;
        FTMovEst.FieldByName('Entrada').AsBoolean   := False; 
        FTMovEst.FieldByName('Desconto').AsFloat    := 0;
        FTMovEst.FieldByName('TipoTran').AsInteger  := ttAcessoVenda;
        FTMovEst.FieldByName('Contato').AsInteger   := Maq.Contato;
        FTMovEst.FieldByName('CaixaPag').AsInteger  := 0;
        FTMovEst.FieldByName('CaixaMov').AsInteger  := 0;
        FTMovEst.FieldByName('DataMov').AsDateTime  := Now;
        FTMovEst.FieldByName('EstoqueAnt').AsFloat  := FTProduto.FieldByName('EstoqueAtual').AsFloat;
        FTMovEst.Post;
          
        FTProduto.Edit;
        with FTProduto.FieldByName('EstoqueAtual') do
          AsFloat := AsFloat - aPaginas;
        FTProduto.Post;  
      end else
        Maq := nil;
      
      FTImp.Post;
      FDB.Commit;

      if Maq<>nil then begin
        Maq.AtualizaCache;
        Maq.Vendas := FTMaquina.FieldByName('Vendas').AsFloat;
        Maq.Notificar(tnAlteracao);
      end;  
      
    except
      if FTImp.State in [dsEdit, dsInsert] then FTImp.Cancel;
      if FTProduto.State in [dsEdit, dsInsert] then FTProduto.Cancel;
      if FTTran.State in [dsEdit, dsInsert] then FTTran.Cancel;
      if FTMaquina.State in [dsEdit, dsInsert] then FTMaquina.Cancel;
      if FTMovEst.State in [dsEdit, dsInsert] then FTMovEst.Cancel;
      FDB.Rollback;
      FTImp.Refresh;
      FTProduto.Refresh;
      FTMaquina.Refresh;
      FTMovEst.Refresh;
      FTTran.Refresh;
    end;  
  except
    Result := cmerrExcecaoNaoTratada;
  end; { Finally }
  FBDSync.Leave;
end;

function TCMServidor.ModoManutencao(aMaq: Byte; aUsername, aSenha: String; aEntrar: Boolean): Integer;
var 
  Usuario: TCMUsuario;  
  Maq    : TCMMaquina;
  I, Q      : Integer;
begin
  try
    Maquinas.Lock;
    Usuarios.Lock;
    
    Maq := Maquinas.PorNumero[aMaq];
    if Maq = nil then begin
      Result := cmerrMaquinaInexistente;
      Exit;
    end;
    if aEntrar then begin
      if Maq.Manutencao then begin
        Result := cmerrMaqJaEstaManutencao;
        Exit;
      end;  
    end else
    if not Maq.Manutencao then begin
      Result := cmerrMaqNaoEstaManutencao;
      Exit;
    end;

    if Maq.AguardaPagto or (Maq.Acesso>0) then begin
      Result := cmerrAcessoEmAndamento;
      Exit;
    end;
      
    try
      if aEntrar then begin
        Usuario := Usuarios.PorUsername[aUsername];
        if (Usuario=nil) or (Usuario.Senha<>aSenha) then begin
          Result := cmerrInfoLoginInvalida; 
          Exit;
        end;

        if not Permitido(Usuario, daMaqModoManutencao) then begin
          Result := cmerrAcessoNaoPermitido;
          Exit;
        end;

        if not Usuario.Admin then
        if (Usuario.MaxMaqManut>0) and (Usuario.MaxMaqManut<Maquinas.Count) then begin
          Q := 0;
          for I := 0 to Maquinas.Count-1 do 
            if Maquinas[I].Manutencao and (Maquinas[I].UsuarioI=aUsername) then
              Inc(Q);
          if Q>=Usuario.MaxMaqManut then begin
            Result := cmerrLimiteManutUsuario;
            Exit;
          end;   
        end;

        if NumCaixaAberto=0 then begin
          Result := cmerrCaixaFechado;
          Exit;
        end;
      end;  

      Maq.LimpaCache;
        
      FBDSync.Enter;
      try  
        FDB.StartTransactionWith([FTMaquina, FTTran, FTCaixa]);
        try
          Maq.Manutencao := aEntrar;
          if aEntrar then begin
            Maq.Inicio := Now;
            Maq.InicioTicks := GetTickCount;
            Maq.UsuarioI := aUsername;
            Maq.Caixa := NumCaixaAberto;
          end else begin
            I := NumCaixaAberto;
            if (I>0) and (I<>Maq.Caixa) then Maq.Caixa := I;
            FTTran.Append;
            FTTran.FieldByName('StatusPagto').AsInteger := spPago;
            FTTran.FieldByName('Inicio').AsDateTime := Maq.Inicio;
            FTTran.FieldByName('Nome').AsString := 'Manutenção';
            FTTran.FieldByName('Maquina').AsInteger := Maq.Numero;
            FTTran.FieldByName('Isento').AsBoolean := True;
            FTTran.FieldByName('Contato').AsInteger := 0;
            FTTran.FieldByName('FuncI').AsString := Maq.UsuarioI;
            FTTran.FieldByName('FuncF').AsString := aUsername;
            FTTran.FieldByName('Tipo').AsInteger := ttManutencao;
            FTTran.FieldByName('TipoAcesso').AsInteger := 0;
            FTTran.FieldByName('Sinal').AsFloat := 0;
            FTTran.FieldByName('CaixaI').AsInteger := Maq.Caixa;
            I := NumCaixaAberto;
            if I>0 then begin
              FTTran.FieldByName('CaixaF').AsInteger := I;
              FTTran.FieldByName('CaixaP').AsInteger := I;
            end else begin
              FTTran.FieldByName('CaixaF').AsInteger := Maq.Caixa;
              FTTran.FieldByName('CaixaP').AsInteger := Maq.Caixa;
            end;

            FTTran.FieldByName('DataPagto').AsDateTime := Now;
            FTTran.FieldByName('Fim').AsDateTime := Now;
            FTTran.FieldByName('Tempo').AsDateTime := TicksToDateTime(Maq.NumTicks);
            FTTran.FieldByName('CredUsado').AsInteger := 0;
            FTTran.FieldByName('CredAnterior').AsInteger := 0;
            FTTran.FieldByName('TempoCobrado').AsDateTime := FTTran.FieldByName('Tempo').AsDateTime;
            FTTran.Post;
            Maq.ZeraInfoAcesso;
          end;
        
          if FTMaquina.FindKey([Maq.Numero]) then begin
            FTMaquina.Edit;
            Maq.SalvaDataset(FTMaquina);
            FTMaquina.Post;
          end;  
        
          FDB.Commit;
        except
          Maq.Manutencao := not aEntrar;
          FDB.Rollback;
          Raise;
        end;    
      finally
        FBDSync.Leave;
      end;  
      Maq.Notificar(tnAlteracao);
        
      Result := 0;
    finally
      Usuarios.Unlock;
      Maquinas.Unlock;
    end;  

  except
    Result := cmerrExcecaoNaoTratada;
  end;    
end;

function TCMServidor.Permitido(U: TCMUsuario; TipoAcesso: Integer): Boolean;
begin
  if not U.Admin then 
    Result := ItemTrueStr(U.Direitos, TipoAcesso)
  else
    Result := True;
end;

function TCMServidor.TodosPerm(TipoAcesso: Integer): Boolean;
var I : Integer;
begin
  Result := False;
  for I := 0 to Usuarios.Count-1 do
  if not Permitido(Usuarios[I], TipoAcesso) then
    Exit;
  Result := True;
end;

procedure TCMServidor.ChecaNumMaq;
var 
  I, NM, NMI, NMF : Integer;
  M : TCMMaquina;
begin
  if LicencaGlobal.SenhaOk and (not LicencaGlobal.EmModoDemo) then begin
    FDB.StartTransactionWith([FTMaquina]);
    try
      NM := 0;
      NMF := 0;
      for I := 0 to pred(Maquinas.Count) do
        if Maquinas[I].Numero > NM then
          NM := Maquinas[I].Numero;
      NMI := NM+1;    
      for I := Maquinas.Count+1 to LicencaGlobal.liMaquinas do begin
        Inc(NM);
        FTMaquina.Insert;
        FTMaquina.FieldByName('Numero').AsInteger := NM;
        FTMaquina.FieldByName('Nome').AsString := 'Máquina' + IntToStr(NM);
        FTMaquina.Post;
        M := CriaMaquina(True);
        M.LeDataset(FTMaquina);
      end;    
      FDB.Commit;

      for I := NMI to NMF do begin
        M := Maquinas.PorNumero[I];
        if M <> nil then begin
          M.LimpaCache;
          M.Notificar(tnAlteracao);
        end;
      end;    
      
    except
      FDB.Rollback;
    end;
  end;  
end;

{ TCMServidor }

function MaxInt(I1, I2: Integer): Integer;
begin
{$I crypt_start.inc}
  if I1>I2 then
    Result := I1
  else
    Result := I2;  
{$I crypt_end.inc}
end;

function TCMServidor.Login(aUsername, aSenha: String; aMaq: Byte; aFuncAtual: Boolean; aRemoto: Boolean;
  aWndHandle: HWND; aProxyHandle: Integer; aSocket: integer; var Handle: Integer): Integer;
var 
  Usuario: TCMUsuario;  
  Maq    : TCMMaquina;
  Cli    : TCMCliente;
begin
  try
    if aMaq>0 then begin
      Maq := Maquinas.PorNumero[aMaq];
      if Maq = nil then begin
        Result := cmerrMaquinaInexistente;
        
        Exit;
      end;
      if Maq.Cliente>0 then begin
        Cli := ObtemCliente(Maq.Cliente);
        if (Cli<>nil) and (Cli.Socket>0) then 
          TCustomWinSocket(Cli.Socket).Close;
      end;
    end else
      Maq := nil;

    if (aMaq <> 0) and 
       (Maquinas.NumConectados >= LicencaGlobal.Maquinas) then 
    begin
      Result := cmerrNumMaxMaq;
      Exit;
    end;
      
    if (aUserName = ProxyUsername) then begin
      if aSenha = ProxySenha then begin
        Handle := ProximoHandle;
        Result := inherited Login(aUserName, aSenha, aMaq, aFuncAtual, aRemoto, aWndHandle, 
                                  aProxyHandle, aSocket, Handle);
        if (Result=0) and (Maq<>nil) then begin
          Maq.Cliente := Handle;
          Maq.LimpaCache;
          Maq.Notificar(tnAlteracao);
        end;  
      end else
        Result := cmerrInfoLoginInvalida;
        
      if aMaq > 0 then GravaLog(0, aMaq, 'ENTROU');
        
      Exit;  
    end;
     
    Usuarios.Lock;
    try
      Usuario := Usuarios.PorUsername[aUsername];
      if (Usuario<>nil) and (Usuario.Senha=aSenha) then begin
        Handle := ProximoHandle;
        Result := inherited Login(aUserName, aSenha, aMaq, aFuncAtual, aRemoto, aWndHandle, 
                                  aProxyHandle, aSocket, Handle);
        if Result = 0 then begin
          Usuario.NumClientes := Usuario.NumClientes + 1;
          Usuario.Notificar(tnAlteracao);
          if aFuncAtual then FFuncAtual := aUsername;
          if (Maq<>nil) then begin
            Maq.Cliente := Handle;
            Maq.LimpaCache;
            Maq.Notificar(tnAlteracao);
          end else 
            GravaLog(1, aMaq, 'ENTROU');
        end;                            
      end else
        Result := cmerrInfoLoginInvalida;   
    finally
      Usuarios.Unlock;
    end;  

  except
    Result := cmerrExcecaoNaoTratada;
  end;    
end;

function TCMServidor.CriaTipoAcesso(InsereLista: Boolean): TCMTipoAcesso;
begin
  Result := TCMTipoAcesso.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FTiposAcesso.Add(Result);
end;

function TCMServidor.CriaCorPreco(InsereLista: Boolean): TCMCorPreco;
begin
  Result := TCMCorPreco.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FCorPrecos.Add(Result);
end;

function TCMServidor.CriaMaquina(InsereLista: Boolean): TCMMaquina;
begin
  Result := TCMMaquina.Create(False);
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FMaquinas.Add(Result);
end;

function TCMServidor.CriaGrupo(InsereLista: Boolean): TCMGrupo; 
begin
  Result := TCMGrupo.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FGrupos.Add(Result);
end;

function TCMServidor.CriaUsuario(InsereLista: Boolean): TCMUsuario;
begin
  Result := TCMUsuario.Create;
  THackTMClasse(Result).ProcNotificar := Notificacao;
  if InsereLista then
    FUsuarios.Add(Result);
end;

function TCMServidor.CriaClasseCS(TipoClasse: Integer): TClasseCS;
begin
  case TipoClasse of
    tcMaquina : Result := CriaMaquina(False);
    tcUsuario : Result := CriaUsuario(False);
    tcGrupo   : Result := CriaGrupo(False);
    tcTipoAcesso : Result := CriaTipoAcesso(False);
    tcCorPreco : Result := CriaCorPreco(False);
  else
    Result := nil;  
  end;
end;

procedure TCMServidor.AoRemoverCliente(Cliente: TCMCliente);
var 
  U : TCMUsuario;
  M : TCMMaquina;
begin
  M := nil;
  inherited;
  if Cliente.Maquina>0 then begin
    Maquinas.Lock;
    try
      M := Maquinas.PorNumero[Cliente.Maquina];
      if (M<>nil) then begin
        M.Cliente := 0;
        M.LimpaCache;
        M.Notificar(tnAlteracao);
      end;
    finally
      Maquinas.UnLock;
    end;  

    GravaLog(0, Cliente.Maquina, 'SAIU');
    if (M<>nil) then begin
      if M.Manutencao then
        ModoManutencao(M.Numero, '', '', False)
      else
      if (M.Acesso>0) and (M.FimTicks>0) then
        LogoutMaq(M.Numero);
    end;
  end;  

  Usuarios.Lock;
  try
    U := Usuarios.PorUsername[Cliente.Username];
    if (U <> nil) and (U.NumClientes > 0) then begin
      U.NumClientes := U.NumClientes - 1;
      U.Notificar(tnAlteracao);

      if M<>nil then GravaLog(1, 0, 'SAIU');
    end;  
  finally
    Usuarios.Unlock;
  end;  
end;

function TCMServidor.TransferirMaq(aOrigem, aDestino: Byte): Integer;
var
  O, D : TCMMaquina;  
  S: String;
begin
  Result := 0;
  Maquinas.Lock;
  try
    try
      O := Maquinas.PorNumero[aOrigem];
      D := Maquinas.PorNumero[aDestino];
      
      if (O = nil) or (D = nil) then begin
        Result := cmerrItemInexistente;
        Exit;
      end;
      
      if O.Acesso = 0 then begin
        Result := cmerrMaquinaSemAcesso;
        Exit;
      end;

      if O.AguardaPagto then begin
        Result := cmerrTransfAguardaPagto;
        Exit;
      end;

      if D.Acesso > 0 then begin
        Result := cmerrAcessoEmAndamento;
        Exit;
      end;

{      if D.Level=0 then begin
        Result := cmerrMaqNaoLic;
        Exit;
      end;}

      O.TransfereMaq(D);

      FBDSync.Enter;
      try
        FDB.StartTransactionWith([FTMaquina, FTTran]);
        try
          if FTMaquina.FindKey([O.Numero]) then begin
            FTMaquina.Edit;
            FTMaquina.FieldByName('Acesso').AsInteger := 0;
            FTMaquina.FieldByName('Inicio').AsDateTime := 0;
            FTMaquina.FieldByName('InicioTicks').AsInteger := 0;
            FTMaquina.FieldByName('Nome').AsString := '';
            FTMaquina.FieldByName('NomeContato').AsString := '';
            FTMaquina.FieldByName('Isento').AsBoolean := False;
            FTMaquina.FieldByName('Contato').AsInteger := 0;
            FTMaquina.FieldByName('TipoAcesso').AsInteger := High(Word);
            FTMaquina.FieldByName('Sinal').AsFloat := 0;
            FTMaquina.FieldByName('Vendas').AsFloat := 0;
            FTMaquina.FieldByName('ObsAcesso').AsString := '';
            FTMaquina.FieldByName('LiberaAlemPacote').AsBoolean := False;
            FTMaquina.FieldByName('TicksParadoPac').AsInteger := 0;
            FTMaquina.Post;
          end;  
          if FTMaquina.FindKey([D.Numero]) then begin
            FTMaquina.Edit;
            FTMaquina.FieldByName('Acesso').AsInteger := D.Acesso;
            FTMaquina.FieldByName('Inicio').AsDateTime := D.Inicio;
            FTMaquina.FieldByName('InicioTicks').AsInteger := D.InicioTicks;
            FTMaquina.FieldByName('Nome').AsString := D.Nome;
            FTMaquina.FieldByName('NomeContato').AsString := D.NomeContato;
            FTMaquina.FieldByName('Isento').AsBoolean := D.Isento;
            FTMaquina.FieldByName('Contato').AsInteger := D.Contato;
            FTMaquina.FieldByName('TipoAcesso').AsInteger := D.TipoAcesso;
            FTMaquina.FieldByName('Sinal').AsFloat := D.Sinal;
            FTMaquina.FieldByName('Vendas').AsFloat := D.Vendas;
            FTMaquina.FieldByName('ObsAcesso').AsString := D.ObsAcesso;
            FTMaquina.FieldByName('LiberaAlemPacote').AsBoolean := D.LiberaALemPacote;
            FTMaquina.FieldByName('TicksParadoPac').AsInteger := D.TicksParadoPac;
            FTMaquina.Post;
          end; 
          if FTTran.FindKey([D.Acesso]) then begin 
            FTTran.Edit;
            FTTran.FieldByName('Maquina').AsInteger := D.Numero;
            FTTran.Post;
          end;  
          S := FTTran.IndexName;
          try
            FTTran.IndexName := 'ITransacaoVinculada';
            FTTran.SetRange([D.Acesso], [D.Acesso]);
            try
              FTTran.First;
              while not FTTran.Eof do begin
                FTTran.Edit;
                FTTran.FieldByName('Maquina').AsInteger := D.Numero;
                FTTran.Post;
                FTTran.Next;
              end;  
            finally
              FTTran.CancelRange;
            end;  
          finally
            FTTran.IndexName := S;
          end;    
          FDB.Commit;
        except
          FTMaquina.Cancel;
          FTTran.Cancel;
          FDB.Rollback;
          Raise;
        end;
      finally
        FBDSync.Leave;
      end;  
      Result := 0;
    except
      Result := cmerrExcecaoNaoTratada;
    end;
  finally
    Maquinas.Unlock;
  end;  
end;

function TCMServidor.LiberarAlemPacote(aMaq: Byte): Integer; 
var
  Maq : TCMMaquina;  
begin
  Result := 0;
  Maquinas.Lock;
  try
    try
      Maq := Maquinas.PorNumero[aMaq];
      
      if Maq = nil then begin
        Result := cmerrItemInexistente;
        Exit;
      end;
      
      if Maq.Acesso = 0 then begin
        Result := cmerrMaquinaSemAcesso;
        Exit;
      end;
      
      if not Maq.LiberaAlemPacote then begin
        Maq.TicksParadoPac := Maq.TicksParadoPac + ((GetTickCount-Maq.InicioTicks) - Maq.NumTicks);
        Maq.LiberaAlemPacote := True;
        AtualizaMaquinaBD(Maq);
      end;  
        
      Sleep(10);
      Maq.LimpaCache;
      Maq.Notificar(tnAlteracao);
      Result := 0;
    except
      Result := cmerrExcecaoNaoTratada;
    end;
  finally
    Maquinas.Unlock;
  end;  
end;

function TCMServidor.PararTempoMaq(aMaq: Byte; aParar: Boolean): Integer; 
var
  Maq : TCMMaquina;  
begin
  Result := 0;
  Maquinas.Lock;
  try
    try
      Maq := Maquinas.PorNumero[aMaq];
      
      if Maq = nil then begin
        Result := cmerrItemInexistente;
        Exit;
      end;
      
      if Maq.Acesso = 0 then begin
        Result := cmerrMaquinaSemAcesso;
        Exit;
      end;
      Maq.Parado := aParar;
      Sleep(10);
      Maq.LimpaCache;
      Maq.Notificar(tnAlteracao);
      Result := 0;
    except
      Result := cmerrExcecaoNaoTratada;
    end;
  finally
    Maquinas.Unlock;
  end;  
end;


function TCMServidor.AdicionaPassaporte(aMaq: Byte;
  aSenha: String): Integer;
var 
  Maq: TCMMaquina;  
  P  : TPassaporte;
begin
  try
    Maq := Maquinas.PorNumero[aMaq];
    if Maq.Acesso=0 then begin
      Result := cmerrMaquinaSemAcesso;
      Exit;
    end;

    if not FTPassaporte.Locate('Senha', aSenha, []) then begin
      Result := cmerrInfoLoginInvalida;
      Exit;
    end;

    P.LoadFromDataset(FTPassaporte);

    if FTHistPass.Locate('Transacao; Passaporte', VarArrayOf([Maq.Acesso, P.pcNumero]), []) then begin
      Result := cmerrPassaporteEmUso;
      Exit;
    end;

    if Maquinas.PassaporteEmUso(P.pcNumero) then begin
      Result := cmerrPassaporteEmUso;
      Exit;
    end;
      
    FDB.StartTransactionWith([FTHistPass, FTMaquina]);
    try
      FTHistPass.Insert;
      FTHistPass.FieldByName('Transacao').AsInteger := Maq.Acesso;
      FTHistPass.FieldByName('DataHora').AsDateTime := Maq.Inicio;
      FTHistPass.FieldByName('Passaporte').AsInteger := P.pcNumero;
      FTHistPass.Post;
      Maq.LimpaCache;
      Maq.Passaportes^.AddPassaporte(P);
      AtualizaMaquinaBD(Maq);
      FDB.Commit;
      Maq.Notificar(tnAlteracao);
    except
      FDB.Rollback;
      Raise;
    end;
    Result := 0;
  except
    Result := cmerrExcecaoNaoTratada;
  end;
end;

function SemEspaco(S: String): String;
var I : Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
    if S[I] <> #32 then
      Result := Result + S[I];
end;

function TCMServidor.LoginMaq(aMaq: Byte; aContato: Integer; aUserName, aSenha,
  aNome, aObsAcesso: String; aLimiteTempo: Cardinal; aSinal: Double; aTipoAcesso: Word): Integer;
var
  Maq : TCMMaquina;  
  U   : TCMUsuario;
  aIsento : Boolean;
  aCredito, aCredTotal : Cardinal;
  I : Integer;
  P : TPassaporte;
  TA : TCMTipoAcesso;
  HC : TCMHoraCor;
begin
  Result := 0;
  Maquinas.Lock;
  try
    try
      Maq := Maquinas.PorNumero[aMaq];
      
      if Maq = nil then begin
        Result := cmerrItemInexistente;
        Exit;
      end;
      
      if Maq.Acesso > 0 then begin
        Result := cmerrAcessoEmAndamento;
        Exit;
      end;

      if Maq.Manutencao then begin
        Result := cmerrMaqJaEstaManutencao;
        Exit;
      end;

{      if Maq.Level=0 then begin
        Result := cmerrMaqNaoLic;
        Exit;
      end;}

      U := FUsuarios.PorUsername[aUserName];
      if (U<>nil) and (U.Senha=aSenha) then begin
        Result := ModoManutencao(aMaq, aUsername, aSenha, True);
        Exit;
      end;  
        
      FBDSync.Enter;
      try
        if not FTMaquina.FindKey([aMaq]) then begin
          Result := cmerrErroBD;
          Exit;
        end;  
        
        aIsento := False;
        aCredito := 0;

        if aContato > 0 then begin
          if not FTContato.Locate('Codigo', aContato, []) then begin
            Result := cmerrInfoLoginInvalida;
            Exit;
          end;

          if FTContato.FieldByName('Inativo').AsBoolean then begin
            Result := cmerrClienteInativo;
            Exit;
          end;

          aNome := FTContato.FieldByName('Nome').AsString;
          aIsento := FTContato.FieldByName('Isento').AsBoolean;
          aCredito := ObtemCred(FTContato.FieldByName('CreditoM').AsInteger);
          LePassaportesCliTran(FTPassaporte, nil, aTipoAcesso, aContato, 0, Maq.Passaportes)
        end else
        if aUsername='anonimo' then begin
          if aSenha <> 'anonimo' then begin
            Result := cmerrInfoLoginInvalida;
            Exit;
          end;
        end else  
        if aUsername='PREPAGO' then begin
          if not FTPassaporte.Locate('Senha', aSenha, []) then begin
            Result := cmerrInfoLoginInvalida;
            Exit;
          end;
          P.LoadFromDataset(FTPassaporte);
          if Maquinas.PassaporteEmUso(P.pcNumero) then begin
            Result := cmerrPassaporteEmUso;
            Exit;
          end;
          Maq.Passaportes^.Limpa;
          Maq.Passaportes^.AddPassaporte(P);
          TA := FTiposAcesso.PorCodigo[aTipoAcesso];
          if TA=nil then
            FillChar(HC, SizeOf(HC), 0)
          else
            HC := TA.PHoraCor^;  
          CalculaMaxTempo(Now, 0, aTipoAcesso, HC, FCorPrecos, Maq.Passaportes, aCredTotal);
          if (aCredTotal < MinCreditoLoginMS) then begin
            Result := cmerrSemCreditoDisp;
            Maq.Passaportes^.Limpa;
            Exit;
          end;
        end else begin
          FTContato.IndexName := 'IUsername';
          FTContato.Refresh;
          if not FTContato.FindKey([aUsername]) or
             (FTContato.FieldByName('Senha').AsString <> aSenha) then begin
            Result := cmerrInfoLoginInvalida;
            Exit;
          end;

          if (Copy(aNome, 1, 4)='@RG@') and FConfig.ExigirRG then begin
            Delete(aNome, 1, 4);
            if SemEspaco(FTContato.FieldByName('RG').AsString)='' then begin
              Result := cmerrRGNaoCadastrado;
              Exit;
            end;
            
            if UpperCase(SemEspaco(aNome)) <> UpperCase(SemEspaco(FTContato.FieldByName('RG').AsString)) then begin
              Result := cmerrRGErrado;
              Exit;
            end;
          end;    
          
          with FTContato.FieldByName('TipoAcessoPref') do 
          if (AsInteger>=0) and (FTiposAcesso.PorCodigo[AsInteger]<>nil) then
            aTipoAcesso := AsInteger;
            
          aIsento := FTContato.FieldByName('Isento').AsBoolean;
          aCredito := ObtemCred(FTContato.FieldByName('CreditoM').AsInteger);
          aContato := FTContato.FieldByName('Codigo').AsInteger;
          LePassaportesCliTran(FTPassaporte, nil, aTipoAcesso, aContato, 0, Maq.Passaportes);

          TA := FTiposAcesso.PorCodigo[aTipoAcesso];
          if TA=nil then
            FillChar(HC, SizeOf(HC), 0)
          else
            HC := TA.PHoraCor^;  

          CalculaMaxTempo(Now, aCredito, aTipoAcesso, HC, FCorPrecos, Maq.Passaportes, aCredTotal);

          if not aIsento then
          if (not FConfig.PermiteLoginSemCred) and (aCredTotal < MinCreditoLoginMS) then begin
            Result := cmerrSemCreditoDisp;
            Exit;
          end;
          aNome := FTContato.FieldByName('Nome').AsString;
        end;

        if (aContato > 0) and (not aIsento) then
        for I := 0 to pred(Maquinas.Count) do 
        if (Maquinas[I].Acesso>0) and (Maquinas[I].Contato=aContato) then begin
          Result := cmerrClienteJaAtivo;
          Exit;
        end;

        if Copy(aNome, 1, 4)='@RG@' then
          aNome := '';
        
        FDB.StartTransactionWith([FTTran, FTMaquina, FTPassaporte, FTHistPass]);
        try
          FTTran.Append;
          FTTran.FieldByName('StatusPagto').AsInteger := spEmAndamento;
          FTTran.FieldByName('Inicio').AsDateTime := Now;
          FTTran.FieldByName('Nome').AsString := aNome;
          FTTran.FieldByName('Maquina').AsInteger := aMaq;
          FTTran.FieldByName('Isento').AsBoolean := aIsento;
          FTTran.FieldByName('Contato').AsInteger := aContato;
          FTTran.FieldByName('FuncI').AsString := FFuncAtual;
          FTTran.FieldByName('Tipo').AsInteger := ttAcesso;
          FTTran.FieldByName('TipoAcesso').AsInteger := aTipoAcesso;
          FTTran.FieldByName('Sinal').AsFloat := aSinal;
          FTTran.FieldByName('CaixaI').AsInteger := NumCaixaAberto;
          FTTran.Post;

          FTMaquina.Edit;
          FTMaquina.FieldByName('Acesso').AsInteger := FTTran.FieldByName('Numero').AsInteger;
          FTMaquina.FieldByName('Inicio').AsDateTime := FTTran.FieldByName('Inicio').AsDateTime;
          FTMaquina.FieldByName('InicioTicks').AsInteger := GetTickCount;
          if aContato > 0 then 
            FTMaquina.FieldByName('NomeContato').AsString := aNome;
          FTMaquina.FieldByName('Nome').AsString := aNome;
          FTMaquina.FieldByName('Isento').AsBoolean := aIsento;
          FTMaquina.FieldByName('Contato').AsInteger := aContato;
          FTMaquina.FieldByName('CreditoCli').AsInteger := aCredito;
          FTMaquina.FieldByName('LimiteTempo').AsInteger := aLimiteTempo;
          FTMaquina.FieldByName('TipoAcesso').AsInteger := aTipoAcesso;
          FTMaquina.FieldByName('Sinal').AsFloat := aSinal;
          FTMaquina.FieldByName('LiberaAlemPacote').AsBoolean := (FConfig.EncerramentoPrePago=eppContinuarEmPosPago);
          FTMaquina.FieldByName('AguardaPagto').AsBoolean := False;
          FTMaquina.FieldByName('TipoTran').AsInteger := ttAcesso;

          if aContato>0 then
            LePassaportesCliTran(FTPassaporte, nil, aTipoAcesso, aContato, 0, Maq.Passaportes)
          else
          if aUsername='PREPAGO' then begin
            FTHistPass.Insert;
            FTHistPass.FieldByName('Transacao').AsInteger := FTTran.FieldByName('Numero').AsInteger;
            FTHistPass.FieldByName('DataHora').AsDateTime := FTTran.FieldByName('Inicio').AsDateTime;
            FTHistPass.FieldByName('Passaporte').AsInteger := P.pcNumero;
            FTHistPass.Post;
          end else
            Maq.Passaportes^.Limpa;

          FTMaquina.FieldByName('StrPassaportes').AsString := Maq.Passaportes^.ObtemStr;
          FTMaquina.Post;

          Maq.Acesso      := FTMaquina.FieldByName('Acesso').AsInteger;
          Maq.NomeContato := aNome;
          Maq.Nome        := aNome;
          Maq.TipoAcesso  := aTipoAcesso;
          Maq.FimTicks    := 0;
          Maq.AguardaPagto := False;
          Maq.InicioTicks := FTMaquina.FieldByName('InicioTicks').AsInteger;
          Maq.Inicio      := FTMaquina.FieldByName('Inicio').AsDateTime;
          Maq.Isento      := aIsento;
          Maq.Contato     := aContato;
          Maq.Sinal       := aSinal;
          Maq.Manutencao  := False;
          Maq.CreditoCli  := aCredito;
          Maq.LimiteTempo := aLimiteTempo;
          Maq.LiberaAlemPacote := (FConfig.EncerramentoPrePago=eppContinuarEmPosPago);
          Maq.ObsAcesso   := aObsAcesso;
          Maq.LimpaInfoParado;
          Maq.LimpaCache;
          if Maq.Sinal>0.009 then SalvaSinal(Maq);
          
          FDB.Commit;
          Result := 0;
        except
          Maq.ZeraInfoAcesso;
          FTMaquina.Cancel;
          FTTran.Cancel;
          FDB.Rollback;
          Raise;
        end;
      finally
        FBDSync.Leave;
      end;
      Maq.Notificar(tnAlteracao);
    except
      Result := cmerrExcecaoNaoTratada;
    end;
  finally
    Maquinas.Unlock;
  end;  
end;

function TCMServidor.PreLogoutMaq(aMaq: Byte): Integer; 
var Maq : TCMMaquina;  
begin
  Result := 0;
  Maquinas.Lock;
  try
    try
      Maq := Maquinas.PorNumero[aMaq];
      
      if Maq = nil then begin
        Result := cmerrItemInexistente;
        Exit;
      end;
      
      if Maq.Acesso = 0 then begin
        Result := 0;
        Exit;
      end;

      Maq.FimTicks := 0;
      Maq.FimTicks := Maq.NumTicks;
      Maq.LimpaCache;
      Maq.Notificar(tnAlteracao);
    except
      Result := cmerrExcecaoNaoTratada;
    end;
  finally
    Maquinas.Unlock;
  end;  
end;

function TCMServidor.CancLogoutMaq(aMaq: Byte): Integer;
var Maq : TCMMaquina;  
begin
  Result := 0;
  Maquinas.Lock;
  try
    try
      Maq := Maquinas.PorNumero[aMaq];
      
      if Maq = nil then begin
        Result := cmerrItemInexistente;
        Exit;
      end;
      
      if Maq.Acesso = 0 then begin
        Result := 0;
        Exit;
      end;

      Maq.FimTicks := 0;
      Maq.LimpaCache;
      Maq.Notificar(tnAlteracao);
    except
      Result := cmerrExcecaoNaoTratada;
    end;
  finally
    Maquinas.Unlock;
  end;  
end;
    
function TCMServidor.LogoutMaq(aMaq: Byte): Integer;
var
  Maq : TCMMaquina;  
  Valor : Double;
  Tempo,
  TempoCobrado,
  CredUsado : Cardinal;
  NumCx : Integer;
  TA : TCMTipoAcesso;
  HC : TCMHoraCor;
  I : Integer;
  Tempos : TArrayTempo;
begin
  Result := 0;
  Maquinas.Lock;
  try
    try
      Maq := Maquinas.PorNumero[aMaq];
      
      if Maq = nil then begin
        Result := cmerrItemInexistente;
        Exit;
      end;
      
      if (Maq.Acesso = 0) or Maq.AguardaPagto then begin
        Result := 0;
        Exit;
      end;

      FBDSync.Enter;
      try
        FTContato.IndexName := 'ICodigo';
        if (Maq.Contato>0) and (not FTContato.FindKey([Maq.Contato])) then
        begin
          Maq.Contato := 0;
          Maq.CreditoCli := 0;
        end;

        if (not FTTran.FindKey([Maq.Acesso])) or (not FTMaquina.FindKey([aMaq])) then
        begin
          Result := cmerrErroBD;
          Exit;
        end; 
         
        CredUsado := 0;
        
        FDB.StartTransactionWith([FTContato, FTTran, FTCaixa, FTMaquina, FTPassaporte, FTHistPass]);
        try
          FTTran.Edit;
        

          if (Maq.Contato>0) and (not Maq.Isento) then 
            Maq.CreditoCli := ObtemCred(FTContato.FieldByName('CreditoM').AsInteger)
          else
            Maq.CreditoCli := 0;  

          TA := FTiposAcesso.PorCodigo[Maq.TipoAcesso];
          if TA=nil then
            FillChar(HC, SizeOf(HC), 0)
          else
            HC := TA.PHoraCor^;
             
          if FConfig.ModoPagtoAcesso in [mpgTelaPagtoAutomatica, mpgDuploCliqueMaq] then
            Maq.FimTicks := Maq.NumTicks;
          
          Maq.Calculo(Tempo, TempoCobrado, CredUsado, Valor, HC, FCorPrecos, FConfig.PacoteTempoReal);  
          Tempo := Maq.NumTicks;

          if (Maq.Contato>0) and (not Maq.Isento) then begin
            FTContato.Edit;
            if FConfig.PacoteTempoReal then 
              FTContato.FieldByName('TempoTotal').AsInteger :=
                FTContato.FieldByName('TempoTotal').AsInteger + (Tempo div 1000) 
            else    
              FTContato.FieldByName('TempoTotal').AsInteger :=
                FTContato.FieldByName('TempoTotal').AsInteger + (TempoCobrado div 1000);
              
            if Maq.CreditoCli>0 then 
              FTContato.FieldByName('CreditoM').AsInteger := ObtemCred(
                ObtemCred(FTContato.FieldByName('CreditoM').AsInteger) - CredUsado);
            
            FTContato.Post;
          end;    

          NumCx := NumCaixaAberto;  

          FTTran.FieldByName('Maquina').AsInteger := Maq.Numero;
          FTTran.FieldByName('StatusPagto').AsInteger := spAguardaPagto;
          FTTran.FieldByName('Fim').AsDateTime := Now;
          FTTran.FieldByName('Valor').AsFloat := Valor;
          if FTTran.FieldByName('Produtos').AsFloat>0.0000001 then
            FTTran.FieldByname('Tipo').AsInteger := ttAcessoVenda
          else
            FTTran.FieldByName('Tipo').AsInteger := ttAcesso;
            
          FTTran.FieldByName('Tempo').AsDateTime := TicksToDateTime(Maq.NumTicks);
          FTTran.FieldByName('CredUsado').AsInteger := CredUsado;
          FTTran.FieldByName('CredAnterior').AsInteger := Maq.CreditoCli;
          FTTran.FieldByName('Contato').AsInteger := Maq.Contato;
          FTTran.FieldByName('FuncF').AsString := FFuncAtual;
          FTTran.FieldByName('TempoCobrado').AsDateTime := TicksToDateTime(TempoCobrado);
          FTTran.FieldByName('CaixaF').AsInteger := NumCx;
          FTTran.FieldByName('TipoAcesso').AsInteger := Maq.TipoAcesso;
          FTTran.FieldByName('Isento').AsBoolean := Maq.Isento;
          FTTran.FieldByName('Nome').AsString := Maq.NomeMostrar;
          FTTran.FieldByName('Obs').AsString := Maq.ObsAcesso;
          FTTran.FieldByName('CaixaP').AsInteger := 0;
          
          if (NumCx>0) and ((Valor < 0.01) or (Maq.Sinal>=Valor)) and (FTTran.FieldByName('Produtos').AsFloat<0.01) then
          begin
            if NumCx<>0 then begin
              FTTran.FieldByName('CaixaP').AsInteger := NumCx;
              FTTran.FieldByName('DataPagto').AsDateTime := Now;
            end else begin
              FTTran.FieldByName('CaixaP').AsInteger := FTTran.FieldByName('CaixaI').AsInteger;
              FTTran.FieldByName('DataPagto').AsDateTime := FTTran.FieldByName('Inicio').AsDateTime;
              FTTran.FieldByName('CaixaF').AsInteger := FTTran.FieldByName('CaixaI').AsInteger;
            end;
            FTTran.FieldByName('StatusPagto').AsInteger := spPago;
          end;

          with FTTran do begin
            MinutosPorHora(FieldByName('Inicio').AsDateTime,
                           FieldByName('Fim').AsDateTime,
                           Tempos);
            for I := 0 to 23 do
              FieldByName('T'+IntToStr(I)).AsFloat := Tempos[I];
          end;

          FTTran.FieldByName('ValorFinalAcesso').AsFloat := 
            CalcAcesso(FTTran.FieldByName('Valor').AsFloat, 
                       FTTran.FieldByName('Sinal').AsFloat,
                       FTTran.FieldByName('Desconto').AsFloat);
            
          FTTran.Post;
          
          SalvaPassaportesUsados(FTPassaporte,
                                 FTHistPass,
                                 FTTran.FieldByName('Numero').AsInteger,
                                 Maq.Inicio,
                                 Maq.Passaportes);

          FTMaquina.Edit;
          if (FConfig.ModoPagtoAcesso=mpgSomenteTransacoes) or
             (not FTTran.FieldByName('DataPagto').IsNull) then
          begin   
            FTMaquina.FieldByName('Acesso').AsInteger := 0;
            FTMaquina.FieldByName('Inicio').AsDateTime := 0;
            FTMaquina.FieldByName('InicioTicks').AsInteger := 0;
            FTMaquina.FieldByName('NomeContato').AsString := '';
            FTMaquina.FieldByName('Nome').AsString := '';
            FTMaquina.FieldByName('Isento').AsBoolean := False;
            FTMaquina.FieldByName('Contato').AsInteger := 0;
            FTMaquina.FieldByName('TipoAcesso').AsInteger := High(Word);
            FTMaquina.FieldByName('Sinal').AsFloat := 0;
            FTMaquina.FieldByName('Vendas').AsFloat := 0;
            FTMaquina.FieldByName('ObsAcesso').AsString := '';
            FTMaquina.FieldByName('LimiteTempo').AsInteger := 0;
            FTMaquina.FieldByName('LiberaAlemPacote').AsBoolean := False;
            FTMaquina.FieldByName('AguardaPagto').AsBoolean := False;
            FTMaquina.FieldByName('StrPassaportes').AsString := '';
            Maq.FimTicks := 0;
          end else 
            FTMaquina.FieldByName('AguardaPagto').AsBoolean := True;
          
          FTMaquina.Post;

          FDB.Commit;
          Result := 0;
        except
          FTMaquina.Cancel;
          FTTran.Cancel;
          FDB.Rollback;
          Raise;
        end;
        
        if Maq.FimTicks=0 then 
          Maq.ZeraInfoAcesso
        else
          Maq.AguardaPagto := True;  
        
        Maq.LimpaCache;
        Maq.Notificar(tnAlteracao);
        
      finally
        FBDSync.Leave;
      end;
    except
      Result := cmerrExcecaoNaoTratada;
    end;
  finally
    Maquinas.Unlock;
  end;  
end;

end.
