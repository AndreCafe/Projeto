unit uDefMsg;

interface

type
  PAutentica = ^TAutentica;
  TAutentica = record
    FAutenticou : Boolean;
    FUsername   : String[10];
  end;

const

  DefSenha    = 'senha';
  

  // Mensagens 
  nmLogin  = 101;
  nmTexto  = 102;

  nmevLogin  = 1001;
  nmevLogout = 1002;
  nmevTexto  = 1003;

  // Mensagens de Erro
  errUsuarioInexistente = 1;
  errSenhaInvalida      = 2;
  errExcecaoInesperada  = 3;

type
  PnmLogin = ^TnmLogin;
  TnmLogin = packed record
    nmUsername : String[10];
    nmSenha    : String[10];
  end;  

  PnmevLoginLogout = ^TnmevLoginLogout;
  TnmevLoginLogout = packed record
    nmUsername : String[10];
  end;  

implementation

end.
