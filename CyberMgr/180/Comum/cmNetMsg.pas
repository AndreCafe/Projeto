unit cmNetMsg;

interface

uses cmClassesBase, CSCBase;

const
  cmnmLogin  = 4;
  cmnmLogout = 5;

  cmnmNovoObj            = 6;
  cmnmAlteraObj          = 7;
  cmnmApagaObj           = 8;
  cmnmObtemLista         = 9;
  cmnmLoginMaq           = 10;
  cmnmLogoutMaq          = 11;
  
{  cmnmObtemPreco         = 12;
  cmnmAjustaPreco        = 13;}
  
  cmnmPreLogoutMaq       = 14;
  cmnmCancLogoutMaq      = 15;
  cmnmSalvaTelaMaq       = 16;
  cmnmCapturaTelaMaq     = 17;
  cmnmObtemStreamConfig  = 18;
  cmnmPararTempoMaq      = 19;
  cmnmTransferirMaq      = 20;
  cmnmObtemModoDemo      = 21;
  cmnmRefreshPrecos      = 22;
  cmnmObtemPrecos        = 23;
  cmnmShutdown           = 24;
  cmnmBaixaAtualizacao   = 25;
  cmnmLiberarAlemPacote  = 26;
  cmnmModoManutencao     = 27;
  cmnmObtemLicenca       = 28;
  cmnmSalvaLicenca       = 29;

  cmnmAtualizaObjEv      = 1001;
  cmnmDestroiObjEv       = 1002;
  cmnmNovoObjEv          = 1003;
  cmnmPedeTelaEv         = 1004;
  cmnmShutdownEv         = 1005;
  cmnmTransfArqEv        = 1006;
  cmnmChecaConexaoEv     = 1007;

type
  TnmLoginReq = packed record
    nmUsername   : String[30];
    nmSenha      : String[10];
    nmFuncAtual  : Boolean;
    nmMaq        : Integer;
    nmProxyHandle: Integer;
  end; 

  TnmBaixaAtualizacao = packed record
    nmPrograma : String[30];
    nmVersao   : String[10]; 
    nmNomeArq  : TCSCFileName;
  end;  

  TnmLicenca = packed record
    nmLicencaStr : TLicencaStr;
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
    nmMaq      : Integer;
    nmEntrar   : Boolean;
  end;  

  TnmObtemListaReq = packed record
    nmCliente    : Integer;
    nmTipoClasse : Integer;
  end;

  TnmPararTempoMaqReq = packed record
    nmMaq : Integer;
    nmParar : Boolean;
  end;  

  TnmShutdown = packed record
    nmMaq  : Integer; // 0 - Todas
    nmOper : Byte;    // 0 - Fechar CMGuard, 1 - Reiniciar Maq, 2 - Desligar Maq      
  end;

  TnmTransferirMaqReq = packed record
    nmOrigem  : Integer;
    nmDestino : Integer;
  end;  

  TnmObtemPrecosReq = packed record
    nmPrecos : TCMHoraCor;
  end;
  
  PnmObj = ^TnmObj;
  TnmObj = packed record
    nmCliente    : Integer;
    nmTipoClasse : Integer;
    nmChave      : String[30];
  end;

  TnmLoginMaqReq = packed record
    nmMaq        : Integer;
    nmContato    : Integer;
    nmUsername   : String[30];
    nmSenha      : String[10];
    nmNome       : String[40];
    nmLimiteTempo: Cardinal;
    nmTipoAcesso : Word;
    nmSinal      : Double;
    nmObs        : String[100];
  end; 

  TnmLogoutMaqReq = packed record
    nmMaq       : Integer;
  end; 

  TnmCapturaTela = packed record
    nmMaq       : Integer;
  end;

  TnmLiberarAlemPacoteReq = packed record
    nmMaq : Integer;
  end;  

  TnmFinalizaChamadaReq = packed record
    nmCliente : Integer;
    nmNumero  : Integer;
  end;

  TnmObtemModoDemoRpy = packed record
    nmModoDemo : Integer;
    nmNumMaq   : Integer;
  end;
  
implementation

end.
