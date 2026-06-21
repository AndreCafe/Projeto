unit nr_consts;

interface

const
  Email_TodosCli    = '__TODOSCLIENTES';
  Email_Cybermgr    = '__TODOSCYBERMGR';
  Email_Definitivos = '__TODOSDEF';
  MaxTriesEmail     = 10;

  TodosNextar = 'todos@nextar.com.br';

  opChecaConta         = 1;
  opObtemDadosConta    = 2;
  opModoDemo           = 3;
  opTrocaHD            = 4;
  opCriarConta         = 5;
  opAtualizaDadosConta = 6;
  opPirata             = 7;
  opUpgradeNex         = 8;
  opObtemContaPorEmail = 9;
  opObtemContaPorEquip = 10;
  opObtemSenha         = 11;
  opSalvaEst           = 12;
  opAtivarConta        = 13;
  opObtemParamAss      = 14;
  opObtemDadosCobranca = 15;
  opAssinar            = 16;
  opAlterarSenha       = 17;
  opObtemBoletos       = 18;
  opCancelarBoleto     = 19;
  
  OpString : Array[opChecaConta..opCancelarBoleto] of String = (
    'ChecaConta      ',
    'ObtemDadosConta ',
    'ModoDemo        ',
    'TrocaHD         ',
    'CriarConta      ',
    'AtualizaConta   ',
    'Pirata',
    'Upgrade para Nex',
    'ContaPorEmail   ',
    'ContaPorEquip   ',
    'ObtemSenha      ',
    'Salva Estat.    ',
    'Ativar Conta    ',
    'Param Assinatura',
    'Obtem Dados Cob.',
    'Assinar         ',
    'Alterar Senha   ',
    'ObtemBoletos    ',
    'CancelarBoleto  ');

implementation

end.
