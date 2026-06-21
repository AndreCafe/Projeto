; *** Inno Setup version 2.0.8+ Brazilian Portuguese messages ***
;
; Authors: Josue Andrade Gomes <josuegomes@hotmail.com>
;          Rubem Pechansky <pechansky@hypervisual.com>
; Last update: July 5, 2001
; Please send corrections, suggestions, etc.
;
; This translation is based in Josue's previous work for Inno Setup 1.3.x and
; and Sérgio de Araujo Farias <sergiofarias@bol.com.br> work for Inno Setup Extensions
;
; (March, 22 2000) Thanks to André Viol <andre@viol.net> for a better translation to ClickNext
;
;   ClickNext=Clique Avançar para continuar, Cancelar para terminar.
;
; WARNING:
;
;  This translation is not suitable for European Portuguese.
;

[LangOptions]
LanguageName=Brazilian Portuguese
LanguageID=$0416
; If the language you are translating to requires special font faces or
; sizes, uncomment any of the following entries and change them accordingly.
;DialogFontName=MS Shell Dlg
;DialogFontSize=8
;DialogFontStandardHeight=13
;TitleFontName=Arial
;TitleFontSize=29
;WelcomeFontName=Arial
;WelcomeFontSize=12
;CopyrightFontName=Arial
;CopyrightFontSize=8

[Messages]

; *** Application titles
SetupAppTitle=Programa de Instalação
SetupWindowTitle=Programa de Instalação - %1
UninstallAppTitle=Desinstalação
UninstallAppFullTitle=Desinstalação do %1

; *** Icons
DefaultUninstallIconName=Desinstalar o %1

; *** Misc. common
InformationTitle=Informação
ConfirmTitle=Confirmação
ErrorTitle=Erro

; *** SetupLdr messages
SetupLdrStartupMessage=Este programa irá instalar o %1. Você gostaria de continuar?
LdrCannotCreateTemp=Não foi possível criar um arquivo temporário. Instalação abortada
LdrCannotExecTemp=Não foi possível executar um arquivo na pasta de arquivos temporários. Instalação abortada

; *** Startup error messages
LastErrorMessage=%1.%n%nErro %2: %3
SetupFileMissing=O arquivo %1 está faltando na pasta de instalação. Corrija o problema ou obtenha uma nova cópia do programa.
SetupFileCorrupt=Os arquivos de instalação estão corrompidos. Obtenha uma cópia nova do programa.
SetupFileCorruptOrWrongVer=Os arquivos de instalação estão corrompidos ou são incompatíveis com esta versão do Programa de Instalação. Corrija o problema ou obtenha uma cópia nova.
NotOnThisPlatform=Este programa não irá executar no %1.
OnlyOnThisPlatform=Este programa deverá executar no %1.
WinVersionTooLowError=Este programa exige o %1 versão %2 ou mais nova.
WinVersionTooHighError=Este programa não pode ser instalado no %1 versão %2 ou mais nova.
AdminPrivilegesRequired=Você deverá estar logado como administrador para instalar este programa.
SetupAppRunningError=O Programa de Instalação detectou que %1 está executando.%n%nPor favor, feche todas as suas instâncias agora, e então clique em OK para continuar, ou Cancelar para sair.
UninstallAppRunningError=O programa de desinstalação detectou que %1 está executando.%n%nPor favor, feche todas as suas instâncias agora, e então clique em OK para continuar, ou Cancelar para sair.

; *** Misc. errors
ErrorCreatingDir=O Programa de Instalação não pode criar a pasta "%1"
ErrorTooManyFilesInDir=Não foi possível criar um arquivo no pasta "%1" - muitos arquivos

; *** Setup common messages
ExitSetupTitle=Terminar a instalação
ExitSetupMessage=A instalação não está completa. Se você terminar agora, o programa não será instalado.%n%nVocê poderá tentar novamente mais tarde para completar a instalação.%n%nTerminar a instalação?
AboutSetupMenuItem=&Sobre o Programa de Instalação...
AboutSetupTitle=Sobre o Programa de Instalação
AboutSetupMessage=%1 versão %2%n%3%n%n%1 home page:%n%4
AboutSetupNote=

; *** Buttons
ButtonBack=< &Voltar
ButtonNext=&Avançar >
ButtonInstall=&Instalar
ButtonOK=OK
ButtonCancel=Cancelar
ButtonYes=&Sim
ButtonYesToAll=Sim para &Todos
ButtonNo=&Não
ButtonNoToAll=Nã&o para Todos
ButtonFinish=&Concluir
ButtonBrowse=&Procurar...

