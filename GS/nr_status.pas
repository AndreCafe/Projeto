unit nr_status;

interface

const

  stcNovo            = 1; // Recente, Premium=False, sem redir
  stcEntrante        = 2; // registrou a mais de 2 dias, nao tem redir, nao é premium e nao teve contato do call-center
  stcEmTeste         = 3; // Em teste:             registrou a mais de 2 dias mas não teve contato 
  stcEmTesteCompleto = 4; // Em teste completo:    já fez redir 
  stcUsando          = 5; // premium OU redir por mais que 10 dias e não pode ficar 5 dias sem redir
  stcLimbo           = 6; // premium inativo OU sem redir mas ativo
  stcSaindo          = 7; // Inativo, Premium = False
  stcSaiu            = 8; // Saiu, Premium = False


  dias_redir_usou = 10;
  dias_parouredir = 5;
  dias_limbosemredir = 21;
  
  dias_premium = 10;
  dias_recente = 1;
  dias_inativo = 5;
  dias_saiu    = 15;

implementation

end.
