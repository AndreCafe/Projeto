unit uDTSyncDef;

interface

uses
  Classes,
  SysUtils,
  filectrl;

const
  // ID de Operações no Log
  iolUpload     = 0;
  iolDownload   = 1;
  iolImportacao = 2;
  iolExportacao = 3;
  iolImpUpload  = 4;
  iolDebug      = 5;
  iolRAF        = 6;

  // Status de fechamento de RA de tecnico
  sfratPendente    = 0;
  sfratAprovado    = 1;
  sfratAprovDiverg = 2;
  sfratReprovado   = 3;


  // Status de fechamento de RA do cliente
  sfracNaoPaga     = 0;
  sfracPendente    = 1;
  sfracAprovado    = 2;
  sfracAprovDiverg = 3;
  sfracNaoCobrar   = 4;

  // Tipos de Itens de RA
  tiraKM         = 0;
  tiraPedagio    = 1;
  tiraRefeicao   = 2;
  tiraHospedagem = 3;
  tiraOutros     = 4;
  
  
  Path : String = 'A:\';
  TempPath : String = 'C:\Windows\Temp\DiaTec\';
  
  cfgDir     : String = 'A:\';
  cfgSrv     : String = 'localhost';
  cfgPort    : Integer = 27000;
  cfgDirDBF  : String = 'C:\AP6\DiaTec';
  cfgVersao  : String = '310';
  cfgPortHTTP: Integer = 0;
  cfgLogUpload : Boolean = False;
  cfgIgnorarVerCli : Boolean = False;
  cfgTamProjeto : Integer = 15;

  cfgServiceName : String = 'DiaTec';
  cfgServiceDisplayName : String = 'Diário do Técnico';
  cfgAlias : String = 'DiaTec';
  cfgArqDup : String = 'OSKEYVIOL.TXT';
  cfgNomeARM : String = '';

 // Status de Controle
  stCtrlLiberado       = 0;
  stCtrlUploadExp      = 1;
  stCtrlDownloadImp    = 2;

 // Erros de acesso ao controle
  errCtrlErroLogin    = 1000;
  errCtrlFalhaConexao = 1001;
  errCtrlEmUso        = 1002;
  errCtrlVersaoAntiga = 1003;

 // Erros Gerais
  errClienteProjetoNaoInformado = 2000; 
  errClienteNaoInformado        = 2001;

 // Nomes dos arquivos de semáforo que controlam o acesso aos DBFs 
  DBFLIBERADO = 'LIBERADO.SEM';   
  DBFPROTHEUS = 'PROTHEUS.SEM';  // Protheus sinaliza que está trabalhando nos arquivos DBF
  DBFUPLOAD   = 'UPPEND.SEM';    // DiaTec sinaliza p/ Protheus que existe upload a serem processados
  DBFDOWN     = 'DOWNPEND.SEM';  // Protheus sinaliza p/ DiaTec que existe download a ser feito
  DBFDIATEC   = 'DIATEC.SEM';    // DiaTec sinaliza que está trabalhando nos arquivos DBF
  DBFERR      = 'DTERR.SEM';     // Erro na importação dos dados

   { ListaProj - Valores possíveis para campo ListaProj do cadastro de técnicos
     *** Esses valores só têm efeito caso campo ObedeceListaProj da tabelas de 
         paramêtros esteja TRUE }
  
  lpTotal         = '0';  // Não há nenhum tipo de restrição no download de projetos
  lpExigeCliente  = '1';  // Sem restrição de amarração porém exige que técnico informe o cliente
  lpExigeProjeto  = '2';  // Sem restrição de amarração porém exige que técnico informa o cliente / projeto
  
  lpAmarrados     = '3';  // Técnico lista apenas clientes / projetos em que ele esteja amarrado
  lpAmarradosCli  = '4';  // Só amarrados + exigência de informar o código do cliente
  lpAmarradosProj = '5';  // Só amarrados + exigência de informar o código do cliente + projeto 
  
  lpValidos      = [lpTotal..lpAmarradosProj];
  lpProjetos     = [lpExigeProjeto, lpAmarradosProj];
  lpClientes     = [lpExigeCliente, lpAmarradosCli];
  lpExigeCliProj = lpProjetos + lpClientes;

  lpDefault      = lpExigeProjeto;  // Valor usado caso campo ListaProj nao contenha nenhum dos valores acima

  cDiatecPar  = 'DiaTec_Par';
  cDiatecUp   = 'DiaTec_Up';
  cDiatecLog  = 'DiaTec_Log';
  cDiatecTemp = 'DiaTec_Temp';
  cDiatecRA   = 'Diatec_RA';

  function GetSyncErrorMsg(Error: Integer): String;
  function AppFolder: String;
  procedure LePortaFF;
  function ObtemStrOperacao(O: Integer): String;
  function NomeAlias(S: String): String;


implementation

function NomeAlias(S: String): String;
var
  sArm: String;
  I: Integer;
