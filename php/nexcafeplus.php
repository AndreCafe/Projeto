<?php

// NEXCAFÉ PLUS
// Módulo Plus
//
//
//
// [[ TEMPLATES ]] 
//
// HOMES
// home_novo 				-> Nome não Cadastrado
// home_servicos 			-> Oferta de Serviços
// home_painel 				-> Painel de Controle
//
// CADASTROS
// cadastro_novo 			-> Página de Cadastro do Plus
// cadastro_editar			-> Página de Cadastro do Plus / Edição
// cadastro_servico			-> Carrinho de Adesão do Serviço
// 
// IFRAMES
// parceiro					-> Painel de Controle do Parceiro
//
// RELATÓRIO
// relatorio_transacoes		-> Página de extrato do Paypal
//
// EXECUTES
// execute					-> Processa POST de formulários e executes
//
//
// [[ PROCEDURES DA APLICAÇÃO ]]
// 
// SELECTS
// getAccount				-> Autentica os dados da conta da Nexcafé
// getCadastro				-> Puxa os dados de cadastro Plus
// getServico				-> Puxa os dados do servico
// getSaldo					-> Puxa o saldo da conta no paypal
// getVenda					-> Puxa os dados da transacao
// getReport				-> Puxa o extrato do Paypal
// getPaypal				-> Puxa os dados da conta dele no Paypal
//
// EXECUTES
// sendCadastro				-> Atualiza o cadastro Plus
// sendServico				-> Aceita os termos do serviço (associa na conta)
// sendPayAuth				-> Autentica o usuário na plataforma
//
//
//
// [[ MAIN ARRAYS ]]
//
// OBJETOS
// plusTemplate				-> Objeto do Template atual (e operação)
// plusAccount				-> Objeto na NexCafé
// plusCadastro				-> Objeto do Cadastro
// plusServico				-> Objeto de Serviços
// plusPaypal				-> Objeto do PayPal
//
// PLUSTEMPLATE
// plusTemplate->template	-> Template Atual
// plusTemplate->parametros	-> Parametros GET ou POST
//
// PLUSACCOUNT
// plusAccount->id			-> ID no cadastro nexcafe
// plusAccount->email		-> email cadastro nexcafe
// plusAccount->adm			-> se é administrador ou não
// plusAccount->versao		-> versao do software
// plusAccount->cripto		-> chave de criptografia da autenticação
//
// PLUSCADASTRO
// plusCadastro->tipo		-> pessoa física ou juridica
// plusCadastro->cpfcnpj	-> cpf ou cnpj
// plusCadastro->rgie		-> rg ou ie
// plusCadastro->nome		-> nome completo ou razao social
// plusCadastro->cep		-> cep
// plusCadastro->endereco	-> endereco
// plusCadastro->numero		-> numero
// plusCadastro->comp		-> complemento, bairro etc
// plusCadastro->cidade		-> cidade
// plusCadastro->uf			-> uf
//
// PLUSSERVICO
// plusServico->ativo[id]->id		-> ID do Servico Ativo
// plusServico->ativo[id]->nome		-> Nome do Servico Ativo
// plusServico->todos[id]->id		-> ID do Servico Ativo
// plusServico->todos[id]->nome		-> Nome do Servico Ativo
//
// PLUSPAYPAL
// plusPaypal->email		-> email da conta paypal
// plusPaypal->senha		-> senha da conta paypal
// plusPayPal->auth			-> está autenticado ? 0/1
//
//

class nexcafeplus {

	// OBJETOS
	// Declara os objetos
	var $plusTemplate 	= false;
	var $plusAccount 	= false;
	var $plusCadastro 	= false;
	var $plusServico 	= false;
	var $plusPayPal 	= false;

	///////////////////////
	//
	// FUNÇÃO DE INÍCIO
	// Construct - Carregado sempre que o objeto nexcafeplus é criado. Detecta as variaveis.
	function __construct(){
	
		//Abre sessão
		session_start();
		
		//Carrega os dados padrao
		$this->plusTemplate->template	=	$_GET['template'] . $_POST['template'];
		if (sizeof($_GET)>0)
		$this->plusTemplate->parametros	=	$_GET;  
		if (sizeof($_POST)>0)
		$this->plusTemplate->parametros	=	$_POST;  
		
		//echo "_" . $this->plusTemplate->template . "_";
		
		// Se não tiver template definido, é início de sessão
		if (!$this->plusTemplate->template){
			// Carrega os dados dele para a sessão
			$this->loadNexcafe();
			//echo "carregou sessão";
		}
			
		// Carrega os dados dele para o array de cadastro 
			$this->plusAccount 		= $this->getAccount();
			$this->plusCadastro 	= $this->getCadastro();
			$this->plusServico	 	= $this->getServico();
			
			
		// Se não tiver template
		if (!$this->plusTemplate->template)
		// SWITCH Central do primeiro acesso
		// Tem cadastro ? Tem serviços ?
		if ($this->plusCadastro!=false){
			// Não tem cadastro, nem serviços
			$this->plusTemplate->template='home_servicos';
			// Tem serviços já
			if (sizeof($this->plusServico->ativo)>0)
				$this->plusTemplate->template='home_painel';
		}else{
			// Não tem cadastro
			$this->plusTemplate->template='home_novo';
		}	
		
		// Redireciona para o Execute quando for executável ou carrega o template
		if ($this->plusTemplate->template=='execute')
			$this->execute();
		else
			$this->loadTemplate();
	}
	
