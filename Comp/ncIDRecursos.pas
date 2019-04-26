unit ncIDRecursos;
{
    ResourceString: Dario 12/03/13
    Nada para fazer
}

interface

{$I NEX.INC}

uses
  classes,
  SysUtils;

  function ItemTrueStr(S: String; Item: Integer): Boolean;
  function ItemTrueSL(SL: TStrings; Item: Integer): Boolean;

resourcestring
    rsDireito01 = 'Configurar Programas Permitidos aos Clientes';
    rsDireito02 = 'Fechar o NexGuard';
    rsDireito03 = 'Acessar máquinas clientes com login de funcionário';
    rsDireito04 = 'Fechar o NexServer';
    rsDireito05 = 'Dar Descontos';
    rsDireito06 = 'Lançar Compras';
    rsDireito07 = 'Lançar Entradas (Ajuste de Estoque)';
    rsDireito08 = 'Lançar Saidas (Ajuste de Estoque)';
    rsDireito09 = 'Cadastrar/Alterar dados de Clientes';
    rsDireito10 = 'Apagar Clientes';
    rsDireito11 = 'Marcar Clientes como Acesso Grátis';
    rsDireito12 = 'Debitar Tempo das contas dos Clientes';
    rsDireito13 = 'Cadastrar/Alterar dados de Produtos';
    rsDireito14 = 'Apagar Produtos';
    rsDireito15 = 'Alterar Preço de Produtos';
    rsDireito16 = 'Ver dados de Caixas Anteriores';
    rsDireito17 = 'Ver dados de Caixas Anteriores de outros usuários';
    rsDireito18 = 'Lançar Suprimento (entrada de dinheito) no Caixa';
    rsDireito19 = 'Lançar Sangria (saída de dinheiro) no Caixa';
    rsDireito20 = 'Abrir / Fechar Caixa';
    rsDireito21 = 'Ver totalização do Caixa Atual';
    rsDireito22 = 'Alterar Opções de funcionamento do sistema';
    rsDireito23 = 'Alterar Tarifas';
    rsDireito24 = 'Imprimir cartões de tempo inválidos';
    rsDireito25 = 'Imprimir cartões de tempo válidos';
    rsDireito26 = 'Editar formato de impressão de códigos pré-pagos';
    rsDireito27 = 'Ver senha de cartões de tempo';
    rsDireito28 = 'Alterar Transações (corrigir itens, valores e quantidades)';
    rsDireito29 = 'Capturar tela e Controle Remoto das máquinas clientes';
    rsDireito30 = 'Ver Lucro dos Produtos';
    rsDireito31 = 'Pode trocar o cliente cadastrado que está acessando a máquina depois do inicio do acesso';
    rsDireito32 = 'Pode alterar o valor de venda de crédito depois de salvar';
    rsDireito33 = 'Zerar Tempo de Acesso dos Clientes';
    rsDireito34 = 'Apagar senha dos clientes';
    rsDireito35 = 'Alterar limite de débito dos clientes';
    rsDireito36 = 'Inativar / Re-ativar contas de clientes';
    rsDireito37 = 'Cancelar Transações';
    rsDireito38 = 'Alterar Impressões Detectadas Automaticamente';
    rsDireito39 = 'Pode iniciar sessão de cliente cadastrado pelo NexAdmin';
    rsDireito40 = 'Pode alterar o tipo de acesso da sessão ou do cliente';
    rsDireito41 = 'Corrigir quantidade de pontos fidelidade dos clientes';
    rsDireito42 = 'Atender Clientes';
    rsDireito43 = 'Estatísticas';
    rsDireito44 = 'Alterar opção de "Não guardar crédito ao final do acesso" dos clientes';
    rsDireito45 = 'Alterar opção de "Permitir login sem crédito" dos clientes';
    rsDireito46 = 'Alterar cotas de impressão dos clientes';
    rsDireito47 = 'Alterar censura de horário dos clientes';
    rsDireito48 = 'Alterar censura de horário dos clientes que tem acesso grátis';
    rsDireito49 = 'Apagar senha dos clientes que tem acesso grátis';
    rsDireito50 = 'Ver colunas de valores do caixa';
    rsDireito51 = 'Usar opção de imprimir e exportar do menu principal';
    rsDireito52 = 'Bloquear ou Desbloquear sites';
    rsDireito53 = 'Desativar bloqueio de sites em uma determinada sessão';
    rsDireito54 = 'Iniciar acesso de cliente com conta gratuita via NexAdmin';
    rsDireito55 = 'Ver transações do caixa atual';
    rsDireito56 = 'Ver Custo e Margem de lucro de produtos';
    rsDireito57 = 'Alterar Custo e Margem de lucro de produtos';
    rsDireito58 = 'Pode autorizar venda de produtos com estoque insuficiente'; 
    rsDireito59 = 'Realizar venda caixa';
    rsDireito60 = 'Realizar venda balcão';
    rsDireito61 = 'Registrar pagamento de venda balcão';
    rsDireito62 = 'Alterar pagamento';
    rsDireito63 = 'Pausar um acesso em andamento';

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

  daVerTranCaixa = 55;
  daVerCusto = 56;
  daAlterarCusto = 57;

  daPodeAutorizarVendaEstInsuficiente = 58;

  daVendaCaixa = 59;
  daVendaBalcao = 60;
  daVendaPagamento = 61;
  daAlterarPagamento = 62;

  daPausarAcessos = 63;

  daQuantidade        = daPausarAcessos;

  daDefault = [daCliCadastrar, daProCadastrar, daCaiAbrirFechar, daCaiVerAtual, daIniciarSessaoCliCad, daAlterarTipoAcesso, daTraAlterar, daAtenderClientes, daAlterarCensuraH, daCaiVerValores, daImpExp, daIniciarAcessoGratis, daVerTranCaixa, daVendaCaixa, daVendaBalcao, daVendaPagamento, daAlterarPagamento, daPausarAcessos];

  daSoLan = [

  daMaqConfigurar      ,
  daMaqFecharCMGuard   ,
  daMaqModoManutencao  ,
  daMaqFecharCMServer  ,
  daCliDebitarTempo    ,
  daPPGImpPPInvalido   ,
  daPPGImpPPValido     ,
  daPPGEditaFmtImpPP   ,
  daVerSenhaPassaporte ,
  daCapturar           ,
  daTrocarClienteAcesso,
  daAlterarCredito     ,
  daZerarTempoAcumulado,
  daApagarSenhaCliente ,
  daAlteraImpressao    ,
  daIniciarSessaoCliCad ,
  daAlterarTipoAcesso   ,
  daAtenderClientes     ,
  daAlterarNaoGuardarCred ,
  daAlterarLoginSemCred   ,
  daAlterarCotasCli       ,
  daAlterarCensuraH ,
  daAlterarCensuraHGratis ,
  daApagarSenhaClienteGratis,
  daFWAlterar,
  daFWSessao,
  daIniciarAcessoGratis  
  ];

  daSoLoja = [
    daVendaCaixa,
    daVendaBalcao,
    daVendaPagamento,
    daAlterarPagamento];  

  daDescr : Array[1..daQuantidade] of String = (
    rsDireito01,
    rsDireito02,
    rsDireito03,
    rsDireito04,
    rsDireito05,
    rsDireito06,
    rsDireito07,
    rsDireito08,
    rsDireito09,
    rsDireito10,
    rsDireito11,
    rsDireito12,
    rsDireito13,
    rsDireito14,
    rsDireito15,
    rsDireito16,
    rsDireito17,
    rsDireito18,
    rsDireito19,
    rsDireito20,
    rsDireito21,
    rsDireito22,
    rsDireito23,
    rsDireito24,
    rsDireito25,
    rsDireito26,
    rsDireito27,
    rsDireito28,
    rsDireito29,
    rsDireito30,
    rsDireito31,
    rsDireito32,
    rsDireito33,
    rsDireito34,
    rsDireito35,
    rsDireito36,
    rsDireito37,
    rsDireito38,
    rsDireito39,
    rsDireito40,
    rsDireito41,
    rsDireito42,
    rsDireito43,
    rsDireito44,
    rsDireito45,
    rsDireito46,
    rsDireito47,
    rsDireito48,
    rsDireito49,
    rsDireito50,
    rsDireito51,
    rsDireito52,
    rsDireito53,
    rsDireito54,
    rsDireito55,
    rsDireito56,
    rsDireito57,
    rsDireito58,
    rsDireito59, rsDireito60, rsDireito61, rsDireito62, rsDireito63);
    
    
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
