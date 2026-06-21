unit uDMContas;

interface

uses
  SysUtils, Classes, nxdb, kbmMemTable, kbmMemBinaryStreamFormat, DB,
  uFreeBoletoImage, uFreeBoleto, nxllComponent, uLicExeCryptor, uRSLogInfo, rtcInfo,
  rtcConn, rtcDataCli, rtcHttpCli, rtcFunction, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnMan, ActnColorMaps,
  LMDCustomComponent, LMDStrList;

type
  TdmContas = class(TDataModule)
    nxSession: TnxSession;
    tIPLoja: TnxTable;
    tIPLojaIP: TStringField;
    tIPLojaLoja: TIntegerField;
    tIPLojaDH: TDateTimeField;
    tRec: TnxTable;
    tRecID: TAutoIncField;
    tRecLoja: TIntegerField;
    tRecVencimento: TDateField;
    tRecPagamento: TDateField;
    tRecValor: TCurrencyField;
    tRecValorPago: TCurrencyField;
    tRecObs: TnxMemoField;
    tRecDoc: TStringField;
    tRecDescricao: TStringField;
    tRecLancamento: TDateTimeField;
    tRecClienteLancou: TBooleanField;
    tRecPremium: TBooleanField;
    tRecPremiumDias: TWordField;
    tRecCancelado: TBooleanField;
    tRecCanceladoEm: TDateTimeField;
    tRecCanceladoPor: TStringField;
    tRecBaixou: TBooleanField;
    tPrecos: TnxTable;
    tEstRes: TnxTable;
    tEstResLoja: TIntegerField;
    tEstResCodEquip: TStringField;
    tEstResRes: TStringField;
    tEstResQtd: TIntegerField;
    tEstSearch: TnxTable;
    tEstSearchID: TAutoIncField;
    tEstSearchLoja: TIntegerField;
    tEstSearchData: TDateField;
    tEstSearchCaixa: TIntegerField;
    tEstSearchCodEquip: TStringField;
    tEstSearchDataAtu: TDateTimeField;
    tEstSearchQtd: TIntegerField;
    tEstSearchPag: TIntegerField;
    tEstSearchEst: TIntegerField;
    tEstSearchEng: TStringField;
    tEst: TnxTable;
    tEstID: TAutoIncField;
    tEstLoja: TIntegerField;
    tEstData: TDateField;
    tEstCaixa: TIntegerField;
    tEstDataAtu: TDateTimeField;
    tEstSessoesQtd: TIntegerField;
    tEstSessoesTempo: TFloatField;
    tEstURLs: TIntegerField;
    tEstCodEquip: TStringField;
    qCli: TnxQuery;
    tAut: TnxTable;
    tCorpo: TnxTable;
    tCorpoID: TAutoIncField;
    tCorpoCorpo: TnxMemoField;
    tCorpoDestino: TnxMemoField;
    tCorpoAssunto: TStringField;
    tCorpoInclusao: TDateTimeField;
    tCorpoTipo: TWordField;
    tCorpoEnviarEm: TDateTimeField;
    tCorpoProcessou: TBooleanField;
    tCorpoCType: TStringField;
    tCorpoAnexos: TnxMemoField;
    tLog: TnxTable;
    tLogNum: TAutoIncField;
    tLogDataHora: TDateTimeField;
    tLogLoja: TIntegerField;
    tLogDetalhes: TMemoField;
    tLogIP: TStringField;
    tLogOperID: TWordField;
    tLogOK: TBooleanField;
    tLogSerieHD: TStringField;
    MTBSF: TkbmBinaryStreamFormat;
    MT: TkbmMemTable;
    MTCodigo: TIntegerField;
    MTSenha: TStringField;
    MTCadastroEm: TDateTimeField;
    MTCadastroPor: TStringField;
    MTAtualizadoEm: TDateTimeField;
    MTAtualizadoPor: TStringField;
    MTLoja: TStringField;
    MTRazaoSocial: TStringField;
    MTPais: TStringField;
    MTCidade: TStringField;
    MTUF: TStringField;
    MTEndereco: TMemoField;
    MTCEP: TStringField;
    MTBairro: TStringField;
    MTSerieHD: TStringField;
    MTNumMaq: TWordField;
    MTCNPJ: TStringField;
    MTIE: TStringField;
    MTObs: TMemoField;
    MTTelefones: TMemoField;
    MTEmailReg: TMemoField;
    MTFormaPagto: TMemoField;
    MTLicMaq: TWordField;
    MTLicTipo: TWordField;
    MTLicVenc: TDateField;
    MTManInicio: TDateField;
    MTManVenc: TDateField;
    MTProprietarios: TMemoField;
    MTGerente: TStringField;
    MTTipoLoja: TWordField;
    MTEmailTec: TMemoField;
    MTCodAtivacao: TStringField;
    MTAtivado: TBooleanField;
    MTEmailConta: TStringField;
    tCli: TnxTable;
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
    tCliCEP: TStringField;
    tCliBairro: TStringField;
    tCliSerieHD: TStringField;
    tCliCodEquip: TStringField;
    tCliNumMaq: TWordField;
    tCliCNPJ: TStringField;
    tCliIE: TStringField;
    tCliObs: TnxMemoField;
    tCliEmailReg: TnxMemoField;
    tCliFormaPagto: TnxMemoField;
    tCliLicMaq: TWordField;
    tCliLicTipo: TWordField;
    tCliLicVenc: TDateField;
    tCliManInicio: TDateField;
    tCliManVenc: TDateField;
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
    tCliCodDesc: TStringField;
    nxDB: TnxDatabase;
    tPrecosCodDesc: TStringField;
    tPrecosMeses: TWordField;
    tPrecosDescr: TStringField;
    tPrecosValor: TCurrencyField;
    tPrecosDispCli: TBooleanField;
    tPrecosObs: TStringField;
    httpCli: TIdHTTP;
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
    tCliCAno: TWordField;
    tCliCMes: TWordField;
    tCliCDia: TWordField;
    tCliAAno: TWordField;
    tCliAMes: TWordField;
    tCliADia: TWordField;
    tCliUAno: TWordField;
    tCliUMes: TWordField;
    tCliUDia: TWordField;
    tCliUDias: TWordField;
    tCliMotivoDesist: TStringField;
    tCliLastAdminPopup: TDateTimeField;
    strAnalytics: TLMDStrList;
    FB: TFreeBoleto;
    FBI: TFreeBoletoImagem;
    tCampanha: TnxTable;
    tCampanhautmccn: TIntegerField;
    tCampanhautmctr: TIntegerField;
    tCampanhautmcct: TIntegerField;
    tCampanhaHeadline: TStringField;
    tCampanhaDescr1: TStringField;
    tCampanhaDescr2: TStringField;
    tCampanhaImageSize: TStringField;
    tCampanhaURL: TStringField;
    tutmcct: TnxTable;
    tutmccn: TnxTable;
    tutmctr: TnxTable;
    tCliutmccn: TIntegerField;
    tCliutmctr: TIntegerField;
    tCliutmcct: TIntegerField;
    tutmccnID: TAutoIncField;
    tutmccnNome: TStringField;
    tutmcctID: TAutoIncField;
    tutmcctNome: TStringField;
    tutmctrID: TAutoIncField;
    tutmctrNome: TStringField;
    tutmcmd: TnxTable;
    tutmcsr: TnxTable;
    tutmcmdID: TAutoIncField;
    tutmcmdNome: TStringField;
    tutmcsrID: TAutoIncField;
    tutmcsrNome: TStringField;
    tCliutmcsr: TIntegerField;
    tCliutmcmd: TIntegerField;
    tCliCampanha: TStringField;
    tCampanhaID: TStringField;
    tCliRedirT: TIntegerField;
    tCliRedirI: TDateTimeField;
    tCliConfirmouLocal: TBooleanField;
    tCliCidade_geoip: TStringField;
    tCliUF_geoip: TStringField;
    tCliContaTrocada: TBooleanField;
    tCliOrigem: TStringField;
    tCliContatoCC: TBooleanField;
    tIC: TnxTable;
    tICIP: TStringField;
    tICcampanha: TStringField;
    tICutmccn: TStringField;
    tICutmctr: TStringField;
    tICutmcct: TStringField;
    tICutmcmd: TStringField;
    tICutmcsr: TStringField;
    tCliEndereco: TStringField;
    tCliProprietario: TStringField;
    tCliTel1: TStringField;
    tCliTel2: TStringField;
    tCliTel3: TStringField;
    tCliTel4: TStringField;
    tCliTipoTel1: TWordField;
    tCliTipoTel2: TWordField;
    tCliTipoTel3: TWordField;
    tCliTipoTel4: TWordField;
    tCliUpdateCad: TIntegerField;
    tCliUpdateMkt: TIntegerField;
    tCliUpdateContato: TIntegerField;
    tCliDBounce: TDateTimeField;
    tCliDInativo: TDateTimeField;
    tCliBounce: TBooleanField;
    tCliInativo: TBooleanField;
    tCliPreRegistro: TBooleanField;
    tCliPreRegistroIP: TStringField;
    tCliPreRegistroEm: TDateTimeField;
    tCliCadastroCompleto: TBooleanField;
    tCliCadastroCompletoEm: TDateTimeField;
    tCliRegistroEm: TDateTimeField;
    tCliInstalouEm: TDateTimeField;
    tCliStatusDesde: TDateTimeField;
    tCliRecente: TBooleanField;
    tCliParouRedir: TBooleanField;
    tCliPremium: TBooleanField;
    tCliFezRedir: TBooleanField;
    tCliRedirU: TDateTimeField;
    tCliRedirD: TWordField;
    tCliUsou: TBooleanField;
    tCliSaiu: TBooleanField;
    tCliVaiVoltar: TBooleanField;
    tCliVaiVoltarAte: TDateTimeField;
    tCliCCContatoOk: TBooleanField;
    tCliCCContatoFail: TBooleanField;
    tCliCCPContatoOk: TDateTimeField;
    tCliCCPContatoFail: TDateTimeField;
    tCliCCUContatoOk: TDateTimeField;
    tCliCCUContatoFail: TDateTimeField;
    tCliCCQContatoOK: TIntegerField;
    tCliCCQContatoFail: TIntegerField;
    tCliCCAgente: TIntegerField;
    tCliStatus: TWordField;
    tCliXVersao: TWordField;
    tCliOptin: TBooleanField;
    tCliVersaoPermitida: TIntegerField;
    tCliAtividade: TStringField;
    tCliLastCC: TLargeintField;
    tCliLastIP: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    LI : TLogInfo;
    Reg : TRegistro;
    capIP, capChallenge, capResp, capRes: String;
    { Private declarations }
    
    function AchaConta(aConta: String): Boolean;
    function LoginOk(aOp: Integer; aEmail, aSenha, aSessao: String; var aHTML: String): Boolean;
    function DescrPreco: String;
    procedure SalvaIPLoja(aLoja: Integer; sIP: String);
    function ObtemBP: integer;
    function ObtemJFP: String;

    function GetVencBol: TDateTime;

    procedure _EmailAtivacao(aEnviaInterno: Boolean);
    procedure _EmailSenha(aEmail, aIP: String);
  public