	/////////////////////////////////////
	//
	// Função EXECUTE com script da aplicação
	// Contem os scripts de procedimento, chamando as funcoes de procedures
	function execute(){
		
		echo "executando...";
		
		// Se for inclusão de cadastros //
		if ($this->plusTemplate->parametros["execute"]=='cadastro_novo'){
			
			echo "up";
			
			// Monta o array de update
			$me->email						=	$this->plusAccount->email;
			$me->campo->tipo				=	$this->plusTemplate->parametros["tipo"];
			$me->campo->nome				=	$this->plusTemplate->parametros["nome"];
			$me->campo->cpfcnpj				=	$this->plusTemplate->parametros["cpfcnpj"];
			$me->campo->rgie				=	$this->plusTemplate->parametros["rgie"];
			$me->campo->telefone			=	$this->plusTemplate->parametros["telefone"];
			$me->campo->cep					=	$this->plusTemplate->parametros["cep"];
			$me->campo->endereco			=	$this->plusTemplate->parametros["endereco"];
			$me->campo->numero				=	$this->plusTemplate->parametros["numero"];
			$me->campo->complemento			=	$this->plusTemplate->parametros["complemento"];
			$me->campo->cidade				=	$this->plusTemplate->parametros["cidade"];
			$me->campo->uf					=	$this->plusTemplate->parametros["uf"];
			$me->campo->data				=	date("Y-m-d");
		
			$this->sendCadastro($me);
			$this->reload();
		}
		
		// Se for inclusão de cadastros //
		if ($this->plusTemplate->parametros["execute"]=='servico_novo'){
			
			//echo "up";
			$this->sendServico();
			$this->reload();
		}
		
		echo print_r($this);
		
		die;
		
	}
	
	
	//////////////////////////////////////
	//
	// Função que carrega os dados da NexCafé
	function loadNexcafe(){
	
		// Checa se existe o e-mail
		if (!$this->plusTemplate->parametros["conta"]){
			echo "O e-mail do cadastro (CONTA) não foi informado.";
			die;
		}
		
		// Define os dados na sessao
		if (is_numeric($this->plusTemplate->parametros["conta"])) {
			echo "Você utiliza uma versão do nexcafé que não tem suporte ao NexCafé PLUS. Por favor atualize sua versão do NexCafé.";
			die;
		}else{
				// Coloca o e-mail na sessão
				$_SESSION['conta'] 					=	$this->plusTemplate->parametros["conta"];
				$_SESSION['adm'] 					=	$this->plusTemplate->parametros["adm"];
		}

	}

	
	//////////////////////////////////////
	//
	// Função que chama os templates
	function loadTemplate(){

		require("templates.php");
		
	}
	
	
	//////////////////////////////////////
	//
	// PROCEDURE: SELECT ACCOUNT
	// getAccount
	// essa função vai, no futuro, ter criptografia e validação no webservice da nexcafé
	// 
	function getAccount(){
		//define
		$retorno->id	=	"";
		$retorno->email	=	$_SESSION["conta"];
		$retorno->adm	=	$_SESSION["adm"];
		//devolve
		return $retorno;
	}
	
	
	//////////////////////////////////////
	//
	// PROCEDURE: SELECT CADASTRO
	// getCadastro
	//
	function getCadastro(){
	
		if ($this->plusAccount->email){
		
			// Faz o SQL que puxa o cadastro
			$sql = "SELECT * FROM plusCadastro where email='".$this->plusAccount->email."'";
			
			// Banco
			$db	=	new plusSQL;		
			$re	=	$db->executa( $sql );
			
			// Se houver algum resultado
			if ( $re->num_rows>0 )
			{
				$returnarray=$re->fetch_object();
				unset($db);
				return $returnarray;
			}else{
				unset($db);
				return false;
			}
			
		}else{
			return false;
		}
	}
	
	
	//////////////////////////////////////
	//
	// PROCEDURE: SELECT SERVICOS
	// getServico
	//
	function getServico(){
	
		// Banco
		$db	=	new plusSQL;	
	
		if ($this->plusCadastro->id){
		
			// Faz o SQL que puxa os serviços ativos
			$sql = "SELECT * FROM `plusServicos` as PSS, plusServico as PS, plusCadastro as PC  WHERE PC.id=PS.cadastro_id AND PS.servico_id=PSS.id AND PSS.status=1 AND PS.cadastro_id=".$this->plusCadastro->id;
			
				
			$re	=	$db->executa( $sql );
			
			// Se houver algum resultado
			if ( $re->num_rows>0 )
			{
				
				while ($obj = $re->fetch_object()){
					$retorno->ativo[$obj->servico_id]->id			=$obj->servico_id;
					$retorno->ativo[$obj->servico_id]->servico		=$obj->servico;
					$retorno->ativo[$obj->servico_id]->imagem		=$obj->imagem;
					$retorno->ativo[$obj->servico_id]->descricao	=$obj->descricao;
					$retorno->ativo[$obj->servico_id]->urlpainel	=$obj->urlpainel;
					$retorno->ativo[$obj->servico_id]->urlcarrinho	=$obj->urlcarrinho;
					$retorno->ativo[$obj->servico_id]->urlpainel	=$obj->urlpainel;
				}
			}
		}
		

		// Faz o SQL que puxa os serviços ativos
		$sql = "SELECT * FROM `plusServicos` WHERE status=1";
		$res	=	$db->executa( $sql );
		
		// Se houver algum resultado
		if ( $res->num_rows>0 )
		{
			while ($obj = $res->fetch_object()){
				$retorno->todos[$obj->id]->id			=$obj->id;
				$retorno->todos[$obj->id]->servico		=$obj->servico;
				$retorno->todos[$obj->id]->imagem		=$obj->imagem;
				$retorno->todos[$obj->id]->descricao	=$obj->descricao;
				$retorno->todos[$obj->id]->urlcarrinho	=$obj->urlcarrinho;
				$retorno->todos[$obj->id]->urlpainel	=$obj->urlpainel;
			}
		}
			
		unset($db);
		
		// INTEGRAÇÃO DE OBJETOS
		// Se tiver no template do carrinho, já seta o servico carrinho. Dependência com o objeto plusTemplate
		if ($this->plusTemplate->template=='cadastro_servico'){		
			$retorno->carrinho->id			=	$retorno->todos[$this->plusTemplate->parametros[servico]]->id;
			$retorno->carrinho->servico		=	$retorno->todos[$this->plusTemplate->parametros[servico]]->servico;
			$retorno->carrinho->imagem		=	$retorno->todos[$this->plusTemplate->parametros[servico]]->imagem;
			$retorno->carrinho->descricao	=	$retorno->todos[$this->plusTemplate->parametros[servico]]->descricao;
			$retorno->carrinho->urlcarrinho	=	$this->stripAccount($retorno->todos[$this->plusTemplate->parametros[servico]]->urlcarrinho);
			$retorno->carrinho->urlpainel	=	$retorno->todos[$this->plusTemplate->parametros[servico]]->urlpainel;
		}
		
		// INTEGRAÇÃO DE OBJETOS
		// Se tiver no template do parceiro, já seta o servico. Dependência com o objeto plusTemplate
		if ($this->plusTemplate->template=='parceiro'){		
			$retorno->parceiro->id			=	$retorno->todos[$this->plusTemplate->parametros[servico]]->id;
			$retorno->parceiro->servico		=	$retorno->todos[$this->plusTemplate->parametros[servico]]->servico;
			$retorno->parceiro->imagem		=	$retorno->todos[$this->plusTemplate->parametros[servico]]->imagem;
			$retorno->parceiro->descricao	=	$retorno->todos[$this->plusTemplate->parametros[servico]]->descricao;
			$retorno->parceiro->urlcarrinho	=	$this->stripAccount($retorno->todos[$this->plusTemplate->parametros[servico]]->urlcarrinho);
			$retorno->parceiro->urlpainel	=	$retorno->todos[$this->plusTemplate->parametros[servico]]->urlpainel;
		}
		
		return $retorno;
	}
	
	
	///////////////////////
	// FUNCTION SEND CADASTRO
	//
	//
	function sendCadastro($me){
	
		if ($me){
		
			// Banco
			$db	=	new plusSQL;	
				
			//Puxa o ID
			if ($this->getCadastro()){
				$id=$this->getCadastro()->id;
			}else{
				// Faz o SQL que puxa os serviços ativos
				$sql = "INSERT INTO plusCadastro (email) VALUES ('".$me->email."')";
				if ($db->executa( $sql )){
					$id=$this->getCadastro()->id;
				}else{
					return false;
				}
			}
			
			//echo print_r($me);

			// Update dos campos
			$sql = "UPDATE plusCadastro SET ";
			$n=0;
			foreach ($me->campo as $campo=>$valor){
				if ($n>=1)
					$sql .= ",";
				$sql .= $campo."='".$valor."'";
				$n++;
			}
			$sql .= " WHERE id=".$id." ";
	
			if ( $db->executa( $sql ) )
				return true;
			else
				return false;
		}
	}
	
