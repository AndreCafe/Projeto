unit cmErros;

interface

const
  cmerrTipoClasseInvalido   = 1;
  cmerrExcecaoNaoTratada    = 2;
  cmerrItemInexistente      = 3;
  cmerrItemSemAlteracoes    = 4;
  cmerrInfoLoginInvalida    = 5;
  cmerrErroBD               = 6;
  cmerrClienteInvalido      = 7;
  cmerrItemJaExiste         = 8;
  cmerrAcessoEmAndamento    = 9;
  cmerrClienteJaAtivo       = 10;
  cmerrSemCreditoDisp       = 11;
  cmerrMaquinaInexistente   = 12;
  cmerrMaquinaJaConectada   = 13;
  cmerrTelaNaoDisponivel    = 14;
  cmerrMaquinaSemAcesso     = 15;
  cmerrEmModoDemo           = 16;
  cmerrNumMaxMaq            = 17;
  cmerrSemNovaVersao        = 18;
  cmerrErroSocket           = 19;
  cmerrMaqJaEstaManutencao  = 20;
  cmerrMaqNaoEstaManutencao = 21;
  cmerrAcessoNaoPermitido   = 22;

  function StringErro(Erro: Integer): String;
  
implementation

function StringErro(Erro: Integer): String;
begin
  case Erro of
    cmerrTipoClasseInvalido :
      Result := 'Tipo de classe inválido';
    cmerrExcecaoNaoTratada  :
      Result := 'Exceção não tratada no servidor';  
    cmerrItemInexistente    :
      Result := 'Item inexistente';
    cmerrItemSemAlteracoes  :
      Result := 'Item sem alterações';
    cmerrInfoLoginInvalida  :
      Result := 'Username ou Senha inválida';
    cmerrErroBD :
      Result := 'Erro acessando banco de dados do servidor';
    cmerrClienteInvalido :
      Result := 'Handle de Cliente Inválido!';
    cmerrItemJaExiste :
      Result := 'Item Repetido!';  
    cmerrAcessoEmAndamento :
      Result := 'Já existe um acesso sendo realizado nessa máquina!';  
    cmerrClienteJaAtivo :
      Result := 'Já existe máquina sendo usada por esse usuário!';
    cmerrSemCreditoDisp :
      Result := 'Não há crédito disponível!';
    cmerrMaquinaInexistente : 
      Result := 'Número de máquina inexistente!';     
    cmerrMaquinaJaConectada :
      Result := 'Esta máquina já está conectada!';
    cmerrTelaNaoDisponivel :
      Result := 'Tela não disponível';  
    cmerrMaquinaSemAcesso :
      Result := 'Não existe acesso em andamento nessa máquina!';
    cmerrEmModoDemo :  
      Result := 'O Cyber-Manager está sendo executado em modo demonstração';
    cmerrNumMaxMaq :
      Result := 'Limite de máquinas licenciadas foi atingido';
    cmerrSemNovaVersao : 
      Result := 'Não há nova versão disponível no servidor';  
    cmerrErroSocket :
      Result := 'Erro de comunicação TCP/IP';  
    cmerrMaqJaEstaManutencao  :
      Result := 'Máquina está em manutenção';
    cmerrMaqNaoEstaManutencao :
      Result := 'Máquina não está em modo manutenção';
    cmerrAcessoNaoPermitido :
      Result := 'Você não possui direito de executar essa operação';  
  else
    Result := '';    
  end;
end;
  

end.