; *** Common wizard text
ClickNext=Clique Avançar para continuar, Cancelar para encerrar.
ClickNextModern=Clique em Avançar para continuar, ou em Cancelar para encerrar a instalação.
BeveledLabel=

; *** "Welcome" wizard page
WizardWelcome=Bem-vindo
WelcomeLabel1=Bem-vindo ao Assistente de Instalação do [name].
WelcomeLabel2=Este programa irá instalar o [name/ver] no seu computador.%n%nÉ recomendado que você feche as aplicações abertas antes de continuar. Isto evitará conflitos durante a instalação.

; *** "Password" wizard page
WizardPassword=Senha
PasswordLabel1=Esta instalação está protegida por senha.
PasswordLabel3=Por favor digite a senha e então clique em Avançar para continuar. Maiúsculas e minúsculas são diferentes.
PasswordEditLabel=&Senha:
IncorrectPassword=A senha que você digitou não está correta. Tente novamente.

; *** "License Agreement" wizard page
WizardLicense=Contrato de Licença de Uso
LicenseLabel=Leia as seguintes informações importantes antes de continuar.
LicenseLabel1=Leia o contrato de licença a seguir. Use a barra de rolagem ou pressione a tecla Page Down para ver o resto do contrato.
LicenseLabel2=Você aceita todos os termos do Contrato de Licença acima? Se escolher Não, o Programa de Instalação será fechado. Para instalar [name], você precisa aceitar este contrato.

; *** "Information" wizard page
WizardInfoBefore=Informação
InfoBeforeLabel=Leia as seguintes informações importantes antes de continuar.
InfoBeforeClickLabel=Quando você estiver pronto para continuar clique em Avançar.
WizardInfoAfter=Informação
InfoAfterLabel=Leia as seguintes informações importantes antes de continuar.
InfoAfterClickLabel=Quando você estiver pronto para continuar clique em Avançar.

; *** "Select Destination Directory" wizard page
WizardSelectDir=Escolha a pasta destino
SelectDirDesc=Onde [name] será instalado?
SelectDirLabel=Escolha a pasta onde você quer instalar [name] e então clique em Avançar.
DiskSpaceMBLabel=Este programa exige [mb] MB de espaço.
ToUNCPathname=O Programa de Instalação não pode instalar em um caminho UNC. Se você está tentando instalar em uma rede, você precisa mapear uma unidade da rede.
InvalidPath=Você deve entrar um caminho completo com a letra da unidade; por exemplo:%nC:\APP
InvalidDrive=A unidade não existe. Escolha outra.
DiskSpaceWarningTitle=Não há espaço suficiente.
DiskSpaceWarning=O Programa de Instalação exige %1 KB de espaço livre para instalar, mas a unidade selecionada tem somente %2 KB disponíveis.%n%você quer continuar?
BadDirName32=O nome da pasta não pode conter os seguintes caracteres:%n%n%1
DirExistsTitle=A pasta já existe
DirExists=A pasta%n%n%1%n%njá existe. Você gostaria de instalar nesta pasta?
DirDoesntExistTitle=A pasta não existe.
DirDoesntExist=A pasta :%n%n%1%n%nnão existe. Você gostaria de criar a pasta?

; *** "Select Components" wizard page
WizardSelectComponents=Selecione Componentes
SelectComponentsDesc=Que componentes serão instalados?
SelectComponentsLabel2=Selecione os componentes que você quer instalar, desmarque os componentes que você não quer instalar. Clique em Avançar quando você estiver pronto para continuar.
FullInstallation=Instalação Completa
; if possible don't translate 'Compact' as 'Minimal' (I mean 'Minimal' in your language)
CompactInstallation=Instalação Compacta
CustomInstallation=Instalação Personalizada
NoUninstallWarningTitle=Componentes Encontrados
NoUninstallWarning=O Programa de Instalação detectou que os seguintes componentes estão instalados em seu computador:%n%n%1%n%nDesmarcando estes componentes eles não serão desinstalados.%n%nVocê gostaria de continuar assim mesmo?
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceMBLabel=Seleção atual requer [mb] MB de espaço.

; *** "Select Additional Tasks" wizard page
WizardSelectTasks=Selecione Tarefas Adicionais
SelectTasksDesc=Que tarefas adicionais serão executadas?
SelectTasksLabel2=Selecione as tarefas adicionais que você gostaria que o Programa de Instalação execute enquanto instala o [name] e então clique em Avançar.
ReadyMemoTasks=Tarefas adicionais:

; *** "Select Program Group" wizard page
WizardSelectProgramGroup=Escolha a pasta do Menu Iniciar
SelectStartMenuFolderDesc=Onde o Programa de Instalação irá criar os ícones do programa?
SelectStartMenuFolderLabel=Escolha a pasta do Menu Iniciar onde o Setup Programa de Instalação irá criar os ícones do programa e então clique em Avançar.
NoIconsCheck=Não criar ícones
MustEnterGroupName=Você deve digitar um nome de uma pasta do Menu Iniciar.
BadGroupName=O nome do pasta não pode incluir os seguintes caracteres:%n%n%1
NoProgramGroupCheck2=&Não criar a pasta do Menu Iniciar

; *** "Ready to Install" wizard page
WizardReady=Pronto para Instalar
ReadyLabel1=O Programa de Instalação está pronto para iniciar a instalar [name] no seu computador.
ReadyLabel2a=Clique em Instalar para iniciar a instalação, ou clique Voltar se você quer rever ou verificar suas opções.
ReadyLabel2b=Clique em Instalar para iniciar a instalação.
ReadyMemoDir=Diretório Destino:
ReadyMemoType=Tipo de Instalação:
ReadyMemoComponents=Componentes Selecionados:
ReadyMemoGroup=Grupo de Programas:

; *** "Installing" wizard page
WizardInstalling=Instalando
InstallingLabel=Aguarde enquanto o Programa de Instalação instala [name] em seu computador.

; *** "Setup Completed" wizard page
WizardFinished=Instalação Terminada
FinishedLabelNoIcons=O Programa de Instalação terminou de instalar [name] no seu computador.
FinishedLabel=O Programa de Instalação terminou de instalar [name] no seu computador. A aplicação pode ser iniciada escolhendo os ícones instalados.
ClickFinish=Clique em Concluir para finalizar o Programa de Instalação.
FinishedRestartLabel=Para completar a instalação do [name], o Programa de Instalação deverá reiniciar o seu computador. Você gostaria de reiniciar agora?
FinishedRestartMessage=Para completar a instalação do [name], o Programa de Instalação deverá reiniciar o seu computador. Você gostaria de reiniciar agora?
ShowReadmeCheck=Sim, eu quero ver o arquivo LEIAME
YesRadio=&Sim, reiniciar o computador agora
NoRadio=&Não, eu reiniciarei o computador mais tarde
; used for example as 'Run MyProg.exe'
RunEntryExec=Executar %1
; used for example as 'View Readme.txt'
RunEntryShellExec=Visualizar %1

; *** "Setup Needs the Next Disk" stuff
ChangeDiskTitle=O Programa de Instalação precisa do próximo disco
SelectDirectory=Escolha a Pasta
SelectDiskLabel2=Insira o disco %1 e clique OK.%n%nSe os arquivos deste disco estiverem em uma outra pasta, digite o caminho correto ou clique em Procurar.
PathLabel=&Caminho:
FileNotInDir2=O arquivo "%1" não pôde ser encontrado em "%2". Insira o disco correto ou escolha outra pasta.
SelectDirectoryLabel=Indique a localização do próximo disco.

; *** Installation phase messages
SetupAborted=A instalação não foi completada.%n%nCorrija o problema e execute o Programa de Instalação novamente.
EntryAbortRetryIgnore=Clique Repetir para tentar novamente, Ignorar para continuar, Anular para cancelar.

; *** Installation status messages
StatusCreateDirs=Criando pastas...
StatusExtractFiles=Extraindo arquivos...
StatusCreateIcons=Criando ícones...
StatusCreateIniEntries=Criando entradas INI...
StatusCreateRegistryEntries=Criando entradas no registro...
StatusRegisterFiles=Registrando arquivos...
StatusSavingUninstall=Salvando informação para desinstalação...
StatusRunProgram=Terminando a instalação...

; *** Misc. errors
ErrorInternal=Erro interno %1
ErrorFunctionFailedNoCode=%1 falhou
ErrorFunctionFailed=%1 falhou; código %2
ErrorFunctionFailedWithMessage=%1 falhou; código %2.%n%3
ErrorExecutingProgram=Não foi possível executar:%n%1

; *** DDE errors
ErrorDDEExecute=DDE: Erro durante a transação "execute" (código: %1)
ErrorDDECommandFailed=DDE: Comando não executou com sucesso
ErrorDDERequest=DDE: Erro durante a transação "request" (código: %1)