	///////////////////////
	// FUNCTION SEND SERVICO
	//
	//
	function sendServico(){
	
			//echo print_r($this);
	
			//echo "SELECT * FROM plusServico WHERE cadastro_id='".$this->plusCadastro->id."' AND servico_id='".$this->plusTemplate->parametros["servico"]."'" ;
			//die;
		
			// Banco
			$db	=	new plusSQL;	
			
			// Faz o SQL que puxa os serviços ativos
			$res	=	$db->executa( "SELECT * FROM plusServico WHERE cadastro_id='".$this->plusCadastro->id."' AND servico_id='".$this->plusTemplate->parametros["servico"]."'" );
			
			// Se houver algum resultado
			if ( $res->num_rows>0 ){
				return true;
			}else{
				// Update dos campos
				$sql = "INSERT INTO plusServico (cadastro_id,servico_id) VALUES ('".$this->plusCadastro->id."','".$this->plusTemplate->parametros["servico"]."')";

				if ( $db->executa( $sql ) )
					return true;
				else
					return false;
			}
	}
	
	//////////////////////////////////
	// FUNCAO COMPLEMENTAR: CADASTRO NA URL
 	// Funcao que inclui os dados do cadastro da conta em qualquer url
	// 
	
	function stripAccount($url){
	
		// Dados do Cadastro a serem passados
		$acc->email		=	$this->plusAccount->email;
		$acc->tipo		=	$this->plusCadastro->tipo;
		$acc->cpfcnpj	=	$this->plusCadastro->cpfcnpj;
		$acc->cep		=	$this->plusCadastro->cep;
		$acc->nome		=	$this->plusCadastro->nome;
		
		//Adiciona o split ?, se nao houver
		if (sizeof(split("\?",$url))<2)
			$url.="?";
		foreach ($acc as $parametro=>$valor)
			$url.="&".$parametro."=".urlencode($valor);
			
		return $url;
	}
	
