program nexCafe5PrintCommand;

{
    nunca ativar Project -> options -> linker - Generate Console Application
    nem adicionar  diretiva $APPTYPE CONSOLE.

    Assim nao temos stdOut/stdIn mas app nao abre a janela de consola

    Dario 01/10/2011


    Incluir NOLOG como diretiva em Project->Options->Directoties/Conditional->conditional defines
    Dario 4/11/2011
}
uses
  SysUtils;

Const
  kInstallDir = 'c:\gs';
  kredmonDir = 'redmon17';
  kgs904Version  = '9.04';
  kgs904Dir  = 'gs'+kgs904Version;
  kgs90432  = 'gs904w32.exe';
  kgs90464  = 'gs904w64.exe';
  kTempoRestante1 = 'Tempo restante:';
  kDownloadServer = 'www.nexcafe.com.br';
  kDownloadPath   = '/dnld/';
  kDescarregado = 'descarregado.';
  kPrinterDriver = 'HP Color LaserJet 4550 PS';
  kLmPrinterName = 'Nexcafé PS printer';
  kLmPrinterCommand = 'C:\\nexcafe\\nexCafe5PrintCommand.exe';
  kLmPrinterArguments = '/p="'+kPrinterDriver+'"';



begin


end.