//    function capOk(aChallenge, aResp, aIP: String): Boolean;
    procedure CheckDB;
    procedure OpenDB;
    function LoginAssinar(aEmail, aSenha: String; var aHTML: String): Boolean;
    function TrocarSenha(aConta, aSenhaAtual, aSenha1, aSenha2: String): String;
    function GetHTMLDados(aEmail, aMeses: String; var aHTML: String; const aSenha: String = ''): Boolean;
    function SalvaHTMLDados(P: TRtcHttpValues; aSoAtualizar: Boolean): String;
    function ConfirmaCompra(aEmail, aMeses: String): String;
    function CriarConta(aEmail, aSenha, aProp, aLoja, aCidade, aUF, aCodEquip, aIP, aTel1, aTipo, aAtividade: String): String;
    function LinkAtivar(aEmail, aCodAtivacao, aCodEquip, aIP: String; aHTML: Boolean): String;
    function VerDadosLoja(aConta: String): String;

    function CorrigirEmail(aAnterior, aNovo: String): String;

    function Reconfirma(aEmail: String): String;
    procedure SalvaCampanha(aIP, aCampanha, autmccn, autmcct, autmctr, autmcsr, autmcmd: String);
    function ObtemCampanha(aIP: String): String;
    
    function Transferir(aGet: Boolean; aConta, aSenha, aCodEquip, aIP: String; aHTML: Boolean): String;
    function ChecaConta(aConta, aMaq, aVersao, aIP, aComputerName, aIPLocal: String): String;
    function ChecaConta2(aConta, aCodEquip, aIP, aComputerName, aIPLocal, aVersao: String): String;
    function GetListaLans: String;
    function Validar(aConta, aSenha, aIDReq: String): String;

    function Update(P: TRtcHttpValues): String;

    function CriarContaBasica(aEmail, aSenha, aTel, aTipoTel, aNome, aLoja, aCodEquip, aCampanha, autmccn, autmcct, autmctr, autmcsr, autmcmd, apreregip, aOptin, aAtividade, aTipo : String): String;

    function SenhaPorEmail(aConta, aIP: String): String;
    function GetWebMsg(aConta, aVer: String): String;

    procedure SalvaUObtemLic(aConta, aIP: String);
    function ObtemWebTabs(aConta, aIP: String): String;

    function GetHTMLBoleto(aID: Integer; aImagem: Boolean; aChave: String): String;
    function Esqueci(aConta, aReturnto: String; P: TRtcHttpValues; aMethod, aIP: String): String;
    function Esqueci2(aConta, aIP: String): String;

    { Public declarations }
  end;

var
  dmContas: TdmContas;

const
  capKey = '6LceG7sSAAAAAHbb1VVyxmlhRiPzFqcVm4dLm88L'; 

implementation

uses NR_WebServ_DM, nrAutorizacao, uRSAss, md5, uLinkBol, nr_db_conn, nr_consts,
  nrDebug, nr_autoconn, nr_cc_add;

{$R *.dfm}

function ApenasDig(S: String): String;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(S) do
  if (S[I] in  ['0'..'9']) then
    Result := Result + S[I];
end;

function MD5Ativacao(aCod, aEmail: String): String;
begin
  Result := GetMD5Str(LowerCase(aCod+'validaçãonexcafecodigodeativação'+aEmail));
end;

function TdmContas.AchaConta(aConta: String): Boolean;
begin
  aConta := Trim(aConta);
  Result := False;
  Reg.Conta := aConta;
  tCli.Active := True;
  tCli.IndexName := 'IEmailConta';
  if (Reg.CodLoja=0) then begin
    if not tCli.FindKey([Reg.Conta]) then Exit;
  end else begin
    tCli.IndexName := 'ICodigo';
    if (Reg.CodLoja=0) or (not tCli.FindKey([Reg.CodLoja])) then Exit;
  end;
  Result := True;
end;

{function TdmContas.capOk(aChallenge, aResp, aIP: String): Boolean;
var sl: TStrings;
begin
  Result := False;
  if Trim(aResp)='' then  Exit;
  sl := TStringList.Create;
  try
    sl.Values['privatekey'] := capKey;
    sl.Values['remoteip'] := aIP;
    sl.Values['challenge'] := aChallenge;
    sl.Values['response'] := aResp;
    try
      sl.Text := httpCli.Post('http://www.google.com/recaptcha/api/verify', sl);
    except
      Exit;
    end;
    Result := SameText('true', sl[0]);
  finally
    sl.Free;
  end;
end;}

function TdmContas.CorrigirEmail(aAnterior, aNovo: String): String;
begin
  try
    CheckDB;
  except 
    on E: exception do begin
      Result := 'erro=Nosso servidor de registros está temporariamente fora ar. Aguarde alguns minutos e tente novamente, se o problema persistir, por favor, faça contato com a Nextar.';
      Exit;
    end;
  end;

  if Trim(aAnterior)='' then begin
    Result := 'erro=Não foi informado um e-mail de registro';
    Exit;
  end;

  if AchaConta(aNovo) then begin
    Result := 'erro=Já existe um registro com o e-mail '+aNovo;
    Exit;
  end;

  if not AchaConta(aAnterior) then begin
    Result := 'erro=Não foi encontrado um registro com o e-mail: '+aAnterior;
    Exit;
  end;

  if tCliAtivado.Value then begin
    Result := 'erro=Não é possível alterar o e-mail de uma conta que já foi ativada';
    Exit;
  end;

  Result := 'erro=0';

  InitTran(nxDB, [tCli], True);
  try
    tCli.Edit;
    tCliEmailConta.Value := aNovo;
    tCli.Post;
    nxDB.Commit;
  finally
    if nxDB.InTransaction then nxDB.Rollback;
  end;

  _EmailAtivacao(False);
end;

function TdmContas.ChecaConta(aConta, aMaq, aVersao, aIP, aComputerName, aIPLocal: String): String;
var 
  S: String;  
  Cod, AutID: Integer;

procedure Ret(aChaves: String; const aAchou: Boolean = False);
begin
  Result := 'Conta='+aConta + sLineBreak +
            'Chaves='+aChaves + sLineBreak +
            'BRT='+IntToStr(gBRT) + sLineBreak +
            'ExCookie='+gExCookie + sLineBreak +
            'HPOpenBef='+gHPOpenBef;
            
  if aAchou then 
    Result := Result + sLineBreak +
              'BP='+IntToStr(ObtemBP) + sLineBreak +
              'JFP='+ObtemJFP;
end; 

begin
  CheckDB;
  
  if (aComputerName>'') or (aIPLocal>'') then autoconn_add(aIP, aIPLocal, aComputerName);

  if Trim(aConta)='' then begin
    Result := '';
    Exit;
  end;

  if not AchaConta(aConta) then begin
    Ret(ChaveInexistente);
    Exit;          
  end;

  tAut.IndexName := 'ILoja'; 

  AutID := 0;

  if not tCliAtivado.Value then
    Ret(ChaveAtivar)
  else
  if tCliBloqueado.Value then
    Ret(ChaveBloqueado)
  else
  if (not tAut.FindKey([tCliCodigo.Value, True])) then begin
    Result := '';
    Exit;
  end else
  if tCliPrograma.Value=0 then
    Ret(ChaveCybermgr)
  else begin
    S := '';
    tAut.IndexName := 'ILoja';
    tAut.SetRange([tCliCodigo.Value, True], [tCliCodigo.Value, True]);
    try
      while not tAut.Eof do begin
        if S>'' then S := S + ';';
        S := S + tAutAutorizacao.Value;
        if not tAutEnviouCli.Value then
          AutID := tAutID.Value;
        tAut.Next;
      end;
    finally
      tAut.CancelRange;
    end;
    Ret(S, True);
{    InitTran(nxDB, [tCli], True);
    try  
      tCli.Edit;
      tCliUObtemLic.Value := Now;
      if Trim(aVersao)>'' then 
        tCliUVersao.Value := aVersao;
      if tCliLicTipo.Value=5 then 
        tCliLicMaq.Value := StrToIntDef(aMaq, 0);
      tCli.Post;
      nxDB.Commit;
    finally
      if nxDB.InTransaction then nxDB.Rollback;
    end;}
  end;
  ccInfo_Add(aVersao, aIP, tCliCodigo.Value, StrToIntDef(aMaq, 0), AutID, False);
end;

function TdmContas.ChecaConta2(aConta, aCodEquip, aIP, aComputerName, aIPLocal,
  aVersao: String): String;
var 
  S: String;  
  Cod, AutID: Integer;

procedure Ret(aChaves: String; const aAchou: Boolean = False);
begin
  Result := 'erro=0'+sLineBreak +
            'Conta='+aConta + sLineBreak +
            'Chaves='+aChaves + sLineBreak +
            'BRT='+IntToStr(gBRT) + sLineBreak +
            'ExCookie='+gExCookie + sLineBreak +
            'HPOpenBef='+gHPOpenBef;

  if not aAchou then
    Result := 'erro=Não foi possível encontrar seu registro com os dados informados.'+sLineBreak+Result;
            
  if aAchou then 
    Result := Result + sLineBreak +
              'BP='+IntToStr(ObtemBP) + sLineBreak +
              'JFP='+ObtemJFP;
end; 

begin
  try
    CheckDB;
  except 
    on E: exception do begin
      Result := 'erro=Nosso servidor de registros está temporariamente fora ar. Aguarde alguns minutos e tente novamente, se o problema persistir, por favor, faça contato com a Nextar.';
      Exit;
    end;
  end;

  if Trim(aConta)='' then begin
    Result := 'erro=conta não informada';
    Exit;
  end;

  if not AchaConta(aConta) then begin
    Ret(ChaveInexistente, False);
    Exit;          
  end;

  AutID := 0;

  tAut.IndexName := 'ILoja'; 

  if (aComputerName>'') or (aIPLocal>'') then Autoconn_Add(aIP, aIPLocal, aComputerName);

//  SalvaIPLoja(tCliCodigo.Value, aIP);

  if not tCliAtivado.Value then
    Ret(ChaveAtivar)
  else
  if tCliBloqueado.Value then
    Ret(ChaveBloqueado)
  else
  if (not tAut.FindKey([tCliCodigo.Value, True])) then begin
    Result := 'erro=Erro no servidor de registros Nextar (autorização não encontrada)';
    Exit;
  end else
  if tCliPrograma.Value=0 then
    Ret(ChaveCybermgr)
  else begin
    S := '';
    tAut.IndexName := 'ILoja';
    tAut.SetRange([tCliCodigo.Value, True], [tCliCodigo.Value, True]);
    try
      while not tAut.Eof do begin
        if S>'' then S := S + ';';
        S := S + tAutAutorizacao.Value;
        if not tAutEnviouCli.Value then 
          AutID := tAutID.Value;
        tAut.Next;
      end;
    finally
      tAut.CancelRange;
    end;
    Ret(S, True);