	//////////////////////////
	// FUNCTION RELOAD
	// reinicia na mesma url
	//
	function reload(){
		header("HTTP/1.1 301 Moved Permanently");
		header("Location: /?conta=".$this->plusAccount->email."&adm=".$this->plusAccount->adm);
	}
	
}



///////////////////////
//
// Classe do MySQL

class plusSQL extends Mysqli
{
 protected $DB_HOST = "dbmy0011.whservidor.com";
 protected $DB_DB 	= "nexcafe";
 protected $DB_USER = "nexcafe";
 protected $DB_PASS = "john1234";
 
        public function __construct ()
        {
                try {
                        @$this->connect ( $this->DB_HOST, $this->DB_USER, $this->DB_PASS, $this->DB_DB);
                        @$this->set_charset ("utf8");
                        if (mysqli_connect_errno () != 0) {
                                throw new Exception (mysqli_connect_errno ());
                        }
                } catch (Exception $erro) {
                        $mensagem  = $erro->getMessage();
                        $codigo    = $erro->getCode();
                        $arquivo   = $erro->getFile();
                        $trace   = $erro->getTraceAsString();
 
                        $dir = "logs";
                        if(!file_exists($dir)) {
                                mkdir($dir);
                        }
                        error_log(date("Y-m-d H:i:s")."|$mensagem|$codigo|$arquivo|$trace\r\n\r\n", 3, $dir."debugger.log");
						
					    echo "$trace\r\n\r\n";
                        exit;
                }
        }
 
        public function __destruct ()
        {
                if(mysqli_connect_errno () == 0) {
                        $this->close();
                }
        }
 
        public function executa ($pSql)
        {
                $resultado = $this->query ($pSql);
                if(preg_match("#(select)#is", $pSql)) {
					return $resultado;
                } else {
                    return $this->affected_rows;
                }
        }
}





?>