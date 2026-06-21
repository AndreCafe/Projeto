unit cmIDRecursos;

interface

uses
  classes,
  SysUtils;

  function ItemTrueStr(S: String; Item: Integer): Boolean;
  function ItemTrueSL(SL: TStrings; Item: Integer): Boolean;

const
  daMaqConfigurar     = 01;
  daMaqFecharCMGuard  = 02;
  daMaqModoManutencao = 03;
  daMaqFecharCMServer = 04;
  daTraDesconto       = 05;
  daEstCompras        = 06;
  daEstEntrada        = 07;
  daEstSaida          = 08;
  daCliCadastrar      = 09;
  daCliApagar         = 10;
  daCliMarcarIsento   = 11;
  daCliDebitarTempo   = 12;
  daProCadastrar      = 13;
  daProApagar         = 14;
  daProEditarPreco    = 15;
  daCaiVerAntes       = 16;
  daCaiVerAntesOutros = 17;
  daCaiSuprimento     = 18;
  daCaiSangria        = 19;
  daCaiAbrirFechar    = 20;
  daCaiVerAtual       = 21;
  daCFGParametros     = 22;
  daCFGPrecos         = 23;
  daPPGImpPPInvalido  = 24;
  daPPGImpPPValido    = 25;
  daPPGEditaFmtImpPP  = 26;

  daQuantidade        = daPPGEditaFmtImpPP;

  daDefault = [daCliCadastrar, daProCadastrar, daCaiAbrirFechar, daCaiVerAtual];

  daDescr : Array[1..daQuantidade] of String = (
    'Configurar Programas Permitidos aos Clientes',
    'Fechar o CM-Guard',
    'Entrar em Modo Manutenção', 
    'Fechar o CM-Server',
    'Dar Descontos',
    'Lançar Compras',
    'Lançar Entradas (Ajuste de Estoque)',
    'Lançar Saidas (Ajuste de Estoque)',
    'Cadastrar/Alterar dados de Clientes',
    'Apagar Clientes',
    'Marcar Clientes como Isento',
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
    'Imprimir códigos pré-pagos inválidos',
    'Imprimir códigos pré-pagos válidos',
    'Editar formato de impressão de códigos pré-pagos');

implementation

uses cmListaID;  

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