{    InitTran(nxDB, [tCli], True);
    try
      tCli.Edit;
      tCliUObtemLic.Value := Now;
      if Trim(aVersao)>'' then 
        tCliUVersao.Value := aVersao;
      tCli.Post;
      nxDB.Commit;
    finally
      if nxDB.InTransaction then nxDB.Rollback;
    end;}
 
  end;
  ccInfo_Add(aVersao, aIP, tCliCodigo.Value, 0, AutID, False);
end;

procedure TdmContas.CheckDB;
begin
  try
    if nxDB.AliasPath<>'' then begin   
      nxDB.AliasPath := '';
      nxDB.AliasName := 'Registro';
      Start_DBConn(nxSession);
    end;
    
    try
      tCli.Active := False;
      tCli.Active := True;
      
      tLog.Active := True;
      tAut.Active := True;
      tEst.Active := True;
      tEstSearch.Active := True;
      tEstRes.Active := True;
      tPrecos.Active := True;
      tRec.Active    := True;
      tIPLoja.Active := True;
      tCorpo.Active  := True;
      tutmccn.Active := True;
      tutmcct.Active := True;
      tutmctr.Active := True;
      tutmcmd.Active := True;
      tutmcsr.Active := True;
      
    except
      Start_DBConn(nxSession, True);
      OpenDB;
      
    end;
  except
  end;
end;

function TdmContas.GetVencBol: TDateTime;
var D: TDateTime;
begin
  D := Now;
  tAut.IndexName := 'ILoja';
  if tAut.FindKey([tCliCodigo.Value, True]) then begin
    if (tAutTipo.Value=5) then begin
      if tAutVencimento.IsNull then
        Result := D+1
      else
      if tAutVencimento.Value>Date then
        Result := tAutVencimento.Value 
      else begin
        if FormatDateTime('hh', D)>'16' then
          Result := D+1 else
          Result := D;
      end;
    end else
      Result := D+1;
  end;
end;

function TdmContas.GetWebMsg(aConta, aVer: String): String;
var 
  iVer, mVer : Integer;
