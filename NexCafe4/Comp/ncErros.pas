unit ncErros;

interface

uses
  SysUtils,
  classes;

type
  ENexCafe = class(Exception);

const
  ncerrTipoClasseInvalido   = 1;
  ncerrExcecaoNaoTratada    = 2;
  ncerrItemInexistente      = 3;
  ncerrItemSemAlteracoes    = 4;
  ncerrInfoLoginInvalida    = 5;
  ncerrErroBD               = 6;
  ncerrClienteInvalido      = 7;
  ncerrItemJaExiste         = 8;
  ncerrAcessoEmAndamento    = 9;
  ncerrClienteJaAtivo       = 10;
  ncerrSemCreditoDisp       = 11;
  ncerrMaquinaInexistente   = 12;
  ncerrMaquinaJaConectada   = 13;
  ncerrTelaNaoDisponivel    = 14;
  ncerrMaquinaSemAcesso     = 15;
  ncerrEmModoDemo           = 16;
  ncerrNumMaxMaq            = 17;
  ncerrSemNovaVersao        = 18;
  ncerrErroSocket           = 19;
  ncerrMaqJaEstaManutencao  = 20;
  ncerrMaqNaoEstaManutencao = 21;
  ncerrAcessoNaoPermitido   = 22;
  ncerrPassaporteEmUso      = 23;
  ncerrRGErrado             = 24;
  ncerrRGNaoCadastrado      = 25;
  ncerrCaixaFechado         = 26;
  ncerrClienteInativo       = 27;
  ncerrTransfAguardaPagto   = 28;
  ncerrLimiteManutUsuario   = 29;  
  ncerrArqNaoEncontrado     = 30; 
  ncerrFundoTemQueSerJPG    = 31;
  ncerrFundoTemQueSerJPGouGIF = 32;
  ncerrClienteNaoEncontrado = 33;
  ncerrMaqNaoLic            = 34;
  ncerrCaixaDiferente       = 35;
  ncerrImpossivelCancFimSessao = 36;
  ncerrImpossivelCancPassaporteUsado = 37;
  ncerrSemCreditoDispCanc            = 38;
  ncerrExisteTranPosterior           = 39;
  ncerrUsuarioInexistente            = 40;
  ncerrJaTemCaixaAberto              = 41;
  ncerrCaixaJaFoiFechado             = 42;
  ncerrAguardaPagto                  = 43;
  ncerrMaqReservada                  = 44;
  ncerrSaldoTempoInsuficiente        = 45;
  ncerrSenhaInvalida                 = 46;
  ncerrLimiteDebitoExcedido          = 47;
  ncerrHorarioNaoPermitido           = 48;
  ncerrMaquinaEmManutencao           = 49;
  ncerrTransacaoSoPodeAlterarViaFimSessao = 50;
  ncerrLoginNaoPermitidoLimDeb = 51;
  ncerrProdutoSemSaldo = 52;
  ncerrSaldoValorInsuficiente = 53;
  ncerrAcessoAlteradoPorOutroUsuario = 54;
  ncerrSessaoJaEncerrou = 55;
  ncerrSaldoFidInsuficiente = 56;
  ncerrFalhaTransfArq = 57;
  ncerrConexaoPerdida = 58;
  ncerrFalhaConexao   = 59;
  ncerrCliAvulsoBloqueado = 60;
  ncerrCliSemDadosMinimos = 61;
  ncerrUltimo = ncerrCliSemDadosMinimos;
  

  function StringErro(Erro: Integer): String;
  
implementation

