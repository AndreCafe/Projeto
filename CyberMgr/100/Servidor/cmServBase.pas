unit cmServBase;

interface

uses
  cmServBD,
  Classes,
  SysUtils,
  Windows,
  Db,
  FFDB,
  FFSrEng,
  FFDBBase,
  FileCtrl,
  SyncObjs,
  
  ClasseCS,
  cmErros,
  cmClassesBase,
  cmMsgCom,
  cmListaID,
  cmIDRecursos,
  cmFFDM,
  PBPrintersMonitorU;
  

type  
  THackTMClasse = class ( TCMClasse );

  TJobImp = record
    jiID     : Cardinal;
    jiStatus : TPBJobStatus;
    jiTicks  : Cardinal;
  end;
  PJobImp = ^TJobImp;

  TCMServidor = class ( TCMServidorBase )
  private
    FDM           : TffDataModule;
    FDB           : TffDatabase;
    FTUsuario     : TffTable;
    FTMaquina     : TffTable;
    FTGrupo       : TffTable;
    FTContato     : TffTable;
    FTAcesso      : TffTable;
    FTConfig      : TffTable;
    FTHoraCor     : TffTable;
    FTCor         : TffTable;
    FTCorPrecos   : TffTable;
    FTCaixa       : TffTable;
    FTTipoAcesso  : TffTable;
    FTLog         : TffTable;
    FTImp         : TffTable;
    FTItensME     : TffTable;
    FTProduto     : TffTable;
    FMonitor      : TPBPrintersMonitor;
    FJobs         : TList;
    
    
    FServidorBD   : TCMServidorBD;
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

    procedure JobNotification( const jobinfo: TPBJobInformation );

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
    
    function SalvaStreamObj(Novo: Boolean; S: TStream): Integer; override;
    function ObtemStreamConfig(S: TStream): Integer; override;
    function ApagaObj(Cliente: Integer; TipoClasse: Integer; Chave: String): Integer; override;
    
    function CapturaTelaMaq(aMaq: Byte; S: TMemoryStream): integer; override;
    function SalvaTelaMaq(aMaq: Byte; S: TMemoryStream): integer; override;
    function ShutdownMaq(aMaq, aOper: Byte): integer; override;

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
                      
    function LogoutMaq(aMaq: Byte): Integer; override;
    
    function PararTempoMaq(aMaq: Byte; aParar: Boolean): Integer; override;

    function LiberarAlemPacote(aMaq: Byte): Integer; override;

    function TransferirMaq(aOrigem, aDestino: Byte): Integer; override;

    function ModoManutencao(aMaq: Byte; aUsername, aSenha: String; aEntrar: Boolean): Integer; override;
    
    function PreLogoutMaq(aMaq: Byte): Integer; override;
    function CancLogoutMaq(aMaq: Byte): Integer; override;

    function RefreshPrecos: integer; override;

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

implementation

uses uCMChecaTabelas;

{ TCMServidor }

function Permitido(Direitos: String; Recurso, TipoAcesso: Integer): Boolean;
var Valor: String;
begin
  Valor := ObtemValor(Direitos, IntToStr(Recurso));
  Result := LIContemID(Valor, TipoAcesso);
end;

procedure TCMServidor.Notificacao(Obj: TCMClasse; TipoNot: TTipoNotificacao);
begin
  case TipoNot of
    tnCriacao   : AoCriarObj(Obj);
    tnAlteracao : AoAlterarObj(Obj);
    tnDestruicao: AoDestruirObj(Obj);
  end;
end;

