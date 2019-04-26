unit ncNetMsg;
{
    ResourceString: Dario 13/03/13
}

interface

uses ncClassesBase, CSCBase, nxstMessages, SysUtils;

const

  nxnmUser               = $1100;
  
  ncnmFirst              = nxnmUser + 5000;
  ncnmLogin              = ncnmFirst + 4;
  ncnmLogout             = ncnmFirst + 5;
  ncnmNovoObj            = ncnmFirst + 6;
  ncnmAlteraObj          = ncnmFirst + 7;
  ncnmApagaObj           = ncnmFirst + 8;
  ncnmObtemLista         = ncnmFirst + 9;
  ncnmLoginMaq           = ncnmFirst + 10;
  ncnmLogoutMaq          = ncnmFirst + 11;
  
{  ncnmObtemPreco         = 12;
  ncnmAjustaPreco        = 13;}
  
  ncnmPreLogoutMaq       = ncnmFirst + 14;
  ncnmCancLogoutMaq      = ncnmFirst + 15;
  ncnmSalvaTelaMaq       = ncnmFirst + 16;
  ncnmCapturaTelaMaq     = ncnmFirst + 17;
  ncnmObtemStreamConfig  = ncnmFirst + 18;
  ncnmPararTempoMaq      = ncnmFirst + 19;
  ncnmTransferirMaq      = ncnmFirst + 20;
  ncnmObtemModoDemo      = ncnmFirst + 21;
  ncnmRefreshPrecos      = ncnmFirst + 22;
  ncnmObtemPrecos        = ncnmFirst + 23;
  ncnmShutdown           = ncnmFirst + 24;
  ncnmBaixaAtualizacao   = ncnmFirst + 25;
  ncnmLiberarAlemPacote  = ncnmFirst + 26;
  ncnmModoManutencao     = ncnmFirst + 27;
  ncnmObtemLicenca       = ncnmFirst + 28;
  ncnmAdicionaPassaporte = ncnmFirst + 30;
  ncnmPaginasImpressas   = ncnmFirst + 31;
  ncnmAvisos             = ncnmFirst + 32;
  ncnmObtemPastaServ     = ncnmFirst + 33;
  ncnmArqFundoEnviado    = ncnmFirst + 34;
  ncnmObtemSenhaCli      = ncnmFirst + 35;
  ncnmSalvaSenhaCli      = ncnmFirst + 36;
  ncnmLimpaFundo         = ncnmFirst + 37;
  ncnmEnviaChat          = ncnmFirst + 38;
  ncnmSalvaCredTempo     = ncnmFirst + 39;
  ncnmAlteraSessao       = ncnmFirst + 40;
  ncnmCancelaTran        = ncnmFirst + 41;
  ncnmSalvaMovEst        = ncnmFirst + 42;
  ncnmSalvaDebito        = ncnmFirst + 43;
  ncnmSalvaImpressao     = ncnmFirst + 44;
  ncnmAbreCaixa          = ncnmFirst + 45;
  ncnmFechaCaixa         = ncnmFirst + 46;
  ncnmObtemProcessos     = ncnmFirst + 47;
  ncnmFinalizaProcesso   = ncnmFirst + 48;
  ncnmSalvaProcessos     = ncnmFirst + 49;
  ncnmObtemSitesBloq     = ncnmFirst + 50;
  ncnmRefreshEspera      = ncnmFirst + 51;
  ncnmPermitirDownload   = ncnmFirst + 52;
  ncnmSalvaLancExtra     = ncnmFirst + 53;
  ncnmSalvaDebTempo      = ncnmFirst + 54;
  ncnmCorrigeDataCaixa   = ncnmFirst + 55;
  ncnmRefreshSessao      = ncnmFirst + 56;
  ncnmSuporteRem         = ncnmFirst + 57;
  ncnmSalvaLic           = ncnmFirst + 58;
  ncnmObtemPatrocinios   = ncnmFirst + 59;
  ncnmAjustaPontosFid    = ncnmFirst + 60;
  ncnmSalvaAppUrlLog     = ncnmFirst + 61;
  ncnmKeepAlive          = ncnmFirst + 62;
  ncnmSalvaTela          = ncnmFirst + 63;
  ncnmDownloadArq        = ncnmFirst + 64;
  ncnmObtemVersaoGuard   = ncnmFirst + 65;
  ncnmUploadArq          = ncnmFirst + 66;
  ncnmDisableAd          = ncnmFirst + 67;
  ncnmSalvaClientPages   = ncnmFirst + 68;
  ncnmJobControl         = ncnmFirst + 69;
  ncnmApagaMsgCli        = ncnmFirst + 70;
  ncnmDesativarFWSessao  = ncnmFirst + 71;
  ncnmDesktopSincronizado= ncnmFirst + 72;
  ncnmMonitorOnOff       = ncnmFirst + 73;
  ncnmGetPrintDoc        = ncnmFirst + 74;
  ncnmPrintDoc           = ncnmFirst + 75;
  ncnmStartPrintTransfer = ncnmFirst + 76;
  ncnmSendPTBlock        = ncnmFirst + 77;
  ncnmPrintDocControl    = ncnmFirst + 78;
  ncnmDownloadArqInterno = ncnmFirst + 79;
  ncnmGetLoginData       = ncnmFirst + 80;
  ncnmSalvaApp           = ncnmFirst + 81;
  
  ncnmMsgComEv           = ncnmFirst + 101;
  ncnmChecaLicEv         = ncnmFirst + 102;
  ncnmHorarioEv          = ncnmFirst + 103;
  ncnmCapturaTelaEv      = ncnmFirst + 104;
  ncnmSalvaTelaEv        = ncnmFirst + 105;
  ncnmFinalizaProcessoEv = ncnmFirst + 106;
  ncnmShutdownEv         = ncnmFirst + 107;
  ncnmSuporteRemEv       = ncnmFirst + 108;
  ncnmObtemProcessosEv   = ncnmFirst + 109;
  ncnmMonitorOnOffEv     = ncnmFirst + 110;


  ncnmFirstEv = ncnmMsgComEv;
  ncnmLastEv = ncnmMonitorOnOffEv;

