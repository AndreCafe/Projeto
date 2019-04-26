unit ncNetMsg;

interface

uses ncClassesBase, CSCBase, nxstMessages;

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
  
  ncnmMsgComEv           = ncnmFirst + 101;
  ncnmChecaLicEv         = ncnmFirst + 102;
  ncnmHorarioEv          = ncnmFirst + 103;
  ncnmCapturaTelaEv      = ncnmFirst + 104;
  ncnmSalvaTelaEv        = ncnmFirst + 105;
  ncnmFinalizaProcessoEv = ncnmFirst + 106;
  ncnmShutdownEv         = ncnmFirst + 107;
  ncnmSuporteRemEv       = ncnmFirst + 108;
  ncnmObtemProcessosEv   = ncnmFirst + 109;

  ncnmFirstEv = ncnmMsgComEv;
  ncnmLastEv = ncnmObtemProcessosEv;

type
  TnmSessao = packed record
    nmSessao : Integer;
  end;

  PnmHorarioEv = ^TnmHorarioEv;
  TnmHorarioEv = packed record
    nmHora : TDateTime;
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

  TnmPermitirDownloadReq = packed record
    nmSessao : Integer;
    nmPerm   : Boolean;
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
    nmMaq     : Word;
    nmPaginas : Integer;
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
    nmChave      : String[30];
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
  
implementation

end.