constructor TCMServidor.Create(AOwner: TComponent);
var S : String;
begin
  inherited;
  LicencaGlobal.LeArquivoPadrao;
  LicencaGlobal.LeSerialHD;
  FMonitor := nil;
  FJobs := nil;
  S := ExtractFilePath(ParamStr(0)) + 'Atualiza';
  if not DirectoryExists(S) then
    MkDir(S);
  
  FFuncAtual     := '';
  FDM            := nil;
  FDB            := nil;
  FServidorBD    := nil;
  FTMaquina      := nil;
  FTContato      := nil;
  FTUsuario      := nil;
  FTGrupo        := nil;
  FTAcesso       := nil;
  FTCaixa        := nil;
  FTConfig       := nil;
  FTCor          := nil;
  FTHoraCor      := nil;
  FTCorPrecos    := nil;
  FTTipoAcesso   := nil;
  FTLog          := nil;
  FTImp          := nil;
  FTItensME      := nil;
  FTProduto      := nil;

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
begin
  FBDSync.Enter;
  try
    DestroiServidorBD;

    ApagaFFTemp;
    
    FServidorBD := TCMServidorBD.Create;
    while not FServidorBD.Running do Sleep(5);
  
    with TFrmChecaBD.Create(nil) do
    Checar;
    
    FDM := TffDataModule.Create(FFServerEng);
  
    FDB := TffDatabase.Create(Self);
    FDB.SessionName  := FDM.FFSE.SessionName;
    FDB.DatabaseName := 'DBServBase';
    FDB.AliasName    := 'CyberMgr';
    FDB.Connected := True;
  
    FTUsuario := TffTable.Create(nil);
    FTUsuario.SessionName  := FDM.FFSE.SessionName;
    FTUsuario.DatabaseName := 'DBServBase';
    FTUsuario.TableName    := 'Usuario';
    FTUsuario.IndexName    := 'IUsername';
    FTUsuario.Open;

    if FTUsuario.RecordCount = 0 then begin
      FTUsuario.Insert;
      FTUsuario.FieldByName('Username').AsString := 'admin';
      FTUsuario.FieldBYName('Nome').AsString := 'Administrador';
      FTUsuario.FieldByName('Admin').AsBoolean := True;
      FTUsuario.FieldByName('Senha').AsString := '';
      FTUsuario.Post;
    end;

    Usuarios.LeDataset(FTUsuario);

    FTAcesso := TffTable.Create(nil);
    FTAcesso.SessionName  := FDM.FFSE.SessionName;
    FTAcesso.DatabaseName := 'DBServBase';
    FTAcesso.TableName    := 'Acesso';
    FTAcesso.IndexName    := 'INumero';
    FTAcesso.Open;
  
    FTMaquina := TffTable.Create(nil);
    FTMaquina.SessionName  := FDM.FFSE.SessionName;
    FTMaquina.DatabaseName := 'DBServBase';
    FTMaquina.TableName    := 'Maquina';
    FTMaquina.IndexName    := 'INumero';
    FTMaquina.Open;

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
      if Manutencao or (Acesso>0) then begin
        DecodeTime(Now-Inicio, H, M, S, MS);
        T := (H * (1000 * 60 * 60)) + (M * (1000 * 60)) + (S * 1000) + MS;
        InicioTicks := (GetTickCount - T);
      end;
        
      if AguardaPagto then
      if (Acesso>0) and FTAcesso.FindKey([Acesso]) then
        FimTicks := DateTimeToTicks(FTAcesso.FieldByName('Tempo').AsDateTime)
      else
        ZeraInfoAcesso;
    end;   
  
    FTCor := TffTable.Create(nil);
    FTCor.SessionName  := FDM.FFSE.SessionName;
    FTCor.DatabaseName := 'DBServBase';
    FTCor.TableName    := 'Cor';
    FTCor.IndexName    := 'IPrim';
    FTCor.Open;

    FTCorPrecos := TffTable.Create(nil);
    FTCorPrecos.SessionName  := FDM.FFSE.SessionName;
    FTCorPrecos.DatabaseName := 'DBServBase';
    FTCorPrecos.TableName    := 'CorPrecos';
    FTCorPrecos.IndexName    := 'IPrim';
    FTCorPrecos.Open;
    
    FTHoraCor := TffTable.Create(nil);
    FTHoraCor.SessionName  := FDM.FFSE.SessionName;
    FTHoraCor.DatabaseName := 'DBServBase';
    FTHoraCor.TableName    := 'HoraCor';
    FTHoraCor.IndexName    := 'IPrim';
    FTHoraCor.Open;
    
    FTConfig := TffTable.Create(nil);
    FTConfig.SessionName  := FDM.FFSE.SessionName;
    FTConfig.DatabaseName := 'DBServBase';
    FTConfig.TableName    := 'Config';
    FTConfig.IndexName    := 'INumSeq';
    FTConfig.Open;

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
      

    FTContato := TffTable.Create(nil);
    FTContato.SessionName  := FDM.FFSE.SessionName;
    FTContato.DatabaseName := 'DBServBase';
    FTContato.TableName    := 'Contato';
    FTContato.IndexName    := 'IUsername';
    FTContato.Open;

    FTGrupo := TffTable.Create(nil);
    FTGrupo.SessionName  := FDM.FFSE.SessionName;
    FTGrupo.DatabaseName := 'DBServBase';
    FTGrupo.TableName    := 'Grupo';
    FTGrupo.IndexName    := 'INome';
    FTGrupo.Open;

    FTCaixa := TffTable.Create(nil);
    FTCaixa.SessionName  := FDM.FFSE.SessionName;
    FTCaixa.DatabaseName := 'DBServBase';
    FTCaixa.TableName    := 'Caixa';
    FTCaixa.IndexName    := 'IAberto';
    FTCaixa.Open;

    FTLog := TffTable.Create(nil);
    FTLog.SessionName  := FDM.FFSE.SessionName;
    FTLog.DatabaseName := 'DBServBase';
    FTLog.TableName    := 'Log';
    FTLog.IndexName    := 'IProgramaMaq';
    FTLog.Open;

    FTImp := TffTable.Create(nil);
    FTImp.SessionName  := FDM.FFSE.SessionName;
    FTImp.DatabaseName := 'DBServBase';
    FTImp.TableName    := 'Impressao';
    FTImp.IndexName    := 'IDataHora';
    FTImp.Open;

    FTItensME := TffTable.Create(nil);
    FTItensME.SessionName  := FDM.FFSE.SessionName;
    FTItensME.DatabaseName := 'DBServBase';
    FTItensME.TableName    := 'ItensME';
    FTItensME.IndexName    := 'IEmissor';
    FTItensME.Open;

    FTProduto := TffTable.Create(nil);
    FTProduto.SessionName  := FDM.FFSE.SessionName;
    FTProduto.DatabaseName := 'DBServBase';
    FTProduto.TableName    := 'Produto';
    FTProduto.IndexName    := 'ICodigo';
    FTProduto.Open;
    
    FTTipoAcesso := TffTable.Create(nil);
    FTTipoAcesso.SessionName  := FDM.FFSE.SessionName;
    FTTipoAcesso.DatabaseName := 'DBServBase';
    FTTipoAcesso.TableName    := 'TipoAcesso';
    FTTipoAcesso.IndexName    := 'ICodigo';
    FTTipoAcesso.Open;

    RefreshPrecos;

    if Win32Platform = VER_PLATFORM_WIN32_NT	then begin
      FMonitor:= TPBPrintersMonitor.Create( self );
      FMonitor.OnNewJob := JobNotification;
      FMonitor.OnJobChange := JobNotification;
      FMonitor.OnJobComplete := JobNotification;
      FMonitor.Active := true;
      FJobs := TList.Create;
    end;  

    Grupos.LeDataset(FTGrupo);

    GravaLog(2, 0, 'ENTROU');

    LicencaGlobal.LeArquivoPadrao;
    LicencaGlobal.LeSerialHD;
    
    
  finally
    FBDSync.Leave;
  end;    