begin
  sArm := cfgNomeArm;
  for I := 1 to Length(sArm) do
    if sArm[I]=' '  then sArm[I] := '_';
  if sArm>'' then
    Result := sArm+'_'+S
  else
    Result := S;
end;

function ObtemStrOperacao(O: Integer): String;
begin
  case O of
    iolUpload     : Result := 'Upload';
    iolDownload   : Result := 'Download';
    iolImportacao : Result := 'Importação DBF';
    iolExportacao : Result := 'Exportação DBF';
    iolImpUpload  : Result := 'Importação de Upload';
    iolDebug      : Result := 'Debug';
    iolRAF        : Result := 'Fechamento de RAs';      
  else
    Result := 'ERRO ! ' + IntToStr(O);  
  end;
end;


procedure LePortaFF;
var List : TStringList;
    lCD  : Boolean;
    S : String;
begin
  lCD := False;
  Path := ParamStr(0);
  while Path[Length(Path)] <> '\' do
  Delete(Path, Length(Path), 1);

  //Verifica se está rodando do CD
  if not DirectoryExists(path+'teste') then
    if not CreateDir(path+'teste') then
       lCD := True
    else
       RemoveDir(path+'teste');

  List := TStringList.Create;

  //se estiver rodando do CD força o caminho para o disquete (unidade A:)
  //senão procura o arquivo .INI localmente, se não achou busca na unidade A:

  If not lCD then
     Try
        List.LoadFromFile(Path+'DIATEC.INI');
        //Variáveis de configuração
        cfgDir := List.Values['Dir'];
        cfgSrv := List.Values['IP'];
        
        

        cfgPort      := StrToIntDef(List.Values['Porta'], cfgPort);
        cfgTamProjeto:= StrToIntDef(List.Values['TamanhoProjeto'], cfgTamProjeto);
        cfgPortHTTP  := StrToIntDef(List.Values['PortaHTTP'], cfgPortHTTP);
        cfgDirDBF    := List.Values['DirDBF'];
        cfgIgnorarVerCli := SameText(List.Values['IgnorarVerCli'], 'S');
        cfgLogUpload := (UpperCase(List.Values['LogUpload'])='S');
        if List.Values['Name'] > '' then
          cfgServiceName := List.Values['Name'];

        if List.Values['ARM'] > '' then
          cfgNomeARM     := List.Values['ARM'];  

        if List.Values['DisplayName'] > '' then
          cfgServiceDisplayName := List.Values['DisplayName'];

        if List.Values['Alias'] > '' then
          cfgAlias := List.Values['Alias'];
     except
        lCD := True;
     end;

  If lCD then
     Try
        List.LoadFromFile('A:\DIATEC.INI');
        //Variáveis de configuração
        cfgDir := List.Values['Dir'];
        cfgSrv := List.Values['IP'];
        cfgPort := StrToIntDef(List.Values['Porta'],cfgPort);
        cfgDirDBF := List.Values['DirDBF'];
     except
     end;

  cfgDirDBF := Trim(cfgDirDBF);   
  if (cfgDirDBF > '') and (cfgDirDBF[Length(cfgDirDBF)]<>'\') then
    cfgDirDBF := cfgDirDBF + '\';
       
  If cfgDir = '' then  //Não abriu o INI
     Path := 'A:\'
  Else
     Path := cfgDir;

  List.Free;

  if (Pos('DIATECSERV.EXE', UpperCase(ParamStr(0)))=0) and
     (Pos('DIATECSVC.EXE', UpperCase(ParamStr(0)))=0) and
     (not DirectoryExists(path+'tabelas')) and
     (not CreateDir(path+'tabelas')) then
    raise Exception.Create('Não foi possível criar diretório '+path+#13+'verifique localização dos dados');
      
end;

function AppFolder: String;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

function GetSyncErrorMsg(Error: Integer): String;
begin
  case Error of
    stCtrlLiberado : 
      Result := 'Sincronização Liberada';
    errCtrlErroLogin :
      Result := 'Username ou Senha inválida !';  
    errCtrlFalhaConexao :
      Result := 'Não foi possível estabelecer conexão com o servidor';  
    errCtrlEmUso :
      Result := 'Servidor está ocupado ... Tente novamente dentro de alguns instantes'; 
    errCtrlVersaoAntiga :
      Result := 'A versão do seu cliente é muito antiga ... baixe nova versão do FTP';      

    stCtrlDownloadImp :
      Result := 'Servidor está importando dados do Protheus ... Tente novamente dentro de alguns instantes';  
    stCtrlUploadExp :
      Result := 'Servidor está exportando dados para o Protheus ... Tente novamente dentro de alguns instantes';

    errClienteProjetoNaoInformado :
      Result := 'Cliente e Projeto devem ser informados!';

    errClienteNaoInformado :
      Result := 'Cliente deve ser informado!';
      
  else
    Result := '';
  end;
end;

end.