type
  TnmDownArqInt = packed record
    nmArq : String[50];
    nmVer : Integer;
  end;
  
  TnmMonitorOnOff = packed record
    nmMaq: Word;
    nmOn : Boolean;
  end;
  
  TnmSessao = packed record
    nmSessao : Integer;
  end;

  TnmApagaMsgCli = packed record
    nmMsgID : Integer;
  end;

  PnmHorarioEv = ^TnmHorarioEv;
  TnmHorarioEv = packed record
    nmHora : TDateTime;
  end;

  TnmClientPages = packed record
    nmImp     : String[255];
    nmJobID   : Cardinal;
    nmMaq     : Word;
    nmPaginas : Word;
  end;

  TnmJobControl = packed record
    nmPrinterIndex : Integer;
    nmJob          : Cardinal;
    nmControl      : Byte;
  end;

  TnmAjustaPontosFid = packed record
    nmFunc   : String[20];
    nmCliente: Integer;
    nmFator  : Smallint;
    nmPontos : Double;
    nmObs    : String[200];
  end;
  
  TnmObtemProcessos = packed record
    nmIDCliente : Integer;
    nmIDRequest : Integer;
    nmMaq       : Word;
  end;
  PnmObtemProcessos = ^TnmObtemProcessos;

  TnmSuporteRem = packed record
    nmMaq : Word;
    nmTec : Word;
  end;

  TnmDisableAdReq = packed record
    nmSessao : Integer;
    nmDisable : Boolean;
  end;

  TnmPermitirDownloadReq = packed record
    nmSessao : Integer;
    nmPerm   : Boolean;
    nmExe    : Boolean;
  end;

  TnmDesativarFWSessaoReq = packed record
    nmSessao    : Integer;
    nmDesativar : Boolean;
  end;

  TnmFinalizaProcesso = packed record
    nmProcessID : Integer;
    nmMaq       : Word;
  end;
  PnmFinalizaProcesso = ^TnmFinalizaProcesso;

  PnmNomeArq = ^TnmNomeArq;
  TnmNomeArq = packed record
    nmNomeArq : String[255];
  end;  

  TnmAbreCaixaReq = packed record
    nmFunc: String[20];
    nmSaldo: Currency;
  end;                          

  TnmCorrigeDataCaixaReq = packed record
    nmFunc          : String[20];
    nmCaixa         : Integer;
    nmNovaAbertura  : TDateTime;
    nmNovoFechamento: TDateTime;
  end;

  TnmFechaCaixaReq = packed record
    nmFunc: String[20];
    nmID  : Integer;
    nmSaldo : Currency;
  end;

  PnmAbreCaixaRpy = ^TnmAbreCaixaRpy;
  TnmAbreCaixaRpy = packed record
    nmID: Integer;
  end;
  
  PnmSenhaCli=^TnmSenhaCli;
  TnmSenhaCli= packed record
    nmCodigo : Integer;
    nmSenha  : String[30];
  end;

  TnmLimpaFundoReq = packed record
    nmDesktop : Boolean;
  end;

  TnmCancelaTranReq = packed record
    nmFunc : String[30];
    nmTran : Integer;
  end;

  TnmLoginReq = packed record
    nmUsername   : String[30];
    nmSenha      : String[10];
    nmFuncAtual  : Boolean;
    nmMaq        : Word;
    nmProxyHandle: Integer;
  end; 

  TnmPaginasImpressasReq = packed record
    nmJobID   : Cardinal;
    nmMaq     : Word;
    nmPag     : Word;
    nmImp     : String[255];
    nmDoc     : String[255];
  end;

  TnmAdicionaPassaporteReq = packed record
    nmSenha  : String[20];
    nmMaq    : Integer;
  end; 

  TnmBaixaAtualizacao = packed record
    nmPrograma : String[30];
    nmVersao   : String[10]; 
    nmNomeArq  : TCSCFileName;
  end;  

  TnmLoginRpy = packed record
    nmHandle   : Integer;
    nmPreco    : Double;
    nmPrecoPor : Integer;
    nmCarencia : Integer;
    nmContato  : Integer;
    nmTempo    : Integer;
  end;

  TnmModoManutencaoReq = packed record 
    nmUsername : String[30];
    nmSenha    : String[10];
    nmMaq      : Word;
    nmEntrar   : Boolean;
  end;  

  TnmObtemListaReq = packed record
    nmCliente    : Integer;
    nmTipoClasse : Integer;
  end;

  TnmPararTempoMaqReq = packed record
    nmMaq : Word;
    nmParar : Boolean;
  end;  

  TnmShutdown = packed record
    nmMaq  : Word;    // 0 - Todas
    nmOper : Byte;    // 0 - Fechar CMGuard, 1 - Reiniciar Maq, 2 - Desligar Maq      
  end;

  TnmTransferirMaqReq = packed record
    nmOrigem  : Word;
    nmDestino : Word;
  end;  

  TnmObtemPrecosReq = packed record
    nmPrecos : TncTarifa;
  end;
  
  PnmObj = ^TnmObj;
  TnmObj = packed record
    nmCliente    : Integer;
    nmTipoClasse : Integer;
    nmChave      : String[50];
  end;

  TnmLogoutMaqReq = packed record
    nmMaq       : Word;
  end; 

  TnmCapturaTela = packed record
    nmSession : Integer;
    nmMaq     : Word;
  end;

  TnmSession = packed record
    nmSession : Integer;
  end;

  TnmObtemModoDemoRpy = packed record
    nmModoDemo : Integer;
    nmNumMaq   : Word;
  end;

  PnmMsgCom = ^TnmMsgCom;
  TnmMsgCom = packed record
    nmMsgID: Integer;
    nmDataLength: Longint;
    nmData: TnxVarMsgField;
  end;

  PnmSalvaTela = ^TnmSalvaTela;
  TnmSalvaTela = packed record
    nmSession: Integer;
    nmMaq    : Integer;
    nmJpgLen : Integer;
    nmJpg    : TnxVarMsgField;
  end;

  PnmUpload = ^TnmUpload;
  TnmUpload = packed record
    nmNomeArq : String[255];
    nmTamanho : Integer;
    nmArq     : TnxVarMsgField;
  end;

  PnmSendPTBlock = ^TnmSendPTBlock;
  TnmSendPTBlock = packed record
    nmArq     : TGUID;
    nmLast    : Boolean;
    nmPos     : Int64;
    nmTamanho : Integer;
    nmBlock   : TnxVarMsgField;
  end;

  PnmGetPrintDoc = ^TnmGetPrintDoc;
  TnmGetPrintDoc = packed record
    nmArq     : TGUID;
    nmPos     : Int64;
  end;

  PnmGetPrintDocReply = ^TnmGetPrintDocReply;
  TnmGetPrintDocReply = packed record
    nmArq      : TGUID;
    nmLast     : Boolean;
    nmTamTotal : Int64;
    nmTamBlock : Int64;
    nmBlock    : TnxVarMsgField;
  end;
  
  TnmStartPrintTransferReply = packed record
    nmPos : Int64;
  end;
  
  function MsgToString(aMsg: Integer): String;
  