end;

procedure TCMServidor.DestroiServidorBD;
begin
  FBDSync.Enter;
  try
    if FServidorBD <> nil then begin
      if Win32Platform = VER_PLATFORM_WIN32_NT then begin
        FreeAndNil(FMonitor);
        while FJobs.Count > 0 do begin
          Dispose(PJobImp(FJobs[0]));
          FJobs.Delete(0);
        end;
        FreeAndNil(FJobs);
      end;    
    
      if FTUsuario <> nil then begin
        FTUsuario.Close;
        FreeAndNil(FTUsuario);
      end;
  
      if FTMaquina <> nil then begin
        FTMaquina.Close;
        FreeAndNil(FTMaquina);
      end;

      if FTAcesso <> nil then begin
        FTAcesso.Close;
        FreeAndNil(FTAcesso);
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

      if FTItensME <> nil then begin
        FTItensME.Close;
        FreeAndNil(FTItensME);
      end;  

      if FTProduto <> nil then begin
        FTProduto.Close;
        FreeAndNil(FTProduto);
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
        
      if FDM <> nil then FreeAndNil(FDM);  
  
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
      Result := 0;
    finally
      FBDSync.Leave;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;  
end;

function TCMServidor.AtualizaGrupoBD(Grupo: TCMGrupo): Integer;
begin
  FBDSync.Enter;
  try
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
  
      Result := 0;
    finally
      FBDSync.Leave;
    end;
  except
    Result := cmerrExcecaoNaoTratada;
  end;    
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

      if not FTConfig.Active then 
        FTConfig.Open;

      if FTConfig.RecordCount>0 then begin
        FTConfig.First;
        FTConfig.Edit;
      end else
        FTConfig.Insert;  
      
      FConfig.SalvaDataset(FTConfig);
      FTConfig.Post;
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
      
      if FTTipoAcesso.FindKey([TA.Codigo]) then 
        FTTipoAcesso.Edit
      else
        FTTipoAcesso.Insert;
      TA.SalvaDataset(FTTipoAcesso);
      FTTipoAcesso.Post;
      Result := 0;
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
  if FTAcesso.Locate('AcessoPago', Maq.Acesso, []) then begin
    if NumCaixaAberto<>FTAcesso.FieldByName('Caixa').AsInteger then 
      Maq.Sinal := FTAcesso.FieldByName('Valor').AsFloat
    else begin
      Dif := Maq.Sinal - FTAcesso.FieldByName('Valor').AsFloat;
      FTCaixa.Edit;
      FTCaixa.FieldByName('Internet').AsFloat := FTCaixa.FieldByName('Internet').AsFloat + Dif;
      FTCaixa.Post;
      
      FTAcesso.Edit;
      FTAcesso.FieldByName('TipoAcesso').AsInteger := Maq.TipoAcesso;
      FTAcesso.FieldByName('Nome').AsString := Maq.NomeMostrar;
      FTAcesso.FieldByName('Valor').AsFloat := Maq.Sinal;
      FTAcesso.FieldByName('ValorFinalAcesso').AsFloat := Maq.Sinal;
      FTAcesso.Post;
    end;  
  end else
  if (Maq.Sinal > 0.009) and (NumCaixaAberto>0) then begin
    FTCaixa.Edit;
    FTCaixa.FieldByName('Internet').AsFloat := FTCaixa.FieldByName('Internet').AsFloat + Maq.Sinal;
    FTCaixa.Post;
  
    FTAcesso.Insert;
    FTAcesso.FieldByName('AcessoPago').AsInteger := Maq.Acesso;
    FTAcesso.FieldByName('Maquina').AsInteger := Maq.Numero;
    FTAcesso.FieldByName('Caixa').AsInteger := FTCaixa.FieldByName('Numero').AsInteger;
    FTAcesso.FieldByName('FuncI').AsString := FTCaixa.FIeldByName('Usuario').AsString;
    FTAcesso.FieldByName('FuncF').AsString := FTCaixa.FIeldByName('Usuario').AsString;
    FTAcesso.FieldByName('TipoAcesso').AsInteger := Maq.TipoAcesso;
    FTAcesso.FieldByName('Tipo').AsInteger := taSinal;
    FTAcesso.FieldByName('Nome').AsString := Maq.NomeMostrar;
    FTAcesso.FieldByName('Aberto').AsBoolean := False;
    FTAcesso.FieldByName('Inicio').AsDateTime := Now;
    FTAcesso.FieldByName('Fim').AsDateTime := Now;
    FTAcesso.FieldByName('DataPagto').AsDateTime := Now;
    FTAcesso.FieldByName('Contato').AsInteger := Maq.Contato;
    FTAcesso.FieldByName('Valor').AsFloat := Maq.Sinal;
    FTAcesso.FieldByName('ValorFinalAcesso').AsFloat := Maq.Sinal;
    FTAcesso.FieldByName('Isento').AsBoolean := False;
    FTAcesso.Post;
  end;