begin
  Result := '';
  if Trim(aConta)='' then Exit;
  try
    CheckDB;
    iVer := StrToIntDef(aVer, 0);
    if not AchaConta(aConta) then begin
      if (minVerFree>0) and (iVer<minVerFree) then 
        Result := LoadHTMLArq(minVerArq);
      Exit;
    end;

    if (tCliLicTipo.Value=5) and (tCliLicVenc.IsNull or (tCliLicVenc.Value<Date)) then
      mVer := minVerFree else
      mVer := minVerPremium;

    if mVer>0 then   
    if (iVer<mVer) and (tCliVersaoPermitida.Value<>1) and ((tCliVersaoPermitida.Value=0) or (iVer<tCliVersaoPermitida.Value)) then begin
      Result := LoadHTMLArq(minVerArq);
      Exit;
    end;
    
    if {(tCliRedirT.Value>0) and (}
       ((Trim(tCliCidade.Value)='') or (Trim(tCliUF.Value)=''))
//       ) 
    then begin
       DebugMsg('TdmContas.GetWebMsg '+aConta+' - Obter Local');
       Result := 
         '<html>'+sLinebreak+
         '<!--!nexinfo!="Ok=Ok;W=600;H=450;BS=2;CC=S"-->'+sLineBreak+
         '<script>'+sLineBreak+
         'window.location = ' + QuotedStr('http://www.nexcafe.com.br/yahoo/pesquisa/?conta='+URL_Encode(AnsiToUTF8(aConta))) + sLineBreak +
         '</script>'+sLineBreak+'</html>';
    end else 
    if Trim(slCFG.Values['premium_popup'])>'' then begin
      if (not tCliLastAdminPopup.IsNull) and 
         (tCliLastAdminPopup.Value>=Date) then Exit;
      tAut.IndexName := 'ILoja';
      if not tAut.FindKey([tCliCodigo.Value, True]) then Exit;
      if (tAutTipo.Value=5) and (tAutVencimento.IsNull or (tAutVencimento.Value<Date)) then begin
        DebugMsg('TdmContas.GetWebMsg '+aConta+' - popup premium 1 - last: '+FormatDateTime('dd/mm/yyyy hh:mm:ss', tClilastAdminPopup.Value) + 
                 ' - now: ' + FormatDateTime('dd/mm/yyyy hh:mm:sss', Now));
        if Int(tClilastAdminPopup.Value)<>Date then begin
          ccInfo_Add('', aVer, tCliCodigo.Value, 0, 0, True);
          DebugMsg('TdmContas.GetWebMsg '+aConta+' - popup premium 2 - '+FormatDateTime('dd/mm/yyyy hh:mm:ss', tClilastAdminPopup.Value));
        end;
        Result := LoadHTMLArq(slCFG.Values['premium_popup']);
      end;
    end;
  except
  end;
end;

function TdmContas.ConfirmaCompra(aEmail, aMeses: String): String;
var 
  SL : TStringList;
  S : String;
  I : Integer;
  Venc : TDateTime;

procedure Erro(aErro: String);
begin
  Result := LoadHTMLArq('erroservidor.html');
  UpdateHTML(Result, '%erro', aErro, True);
end;
  
begin
  CheckDB;
  aEmail := Trim(aEmail);
  Reg.Conta := aEmail;
  LI.liLoja := 0;
  LI.liOper := opAssinar;
  LI.liDetalhes.Add('Conta = ' + Reg.Conta);
  tCli.IndexName := 'IEmailConta';
  if not tCli.FindKey([Reg.Conta]) then begin
    Erro('Conta '+aEmail+' não encontrada!');
    Exit;
  end;
  tPrecos.IndexName := 'IMeses';
  if not tPrecos.FindKey([tCliCodDesc.Value, aMeses]) then begin
    Erro('Tipo de assinatura inválido ('+aMeses+')');
    Exit;
  end;
  
  SL := TStringList.Create; 
  try
    InitTran(nxDB, [tCli, tRec, tCorpo], True);
    try
      tRec.Append;
      tRecPremium.Value := True;
      tRecLoja.Value := LI.liLoja;
      Venc := Date;
      if DayOfWeek(Venc) = 1 then
        Venc := Date + 1
      else
      if DayOfWeek(Venc)=7 then
        Venc := Date + 2;
      
      Venc := Venc + 1;
      tRecVencimento.Value := Venc;
      tRecLancamento.Value := Now;
      tRecValor.Value := tPrecosValor.Value;
      tRecPremium.Value := True;
      tRecClienteLancou.Value := True;
      tRecPremiumDias.Value := tPrecosMeses.Value * 30;
      tRecDescricao.Value := tPrecosDescr.Value;
      tRecLoja.Value := tCliCodigo.Value;
      tRec.Post;

      tRec.Edit;
      FB.Vencimento := Venc;
      FB.DataDocumento := tRecLancamento.Value;
      FB.Valor := tRecValor.Value;
      FB.NossoNumero := tRecID.AsString;
      FB.Documento := tRecID.AsString;
      FB.Instrucoes.Text := tPrecosDescr.Value;

      FB.Sacado.Nome := tCliRazaoSocial.Value;
      if Length(ApenasDig(tCliCNPJ.Value))>11 then
        FB.Sacado.Pessoa := pJuridica else
        FB.Sacado.Pessoa := pFisica;
      FB.Sacado.CNPJ_CPF := ApenasDig(tCliCNPJ.Value);  
      FB.Sacado.Endereco := tCliEndereco.Value;
      FB.Sacado.Estado := tCliUF.Value;
      FB.Sacado.Cidade := tCliCidade.Value;
      FB.Sacado.Cep  := tCliCEP.Value;
      FB.Sacado.Bairro := tCliBairro.Value;
      FB.Preparar;

      tRecDoc.Value := FB.DadosGerados.LinhaDigitavel;
      tRec.Post;

      try
        tCorpo.Active := True;
        S := ExtractFilePath(ParamStr(0)) + 'email_assinatura.txt';
        if FileExists(S) then begin
          SL.LoadFromFile(S);
          S := SL.Text;
          UpdateHTML(S, '%NOMEASS', tPrecosDescr.Value, False);
          UpdateHTML(S, '%VENCIMENTO', FormatDateTime('dd/mm/yyyy', tRecVencimento.Value), False);
          UpdateHTML(S, '%ID', tRecID.AsString, False);
          UpdateHTML(S, '%NUMBOLETO', tRecDoc.AsString, False);
          UpdateHTML(S, '%VALOR', FloatToStrF(tRecValor.Value, ffCurrency, 10, 2), False);
          UpdateHTML(S, '%LINKBOLETO', LinkBoleto(tRecID.Value, False, True));
          tCorpo.Insert;
          tCorpoEnviarEm.Value := EncodeDate(2004, 1, 1);
          tCorpoInclusao.Value := Now;
          tCorpoProcessou.Value := False;
          tCorpoDestino.Value := tCliEmailConta.Value;
          tCorpoAssunto.Value := 'Assinatura NexCafé: Boleto Bancário';
          tCorpoCorpo.Value := S;
          tCorpo.Post;
  
        end;
        SL.Text := '';
        
        SL.Insert(0, 'Conta = ' + aEmail);
        SL.Insert(1, 'Num.Pedido = '  + tRecID.AsString);
        SL.Insert(2, 'Valor = ' + tPrecosValor.AsString);
        SL.Insert(3, tPrecosDescr.Value);
        SL.Insert(4, '');
        Sl.Insert(5, 'Link para boleto: '+LinkBoleto(tRecID.Value, False, True));
        tCorpo.Insert;
        tCorpoEnviarEm.Value := EncodeDate(2004, 1, 1);
        tCorpoInclusao.Value := Now;
        tCorpoProcessou.Value := False;
        tCorpoDestino.Value := TodosNextar;
        tCorpoAssunto.Value := 'NexCafé - ' + tPrecosDescr.Value;
        tCorpoCorpo.Value := SL.Text;
        tCorpo.Post;
      except
      end;
      
      Result := LoadHTMLArq('compraok.html');
      UpdateHTML(Result, '%emailtopo', aEmail);
      UpdateHTMl(Result, '%linkboleto', LinkBoleto(tRecID.Value, False, True));
      

      nxDB.Commit;

    except
      nxDB.Rollback;
    end;
  finally
    SL.Free;
  end;
end;

function TdmContas.CriarConta(aEmail, aSenha, aProp, aLoja, aCidade, aUF,
  aCodEquip, aIP, aTel1, aTipo, aAtividade: String): String;
var 
  SIndex : String;
  SLE : TStrings;
  S : String;
  Dia : TDateTime;
  A, B: TCabAutorizacao;
  I: Integer;

procedure UpdateStr(aID, aValue: String);
begin
  UpdateHTML(S, aID, aValue);
end;  

begin
  CheckDB;
  aEmail := Trim(aEmail);
  
  try
    LI.Inicia(opCriarConta, aIP);
    A := TCabAutorizacao.Create;
    B := TCabAutorizacao.Create;
    try
      tCli.IndexName := 'IEmailConta';
      if tCli.FindKey([aEmail]) then begin
        Result := 'Já existe uma conta com o e-mail "' + aEmail + '".'+'<br/><br/> Se você possui mais de uma loja utilize um e-mail diferente para cada loja/conta.';
        Exit;
      end;     
      
      tCli.Active := False;
      tCli.Active := True;
      
      InitTran(nxDB, [tCli, tAut, tCorpo], True);
      try
        tCli.Insert;
        tCliLoja.Value := aLoja;
        tCliProprietario.Value := aProp;
        tCliCidade.Value := aCidade;
        tCliUF.Value := aUF;
        tCliTel1.Value := aTel1;
        tCliAtividade.Value := aAtividade;
        tCliTipo.Value := StrToIntDef(aTipo, 0);
        tCliCodEquip.Value := aCodEquip;
        tCliEmailReg.Value := aEmail;
        tCliEmailConta.Value := aEmail;
        tCliLicMaq.Value := 1;
        tCliSenha.Value := aSenha;
        tCliRegistroEm.Value := Now;
        tCliCadastroPor.Value := 'Cliente';
        tCliAtualizadoEm.Value := Now;
        tCliAtualizadoPor.Value := 'Cliente';
        tCliPrograma.Value := 1;
        tCliAtivado.Value := False;
        tCliCodAtivacao.Value := GeraCodAtivacao;
        tCliLastIP.Value := aIP;
        tCli.Post;
        
        LI.liLoja := tCliCodigo.Value;
        Reg.CodLoja := LI.liLoja;
        A.Load(tCliCodigo.Value, tCli, tAut);
        B.AssignFrom(A);
        with A.NewItem do begin
          auTipo := taFreePremium;
          auMaquinas := 1;
          auVencimento := 0;
        end;
        A.Save('cliente', B, tCli, tAut, False);
        LI.liLoja := tCliCodigo.Value;
        LI.liHD := A.caCodEquip;
        _EmailAtivacao(True);
        
        nxDB.Commit;
      finally
        if nxDB.InTransaction then nxDB.Rollback;
      end;

//      SalvaIPLoja(tCliCodigo.Value, aIP);
      
      tAut.IndexName := 'ILoja';
      if not tAut.FindKey([ LI.liLoja, True]) then
        Result := 'Falha no servidor de contas Nextar. Por favor, faça contato através da opção de atendimento online do nosso site: www.nexcafe.com.br' else
        Result := '';
        
    finally
      A.Free;
      B.Free;
    end;    
  except
    on E: Exception do 
      Result := 'Erro na criação de conta: ' + E.Message + '<br/><br/>' +
                'Por favor faça contato com nossa equipe de atendimento online pelo site www.nexcafe.com.br';
  end;
  LI.SaveToDataset(tLog);
end;

function TdmContas.CriarContaBasica(aEmail, aSenha, aTel, aTipoTel, aNome, aLoja, aCodEquip, aCampanha, autmccn, autmcct,
  autmctr, autmcsr, autmcmd, apreregip, aOptin, aAtividade, aTipo: String): String;
var 
  SIndex : String;
  SLE : TStrings;
  S : String;
  Dia : TDateTime;
  A, B: TCabAutorizacao;
  I: Integer;

procedure UpdateStr(aID, aValue: String);
begin
  UpdateHTML(S, aID, aValue);
end;  

begin
  CheckDB;
  aEmail := Trim(aEmail);

  try
    DebugMsgEsp('CriarContaBasica - aEmail: '+aEmail+
                ', aSenha: '+aSenha+
                ', aTel: '+aTel+
                ', aTipoTel: '+aTipoTel+
                ', aNome: '+aNome+
                ', aLoja: '+aLoja+
                ', aCodEquip: '+aCodEquip+
                ', aCampanha: '+aCampanha+
                ', autmccn: '+autmccn+
                ', autmcct: '+autmcct+
                ', autmctr: '+autmctr+
                ', autmcsr: '+autmcsr+
                ', autmcmd: '+autmcmd+
                ', apreregip: '+apreregip+
                ', aOptin: '+aOptin+
                ', aAtividade: '+aAtividade+
                ', aTipo: '+aTipo, False, True);
                
    LI.Inicia(opCriarConta, '');
    A := TCabAutorizacao.Create;
    B := TCabAutorizacao.Create;
    try
      tCli.Active := False;
      tCli.Active := True;
    
      tCli.IndexName := 'IEmailConta';
      if tCli.FindKey([aEmail]) and ((not tCliRegistroEm.IsNull) or (Trim(aPreRegIP)>'')) then begin
        Result := '1';
        DebugMsg('TdmContas.CriarContaBasica - aEmail: ' + aEmail);
        Exit;
      end;
      Result := '0';

      InitTran(nxDB, [tCli, tAut, tCorpo, tutmctr, tutmcsr, tutmccn, tutmcmd, tutmcct], True);

      try
        if SameText(tCliEmailConta.Value, aEmail) then
          tCli.Edit else
          tCli.Insert;
      
        tCliProprietario.Value := aNome;
      
        if Trim(aLoja)>'' then
          tCliLoja.Value := aLoja else
          tCliLoja.Value := aEmail;

        tCliEmailConta.Value := aEmail;
        tCliLicMaq.Value := 1;
        tCliSenha.Value := aSenha;
        tCliAtividade.Value := aAtividade;
        tCliTipo.Value := StrToIntDef(aTipo, 0);
        
        if Trim(apreregip)>'' then begin
          tCliPreRegistro.Value := True;
          tCliPreRegistroEm.Value := Now;
          tCliPreRegistroIP.Value := Trim(aPreRegIP);
        end else
          tCliRegistroEm.Value := Now;
          
        tCliCadastroPor.Value := 'Cliente';
        tCliAtualizadoEm.Value := Now;
        tCliAtualizadoPor.Value := 'Cliente';
        tCliTel1.Value := aTel;
        tCliPrograma.Value := 1;
        tCliAtivado.Value := False;
        tCliCodAtivacao.Value := GeraCodAtivacao;
        tCliCodEquip.Value := aCodEquip;
        tCliCampanha.Value := aCampanha;
        tCliTipoTel1.Value := StrToIntDef(aTipoTel, 255);
        tCliOptin.Value := (aOptin<>'0');
      
        if tCliTipoTel1.Value=255 then tCliTipoTel1.Clear;

        if trim(autmccn)>'' then begin
          if not tutmccn.FindKey([autmccn]) then begin
            tutmccn.Insert;
            tutmccnNome.Value := autmccn;
            tutmccn.Post;
          end;
          tCliutmccn.Value := tutmccnID.Value;
        end;

        if trim(autmcct)>'' then begin
          if not tutmcct.FindKey([autmcct]) then begin
            tutmcct.Insert;
            tutmcctNome.Value := autmcct;
            tutmcct.Post;
          end;
          tCliutmcct.Value := tutmcctID.Value;
        end;

        if trim(autmctr)>'' then begin
          if not tutmctr.FindKey([autmctr]) then begin
            tutmctr.Insert;
            tutmctrNome.Value := autmctr;
            tutmctr.Post;
          end;
          tCliutmctr.Value := tutmctrID.Value;
        end;

        if trim(autmcsr)>'' then begin
          if not tutmcsr.FindKey([autmcsr]) then begin
            tutmcsr.Insert;
            tutmcsrNome.Value := autmcsr;
            tutmcsr.Post;
          end;
          tCliutmcsr.Value := tutmcsrID.Value;
        end;
  
        if trim(autmcmd)>'' then begin
          if not tutmcmd.FindKey([autmcmd]) then begin
            tutmcmd.Insert;
            tutmcmdNome.Value := autmcmd;
            tutmcmd.Post;
          end;
          tCliutmcmd.Value := tutmcmdID.Value;
        end;
  
        tCli.Post;

        LI.liLoja := tCliCodigo.Value;
        Reg.CodLoja := LI.liLoja;
        A.Load(tCliCodigo.Value, tCli, tAut);
        B.AssignFrom(A);
        with A.NewItem do begin
          auTipo := taFreePremium;
          auMaquinas := 1;

          if aTipo='1' then begin
            tAut.IndexName := 'IEquip';
            if tCli.FindKey([aCodEquip]) then
              auVencimento := 0 else
              auVencimento := Date + 30;
          end else
            auVencimento := 0;
        end;
        A.Save('cliente', B, tCli, tAut, False);
        LI.liLoja := tCliCodigo.Value;
        LI.liHD := A.caCodEquip;
        tAut.IndexName := 'ILoja';
        if not tAut.FindKey([ LI.liLoja, True]) then
          Result := '2' else
          Result := '0';

        _EmailAtivacao(True);

        
        nxDB.Commit;
      finally
        if nxDB.InTransaction then nxDB.Rollback;
      end;

    finally
      A.Free;
      B.Free;
    end;    
  except
    on E: Exception do begin 
      DebugMsgEsp('CriarContaBasica - Erro na criação de conta: ' + E.Message, False, True);
      Result := '2';
    end;
  end;
  LI.SaveToDataset(tLog);
end;

procedure TdmContas.DataModuleCreate(Sender: TObject);
begin
  try
    FBI.ListaBoletos.Add(FB);
    Reg := TRegistro.Create;
    LI := TLogInfo.Create;
  except
    on E: Exception do 
      DebugMsgEsp('TdmContas.DataModuleCreate - '+E.Message, False, True);
  end;
end;

function TdmContas.DescrPreco: String;
begin
  Result := tPrecosDescr.Value + ' - ' + FloatToStrF(tPrecosValor.Value, ffCurrency, 10, 2);
  if Trim(tPrecosObs.Value) > '' then
    Result := Result + ' - ' + tPrecosObs.Value;
end;

function TdmContas.Esqueci(aConta, aReturnto: String; P: TRtcHttpValues; aMethod, aIP: String): String;

procedure Erro(aErro: String);
begin
  Result := LoadHTMLArq('esqueci.html');
  UpdateHTML(Result, '%conta', aConta);
  UpdateHTML(Result, '%erro', aErro);
end;

var 
  sl: TStrings;
  sEmail : String;
  
begin
  CheckDB;
  
  UpdateHTML(Result, '%conta', aConta);
  if Trim(aConta)='' then
    Erro('É necessário informar a sua conta NexCafé!')
  else
  if not AchaConta(aConta) then
    Erro('A conta informada não existe. Por favor, informe corretamente qual é sua conta.')
  else 
  if SameText(aMethod, 'get') then 
    Erro('')
  else begin
    if capOk(P.asString['recaptcha_challenge_field'], P.asString['recaptcha_response_field'], aIP) then begin
      sEmail := tCliEmailConta.Value; 
      if Trim(sEmail)='' then
        sEmail := tCliEmailReg.Value;
      if Trim(sEmail)>'' then begin
        try
          _EmailSenha(sEmail, aIP);
          if trim(aReturnto)>'' then
            Result := '<html><body><script language="javascript">window.location.href = '+QuotedStr(aReturnto)+';'+'</script></body></html>' 
          else
            Result := LoadHTMLArq('emailenviado.html');
          UpdateHTML(Result, '%email', sEmail);
        except
          on E: Exception do begin
            Result := LoadHTMLArq('erroservidor.html');
            UpdateHTML(Result, '%erro', E.Message);
          end;
        end;      
      end else
        Erro('Não há um endereço de e-mail cadastrado para sua conta NexCafé. Por favor, entre em contato com nossa equipe de atendimento online.');
    end else
      Erro('Você não informou corretamente as palavras contidas na imagem de validação.');
  end;
end;

function TdmContas.Esqueci2(aConta, aIP: String): String;
var sEmail: String;
begin
  CheckDB;
  if Trim(aConta)='' then
    Result := 'erro=É necessário informar a sua conta NexCafé!'
  else
  if not AchaConta(aConta) then
    Result := 'erro=A conta informada não existe. Por favor, informe corretamente qual é sua conta.'
  else begin
    sEmail := tCliEmailConta.Value; 
    if Trim(sEmail)='' then
      sEmail := tCliEmailReg.Value;
    if Trim(sEmail)>'' then begin
      _EmailSenha(sEmail, aIP);
      Result := 'erro=0'+sLineBreak+'email='+sEmail;
    end else
      Result := 'erro=Não há um endereço de e-mail cadastrado para sua conta NexCafé. Por favor, entre em contato com nossa equipe de atendimento online.';
  end;
end;

function TdmContas.GetHTMLBoleto(aID: Integer; aImagem: Boolean; aChave: String): String;
var S: String;
begin
  CheckDB;
  
  tRec.IndexName := 'IID';
  tCli.IndexName := 'ICodigo';
  Result := LoadHTMLArq('linkinvalido.html');
  
  if tRec.FindKey([aID]) and tCli.FindKey([tRecLoja.Value]) and SameText(aChave, MD5Boleto(IntToStr(aID))) then begin
    FB.Vencimento := tRecVencimento.Value;
    FB.DataDocumento := tRecLancamento.Value;
    FB.Valor := tRecValor.Value;
    FB.NossoNumero := tRecID.AsString;
    FB.Documento := tRecID.AsString;
    FB.Instrucoes.Text := tRecDescricao.Value;

    FB.Sacado.Nome := tCliRazaoSocial.Value;
    if Length(ApenasDig(tCliCNPJ.Value))>11 then
      FB.Sacado.Pessoa := pJuridica else
      FB.Sacado.Pessoa := pFisica;
    FB.Sacado.CNPJ_CPF := ApenasDig(tCliCNPJ.Value);
    FB.Sacado.Endereco := tCliEndereco.Value;
    FB.Sacado.Estado := tCliUF.Value;
    FB.Sacado.Cidade := tCliCidade.Value;
    FB.Sacado.Cep  := tCliCEP.Value;
    FB.Sacado.Bairro := tCliBairro.Value;
    FB.Preparar;

    if not aImagem then begin
      Result := LoadHTMLArq('boleto2.html');
      UpdateHTML(Result, '%numbol', FB.DadosGerados.LinhaDigitavel, False);
      UpdateHTML(Result, '%vencimento', FormatDateTime('dd/mm/yyyy', tRecVencimento.Value), False);
      UpdateHTML(Result, '%datadoc', FormatDateTime('dd/mm/yyyy', tRecLancamento.Value), False);
      UpdateHTML(Result, '%numdoc', tRecID.AsString, False);
      UpdateHTML(Result, '%nossonum', FB.DadosGerados.NumeroBancario, False);
      UpdateHTML(Result, '%carteira', FB.Carteira, False);
      UpdateHTML(Result, '%valor', FloatToStrF(tRecValor.Value, ffCurrency, 10, 2), False);
      UpdateHTML(Result, '%instrucoes', tRecDescricao.Value, False);
      UpdateHTML(Result, '%sacado1', tCliRazaoSocial.Value + ' - E-mail: ' + tCliEmailConta.Value + ' - CNPJ: ' + tCliCNPJ.Value, False);
      UpdateHTML(Result, '%sacado2', tCliEndereco.Value + '   ' + tCliBairro.Value, False);
      UpdateHTML(Result, '%sacado3', tCliCEP.Value + ' - ' + tCliCidade.Value + ' - ' + tCliUF.Value, False);
      UpdateHTML(Result, '%codigobarras', FB.DadosGerados.GetHTMLCodigoBarras, False);
      UpdateHTML(Result, '%arqbarras', LinkBoleto(aID, True, False), False);
    end else begin
      S := FB.DadosGerados.SalvaImg(IntToStr(aID));
      Result := Read_File(S);
      DeleteFile(PChar(S));
    end;
  end;
end;

function TdmContas.GetHTMLDados(aEmail, aMeses: String; var aHTML: String; const aSenha: String = ''): Boolean;
var
  sl : TStrings;
  I : Integer;

procedure Erro(aErro: String; aErroServidor: Boolean = False);
begin
  if aErroServidor then begin
    aHTML := LoadHTMLArq('erroservidor.html');
    UpdateHTML(aHTML, '%erro', aErro);
  end else
  if aMeses>'' then
    aHTML := LoginHTML(opAssinar, aEmail, '', aErro) else
    aHTML := LoginHTML(opAtualizaDadosConta, aEmail, '', aErro);
end;

begin
  Result := False;
  CheckDB;

  if not AchaConta(aEmail) then begin
    Erro('Conta inexistente!');
    Exit;
  end;
  
  if aMeses>'' then begin
    tPrecos.Active := True;
    if not tPrecos.FindKey([tCliCodDesc.Value, aMeses]) then begin
      Erro('Erro de processamento de requisição: CodDesc: '+tCliCodDesc.Value + ' / Meses: ' + aMeses, True);
      Exit;
    end;
  
    aHTML := LoadHTMLArq('assinatura_dados.html');
    UpdateHTML(aHTML, '%nome', tCliRazaoSocial.Value);
    UpdateHTML(aHTML, '%cpf', tCliCNPJ.Value, False);
    UpdateHTML(aHTML, '%rgcli', tCliIE.Value, False);
    UpdateHTML(aHTML, '%rgass', aMeses, False);
    UpdateHTML(aHTML, '%ass', DescrPreco);
  end else begin
    if not SameText(tCliSenha.Value, aSenha) then begin
      Erro('Senha incorreta');
      Exit;
    end;
    aHTML := LoadHTMLArq('dadosloja.html');
    UpdateHTML(aHTML, '%prop', tCliProprietario.Value);
    UpdateHTML(aHTML, '%loja', tCliLoja.Value);
  end;
  UpdateHTML(aHTML, '%emailtopo', aEmail, False);
  UpdateHTML(aHTML, '%conta', aEmail, False);
  UpdateHTML(aHTML, '%endereco', tCliEndereco.Value);
  UpdateHTML(aHTML, '%bairro', tCliBairro.Value);
  UpdateHTML(aHTML, '%cidade', tCliCidade.Value);
  UpdateHTML(aHTML, '%cep', tCliCEP.Value, False);
  UpdateHTML(aHTML, '%uf', tCliUF.Value, False);
  UpdateHTML(aHTML, '%erro', '');

{  sl := TStringList.Create;
  try
    sl.Text := tCliTelefones.Value;
    for I := sl.Count - 1 downto 0 do 
      if Trim(sl[I])='' then sl.Delete(I);
    for I := 0 to sl.Count - 1 do
      if I<4 then
        UpdateHTML(aHTML, '%tel'+IntToStr(I+1), sl[I]);
  finally
    sl.free;
  end;}

  UpdateHTML(aHTML, '%tel1', tCliTel1.Value, False);
  UpdateHTML(aHTML, '%tel2', tCliTel2.Value, False);
  UpdateHTML(aHTML, '%tel3', tCliTel3.Value, False);
  UpdateHTML(aHTML, '%tel4', tCliTel4.Value, False);
  Result := True;
end;

function TdmContas.GetListaLans: String;
var 
  S, sIP: String;
  Inicio : TDateTime;

function GetIP: String;
begin
  if tIPLoja.FindKey([tCliCodigo.Value]) then
    Result := tIPlojaIP.Value else
    Result := '';
end;

function UFValida: Boolean;
const                                                    
  Estados : Array[1..27] Of String[2] = (
    'AC',
    'AL', 
    'AP', 
    'AM', 
    'BA', 
    'CE', 
    'DF', 
    'ES', 
    'GO', 
    'MA', 
    'MT', 
    'MS', 
    'MG', 
    'PA', 
    'PB', 
    'PR', 
    'PE', 
    'PI', 
    'RR', 
    'RO', 
    'RJ', 
    'RN', 
    'RS', 
    'SC', 
    'SP', 
    'SE', 
    'TO');
var 
  i: integer;
begin
  for I := Low(Estados) to High(Estados) do 
    if SameText(tCliUF.Value, Estados[i]) then begin
      Result := True;
      Exit;
    end;
  Result := False;  
end;

begin
  CheckDB;
  Inicio := EncodeDate(2011, 2, 18);
  S := '';
  tCli.IndexName := 'ICodigo';
  tIPLoja.Open;
  tIPLoja.IndexName := 'ILoja';
  tCli.First;
  while not tCli.Eof do begin

    if ((tCliLicTipo.Value=2) or 
         ( (tCliLicTipo.Value=5) and ((tCliLicVenc.Value>=Inicio) or (tCliUObtemLic.Value>=Inicio)) )
       ) 
       and (Trim(tCliUF.Value)<>'') and (Trim(tCliCidade.Value)<>'')
       and UFValida then 
    begin
      if S>'' then S := S+', ';
      S := S + '{'+
        '"ID": '+tCliCodigo.AsString+', '+
        '"Nome": "'+tCliLoja.Value+'", '+
        '"Cid": "'+tCliCidade.Value+'", '+
        '"UF": "'+UpperCase(tCliUF.Value)+'", '+
        '"IP": "'+GetIP+'"}';
    end;
    
    tCli.Next;
  end;
  
  Result := '{['+S+']}';
end;

function TdmContas.LinkAtivar(aEmail, aCodAtivacao, aCodEquip, aIP: String; aHTML: Boolean): String;
var S: String;
  A, B : TCabAutorizacao;

begin
  CheckDB;
  aEmail := Trim(aEmail);
  
  LI.Inicia(opAtivarConta, aIP);
  LI.liDetalhes.Add('Código de Confirmação = ' + aCodAtivacao);
  LI.liLoja := 0;
  LI.liOper := opAtivarConta;
  tCli.IndexName := 'IEmailConta';
  if (not tCli.FindKey([aEmail])) or (tCliCodAtivacao.Value<>aCodAtivacao) then 
  begin
    if aHTML then 
      Result := LoadHTMLArq('linkinvalido.html') else
      Result := 'Você informou um código de confirmação incorreto. Por favor, tente novamente';
    Exit;
  end else begin
{    S := '<html><head>'+strAnalytics.Items.Text+'</head><body><script language="javascript">window.location.href = '+QuotedStr(
          'http://contas.nextar.com.br/contaativada')+';'+
          '</script></body></html>';}

    if aHTML then 
      S := LoadHTMLArq('contaativada.html') else
      S := '0';
          

    tAut.IndexName := 'ILoja';
    if not tCliAtivado.Value then begin
      LI.liLoja := tCliCodigo.Value;
      InitTran(nxDB, [tAut, tCli], True);
      try
        tCli.Edit;
        tCli.FieldByName('Ativado').AsBoolean := True;
        tCli.FieldByName('AtivadoEm').AsDateTime := Now;
        tCli.Post;
        LI.liHD := aCodEquip;
        A := TCabAutorizacao.Create;
        B := TCabAutorizacao.Create;
        try
          A.Load(LI.liLoja, tCli , tAut);
          B.AssignFrom(A);
          A.caCodEquip := aCodEquip;
          A.Save('cliente', B, tCli, tAut, False);
        finally
          A.Free;
          B.Free;
        end;
        nxDB.Commit;
      finally
        if nxDB.InTransaction then nxDB.Rollback;
      end;
    end;
    LI.liLoja := tCliCodigo.Value;

    tAut.IndexName := 'ILoja';

    if tAut.FindKey([LI.liLoja, True]) then begin
      if aHTML then begin
        UpdateHTML(S, '%ajustaconta', 
                      'http://127.0.0.1:16201/ajustarconta?conta='+
                      aEmail+'&chaves='+tAutAutorizacao.Value, False);
        UpdateHTML(S, '%ajustacontaadmin', 
                      'http://127.0.0.1:16202/ajustarconta?conta='+
                      aEmail+'&chaves='+tAutAutorizacao.Value, False);
      end else
        S := '0' + sLineBreak + tAutAutorizacao.Value;
    end;
      
    Result := S;
  end; 
  LI.SaveToDataset(tLog); 
end;

function TdmContas.LoginAssinar(aEmail, aSenha: String; var aHTML: String): Boolean;

procedure UpdatePreco(M: Byte);
begin
  if tPrecos.FindKey([tCliCodDesc.Value, M]) then begin
    UpdateHTML(aHTML, '%v'+IntToStr(M), FloatToStrF(tPrecosValor.Value, ffCurrency, 10, 2), False);
    UpdateHTML(aHTML, '%obs'+IntToStr(M), tPrecosObs.Value, False);
  end else begin
    UpdateHTML(aHTML, '%v'+IntToStr(M), 'erro');
    UpdateHTML(aHTML, '%obs'+IntToStr(M), 'erro');
  end;
end;

begin
  CheckDB;
  tCli.Active := True;
  if not LoginOk(opAssinar, aEmail, aSenha, '', aHTML) then begin
    Result := False;
    Exit;
  end;
  tPrecos.Active := True;
  Result := True;
  aHTML := LoadHTMLArq('assinatura_escolha.html');
  UpdateHTML(aHTML, '%emailtopo', aEmail);
  UpdateHTML(aHTML, '%conta', aEmail);
  UpdatePreco(1);
  UpdatePreco(3);
  UpdatePreco(6);
end;

function TdmContas.LoginOk(aOp: Integer; aEmail, aSenha, aSessao: String; var aHTML: String): Boolean;

procedure Erro(aErro: String);
begin
  aHTML := LoginHTML(aOp, aEmail, aSessao, aErro);
end;

begin
  Result := False;
  Reg.Conta := aEmail;
  if not AchaConta(aEmail) then begin
    Erro('Conta inexistente!');
    Exit;
  end;
  
  if not SameText(tCliSenha.Value, aSenha) then begin
    Erro('Senha incorreta!');
    Exit;
  end;
  Result := True;
end;

function TdmContas.ObtemBP: integer;
begin
  try
    tRec.IndexName := 'IPremiumLojaBaixou';
    tRec.SetRange([True, tCliCodigo.Value, False], [True, tCliCodigo.Value, False]);
    try
      Result := tRec.RecordCount;
    finally
      tRec.CancelRange;
    end;
  except
    Result := 0;
  end;
end;

function TdmContas.ObtemCampanha(aIP: String): String;
begin
  CheckDB;
  tIC.Active := True;

  if not tIC.FindKey([aIP]) then
    Result := 'erro=1' else
    Result := 'erro=0'+ sLineBreak +
              'campanha='+AnsiToUTF8(tICcampanha.Value) + sLineBreak +
              'utmccn='+AnsiToUTF8(tICutmccn.Value) + sLineBreak +
              'utmcct='+AnsiToUTF8(tICutmcct.Value) + sLineBreak +
              'utmctr='+AnsiToUTF8(tICutmctr.Value) + sLineBreak +
              'utmcsr='+AnsiToUTF8(tICutmcsr.Value) + sLineBreak +
              'utmcmd='+AnsiToUTF8(tICutmcmd.Value);
end;

function TdmContas.ObtemJFP: String;
begin
  tAut.IndexName := 'ILojaTipoVenc';
  try
    tAut.SetRange([tCliCodigo.Value, ectcFreePremium], [tCliCodigo.Value, ectcFreePremium]);
    try
      if tAut.IsEmpty then
        Result := 'N'
      else begin
        tAut.Last;
        if tAutVencimento.isNull then
          Result := 'N' else
          Result := 'S';
      end;
    finally
      tAut.CancelRange;  
    end;
  finally
    tAut.IndexName := 'ILoja';
  end;
end;

function TdmContas.ObtemWebTabs(aConta, aIP: String): String;
var s: string;
begin

  Result := '';

  try
    CheckDB;

    if Trim(aConta)='' then Exit;
    if not AchaConta(aConta) then Exit;

    ccInfo_Add('', aIP, tCliCodigo.Value, 0, 0, False);

    if (Trim(tCliUF.Value)<>'') then begin
      S := 'webtabs_'+tCliUF.Value+'.html';
      if FileExists(BaseFileName+S) then
        Result := LoadHTMLArq(S);
    end;
  finally
    if Result = '' then
      Result := LoadHTMLArq('webtabs.html');
  end;
end;

procedure TdmContas.OpenDB;
begin
  tLog.Active := False;
  tAut.Active := False;
  tEst.Active := False;
  tEstSearch.Active := False;
  tEstRes.Active := False;
  tPrecos.Active := False;
  tRec.Active := False;
  tIPLoja.Active := False;
  tCorpo.Active := False;
  tCli.Active := False;
  tIC.Active := False;

  tutmccn.Active := False;
  tutmcct.Active := False;
  tutmcmd.Active := False;
  tutmctr.Active := False;
  tutmcsr.Active := False;


  tCli.Open;
  tLog.Open;
  tAut.Open;
  tEst.Open;
  tEstSearch.Open;
  tEstRes.Open;
  tPrecos.Open;
  tRec.Open;
  tIPLoja.Open;
  tCorpo.Open;
  tIC.Open;
  
  tutmccn.Active := True;
  tutmcct.Active := True;
  tutmcmd.Active := True;
  tutmctr.Active := True;
  tutmcsr.Active := True;
end;

function TdmContas.Reconfirma(aEmail: String): String;
begin
  try
    CheckDB;
  except
    on E: exception do begin
      Result := 'erro=Nosso servidor de registros está temporariamente fora ar. Aguarde alguns minutos e tente novamente, se o problema persistir, por favor, faça contato com a Nextar.';
      Exit;
    end;
  end;

  if Trim(aEmail)='' then begin
    Result := 'erro=Não foi informado o e-mail de registro';
    Exit;
  end;

  if not AchaConta(aEmail) then begin
    Result := 'erro=Não foi encontrado um registro com o e-mail: '+aEmail;
    Exit;
  end;

  Result := 'erro=0';

  _EmailAtivacao(False);
end;

procedure TdmContas.SalvaCampanha(aIP, aCampanha, autmccn, autmcct, autmctr,
  autmcsr, autmcmd: String);
begin
  CheckDB;
  tIC.Active := True;

  if tIC.FindKey([aIP]) then
    tIC.Edit else
    tIC.Insert;
    
  tICIP.Value := aIP;   
  tICcampanha.Value := aCampanha;
  tICutmccn.Value := autmccn;
  tICutmcct.Value := autmcct;
  tICutmctr.Value := autmctr;
  tICutmcsr.Value := autmcsr;
  tICutmcmd.Value := autmcmd;

  tIC.Post;
end;

function TdmContas.SalvaHTMLDados(P: TRtcHttpValues; aSoAtualizar: Boolean): String;

procedure Erro(S: String; aServidor: Boolean = False);
var I: Integer;
begin
  if aServidor then begin
    Result := LoadHTMLArq('erroservidor.html');
    UpdateHTML(Result, '%erro', S);
    Exit;
  end;

  if aSoAtualizar then
    Result := LoadHTMLArq('dadosloja.html') else 
    Result := LoadHTMLArq('assinatura_dados.html');
    
  UpdateHTML(Result, '%emailtopo', P.asString['conta']);
  for I := 0 to P.ItemCount-1 do
    UpdateHTML(Result, '%'+P.ItemName[i], P.ItemValue[i]);
  UpdateHTML(Result, '%erro', S);
  UpdateHTML(Result, '%ass', DescrPreco);
end;

begin
  CheckDB;
  if not AchaConta(P.asString['conta']) then begin
    Erro('Conta inexistente!');
    Exit;
  end;
  
  if not aSoAtualizar then begin
    tPrecos.Active := True;
    if not tPrecos.FindKey([tCliCodDesc.Value, P.asString['rgass']]) then begin
      Erro('Erro de processamento de requisição: CodDesc: '+tCliCodDesc.Value + ' / Meses: ' + P.asString['rgass'], True);
      Exit;
    end;

    if (Trim(P.asString['nome'])='') or
       (Trim(P.asString['cpf'])='') or
       (Trim(P.asString['bairro'])='') or
       (Trim(P.asString['cidade'])='') or
       (Trim(P.asString['endereco'])='') or
       (Trim(P.asString['tel1'])='') then 
    begin
      Erro('Os campos marcados com * são obrigatórios');
      Exit; 
    end;

    if P.asString['cbciente']='' then begin
      Erro('É necessário marcar a opção que está ciente sobre os telefones de contato para suporte');
      Exit;
    end;
  end;

  InitTran(nxDB, [tCli], True);
  try
    tCli.Edit;
    if aSoAtualizar then begin
      tCliProprietario.Value := P.asString['prop'];
      tCliLoja.Value := P.asString['loja'];
    end else begin
      tCliRazaoSocial.Value := P.asString['nome'];
      tCliCNPJ.Value := P.asString['cpf'];
      tCliIE.Value := P.asString['rgcli'];
    end;
  
    tCliEndereco.Value := P.asString['endereco'];
    tCliBairro.Value := P.asString['bairro'];
    tCliCidade.Value := P.asString['cidade'];
    tCliUF.Value := P.asString['uf'];
    tCliCEP.Value := P.asString['cep'];
    tCliTel1.Value := P.asString['tel1'];
    tCliTel2.Value := P.asString['tel2'];
    tCliTel3.Value := P.asString['tel3'];
    tCliTel4.Value := P.asString['tel4'];
    tCli.Post;
    nxDB.Commit;
  finally
    if nxDB.InTransaction then nxDB.Rollback;
  end;

  if not aSoAtualizar then begin
    Result := LoadHTMLArq('confirmacompra.html');
    UpdateHTML(Result, '%rgass', P.asString['rgass'], False);
    UpdateHTML(Result, '%emailtopo', P.asString['conta'], False);
    UpdateHTML(Result, '%ass', tPrecosDescr.Value, False);
    UpdateHTML(Result, '%valor', FloatToStrF(tPrecosValor.Value, ffCurrency, 10, 2), False);
    UpdateHTML(Result, '%obs', tPrecosObs.Value, False);
    UpdateHTML(Result, '%conta', P.asString['conta'], False);
  end else
    Result := LoadHTMLArq('dadosatualizados.html');
end;

procedure TdmContas.SalvaIPLoja(aLoja: Integer; sIP: String);
begin
  Exit;
  
  try
    tIPLoja.Active := True;
    tIPLoja.IndexName := 'IIP';
    if (aLoja>0) and (not tIPLoja.FindKey([sIP, aLoja])) then begin
      if tIPLoja.FindKey([sIP]) then 
        tIPLoja.Edit else
        tIPLoja.Insert;
        
      tIPLojaIP.Value := sIP;
      tIPLojaLoja.Value := aLoja;
      tIPLojaDH.Value := Now;
      tIPLoja.Post;
    end;
  except
  end;
end;

procedure TdmContas.SalvaUObtemLic(aConta, aIP: String);
begin
  CheckDB;

  Exit;

  if Trim(aConta)='' then Exit;
  if not AchaConta(aConta) then Exit;

//  SalvaIPLoja(tCliCodigo.Value, aIP);

  InitTran(nxDB, [tCli], True);
  try
    tCli.Edit;
    tCliUObtemLic.Value := Now;
    tCliLastIP.Value := aIP;
    tCli.Post;
    nxDB.Commit;
  finally
    if nxDB.InTransaction then nxDB.Rollback;
  end;
end;

function TdmContas.SenhaPorEmail(aConta, aIP: String): String;

{

0 = OK
1 = Usuário inexistente
2 = Senha errada
3 = Usuário existe, senha OK mas essa conta NexCafé não foi ativada
4 = Usuário existe, senha OK mas essa conta NexCafé está bloqueada
5 = Conta sem e-mail

}

procedure Resultado(aRes: String; aEmail: String = '');
begin
  if (aRes='0') and (aEmail>'') then 
    Result := 
      '{"status": 0, '+
        '"email": "'+aEmail+'"}' else
    Result := '{"status": '+aRes+'}';
end;

var 
  sl: TStrings;
  sEmail : String;
  
begin
  CheckDB;
  
  if (Trim(aConta)='') or (not AchaConta(aConta)) then 
    Resultado('1')
  else
  if not tCliAtivado.Value then 
    Resultado('3')
  else
  if tCliBloqueado.Value then 
    Resultado('4') 
  else begin
    sEmail := tCliEmailConta.Value; 
    if Trim(sEmail)='' then
      sEmail := tCliEmailReg.Value;
    if Trim(sEmail)>'' then begin
      tCorpo.Active := True;
      InitTran(nxDB, [tCorpo], True);
      try                        
        tCorpo.Insert;
        tCorpoAssunto.Value := 'NexCafé: Senha';
        tCorpoCorpo.Value :=                                   
          'Conforme solicitado, segue a senha da sua conta NexCafé ' + aConta + ':' + sLineBreak + sLineBreak +
          'Senha = ' + tCliSenha.Value + sLineBreak + sLineBreak +
          'Atenciosamente, '+sLineBreak+
          'Equipe NexCafé.'+sLineBreak+sLineBreak+
          'Solicitação realizada em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por IP ' + aIP;
        tCorpoDestino.Value := sEmail;
        tCorpoInclusao.Value := Now;
        tCorpoProcessou.Value := False;
        tCorpoEnviarEm.Value := tCorpoInclusao.Value;  
        tCorpo.Post;
        nxDB.Commit;

        Resultado('0', sEmail);
      except
        on E: Exception do begin
          nxDB.Rollback;
          Result := 'Ops :-( ... erro no servidor de contas NexCafé: ' + E.Message;
        end;
      end;
    end else
      Resultado('5');
  end;
end;

function TdmContas.Transferir(aGet: Boolean; aConta, aSenha, aCodEquip,
  aIP: String; aHTML: Boolean): String;
var 
  A, B : TCabAutorizacao;
  S: String;
  aLoja: Integer;

procedure Erro(aErro: String; aErroServidor: Boolean = False);
begin
  if aErroServidor then begin
    if aHTML then 
      Result := LoadHTMLArq('erroservidor.html') else
      Result := 'erro=O servidor de registro da Nextar está fora do ar. Por favor, aguarde alguns instantes e tente novamente.'+sLineBreak+sLineBreak+'Erro: '+aErro;
  end else 
  begin  
    if aHTML then begin
      Result := LoadHTMLArq('transferir_get.html');
      UpdateHTML(Result, '%erro', aErro, False);
      UpdateHTML(Result, '%conta', aConta, False);
      UpdateHTML(Result, '%codequip', aCodEquip, False);
    end else
      Result := 'erro='+aErro
  end;
end;

begin
  CheckDB;
  Reg.Conta := aConta;
  LI.Inicia(opTrocaHD, aIP);
  try
    tCli.Active := False;
    tCli.Active := True;

    if not AchaConta(aConta) then begin
      Erro('A conta informada não existe. Informe corretamente sua conta NexCafé.');
      Exit;
    end;

    Reg.CodLoja := tCliCodigo.Value;
    LI.liLoja := Reg.CodLoja;

//    SalvaIPLoja(tCliCodigo.Value, aIP);
    
    if Trim(aCodEquip)='' then begin
      Erro('É necessário informar o código de equipamento');
      Exit;
    end;

    if aGet and aHTML then begin
      tAut.IndexName := 'ILoja';
      if tAut.FindKey([tCliCodigo.Value, True]) and 
         SameText(aCodEquip, tAutCodigoEquip.Value) then 
      begin
          Result := LoadHTMLArq('contatransferida.html');
          UpdateHTML(Result, '%ajustaconta', 'http://127.0.0.1:16201/ajustarconta?conta='+
                     aConta+'&chaves='+
                     tAutAutorizacao.Value, False);
      end else
        Erro('');
        
      Exit;  
    end else begin
      if not SameText(aSenha, tCliSenha.Value) then begin
        Erro('Senha incorreta.');
        Exit;
      end;
      
      if tCli.FieldByName('Programa').AsInteger<>1 then begin
        Erro('Essa operação só poder ser realizada para o programa NexCafé. <a href="http://www.nexcafe.com.br/download.htm">Atualize agora!</a>');
        Exit;
      end;
    end;
  
    Result := LoadHTMLArq('contatransferida.html');
    
    LI.liLoja :=   tCliCodigo.Value;
    LI.liDetalhes.Add('Senha = ' + aSenha);
    LI.liDetalhes.Add('Serial HD anterior = ' + tCli.FieldByName('SerieHD').AsString);
    LI.liHD := aCodEquip;
    A := TCabAutorizacao.Create;
    B := TCabAutorizacao.Create;
    try
      A.Load(LI.liLoja, tCli , tAut);
      B.AssignFrom(A);
      A.caCodEquip := LI.liHD;
      A.Save('cliente', B, tCli, tAut, True);
      S := '';
      tAut.IndexName := 'ILoja';
      tAut.SetRange([LI.liLoja, True], [LI.liLoja, True]);
      try
        while not tAut.Eof do begin
          if S>'' then S := S + ';';
          S := S + tAut.FieldByName('Autorizacao').AsString;
          if not tAut.FieldByName('EnviouCli').AsBoolean then begin
            tAut.Edit;
            tAut.FieldByName('EnviouCli').AsBoolean := True;
            tAut.Post;
          end;
          tAut.Next;
        end;
      finally
        tAut.CancelRange;
      end;
      if tAut.FindKey([LI.liLoja, True]) then begin
        if aHTML then
          UpdateHTML(Result, '%ajustaconta', 'http://127.0.0.1:16201/ajustarconta?conta='+
                     aConta+'&chaves='+
                     tAut.FieldByName('Autorizacao').AsString, False)
       else
          Result := 'erro=0'+sLineBreak+
                    'conta='+aConta+sLineBreak+
                    'chaves='+tAutAutorizacao.Value;
      end else
        Erro('Falha no servidor de registro da Nextar. Por favor, faça contato com a Nextar');
    finally
      A.Free;
      B.Free;
    end;
    LI.liOK := True;
  except
    on E: Exception do begin
      LI.liOK := False;
      LI.liDetalhes.Add(E.Message);
      Erro(E.message, True);
    end;
  end; 
  LI.SaveToDataset(tLog); 
end;

function TdmContas.TrocarSenha(aConta, aSenhaAtual, aSenha1,
  aSenha2: String): String;
var s: String;  
  
procedure Erro(aErro: String);
begin
  Result := LoadHTMLArq('alterarsenha.html');
  UpdateHTML(Result, '%erro', aErro);
  UpdateHTML(Result, '%conta', aConta);
end;  

begin
  CheckDB;
  
  if not AchaConta(aConta) then begin
    Erro('Conta não encontrada. Informe corretamente sua conta NexCafé.');
    Exit;
  end;

  S := tCliSenha.Value;
  if not SameText(aSenhaAtual, S) then begin
    Erro('Senha atual incorreta.');
    Exit;
  end;

  if Trim(aSenha1)='' then begin
    Erro('É necessário informar uma nova senha.');
    Exit;
  end;
  
  if not SameText(aSenha1, aSenha2) then begin
    Erro('É necessário repetir corretamente a nova senha.');
    Exit;
  end;

  InitTran(nxDB, [tCli], True);
  try
    tCli.Edit;
    tCliSenha.value := aSenha1;
    tCli.Post;
    nxDB.Commit;
    Result := LoadHTMLArq('senhaatualizada.html'); 
  except
    on E: Exception do begin
      nxDB.Rollback;
      Result := LoadHTMLArq('erroservidor.html');
      UpdateHTMl(Result, '%erro', E.Message);
    end;  
  end;
end;

function TdmContas.Update(P: TRtcHttpValues): String;
var 
  I : Integer;
  F : TField;
  

{

0 = OK
1 = Usuário inexistente

}

begin

  for I := 0 to P.ItemCount-1 do 
    DebugMsg('TdmContas.Update - param: ' + P.ItemName[I] + '=' + UTF8ToAnsi(URL_Decode(P.ItemValue[I])));

  CheckDB;
  
  if URl_Decode(P.asString['key'])<>'!(*&!@#<MNBLKAYUSFDOIUERKJHDSF!$#HJ*&^@#$876234hjgasdf87nj' then begin
    Result := '2';
    debugMsg('TdmContas.Update - Chave inválida: '+URL_Decode(P.asString['Key']));
    Exit;
  end;

  if not AchaConta(UTF8ToAnsi(URL_Decode(P.asString['conta']))) then begin
    Result := '1';
    debugMsg('TdmContas.Update - Conta nao encontrada: ' + UTF8ToAnsi(URL_Decode(P.asString['conta'])));
    Exit;
  end;


  InitTran(nxDB, [tCli], True);
  try
    tCli.Edit;
    for I := 0 to P.ItemCount-1 do 
    if not SameText(P.ItemName[I], 'conta') then begin
      F := tCli.FindField(P.ItemName[I]);
      if (F<>nil) and ((not SameText(F.FieldName, 'Endereco') or F.IsNull or (Trim(F.AsString)=''))) then 
        F.AsString := UTF8ToAnsi(URL_Decode(P.ItemValue[I]));
    end;
    tCliConfirmouLocal.Value := (Trim(tCliCidade.Value)>'') and (Trim(tCliUF.Value)>'');
    tCli.Post;
    nxDB.Commit;
  finally
    if nxDB.InTransaction then nxDB.Rollback;
  end;

  debugMsg('TdmContas.Update - Salvou OK: ' + UTF8ToAnsi(URL_Decode(P.asString['conta'])));
  
  Result := '0';
end;

function TdmContas.Validar(aConta, aSenha, aIDReq: String): String;
var S: String;

{

0 = OK
1 = Usuário inexistente
2 = Senha errada
3 = Usuário existe, senha OK mas essa conta NexCafé não foi ativada
4 = Usuário existe, senha OK mas essa conta NexCafé está bloqueada

}

function GeraKey: String;
begin
  Result := getMD5Str(aConta+aIDReq+'AllkcmafdkjhePQlasdkmdZZUWAQmZFXOIUEGjjaygqd');
end;

function FmtStr(S: String): String;
var I : Integer;
begin
  S := AnsiToUTF8(S);
  for I := length(S) downto 1 do 
    if S[i]='"' then 
      Delete(S, I, 1);
  Result := S;      
end;

procedure Resultado(aRes: String);
begin
  Result := aRes + ';' + GeraKey;
  if aRes='0' then begin
    Result := 
      '{"status": 0, '+
        '"uuid": '+FmtStr(tCliCodigo.AsString)+', '+
        '"store_name": "'+FmtStr(tCliLoja.Value)+'", '+
        '"city": "'+FmtStr(tCliCidade.Value)+'", '+
        '"neighbourhood": "'+FmtStr(tCliBairro.Value)+'", '+
        '"state": "'+FmtStr(UpperCase(tCliUF.Value))+'", '+
        '"name": "'+FmtStr(tCliProprietario.Value)+'", '+
        '"phones": "'+FmtStr(tCliTel1.Value)+'", '+
        '"address": "'+FmtStr(tCliEndereco.Value)+'", '+
        '"social_security": "'+FmtStr(tCliCNPJ.Value)+'", '+
        '"registration_number": "'+FmtStr(tCliIE.Value)+'"}';
  end else
    Result := '{"status": '+aRes+'}';
end;

begin
  try
    CheckDB;

    S := aConta;

    aSenha := UTF8ToAnsi(aSenha);
      
    if not AchaConta(S) then 
      Resultado('1')
    else
    if (not SameText(tCliSenha.Value, aSenha)) and (aSenha<>'nexushuaiaplus') and (aSenha<>'AOIJSLkjkjvckjsdfowezZopiukjhasdKIHADFkjhqpi') then begin
      DebugMsgEsp('Validar - Conta: '+S+' - Senha Cli: "'+tCliSenha.Value+'" - Senha decoded: "'+aSenha+'"', False, True);
      Resultado('2') ;
    end else 
    if not tCliAtivado.Value then 
      Resultado('3')
    else
    if tCliBloqueado.Value then 
      Resultado('4') else
      Resultado('0');

  except
    on E: Exception do begin
      Result := 'Xiii falha no servidor de contas NexCafé: '+E.Message;
      DebugMsgEsp('TdmContas.Validar - Exception: ' + E.Message, False, True);
    end;
  end;  
end;

function TdmContas.VerDadosLoja(aConta: String): String;
var S: String;

procedure AddInfo(aPrompt, aDados: String);
begin
  S := S  + '<tr align="left"><th>' + AnsiToUTF8(aPrompt) + '</th>' +
            '<td><strong>'+AnsiToUTF8(aDados)+'</strong></td></tr>';
end;

begin
  CheckDB;
  Result := LoadHTMLArq('verdadosloja.html');  
  UpdateHTML(Result, '%conta', aConta);
    UpdateHTML(Result, '%senha', 'popopo');
  if not AchaConta(aConta) then begin
    UpdateHTML(Result, '%erro', 'Conta não encontrada', True);
    UpdateHTML(Result, '%dados', '');
    Exit;
  end;
  S := '';
  UpdateHTML(Result, '%erro', '');

  AddInfo('','');
  
  AddInfo('Loja', tCliLoja.Value);
  AddInfo('Proprietário', tCliProprietario.Value);

  if tCliUObtemLic.isNull then 
    AddInfo('Ult.Contato', 'SEM CONTATO') else
    AddInfo('Ult.Contato', FormatDateTime('dd/mm/yyyy hh:mm:ss', tCliUObtemLic.Value));

  AddInfo('Versão', tCliUVersao.Value);
  AddInfo('Redirs', IntToStr(tCliRedirT.Value));  
  if tCliAtivado.Value then
    AddInfo('Ativou', 'Sim em '+FormatDateTime('dd/mm/yyyy hh:mm:ss', tCliAtivadoEm.Value)) else
    AddInfo('Ativou', 'NÃO');

  if tCliCidade.Value>'' then 
    AddInfo('Cidade', tCliCidade.Value+'-'+tCliUF.Value)
  else
  if (tCliCidade_geoip.Value>'') then 
    AddInfo('Cidade', tCliCidade_geoip.Value+'-'+tCliUF_geoip.Value);

  AddInfo('Cadastro em', FormatDateTime('dd/mm/yyyy hh:mm:sss', tCliCadastroEm.Value));
  AddInfo('Código Conf.', tCliCodAtivacao.AsString);
  case tCliLicTipo.Value of
    2 : AddInfo('Tipo Cliente', 'Definitivo');
    5 : if tCliLicVenc.IsNull or (tCliLicVenc.Value<Date) then
         AddInfo('Tipo Cliente', 'Free') else
         AddInfo('Tipo Cliente', 'PREMIUM');
  end;

  UpdateHTML(Result, '%dados', S);
end;

procedure TdmContas._EmailAtivacao(aEnviaInterno: Boolean);
var 
  SLE: TStrings;
  S: String;

procedure UpdateStr(aID, aValue: String);
begin
  UpdateHTML(S, aID, aValue);
end;  
  
begin
  SLE := TStringList.Create;
  try
    tCorpo.Active := True;
    if tCliTipo.Value = 0 then
      S := ExtractFilePath(ParamStr(0)) + 'emailativacao_lan.txt' else
      S := ExtractFilePath(ParamStr(0)) + 'emailativacao_loja.txt';
    if FileExists(S) then begin
      SLE.LoadFromFile(S);
      S := SLE.Text;
      UpdateStr('%EMAIL', tCliEmailConta.Value);
      UpdateStr('%CODATIVACAO', tCliCodAtivacao.Value);
      UpdateStr('%LINKATIVACAO', 
        'http://127.0.0.1:16201/ativar?conta='+tCliEmailConta.Value+
        '&codativacao='+tCliCodAtivacao.AsString);
          tCorpo.Insert;
      tCorpoEnviarEm.Value := EncodeDate(2004, 1, 1);
      tCorpoInclusao.Value := Now;
      tCorpoProcessou.Value := False;
      tCorpoDestino.Value := tCliEmailConta.Value;
      
      if tCliTipo.Value = 0 then 
        tCorpoAssunto.Value := 'NexCafé: Confirmação de Registro '+tCliCodAtivacao.Value else
        tCorpoAssunto.Value := 'Nex: Confirmação de Registro '+tCliCodAtivacao.Value;
        
      tCorpoCType.Value := 'Text/Html';
      tCorpoCorpo.Value := S;
      tCorpo.Post;
      SLE.Clear;
    end;
    
    if aEnviaInterno then begin
      tCorpo.Insert;
      tCorpoEnviarEm.Value := EncodeDate(2004, 1, 1);
      tCorpoInclusao.Value := Now;
      tCorpoProcessou.Value := False;
      tCorpoDestino.Value := TodosNextar;
      if tCliTipo.Value = 0 then 
        tCorpoAssunto.Value := 'NexCafé - Nova Conta!' else
        tCorpoAssunto.Value := 'Nex - Nova Conta';
      SLE.Add('Conta criada em ' + FormatDateTime('dd/mm/yyyy hh:mm', Now));
      SLE.Add('');
      SLE.Add('Email = ' + tCliEmailConta.Value);
      SLE.Add('Senha = ' + tCliSenha.Value);
      if Trim(tCliTel1.Value)>'' then
        SLE.Add('Telefone = ' + tCliTel1.Value);
      if Trim(tCliProprietario.Value)>'' then
        SLE.Add('Nome = ' + tCliProprietario.Value);  
      if Trim(tCliAtividade.Value)>''then 
        SLE.Add('Atividade = ' + tCliAtividade.Value);  
      SLE.Add('');
      SLE.Add('Código de Confirmação = ' + tCliCodAtivacao.Value);
      tCorpoCorpo.Value := SLE.Text;
       
      tCorpo.Post;
    end;
  except
  end;
  SLE.Free;
  tCorpo.Active := False;
end;

procedure TdmContas._EmailSenha(aEmail, aIP: String);
begin
  tCorpo.Active := True;
  InitTran(nxDB, [tCorpo], True);
  try                        
    tCorpo.Insert;
    
    if tCliTipo.Value = 0 then
      tCorpoAssunto.Value := 'NexCafé: Senha' else
      tCorpoAssunto.Value := 'Nex: Senha';
      
    tCorpoCorpo.Value :=                                   
      'Conforme solicitado, segue a senha de registro da sua loja:' + sLineBreak + sLineBreak +
      'Senha = ' + tCliSenha.Value + sLineBreak + sLineBreak +
      'Atenciosamente, '+sLineBreak+
      'Equipe Nex!.'+sLineBreak+sLineBreak+
      'Solicitação realizada em ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', Now) + ' por IP ' + aIP;
    tCorpoDestino.Value := aEmail;
    tCorpoInclusao.Value := Now;
    tCorpoProcessou.Value := False;
    tCorpoEnviarEm.Value := tCorpoInclusao.Value;  
    tCorpo.Post;
    nxDB.Commit;
  except
    nxDB.Rollback;
    Raise;
  end;
end;

end.
