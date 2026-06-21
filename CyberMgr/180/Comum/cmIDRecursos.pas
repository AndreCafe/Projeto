unit cmIDRecursos;

interface

uses
  SysUtils;

const

// ID dos Recursos
reMaquinas     = 1;
reTransacoes   = 2;
reMovEstoque   = 3;
reClientes     = 4;
reProdutos     = 5;
reCaixas       = 6;
reConfig       = 7;

reUltimo       = reConfig;

NumRecursos    = reUltimo;

// ID dos Tipos de Acessos
taMaqConfigurar     = 1;
taMaqFecharCMGuard  = 2;
taMaqModoManutencao = 3;
taMaqFecharCMServer = 4;

taTraDesconto       = 1;

taEstCompras        = 1;
taEstEntrada        = 2;
taEstSaida          = 3;

taCliCadastrar      = 1;
taCliEditar         = 2;
taCliApagar         = 3;
taCliMarcarIsento   = 4;
taCliDebitarTempo   = 5;

taProCadastrar      = 1;
taProEditar         = 2;
taProApagar         = 3;
taProEditarPreco    = 4;

taCaiVerAntes       = 1;
taCaiVerAntesOutros = 2;
taCaiSuprimento     = 3;
taCaiSangria        = 4;

taCFGParametros     = 1;
taCFGPrecos         = 2;

  function StringTipoAcesso(Recurso, ID: Integer): String;
  function StringRecurso(ID: Integer): String;
  function TipoAcessoValido(Recurso, ID: Integer): Boolean;
  function AcessoMinimo(Recurso: Integer): Byte;

implementation

function TipoAcessoValido(Recurso, ID: Integer): Boolean;
begin
  case Recurso of
    reMaquinas   : Result := (ID in [taMaqConfigurar..taMaqFecharCMServer]);
    reTransacoes : Result := (ID in [taTraDesconto]);
    reMovEstoque : Result := (ID in [taEstCompras..taEstSaida]);
    reClientes   : Result := (ID in [taCliCadastrar..taCliDebitarTempo]);
    reProdutos   : Result := (ID in [taProCadastrar..taProEditarPreco]);
    reCaixas     : Result := (ID in [taCaiVerAntes..taCaiSangria]);
    reConfig     : Result := (ID in [taCfgParametros, taCfgPrecos]);
  else
    Result := False;  
  end;
end;

function AcessoMinimo(Recurso: Integer): Byte;
begin
  Result := 0;
end;

function StringRecurso(ID: Integer): String;
begin
  case ID of
    reMaquinas     : Result := 'Máquinas';
    reTransacoes   : Result := 'Transações';
    reMovEstoque   : Result := 'Movimentação de Estoque';
    reClientes     : Result := 'Clientes';
    reProdutos     : Result := 'Produtos';
    reCaixas       : Result := 'Caixa';
    reConfig       : Result := 'Opções / Tarifas';
  else
    Result := IntToStr(ID);
  end;
end;


function StringTipoAcesso(Recurso, ID: Integer): String;
begin
  Result := 'ERRO-'+IntToStr(Recurso)+'/'+IntToStr(ID);
  case Recurso of
    reMaquinas   : 
      case ID of
        taMaqConfigurar    : Result := 'Configurar CM-Guard';
        taMaqModoManutencao: Result := 'Entrar em Modo Manutenção';
        taMaqFecharCMGuard : Result := 'Fechar CM-Guard';
        taMaqFecharCMServer: Result := 'Fechar CM-Server';
      end;
    
    reTransacoes : 
      case ID of
        taTraDesconto : Result := 'Dar Desconto';
      end;
    
    reMovEstoque : 
      case ID of
        taEstCompras : Result := 'Compras (Entrada)';
        taEstEntrada : Result := 'Entrada - Ajuste de estoque';
        taEstSaida   : Result := 'Saída - Ajuste de estoque';
      end;
    
    reClientes   : 
      case ID of
        taCliCadastrar     : Result := 'Cadastrar';
        taCliEditar        : Result := 'Editar';
        taCliApagar        : Result := 'Apagar';
        taCliMarcarIsento  : Result := 'Marcar como Isento';
        taCliDebitarTempo  : Result := 'Debitar Tempo';
      end;
    
    reProdutos   : 
      case ID of
        taProCadastrar   : Result := 'Cadastrar';
        taProEditar      : Result := 'Editar';
        taProApagar      : Result := 'Apagar';
        taProEditarPreco : Result := 'Alterar preço de venda';
      end;
    
    reCaixas     : 
      case ID of
        taCaiVerAntes       : Result := 'Acessar caixas anteriores';
        taCaiVerAntesOutros : Result := 'Acessar caixas anteriores de outros usuários';
        taCaiSangria        : Result := 'Lançar Sangria';
        taCaiSuprimento     : Result := 'Lançar Suprimento';
      end;
    
    reConfig     : 
      case ID of
        taCFGParametros : Result := 'Alterar Opções';
        taCFGPrecos     : Result := 'Alterar Tarifas';
      end;
  end;    
end;



end.