end;

function TCMServidor.AtualizaMaquinaBD(Maq: TCMMaquina): Integer;
begin
  try
    FBDSync.Enter;
    try
      FDB.StartTransactionWith([FTMaquina, FTAcesso, FTCaixa]);
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
  
        if (Maq.Acesso>0) and FTAcesso.FindKey([Maq.Acesso]) then begin
          FTAcesso.Edit;
          FTAcesso.FieldByName('Nome').AsString := Maq.NomeMostrar;
          FTAcesso.FieldByName('TipoAcesso').AsInteger := Maq.TipoAcesso;
          FTAcesso.FieldByName('Sinal').AsFloat := Maq.Sinal;
          FTAcesso.FieldByName('ValorFinalAcesso').AsFloat := 
            CalcAcesso(FTAcesso.FieldByName('Valor').AsFloat, 
                       FTAcesso.FieldByName('Sinal').AsFloat,
                       FTAcesso.FieldByName('Desconto').AsFloat);
            
          FTAcesso.Post;
        end;
        Result := 0;
        FDB.Commit;
      except
        FTAcesso.Cancel;
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

function TCMServidor.ObtemStreamConfig(S: TStream): Integer;
begin
  try
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
    tcMaquina : if UpperCase(Obj.PropriedadesAlteradas)<>'PROGRAMAATUAL' then AtualizaMaquinaBD(TCMMaquina(Obj)); 
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
    LicencaGlobal.SalvaArquivoPadrao;
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