; *** Registry errors
ErrorRegOpenKey=Erro ao abrir a chave de registro:%n%1\%2
ErrorRegCreateKey=Erro ao criar a chave de registro:%n%1\%2
ErrorRegWriteKey=Erro ao escrever na chave de registro:%n%1\%2

; *** INI errors
ErrorIniEntry=Error creating INI entry in file %1.

; *** File copying errors
FileAbortRetryIgnore=Clique Repetir para tentar novamente, Ignorar para ignorar este arquivo (não recomendado), ou Anular para cancelar a instalação.
FileAbortRetryIgnore2=Clique Repetir para tentar novamente, Ignorar para continuar assim mesmo (não recomendado), ou Anular para cancelar a instalação.
SourceIsCorrupted=O arquivo de origem está corrompido
SourceDoesntExist=O arquivo de origem "%1" não existe
ExistingFileReadOnly=O arquivo existente no seu computador está marcado como somente para leitura.%n%nClique em Repetir para remover o atributo de somente leitura e tentar novamente, Ignorar para continuar, ou Anular para cancelar a instalação.
ErrorReadingExistingDest=Um erro ocorreu ao tentar ler o arquivo existente no seu computador.
FileExists=O arquivo já existe.%n%nVocê gostaria de sobrescrevê-lo?
ExistingFileNewer=O arquivo existente no seu computador é mais novo que aquele que o Programa de Instalação está tentando instalar. É recomendado que você mantenha o arquivo existente.%n%nVocê quer manter o arquivo existente?
ErrorChangingAttr=Um erro ocorreu ao tentar mudar os atributos do arquivo existente no seu computador.
ErrorCreatingTemp=Um erro ocorreu ao tentar criar um arquivo na pasta destino.
ErrorReadingSource=Um erro ocorreu ao tentar ler o arquivo fonte:
ErrorCopying=Um erro ocorreu ao tentar compiar um arquivo.
ErrorReplacingExistingFile=Um erro ocorreu ao tentar substituir um arquivo existente:
ErrorRestartReplace=RestartReplace falhou:
ErrorRenamingTemp=Um erro ocorreu ao tentar renomear um arquivo na pasta destino:
ErrorRegisterServer=Não foi possível registrar DLL/OCX: %1
ErrorRegisterServerMissingExport=DllRegisterServer não encontrado
ErrorRegisterTypeLib=Não foi possível registrar a biblioteca de tipos: %1

; *** Post-installation errors
ErrorOpeningReadme=Um erro ocorreu ao tentar abrir o arquivo LEIAME.
ErrorRestartingComputer=O Programa de Instalação não conseguiu reiniciar o computador. Por favor faça isso manualmente.

; *** Uninstaller messages
UninstallNotFound=O arquivo "%1" não existe. Não é possível desinstalar.
UninstallUnsupportedVer=O arquivo de log de desinstação "%1" está em um formato que não é reconhecido por esta versão do desinstalador. Não é possível desinstalar
UninstallUnknownEntry=Uma entrada desconhecida (%1) foi encontrada no log de desinstalação
ConfirmUninstall=Você tem certeza que quer remover completamente %1 e todos os seus componentes?
OnlyAdminCanUninstall=Está instalação só pode ser desinstalada por um usuário com privilégios administrativos.
UninstallStatusLabel=Por favor, aguarde enquanto o %1 é removido do seu computador.
UninstalledAll=O %1 foi removido com sucesso do seu computador.
UninstalledMost=A desinstalação do %1 terminou.%n%nAlguns elementos não podem ser removidos. Estes elementos podem ser removidos manualmente.
UninstallDataCorrupted=O arquivo "%1" está corrompido. Não pode desinstalar

; *** Uninstallation phase messages
ConfirmDeleteSharedFileTitle=Remover arquivo compartilhado?
ConfirmDeleteSharedFile2=O sistema indicou que o seguinte arquivo compartilhado não está mais sendo usando por nenhum outro programa. Você gostaria de remover este arquivo compartilhado?%n%n%Se qualquer programa ainda estiver usando este arquivo e ele for removido, este programa pode não funcionar corretamente. Se você não tiver certeza, escolha Não. Manter o arquivo no computador não causará nenhum problema.
SharedFileNameLabel=Nome do Arquivo:
SharedFileLocationLabel=Localização:
WizardUninstalling=Progresso da Desinstalação
StatusUninstalling=Desinstalando %1...