implementation

function MsgToString(aMsg: Integer): String;
begin
  case aMsg of
  ncnmLogin              : Result := 'Login              '; // do not localize
  ncnmLogout             : Result := 'Logout             '; // do not localize
  ncnmNovoObj            : Result := 'NovoObj            '; // do not localize
  ncnmAlteraObj          : Result := 'AlteraObj          '; // do not localize
  ncnmApagaObj           : Result := 'ApagaObj           '; // do not localize
  ncnmObtemLista         : Result := 'ObtemLista         '; // do not localize
  ncnmLoginMaq           : Result := 'LoginMaq           '; // do not localize
  ncnmLogoutMaq          : Result := 'LogoutMaq          '; // do not localize
  
{  ncnmObtemPreco         = 12;
  ncnmAjustaPreco        = 13;}
  
  ncnmPreLogoutMaq       : Result := 'PreLogoutMaq       '; // do not localize
  ncnmCancLogoutMaq      : Result := 'CancLogoutMaq      '; // do not localize
  ncnmSalvaTelaMaq       : Result := 'SalvaTelaMaq       '; // do not localize
  ncnmCapturaTelaMaq     : Result := 'CapturaTelaMaq     '; // do not localize
  ncnmObtemStreamConfig  : Result := 'ObtemStreamConfig  '; // do not localize
  ncnmPararTempoMaq      : Result := 'PararTempoMaq      '; // do not localize
  ncnmTransferirMaq      : Result := 'TransferirMaq      '; // do not localize
  ncnmObtemModoDemo      : Result := 'ObtemModoDemo      '; // do not localize
  ncnmRefreshPrecos      : Result := 'RefreshPrecos      '; // do not localize
  ncnmObtemPrecos        : Result := 'ObtemPrecos        '; // do not localize
  ncnmShutdown           : Result := 'Shutdown           '; // do not localize
  ncnmBaixaAtualizacao   : Result := 'BaixaAtualizacao   '; // do not localize
  ncnmLiberarAlemPacote  : Result := 'LiberarAlemPacote  '; // do not localize
  ncnmModoManutencao     : Result := 'ModoManutencao     '; // do not localize
  ncnmObtemLicenca       : Result := 'ObtemLicenca       '; // do not localize
  ncnmAdicionaPassaporte : Result := 'AdicionaPassaporte '; // do not localize
  ncnmPaginasImpressas   : Result := 'PaginasImpressas   '; // do not localize
  ncnmAvisos             : Result := 'Avisos             '; // do not localize
  ncnmObtemPastaServ     : Result := 'ObtemPastaServ     '; // do not localize
  ncnmArqFundoEnviado    : Result := 'ArqFundoEnviado    '; // do not localize
  ncnmObtemSenhaCli      : Result := 'ObtemSenhaCli      '; // do not localize
  ncnmSalvaSenhaCli      : Result := 'SalvaSenhaCli      '; // do not localize
  ncnmLimpaFundo         : Result := 'LimpaFundo         '; // do not localize
  ncnmEnviaChat          : Result := 'EnviaChat          '; // do not localize
  ncnmSalvaCredTempo     : Result := 'SalvaCredTempo     '; // do not localize
  ncnmAlteraSessao       : Result := 'AlteraSessao       '; // do not localize
  ncnmCancelaTran        : Result := 'CancelaTran        '; // do not localize
  ncnmSalvaMovEst        : Result := 'SalvaMovEst        '; // do not localize
  ncnmSalvaDebito        : Result := 'SalvaDebito        '; // do not localize
  ncnmSalvaImpressao     : Result := 'SalvaImpressao     '; // do not localize
  ncnmAbreCaixa          : Result := 'AbreCaixa          '; // do not localize
  ncnmFechaCaixa         : Result := 'FechaCaixa         '; // do not localize
  ncnmObtemProcessos     : Result := 'ObtemProcessos     '; // do not localize
  ncnmFinalizaProcesso   : Result := 'FinalizaProcesso   '; // do not localize
  ncnmSalvaProcessos     : Result := 'SalvaProcessos     '; // do not localize
  ncnmObtemSitesBloq     : Result := 'ObtemSitesBloq     '; // do not localize
  ncnmRefreshEspera      : Result := 'RefreshEspera      '; // do not localize
  ncnmPermitirDownload   : Result := 'PermitirDownload   '; // do not localize
  ncnmSalvaLancExtra     : Result := 'SalvaLancExtra     '; // do not localize
  ncnmSalvaDebTempo      : Result := 'SalvaDebTempo      '; // do not localize
  ncnmCorrigeDataCaixa   : Result := 'CorrigeDataCaixa   '; // do not localize
  ncnmRefreshSessao      : Result := 'RefreshSessao      '; // do not localize
  ncnmSuporteRem         : Result := 'SuporteRem         '; // do not localize
  ncnmSalvaLic           : Result := 'SalvaLic           '; // do not localize
  ncnmObtemPatrocinios   : Result := 'ObtemPatrocinios   '; // do not localize
  ncnmAjustaPontosFid    : Result := 'AjustaPontosFid    '; // do not localize
  ncnmSalvaAppUrlLog     : Result := 'SalvaAppUrlLog     '; // do not localize
  ncnmKeepAlive          : Result := 'KeepAlive          '; // do not localize
  ncnmSalvaTela          : Result := 'SalvaTela          '; // do not localize
  ncnmDownloadArq        : Result := 'DownloadArq        '; // do not localize
  ncnmObtemVersaoGuard   : Result := 'ObtemVersaoGuard   '; // do not localize
  ncnmUploadArq          : Result := 'UploadArq          '; // do not localize
  ncnmDisableAd          : Result := 'DisableAd          '; // do not localize
  ncnmSalvaClientPages   : Result := 'SalvaClientPages   '; // do not localize
  ncnmJobControl         : Result := 'JobControl         '; // do not localize
  ncnmApagaMsgCli        : Result := 'ApagaMsgCli        '; // do not localize
  ncnmGetLoginData       : Result := 'GetLoginData       '; // do not localize
  
  ncnmMsgComEv           : Result := 'MsgComEv           '; // do not localize
  ncnmChecaLicEv         : Result := 'ChecaLicEv         '; // do not localize
  ncnmHorarioEv          : Result := 'HorarioEv          '; // do not localize
  ncnmCapturaTelaEv      : Result := 'CapturaTelaEv      '; // do not localize
  ncnmSalvaTelaEv        : Result := 'SalvaTelaEv        '; // do not localize
  ncnmFinalizaProcessoEv : Result := 'FinalizaProcessoEv '; // do not localize
  ncnmShutdownEv         : Result := 'ShutdownEv         '; // do not localize
  ncnmSuporteRemEv       : Result := 'SuporteRemEv       '; // do not localize
  ncnmObtemProcessosEv   : Result := 'ObtemProcessosEv   '; // do not localize
  else
    Result := '#MSG='+IntToStr(aMsg); // do not localize
  end;
end;

end.