procedure TCMServidor.JobNotification(const jobinfo: TPBJobInformation);
var
  Maq : TCMMaquina;
  S : String;
  NumItem : Integer;

procedure ObtemMaq;
var I : Integer;
begin
  for I := 0 to pred(Maquinas.Count) do 
  with Maquinas[I] do 
  if UpperCase(ComputerName)=UpperCase(S) then begin
    Maq := Maquinas[I];
    Exit;
  end;
  Maq := nil;  
end;

function JobExiste: Boolean;
var 
  I : Integer;
  P : PJobImp;
begin
  Result := False;
  for I := (FJobs.Count-1) downto 0 do begin
    P := FJobs[I];
    if (P^.jiID=jobInfo.JobID) and (P^.jiStatus=jobInfo.Status) then
      Result := True;
    if (GetTickCount - P^.jiTicks) > 60000 then begin
      Dispose(P);
      FJobs.Delete(I);
    end;  
  end;
  if (not Result) then begin
    New(P);
    P^.jiID := jobInfo.JobID;
    P^.jiTicks := GetTickCount;
    P^.jiStatus := jobInfo.Status;
    FJobs.Add(P);
  end;  
end;
      
begin
  if (not (JobInfo.Status in [jsCompleted, jsError])) or JobExiste then Exit;
  FBDSync.Enter;
  Maq := nil;
  with FTImp, JobInfo do 
  Try
    FDB.StartTransactionWith([FTImp, FTAcesso, FTProduto, FTItensME, FTMaquina]);
    try
      Insert;
      FieldByName('DataHora').AsDateTime := Now;
      S := Computer;
      while Copy(S, 1, 1)='\' do System.Delete(S, 1, 1);
      ObtemMaq;
      FieldByName('Computador').AsString := S;
      FieldByName('Impressora').AsString := PrinterName;
      FieldByName('Documento').AsString := Document;
      FieldByName('Paginas').AsInteger := Pages;  
      if Maq <> nil then begin
        FieldByName('Maquina').AsInteger := Maq.Numero;
        FieldByName('Acesso').AsInteger := Maq.Acesso;
      end;  
      
      if (Status=jsCompleted) then
        FieldByName('Resultado').AsInteger := 0
      else
        FieldByName('Resultado').AsInteger := 1;
        
      if (Status=jsCompleted) and (Pages>0) then begin
        FTProduto.Refresh;
        FTMaquina.Refresh;
        FTAcesso.Refresh;
        FTItensME.Refresh;
        if (Maq<>nil) and (Maq.Acesso>0) and (FConfig.ProdutoImpressao>'') and
           FTProduto.FindKey([FConfig.ProdutoImpressao]) and
           FTMaquina.FindKey([Maq.Numero]) and
           FTAcesso.FindKey([Maq.Acesso]) and
           FTAcesso.FieldByName('Aberto').AsBoolean then
        begin
          FTItensME.SetRange([0, 'AC', Maq.Acesso],
                             [0, 'AC', Maq.Acesso]);
          NumItem := FTItensME.RecordCount + 1;  
          FTAcesso.Edit;
          FTMaquina.Edit;
          with FTAcesso.FieldByName('Produtos') do begin
            AsFloat := AsFloat + (FTProduto.FieldByName('Preco').AsFloat * Pages);
            FTMaquina.FieldByName('Vendas').AsFloat := AsFloat;
          end;  
            
          FTAcesso.Post;  
          FTMaquina.Post;
          
          FTItensME.Insert;
          FTItensME.FieldByName('Emissor').AsInteger   := 0;
          FTItensME.FieldByName('Serie').AsString      := 'AC';
          FTItensME.FieldByName('Numero').AsInteger    := Maq.Acesso;
          FTItensME.FieldByName('Produto').AsString    := FConfig.ProdutoImpressao;
          FTItensME.FieldByName('Quant').AsFloat       := Pages;
          FTItensME.FieldByName('Unitario').AsFloat    := FTProduto.FieldByName('Preco').AsFloat;
          FTItensME.FieldByName('Total').AsFloat       := (FTProduto.FieldByName('Preco').AsFloat * Pages);
          FTItensME.FieldByName('Item').AsInteger       := NumItem;
          FTItensME.FieldByName('MovEst').AsBoolean    := True; 
          FTItensME.FieldByName('Cancelado').AsBoolean := True; 
          FTItensME.FieldByName('Entrada').AsBoolean   := False; 
          FTItensME.FieldByName('Desconto').AsFloat    := 0;
          FTItensME.FieldByName('TipoMov').AsString    := 'VENDA';
          FTItensME.FieldByName('Contato').AsInteger   := Maq.Contato;
          FTItensME.FieldByName('Caixa').AsInteger     := 0;
          FTItensME.FieldByName('EstoqueAnt').AsFloat  := FTProduto.FieldByName('EstoqueAtual').AsFloat;
          FTItensME.Post;
          
          FTProduto.Edit;
          with FTProduto.FieldByName('EstoqueAtual') do
            AsFloat := AsFloat - Pages;
          FTProduto.Post;  
          
        end else
          Maq := nil;   
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
      if FTAcesso.State in [dsEdit, dsInsert] then FTAcesso.Cancel;
      if FTMaquina.State in [dsEdit, dsInsert] then FTMaquina.Cancel;
      if FTItensME.State in [dsEdit, dsInsert] then FTItensME.Cancel;
      FDB.Rollback;
      FTImp.Refresh;
      FTProduto.Refresh;
      FTMaquina.Refresh;
      FTItensME.Refresh;
      FTAcesso.Refresh;
    end;  
  Finally
    FBDSync.Leave;
  End; { Finally }
