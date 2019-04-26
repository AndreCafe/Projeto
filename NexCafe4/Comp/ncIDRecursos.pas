unit ncIDRecursos;

interface

uses
  classes,
  SysUtils;

  function ItemTrueStr(S: String; Item: Integer): Boolean;
  function ItemTrueSL(SL: TStrings; Item: Integer): Boolean;

const
  daMaqConfigurar      = 01;
  daMaqFecharCMGuard   = 02;
  daMaqModoManutencao  = 03;
  daMaqFecharCMServer  = 04;
  daTraDesconto        = 05;
  daEstCompras         = 06;
  daEstEntrada         = 07;
  daEstSaida           = 08;
  daCliCadastrar       = 09;
  daCliApagar          = 10;
  daCliMarcarIsento    = 11;
  daCliDebitarTempo    = 12;
  daProCadastrar       = 13;
  daProApagar          = 14;
  daProEditarPreco     = 15;
  daCaiVerAntes        = 16;
  daCaiVerAntesOutros  = 17;
  daCaiSuprimento      = 18;
  daCaiSangria         = 19;
  daCaiAbrirFechar     = 20;
  daCaiVerAtual        = 21;
  daCFGParametros      = 22;
  daCFGPrecos          = 23;
  daPPGImpPPInvalido   = 24;
  daPPGImpPPValido     = 25;
  daPPGEditaFmtImpPP   = 26;
  daVerSenhaPassaporte = 27;
  daTraAlterar         = 28;
  daCapturar           = 29;
  daVerLucroProdutos   = 30;
  daTrocarClienteAcesso= 31;
  daAlterarCredito     = 32;
  daZerarTempoAcumulado= 33;
  daApagarSenhaCliente = 34;
  daAlterarLimiteDebito= 35;
  daInativarContas     = 36;
  daTraCancelar        = 37;
  daAlteraImpressao    = 38;
  
  daIniciarSessaoCliCad = 39;
  daAlterarTipoAcesso   = 40;
  daCorrigirFidelidade  = 41;

  daAtenderClientes     = 42;
  daEstatisticas        = 43;
  daAlterarNaoGuardarCred = 44;
  daAlterarLoginSemCred   = 45;
  daAlterarCotasCli       = 46;

  daAlterarCensuraH = 47;
  daAlterarCensuraHGratis = 48;

  daApagarSenhaClienteGratis = 49;

  daCaiVerValores = 50;
  daImpExp = 51;
  daFWAlterar = 52;
  daFWSessao = 53;
  daIniciarAcessoGratis = 54;
  

  daQuantidade        = daIniciarAcessoGratis;

  daDefault = [daCliCadastrar, daProCadastrar, daCaiAbrirFechar, daCaiVerAtual, daIniciarSessaoCliCad, daAlterarTipoAcesso, daTraAlterar, daAtenderClientes, daAlterarCensuraH, daCaiVerValores, daImpExp, daIniciarAcessoGratis];

  daDescr : Array[1..daQuantidade] of String = (
    'Configurar Programas Permitidos aos Clientes',
    'Fechar o NexGuard',
    'Acessar máquinas clientes com login de funcionário',
    'Fechar o NexServer',
    'Dar Descontos',
    'Lançar Compras',
    'Lançar Entradas (Ajuste de Estoque)',
    'Lançar Saidas (Ajuste de Estoque)',
    'Cadastrar/Alterar dados de Clientes',
    'Apagar Clientes',
    'Marcar Clientes como Acesso Grátis',
    'Debitar Tempo das contas dos Clientes',
    'Cadastrar/Alterar dados de Produtos',
    'Apagar Produtos',
    'Alterar Preço de Produtos',
    'Ver dados de Caixas Anteriores',
    'Ver dados de Caixas Anteriores de outros usuários',
    'Lançar Suprimento (entrada de dinheito) no Caixa',
    'Lançar Sangria (saída de dinheiro) no Caixa',
    'Abrir / Fechar Caixa',
    'Ver dados do Caixa Atual',
    'Alterar Opções de funcionamento do sistema',
    'Alterar Tarifas',
    'Imprimir cartões de tempo inválidos',
    'Imprimir cartões de tempo válidos',
    'Editar formato de impressão de códigos pré-pagos',
    'Ver senha de cartões de tempo', 
    'Alterar Transações (corrigir itens, valores e quantidades)',
    'Capturar tela e Controle Remoto das máquinas clientes',
    'Ver Lucro dos Produtos', 
    'Pode trocar o cliente cadastrado que está acessando a máquina depois do inicio do acesso',           
    'Pode alterar o valor de venda de crédito depois de salvar', 
    'Zerar Tempo de Acesso dos Clientes',
    'Apagar senha dos clientes',  
    'Alterar limite de débito dos clientes',
    'Inativar / Re-ativar contas de clientes',
    'Cancelar Transações',
    'Alterar Impressões Detectadas Automaticamente',
    'Pode iniciar sessão de cliente cadastrado pelo NexAdmin',
    'Pode alterar o tipo de acesso da sessão ou do cliente',
    'Corrigir quantidade de pontos fidelidade dos clientes',
    'Atender Clientes',
    'Estatísticas',
    'Alterar opção de "Não guardar crédito ao final do acesso" dos clientes',
    'Alterar opção de "Permitir login sem crédito" dos clientes',
    'Alterar cotas de impressão dos clientes',
    'Alterar censura de horário dos clientes',
    'Alterar censura de horário dos clientes que tem acesso grátis',
    'Apagar senha dos clientes que tem acesso grátis',
    'Ver colunas de valores do caixa',
    'Usar opção de imprimir e exportar do menu principal',
    'Bloquear ou Desbloquear sites',
    'Desativar bloqueio de sites em uma determinada sessão',
    'Iniciar acesso de cliente com conta gratuita via NexAdmin');
    
    
implementation

uses ncListaID;  

function ItemTrueSL(SL: TStrings; Item: Integer): Boolean;
var S : String;
begin
  S := SL.Values[IntToStr(Item)];
  Result := (S='T') or (S='S') or ((S='') and (Item in daDefault));
end;

function ItemTrueStr(S: String; Item: Integer): Boolean;
begin
  S := ObtemValor(S, IntToStr(Item));
  Result := (S='S') or (S='T') or ((S='') and (Item in daDefault));
end;

end.
