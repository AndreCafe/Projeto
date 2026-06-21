unit ocmIDRecursos;

interface

uses
  SysUtils;

const

// ID dos Recursos
reRamais=1;
reChamadas=2;
reOcorrencias=3;
rePedidos=4;
reContatos=5;
reProdutos=6;
reVendas=7;
reUsuarios=8;
reEntregadores=9;
reGrupos=10;
reAssuntos=11;
reMicrosiga=12;
rePastas=13;


reCompartilhamentoPasta = 200;

NumRecursos=rePastas;

// ID dos Tipos de Acessos
taTotal=1;
taLeitura=2;
taGravacao=3;
taExporta=4;
taImprime=5;
taSalvaLayout=6;
taPublicaLayout=7;
taAlteraLayout=8;
taGrafico=9;
taSelecionaPasta=10;
taCriaPasta=11;
taTarifacao=12;

NumTipoAcessos=taCriaPasta;

  function StringTipoAcesso(ID: Integer): String;
  function StringRecurso(ID: Integer): String;
  function TipoAcessoValido(Recurso, ID: Byte): Boolean;
  function AcessoMinimo(Recurso: Byte): Byte;

implementation

function TipoAcessoValido(Recurso, ID: Byte): Boolean;
begin
  case Recurso of
    rePastas       : Result := (ID in [taTotal, taCriaPasta, taSelecionaPasta]);
    reContatos     : 
      Result := (ID in [taTotal..taGrafico, taTarifacao]);
      
    reCompartilhamentoPasta :
      Result := (ID in [taTotal, taLeitura, taGravacao]);
  else
    Result := (ID <= taGrafico);    
  end;
end;

function AcessoMinimo(Recurso: Byte): Byte;
begin
  case Recurso of
    rePastas : Result := taSelecionaPasta;
  else
    Result := taLeitura;
  end;  
end;


function StringRecurso(ID: Integer): String;
begin
  case ID of
    reRamais       : Result := 'Ramais';
    reChamadas     : Result := 'Chamadas';
    reOcorrencias  : Result := 'Ocorrencias';
    rePedidos      : Result := 'Pedidos';
    reContatos     : Result := 'Contatos';
    reProdutos     : Result := 'Produtos';
    reVendas       : Result := 'Vendas';
    reUsuarios     : Result := 'Usuarios';
    reEntregadores : Result := 'Entregadores';
    reGrupos       : Result := 'Grupos';
    rePastas       : Result := 'Pastas';
    reAssuntos     : Result := 'Assuntos';
    reMicrosiga    : Result := 'Contatos Microsiga';
    reCompartilhamentoPasta :
      Result := 'Compartilhamento de Pasta';
  else
    Result := IntToStr(ID);
  end;
end;


function StringTipoAcesso(ID: Integer): String;
begin
  case ID of
    taTotal         : Result := 'Total';
    taLeitura       : Result := 'Leitura';
    taGravacao      : Result := 'Gravação';
    taExporta       : Result := 'Exporta';
    taImprime       : Result := 'Imprime';
    taSalvaLayout   : Result := 'Salva Layout';
    taPublicaLayout : Result := 'Publica Layout';
    taAlteraLayout  : Result := 'Altera Layout';
    taGrafico       : Result := 'Gráfico';
    taSelecionaPasta: Result := 'Seleciona Pastas';
    taCriaPasta     : Result := 'Cria Pastas';
    taTarifacao     : Result := 'Tarifação';
  else
    Result := IntToStr(ID);
  end;
end;



end.