end;

function TCMServidor.ModoManutencao(aMaq: Byte; aUsername, aSenha: String; aEntrar: Boolean): Integer;
var 
  Usuario: TCMUsuario;  
  Maq    : TCMMaquina;
  Dir    : String;
  I      : Integer;
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

        Dir := Usuario.Direitos;                                 
        for I := 0 to pred(Grupos.Count) do with Grupos[I] do
        if ListaContemStr(Usuario.Grupos, Nome) then 
          Dir := LISomaListas(Dir, Direitos);

        if not Usuario.Admin and (not Permitido(Dir, reMaquinas, taMaqConfigurar)) then begin
          Result := cmerrAcessoNaoPermitido;
          Exit;
        end;  
      end;  

      Maq.LimpaCache;
        
      FBDSync.Enter;
      try  
        FDB.StartTransactionWith([FTMaquina, FTAcesso, FTCaixa]);
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
            FTAcesso.Append;
            FTAcesso.FieldByName('Aberto').AsBoolean := False;
            FTAcesso.FieldByName('Inicio').AsDateTime := Maq.Inicio;
            FTAcesso.FieldByName('Nome').AsString := 'Manutenção';
            FTAcesso.FieldByName('Maquina').AsInteger := Maq.Numero;
            FTAcesso.FieldByName('Isento').AsBoolean := True;
            FTAcesso.FieldByName('Manutencao').AsBoolean := True;
            FTAcesso.FieldByName('Contato').AsInteger := 0;
            FTAcesso.FieldByName('FuncI').AsString := Maq.UsuarioI;
            FTAcesso.FieldByName('FuncF').AsString := aUsername;
            FTAcesso.FieldByName('Tipo').AsInteger := 0;
            FTAcesso.FieldByName('TipoAcesso').AsInteger := 0;
            FTAcesso.FieldByName('Sinal').AsFloat := 0;
            FTAcesso.FieldByName('Caixa').AsInteger := Maq.Caixa;
            FTAcesso.FieldByName('DataPagto').AsDateTime := Now;
            FTAcesso.FieldByName('Fim').AsDateTime := Now;
            FTAcesso.FieldByName('Tempo').AsDateTime := TicksToDateTime(Maq.NumTicks);
            FTAcesso.FieldByName('CredUsado').AsInteger := 0;
            FTAcesso.FieldByName('CredAnterior').AsInteger := 0;
            FTAcesso.FieldByName('TempoCobrado').AsDateTime := FTAcesso.FieldByName('Tempo').AsDateTime;
            FTAcesso.Post;
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

{ TCMServidor }

function TCMServidor.Login(aUsername, aSenha: String; aMaq: Byte; aFuncAtual: Boolean; aRemoto: Boolean;
  aWndHandle: HWND; aProxyHandle: Integer; aSocket: integer; var Handle: Integer): Integer;
var 
  Usuario: TCMUsuario;  
  Maq    : TCMMaquina;
