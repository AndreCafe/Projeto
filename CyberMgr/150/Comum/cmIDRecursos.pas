unit cmIDRecursos;

interface

uses
  SysUtils;

const

// ID dos Recursos
reMaquinas     = 1;
reTransacoes   = 2;
rePacotes      = 3;
reMovEstoque   = 4;
reClientes     = 5;
reProdutos     = 6;
reUsuarios     = 7;
reCaixas       = 8;
reLancExtras   = 9;
reLogProgramas = 10;
reConfig       = 11;

reUltimo       = reConfig;

NumRecursos=reUltimo;

// ID dos Tipos de Acessos
taMaqCadastrar      = 1;
taMaqApagar         = 2;
taMaqConfigurar     = 3;
taMaqFecharCMGuard  = 4;

taTraDesconto       = 1;

taPacCadastrar      = 1;

taEstCompras        = 1;
taEstEntrada        = 2;           
taEstSaida          = 3;

taCliCadastrar      = 1;
taCliEditar         = 2;
taCliApagar         = 3;
taCliMarcarIsento   = 4;
taCliCreditarTempo  = 5;
taCliDebitarTempo   = 6;

taProCadastrar      = 1;
taProEditar         = 2;
taProApagar         = 3;
taProEditarPreco    = 4;

taUsuCadastrar      = 1;

taCaiVerAntes       = 1;
taCaiVerAntesOutros = 2;

taLEXCadastrar      = 1;
taLEXEditar         = 2;
taLEXApagar         = 3;

taLOGVer            = 1;

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
    reMaquinas   : Result := (ID in [taMaqCadastrar..taMaqFecharCMGuard]);
    reTransacoes : Result := (ID in [taTraDesconto]);
    rePacotes    : Result := (ID in [taPacCadastrar]);
    reMovEstoque : Result := (ID in [taEstCompras..taEstSaida]);
    reClientes   : Result := (ID in [taCliCadastrar..taCliDebitarTempo]);
    reProdutos   : Result := (ID in [taProCadastrar..taProEditarPreco]);
    reUsuarios   : Result := (ID in [taUsuCadastrar]);
    reCaixas     : Result := (ID in [taCaiVerAntes..taCaiVerAntesOutros]);
    reLancExtras : Result := (ID in [taLEXCadastrar..taLEXApagar]);
    reLogProgramas : Result := (ID in [taLogVer]);
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
    rePacotes      : Result := 'Pacotes';
    reMovEstoque   : Result := 'Movimentação de Estoque';
    reClientes     : Result := 'Clientes';
    reProdutos     : Result := 'Produtos';
    reUsuarios     : Result := 'Usuários';
    reCaixas       : Result := 'Caixa';
    reLancExtras   : Result := 'Lançamentos Extras';
    reLogProgramas : Result := 'Log do Sistema';
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
        taMaqCadastrar     : Result := 'Cadastrar';
        taMaqApagar        : Result := 'Apagar';
        taMaqConfigurar    : Result := 'Configurar';
        taMaqFecharCMGuard : Result := 'Fechar CM-Guard';
      end;
    
    reTransacoes : 
      case ID of
        taTraDesconto : Result := 'Dar Desconto';
      end;
    
    rePacotes    : 
      case ID of
        taPacCadastrar : Result := 'Cadastrar';
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
        taCliCreditarTempo : Result := 'Creditar Tempo';
        taCliDebitarTempo  : Result := 'Debitar Tempo';
      end;
    
    reProdutos   : 
      case ID of
        taProCadastrar   : Result := 'Cadastrar';
        taProEditar      : Result := 'Editar';
        taProApagar      : Result := 'Apagar';
        taProEditarPreco : Result := 'Alterar preço de venda';
      end;
    
    reUsuarios   : 
      case ID of
        taUsuCadastrar   : Result := 'Cadastrar';
      end;
    
    reCaixas     : 
      case ID of
        taCaiVerAntes       : Result := 'Acessar caixas anteriores';
        taCaiVerAntesOutros : Result := 'Acessar caixas anteriores de outros usuários';
      end;
    
    reLancExtras : 
      case ID of
        taLEXCadastrar : Result := 'Cadastrar';
        taLEXEditar    : Result := 'Editar';
        taLEXApagar    : Result := 'Apagar';
      end;
    
    reLogProgramas : 
      case ID of
        taLOGVer : Result := 'Ver Log';
      end;
    
    reConfig     : 
      case ID of
        taCFGParametros : Result := 'Alterar Opções';
        taCFGPrecos     : Result := 'Alterar Tarifas';
      end;
  end;    
end;



end.