function StringErro(Erro: Integer): String;
begin
  case Erro of
    ncerrTipoClasseInvalido :
      Result := 'Tipo de classe inválido';
    ncerrExcecaoNaoTratada  :
      Result := 'Exceção não tratada no servidor';  
    ncerrItemInexistente    :
      Result := 'Item inexistente';
    ncerrItemSemAlteracoes  :
      Result := 'Item sem alterações';
    ncerrInfoLoginInvalida  :
      Result := 'Username ou Senha inválida';
    ncerrErroBD :
      Result := 'Erro acessando banco de dados do servidor';
    ncerrClienteInvalido :
      Result := 'Handle de Cliente Inválido!';
    ncerrItemJaExiste :
      Result := 'Item Repetido!';  
    ncerrAcessoEmAndamento :
      Result := 'O acesso anterior dessa máquina ainda não finalizado por completo pelo atendente';  
    ncerrClienteJaAtivo :
      Result := 'Já existe máquina sendo usada por esse usuário!';
    ncerrSemCreditoDisp :
      Result := 'Não há crédito disponível!';
    ncerrMaquinaInexistente : 
      Result := 'Número de máquina inexistente!';     
    ncerrMaquinaJaConectada :
      Result := 'Esta máquina já está conectada!';
    ncerrTelaNaoDisponivel :
      Result := 'Tela não disponível';  
    ncerrMaquinaSemAcesso :
      Result := 'Não existe acesso em andamento nessa máquina!';
    ncerrEmModoDemo :  
      Result := 'O NexCafé está sendo executado em modo demonstração';
    ncerrNumMaxMaq :
      Result := 'Limite de máquinas licenciadas foi atingido';
    ncerrSemNovaVersao : 
      Result := 'Não há nova versão disponível no servidor';  
    ncerrErroSocket :
      Result := 'Erro de comunicação TCP/IP';  
    ncerrMaqJaEstaManutencao  :
      Result := 'Máquina está em manutenção';
    ncerrMaqNaoEstaManutencao :
      Result := 'Máquina não está em modo manutenção';
    ncerrAcessoNaoPermitido :
      Result := 'Você não possui direito de executar essa operação'; 
    ncerrPassaporteEmUso :
      Result := 'Esse cartão de tempo ou passaporte já está em uso';
    ncerrRGErrado :
      Result := 'O número de RG informado está diferente do cadastrado';
    ncerrRGNaoCadastrado :
      Result := 'Para usar sua conta é necessário cadastrar seu RG com o atendente da loja';
    ncerrCaixaFechado :
      Result := 'É necessário abrir um caixa para realizar essa operação';
    ncerrClienteInativo :
      Result := 'Essa conta de cliente está inativada'; 
    ncerrTransfAguardaPagto :
      Result := 'Não é possível transferir um acesso que está aguardando pagamento';
    ncerrLimiteManutUsuario :
      Result := 'Limite máximo de máquinas em manutenção para esse usuário já foi atigindo';
    ncerrArqNaoEncontrado :
      Result := 'Arquivo não encontrado';
    ncerrFundoTemQueSerJPG :  
      Result := 'O arquivo de fundo para área de trabalho tem que ser do tipo JPG';
    ncerrFundoTemQueSerJPGouGIF :  
      Result := 'O arquivo de fundo para a tela de login tem que ser do tipo JPG ou GIF';
    ncerrClienteNaoEncontrado :
      Result := 'Cliente não encontrado';
    ncerrMaqNaoLic : 
      Result := 'Sua conta NexCafé não permite o uso dessa máquina. Verifique sua conta no servidor NexCafé (NexServ)'; 
    ncerrCaixaDiferente : 
      Result := 'Não é possível alterar uma transação que ocorreu em outro caixa'; 
    ncerrImpossivelCancFimSessao : 
      Result := 'Não é permitido cancelar um Fim de Acesso';
    ncerrImpossivelCancPassaporteUsado :
      Result := 'Não é permitido cancelar a venda de um passaporte que já foi usado';
    ncerrSemCreditoDispCanc :
      Result := 'Sem crédito disponível para cancelar a transação';
    ncerrExisteTranPosterior :
      Result := 'Existe transação posterior a essa que envolve item(s) dessa transação.';
    ncerrUsuarioInexistente :
      Result := 'Nome de Usuário Inexistente';
    ncerrJaTemCaixaAberto :
      Result := 'Já existe um caixa aberto.';  
    ncerrCaixaJaFoiFechado :
      Result := 'Este caixa já está fechado';  
    ncerrAguardaPagto :
      Result := 'Existem itens aguardando confirmação de pagamento';
    ncerrMaqReservada :
      Result := 'Esta máquina está reservada para outro cliente'; 
    ncerrSaldoTempoInsuficiente :
      Result := 'Crédito de tempo atual do cliente não é suficiente para executar essa operação';
    ncerrSaldoValorInsuficiente :
      Result := 'O cliente não possui saldo suficiente para executar essa operação';
    ncerrSenhaInvalida :
      Result := 'Senha Inválida';  
    ncerrLimiteDebitoExcedido :
      Result := 'O limite máximo de débito permitido para esse cliente foi ultrapassado.';
    ncerrHorarioNaoPermitido :
      Result := 'Cliente não autorizado a usar computadores nesse horário';
    ncerrMaquinaEmManutencao :
      Result := 'Essa máquina está em manutenção / fora do ar. Não é possível usar';  
    ncerrTransacaoSoPodeAlterarViaFimSessao :
      Result := 'Essa transação não pode ser alterada diretamente. '+
                'Faça a alteração através da tela de Fim de Sessão da qual ela faz parte';
    ncerrLoginNaoPermitidoLimDeb :
      Result := 'Login não permitido: Valor limite de débitos foi atingido';
    ncerrProdutoSemSaldo :
      Result := 'Saldo de produto insuficiente';
    ncerrAcessoAlteradoPorOutroUsuario :
      Result := 'O acesso foi alterado antes de você salvar essa operação. Realize novamente essa operação';
    ncerrSessaoJaEncerrou :
      Result := 'Não é possível realizar operações em um acesso que já encerrou';
    ncerrSaldoFidInsuficiente :
      Result := 'Saldo de pontos do fidelidade do cliente é insuficiente para realizar essa operação';
    ncerrFalhaTransfArq :
      Result := 'Falha na transferência de arquivo';
    ncerrConexaoPerdida : 
      Result := 'A conexão de rede com o servidor foi perdida';
    ncerrFalhaConexao : 
      Result := 'Falha de conexão com o servidor NexCafé. Verifique os parâmetros de conexão e se sua rede está funcionando corretamente.';  
    ncerrCliAvulsoBloqueado :
      Result := 'Não é possível liberar acesso para cliente avulso. É necessário realizar um cadastro do cliente';
    ncerrCliSemDadosMinimos :
      Result := 'O cliente não possui os dados cadastrais mínimos para permitir seu acesso';
      
  else
    Result := '';    
  end;
end;
  

end.