begin
  try
    if aMaq>0 then begin
      Maq := Maquinas.PorNumero[aMaq];
      if Maq = nil then begin
        Result := cmerrMaquinaInexistente;
        Exit;
      end;
      if Maq.Cliente>0 then begin
        Result := cmerrMaquinaJaConectada;
        Exit;
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
      if M<>nil then begin
        M.Cliente := 0;
        M.LimpaCache;
        M.Notificar(tnAlteracao);
      end;
    finally
      Maquinas.UnLock;
    end;  

    GravaLog(0, Cliente.Maquina, 'SAIU');
    if (M<>nil) and M.Manutencao then
      ModoManutencao(M.Numero, '', '', False);
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

      if D.Acesso > 0 then begin
        Result := cmerrAcessoEmAndamento;
        Exit;
      end;

      O.TransfereMaq(D);

      FBDSync.Enter;
      try
        FDB.StartTransactionWith([FTMaquina, FTAcesso]);
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
          if FTAcesso.FindKey([D.Acesso]) then begin 
            FTAcesso.Edit;
            FTAcesso.FieldByName('Maquina').AsInteger := D.Numero;
            FTAcesso.Post;
          end;  
          S := FTAcesso.IndexName;
          try
            FTAcesso.IndexName := 'IAcessoPago';
            FTAcesso.SetRange([D.Acesso], [D.Acesso]);
            try
              FTAcesso.First;
              while not FTAcesso.Eof do begin
                FTAcesso.Edit;
                FTAcesso.FieldByName('Maquina').AsInteger := D.Numero;
                FTAcesso.Post;
                FTAcesso.Next;
              end;  
            finally
              FTAcesso.CancelRange;
            end;  
          finally
            FTAcesso.IndexName := S;
          end;    
          FDB.Commit;
        except
          FTMaquina.Cancel;
          FTAcesso.Cancel;
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
        Maq.TicksParadoPac := Maq.NumTicks - Maq.CreditoCli;
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

function TCMServidor.LoginMaq(aMaq: Byte; aContato: Integer; aUserName, aSenha,
  aNome, aObsAcesso: String; aLimiteTempo: Cardinal; aSinal: Double; aTipoAcesso: Word): Integer;
var
  Maq : TCMMaquina;  
  U   : TCMUsuario;
  aIsento : Boolean;
  aCredito : Cardinal;
  I : Integer;
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

          aNome := FTContato.FieldByName('Nome').AsString;
          aIsento := FTContato.FieldByName('Isento').AsBoolean;
          aCredito := ObtemCred(FTContato.FieldByName('CreditoM').AsInteger);
        end else
        if aUsername='anonimo' then begin
          if aSenha <> 'anonimo' then begin
            Result := cmerrInfoLoginInvalida;
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
          aIsento := FTContato.FieldByName('Isento').AsBoolean;
          aCredito := ObtemCred(FTContato.FieldByName('CreditoM').AsInteger);
          if not aIsento then 
          if (not FConfig.PermiteLoginSemCred) and (aCredito < MinCreditoLoginMS) then begin
            Result := cmerrSemCreditoDisp;
            Exit;
          end;  
          aNome := FTContato.FieldByName('Nome').AsString;
          aContato := FTContato.FieldByName('Codigo').AsInteger; 
        end;

        if (aContato > 0) and (not aIsento) then 
        for I := 0 to pred(Maquinas.Count) do 
        if (Maquinas[I].Acesso>0) and (Maquinas[I].Contato=aContato) then begin
          Result := cmerrClienteJaAtivo;
          Exit;
        end;
        
        FDB.StartTransactionWith([FTAcesso, FTMaquina]);
        try
          FTAcesso.Append;
          FTAcesso.FieldByName('Aberto').AsBoolean := True;
          FTAcesso.FieldByName('Inicio').AsDateTime := Now;
          FTAcesso.FieldByName('Nome').AsString := aNome;
          FTAcesso.FieldByName('Maquina').AsInteger := aMaq;
          FTAcesso.FieldByName('Isento').AsBoolean := aIsento;
          FTAcesso.FieldByName('Contato').AsInteger := aContato;
          FTAcesso.FieldByName('FuncI').AsString := FFuncAtual;
          FTAcesso.FieldByName('Tipo').AsInteger := 0;
          FTAcesso.FieldByName('TipoAcesso').AsInteger := aTipoAcesso;
          FTAcesso.FieldByName('Sinal').AsFloat := aSinal;
          FTAcesso.Post;

          FTMaquina.Edit;
          FTMaquina.FieldByName('Acesso').AsInteger := FTAcesso.FieldByName('Numero').AsInteger;
          FTMaquina.FieldByName('Inicio').AsDateTime := FTAcesso.FieldByName('Inicio').AsDateTime;
          FTMaquina.FieldByName('InicioTicks').AsInteger := GetTickCount;
          if aContato > 0 then 
            FTMaquina.FieldByName('NomeContato').AsString := aNome;
          FTMaquina.FieldByName('Nome').AsString := aNome;
          FTMaquina.FieldByName('Isento').AsBoolean := aIsento;
          FTMaquina.FieldByName('Contato').AsInteger := aContato;
          FTMaquina.FieldByName('CreditoCli').AsInteger := aCredito;
          FTMaquina.FieldByName('TipoAcesso').AsInteger := aTipoAcesso;
          FTMaquina.FieldByName('Sinal').AsFloat := aSinal;
          FTMaquina.FieldByName('LiberaAlemPacote').AsBoolean := not FConfig.PausarFimPacote;
          FTMaquina.FieldByName('AguardaPagto').AsBoolean := False;
          
          FTMaquina.Post;
          FDB.Commit;
          Result := 0;
        except
          FTMaquina.Cancel;
          FTAcesso.Cancel;
          FDB.Rollback;
          Raise;
        end;
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
        Maq.CreditoCli  := aCredito;
        Maq.LimiteTempo := aLimiteTempo;
        Maq.LiberaAlemPacote := not FConfig.PausarFimPacote;
        Maq.ObsAcesso   := aObsAcesso;
        Maq.LimpaInfoParado;
        Maq.LimpaCache;
        Maq.Notificar(tnAlteracao);

        if Maq.Sinal>0.009 then SalvaSinal(Maq);
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
          
        if (not FTAcesso.FindKey([Maq.Acesso])) or (not FTMaquina.FindKey([aMaq])) then
        begin
          Result := cmerrErroBD;
          Exit;
        end; 
         
        CredUsado := 0;
        
        FDB.StartTransactionWith([FTContato, FTAcesso, FTCaixa, FTMaquina]);
        try
          FTAcesso.Edit;
        

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

          FTAcesso.FieldByName('Maquina').AsInteger := Maq.Numero;
          FTAcesso.FieldByName('Aberto').AsBoolean := False;
          FTAcesso.FieldByName('Fim').AsDateTime := Now;
          FTAcesso.FieldByName('Valor').AsFloat := Valor;
          FTAcesso.FieldByName('Tipo').AsInteger := 0;
          FTAcesso.FieldByName('Tempo').AsDateTime := TicksToDateTime(Maq.NumTicks);
          FTAcesso.FieldByName('CredUsado').AsInteger := CredUsado;
          FTAcesso.FieldByName('CredAnterior').AsInteger := Maq.CreditoCli;
          FTAcesso.FieldByName('Contato').AsInteger := Maq.Contato;
          FTAcesso.FieldByName('FuncF').AsString := FFuncAtual;
          FTAcesso.FieldByName('TempoCobrado').AsDateTime := TicksToDateTime(TempoCobrado);
          FTAcesso.FieldByName('Caixa').AsInteger := NumCx;
          FTAcesso.FieldByName('TipoAcesso').AsInteger := Maq.TipoAcesso;
          FTAcesso.FieldByName('Isento').AsBoolean := Maq.Isento;
          FTAcesso.FieldByName('Nome').AsString := Maq.NomeMostrar;
          FTAcesso.FieldByName('Obs').AsString := Maq.ObsAcesso;
          
          if (NumCx>0) and ((Valor < 0.01) or (Maq.Sinal>=Valor)) and (FTAcesso.FieldByName('Produtos').AsFloat<0.01) then
            FTAcesso.FieldByName('DataPagto').AsDateTime := FTAcesso.FieldByName('Inicio').AsDateTime;

          FTAcesso.FieldByName('ValorFinalAcesso').AsFloat := 
            CalcAcesso(FTAcesso.FieldByName('Valor').AsFloat, 
                       FTAcesso.FieldByName('Sinal').AsFloat,
                       FTAcesso.FieldByName('Desconto').AsFloat);
            
          FTAcesso.Post;

          FTMaquina.Edit;
          if (FConfig.ModoPagtoAcesso=mpgSomenteTransacoes) or
             (not FTAcesso.FieldByName('DataPagto').IsNull) then
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
            Maq.FimTicks := 0;
          end else 
            FTMaquina.FieldByName('AguardaPagto').AsBoolean := True;
          
          FTMaquina.Post;

          FDB.Commit;
          Result := 0;
        except
          FTMaquina.Cancel;
          FTAcesso.Cancel;
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
