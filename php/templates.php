<?php




?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="style.css" type="text/css" />


<!-- Bloco de scripts-->
<? if ($this->plusTemplate->template=='cadastro_novo') { ?>	

<script>
	
	function go(){
		
		if (document.getElementById("tipo").options[document.getElementById("tipo").selectedIndex].value==""){
			alert("Informe o tipo do cadastro");
			document.getElementById("tipo").focus();
			return;
		}
		
		if (document.getElementById("nome").value==""){
			if (document.getElementById("tipo").options[document.getElementById("tipo").selectedIndex].value=="pj")
				alert("Informe a Razão Social");
			else
				alert("Informe o Nome Completo");
			document.getElementById("nome").focus();
			return;
		}
		
		if (document.getElementById("cpfcnpj").value==""){
			if (document.getElementById("tipo").options[document.getElementById("tipo").selectedIndex].value=="pj")
				alert("Informe o CNPJ");
			else
				alert("Informe o CPF");
			document.getElementById("cpfcnpj").focus();
			return;
		}
		
		if (document.getElementById("tipo").options[document.getElementById("tipo").selectedIndex].value=="pj")
			if (valida_cnpj(document.getElementById("cpfcnpj").value)   ){
			}else{
				alert("CNPJ Inválido. Certifique-se que o número informado está correto (sem pontos e traços).");
				document.getElementById("cpfcnpj").focus();
				return;
			}
		else
			if (valida_cpf(document.getElementById("cpfcnpj").value)){
			}else{
				alert("CPF Inválido. Certifique-se que o número informado está correto (sem pontos e traços).");
				document.getElementById("cpfcnpj").focus();
				return;
			}
		
		if (document.getElementById("rgie").value==""){
			if (document.getElementById("tipo").options[document.getElementById("tipo").selectedIndex].value=="pj")
				alert("Informe a Inscrição Estadual ou escreva ISENTO.");
			else
				alert("Informe o RG");
			document.getElementById("rgie").focus();
			return;
		}
		
		if (document.getElementById("telefone").value==""){
			alert("Informe o Telefone de Contato");
			document.getElementById("telefone").focus();
			return;
		}
		
		if (document.getElementById("cep").value==""){
			alert("Informe o CEP");
			document.getElementById("cep").focus();
			return;
		}
		
		if (document.getElementById("endereco").value==""){
			alert("Informe o Endereço");
			document.getElementById("endereco").focus();
			return;
		}
		
		if (document.getElementById("numero").value==""){
			alert("Informe o Número (ou digite S/N para sem número)");
			document.getElementById("numero").focus();
			return;
		}
		
		if (document.getElementById("cidade").value==""){
			alert("Informe a Cidade");
			document.getElementById("cidade").focus();
			return;
		}
		
		if (document.getElementById("uf").options[document.getElementById("uf").selectedIndex].value==""){
			alert("Informe o Estado (UF)");
			document.getElementById("uf").focus();
			return;
		}

		// Go Final
		document.cadastronovo.submit();
	}
	
	function trocatipo(){
		if (document.getElementById("tipo").options[document.getElementById("tipo").selectedIndex].value!="") {
			if (document.getElementById("tipo").options[document.getElementById("tipo").selectedIndex].value=="pf"){
				document.getElementById("labelnome").innerHTML="Nome Completo:";
				document.getElementById("labelcpfcnpj").innerHTML="CPF:";
				document.getElementById("labelrgie").innerHTML="RG:";
			}else{
				document.getElementById("labelnome").innerHTML="Raz&atilde;o Social:";
				document.getElementById("labelcpfcnpj").innerHTML="CNPJ:";
				document.getElementById("labelrgie").innerHTML="IE:";
			}
			show('noshow');
		}else{
			noshow('noshow');
		}
	}
	
	function noshow() {
		document.getElementById("noshow1").style.display='none';
		document.getElementById("noshow2").style.display='none';
		document.getElementById("noshow3").style.display='none';
		document.getElementById("noshow33").style.display='none';
		document.getElementById("noshow4").style.display='none';
		document.getElementById("noshow5").style.display='none';
		document.getElementById("noshow6").style.display='none';
		document.getElementById("noshow7").style.display='none';
	}
	
	function show() {
		document.getElementById("noshow1").style.display='block';
		document.getElementById("noshow2").style.display='block';
		document.getElementById("noshow3").style.display='block';
		document.getElementById("noshow33").style.display='block';
		document.getElementById("noshow4").style.display='block';
		document.getElementById("noshow5").style.display='block';
		document.getElementById("noshow6").style.display='block';
		document.getElementById("noshow7").style.display='block';
	}
	
	function valida_cpf(cpf)
      {
	  
	  //alert(cpf);

      var numeros, digitos, soma, i, resultado, digitos_iguais;
      digitos_iguais = 1;
      if (cpf.length < 11)
            return false;
      for (i = 0; i < cpf.length - 1; i++)
            if (cpf.charAt(i) != cpf.charAt(i + 1))
                  {
                  digitos_iguais = 0;
                  break;
                  }
      if (!digitos_iguais)
            {
            numeros = cpf.substring(0,9);
            digitos = cpf.substring(9);
            soma = 0;
            for (i = 10; i > 1; i--)
                  soma += numeros.charAt(10 - i) * i;
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(0))
                  return false;
            numeros = cpf.substring(0,10);
            soma = 0;
            for (i = 11; i > 1; i--)
                  soma += numeros.charAt(11 - i) * i;
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(1))
                  return false;
            return true;
            }
      else
            return false;
      }
	  
	  function valida_cnpj(cnpj)
      {
	  cnpj = cnpj.replace("-","");
      cnpj = cnpj.replace(".","");
	  
      var numeros, digitos, soma, i, resultado, pos, tamanho, digitos_iguais;
      digitos_iguais = 1;
      if (cnpj.length < 14 && cnpj.length < 15)
            return false;
      for (i = 0; i < cnpj.length - 1; i++)
            if (cnpj.charAt(i) != cnpj.charAt(i + 1))
                  {
                  digitos_iguais = 0;
                  break;
                  }
      if (!digitos_iguais)
            {
            tamanho = cnpj.length - 2
            numeros = cnpj.substring(0,tamanho);
            digitos = cnpj.substring(tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--)
                  {
                  soma += numeros.charAt(tamanho - i) * pos--;
                  if (pos < 2)
                        pos = 9;
                  }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(0))
                  return false;
            tamanho = tamanho + 1;
            numeros = cnpj.substring(0,tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--)
                  {
                  soma += numeros.charAt(tamanho - i) * pos--;
                  if (pos < 2)
                        pos = 9;
                  }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(1))
                  return false;
            return true;
            }
      else
            return false;
      } 


   </script>
   
   
<?};?>

	<title>NexCaf&eacute; PLUS</title>
</head>
<body>

	<div class="wrapper">
	
		<div class="header"> 
			<a href="#" class="bt logo">NexCafe</a>
			<a href="#" class="bt fundo">PLUS</a>
		</div>
		
		
		<? /*
		DEPRECATED 3-6-2011
		
		
		
		?>
		<!-- TEMPLATE: HOME NOVO -->
		
		<div class="main ganhedinheiro">
		
			<div class="centro homenovo">
			
				<h1>Ganhe Dinheiro com a sua Lan-House</h1>
				<h2>Cadastre-se agora mesmo!</h2>
				<p>Com o pacote de servi&ccedil;os <cite>NexCaf&eacute; Plus</cite> voc&ecirc; vai aumentar a renda da sua Lan House. Cadastre-se aogra mesmo e tenha acesso a um pacote de servi&ccedil;os para revenda, como:</p>
				<ul>
				<li>Patroc&iacute;nio de Ponto de Venda</li>
				<li>Venda de Publicidade Local</li>
				<li>Venda de Cr&eacute;ditos para Jogos</li>
				<li>Recarga de Celular</li>
				<li>Cursos de e-Learning</li>
				</ul>
				<a href="?template=cadastro_novo" class="bt cadastre">Cadastre-se J&aacute;</a>
			
			</div>
		
		</div>
		<?};*/
		
		if ($this->plusTemplate->template=='home_novo') { ?>
		<!-- TEMPLATE: HOME NOVO (ANTIGO SERVIÇOS) -->
		
		
		<script>
	
	function goserv(){
		
		if (document.getElementById("servico").length>1){
			for (i=0;i<document.getElementById("servico").length;i++){
				   if (document.getElementById("servico")[i].checked){
						document.serviconovo.submit()
						break;
					}
				}
			
			alert("Informe qual Servico deseja revender");
			document.getElementById("servico").focus();
			return;
		}else{
			if (document.getElementById("servico").checked){
				document.serviconovo.submit()
			}else{
				alert("Informe qual Servico deseja revender");
				document.getElementById("servico").focus();
				return;
			}
		}
	}


   </script>
		
		<div class="main homeservicos">
		
			<div class="centro homeservicos">
			
				<h1>Ganhe Dinheiro com a sua Lan-House</h1>
				<h2>Servi&ccedil;os Dispon&iacute;veis no NexCaf&eacute; PLUS+</h2>
				<p>Com o pacote de servi&ccedil;os <cite>NexCaf&eacute; Plus+</cite> voc&ecirc; vai aumentar a renda da sua Lan House. Cadastre-se agora mesmo e tenha acesso a um pacote de servi&ccedil;os.</p>
				
				<p>Escolha um dos servi&ccedil;os abaixo (um por vez) para saber as condi&ccedil;&otilde;es e come&ccedil;ar a ganhar. Voc&ecirc; poder&aacute; adicionar quantos servi&ccedil;os quiser. </p>
				
				<form name="serviconovo" class="servicos" action="/" method="post">
				
				<input type="hidden" name="template" value="cadastro_novo" />
				
				<ul class="servicos">
				
					<? foreach ($this->plusServico->todos as $serv){?>
					
					<li>
						<img src="img/<?=$serv->imagem;?>" alt="<?=$serv->servico;?>" class="servicos" />
						<label class="servicos"><input type="radio" value="<?=$serv->id;?>" id="servico" name="servico" class="servicos"/><?=$serv->servico;?></label>
						<label class="servicos down"><?=$serv->descricao;?></label> 
					</li>
					
					<?}?>
					
				</ul>
				
				
				<a href="javascript:goserv();" class="bt proximo">Pr&oacute;ximo Passo</a>
				
				</form>
			
			</div>
		
		</div>
		<?};?>
		
		
		<? if ($this->plusTemplate->template=='cadastro_novo') { ?>
		<!-- TEMPLATE: CADASTRO NOVO -->
		
		<div class="main cadastro">
		
			<div class="centro cadastronovo">
			
				<h1>Registro no NexCaf&eacute; PLUS+</h1>
				<h2>Passo 1 de 1</h2>
				<p>Informe os dados da sua Lan-House para cadastramento no programa PLUS. Voc&ecirc; pode realizar o seu cadastro como <cite>Pessoa Jur&iacute;dica</cite> ou <cite>Pessoa F&iacute;sica</cite>.</p>
				
				<form id="cadastronovo" name="cadastronovo" class="cadastro" action="/nexcafe/" method="post">
				
					<input type="hidden" name="template" value="execute" />
					<input type="hidden" name="execute" value="cadastro_novo" />
					<input type="hidden" name="servico" value="<?=$_POST["servico"];?>" />
					
				
					<p class="cadastro">
						<label class="cadastro">ID Conta NexCaf&eacute;</label>
						<input type="text" name="id_nexcafe" value="<?=$this->plusAccount->email;?>" disabled="true" class="text cadastro" />
					</p>
					
					<p class="cadastro">
						<label class="cadastro">Senha NexCaf&eacute;</label>
						<input type="text" name="pass_nexcafe" value="" class="text cadastromm" />
						<label class="cadastrom mini">(Mesma do Software)</label>
					</p>
					
					<p class="cadastro">
						<label class="cadastro">e-mail de Contato</label>
						<input type="text" name="email" value="<?=$this->plusAccount->email;?>" class="text cadastro" />
					</p>
					
					<p class="cadastro">
						<label class="cadastro">Tipo de Neg&oacute;cio</label>
						<select id="tipo" name="tipo" class="cadastro" onchange="javascript:trocatipo();"/>
							<option value="">Escolha uma op&ccedil;&atilde;o...</option>
							<option value="">---</option>
							<option value="pf">Pessoa F&iacute;sica</option>
							<option value="pj">Pessoa Jur&iacute;dica</option>
						</select>
					</p>
					
					<p class="cadastro" id="noshow1">
						<label class="cadastro" for="nome" id="labelnome">Nome Completo ou Raz&atilde;o Social</label>
						<input type="text" id="nome" name="nome" class="text cadastro" />
					</p>
					
					<p class="cadastro" id="noshow2">
						<label class="cadastro" for="cpfcnpj" id="labelcpfcnpj">CPF/CNPJ:</label>
						<input type="text" name="cpfcnpj" id="cpfcnpj" class="text cadastro" />
					</p>
					
					<p class="cadastro" id="noshow3">
						<label class="cadastro" id="labelrgie">RG/IE:</label>
						<input type="text" id="rgie" name="rgie" class="text cadastro" />
					</p>
					
					<p class="cadastro" id="noshow33">
						<label class="cadastro">Telefone:</label>
						<input type="text" name="telefone" id="telefone" class="text cadastromm" />
						<label class="cadastrom mini">Informe com DDD</label>
					</p>
					
					<p class="cadastro" id="noshow4">
						<label class="cadastro">CEP:</label>
						<input type="text" name="cep" id="cep" class="text cadastromm" />
						<label class="cadastrom mini">N&atilde;o sabe o CEP ? Clique aqui</label>
					</p>
					
					<p class="cadastro" id="noshow5">
						<label class="cadastro">Endere&ccedil;o:</label>
						<input type="text" name="endereco" id="endereco" class="text cadastrom" />
						<label class="cadastrop">N.: </label>
						<input type="text" name="numero" id="numero" class="text cadastrop" />
					</p>
					
					<p class="cadastro" id="noshow6">
						<label class="cadastro">Complemento:</label>
						<input type="text" name="complemento" id="complemento" class="text cadastro" />
					</p>
					
					
					
					<p class="cadastro" id="noshow7">
						<label class="cadastro">Cidade:</label>
						<input type="text" name="cidade" id="cidade" class="text cadastrom" />
						<label class="cadastrop">UF: </label>
						<select class="cadastrop" id="uf" name="uf">
							<option value="" selected="">Escolha</option>
							<option value="" selected="">---</option>
							<option value="AC">Acre</option>
							<option value="AL">Alagoas</option>
							<option value="AP">Amap&aacute;</option>
							<option value="AM">Amazonas</option>
							<option value="BA">Bahia</option>
							<option value="CE">Cear&aacute;</option>
							<option value="DF">Distrito Federal</option>
							<option value="ES">Esp&iacute;rito Santo</option>
							<option value="GO">Goi&aacute;s</option>
							<option value="MA">Maranh&atilde;o</option>
							<option value="MT">Mato Grosso</option>
							<option value="MS">Mato Grosso do Sul</option>
							<option value="MG">Minas Gerais</option>
							<option value="PR">Paran&aacute;</option>
							<option value="PB">Para&iacute;ba</option>
							<option value="PA">Par&aacute;</option>
							<option value="PE">Pernambuco</option>
							<option value="PI">Piau&iacute;</option>
							<option value="RJ">Rio de Janeiro</option>
							<option value="RN">Rio Grande do Norte</option>
							<option value="RS">Rio Grande do Sul</option>
							<option value="RO">Rond&ocirc;nia</option>
							<option value="RR">Roraima</option>
							<option value="SC">Santa Catarina</option>
							<option value="SE">Sergipe</option>
							<option value="SP">S&atilde;o Paulo</option>
							<option value="TO">Tocantins</option>
						</select>
					</p>

				</form>
				
				
				<a href="javascript:go();" class="bt proximo">Pr&oacute;ximo Passo</a>
				
				<script>
					noshow('noshow');
				</script>
				
				
			
			</div>
		
		</div>
		<?};?>
		
		<? /*
		DEPRECATED 3-6-2011
		
		if ($this->plusTemplate->template=='home_servicos') { ?>
		<!-- TEMPLATE: HOME SERVIÇOS -->
		
		<div class="main homeservicos">
		
			<div class="centro homeservicos">
			
				<h1>Servi&ccedil;os Dispon&iacute;veis no NexCaf&eacute; PLUS+</h1>
				<h2>Escolha os servi&ccedil;os que quer revender</h2>
				<p>Voc&ecirc; poder&aacute; adicionar quantos servi&ccedil;os quiser. Escolha um dos servi&ccedil;os abaixo (um por vez) para saber as condi&ccedil;&otilde;es e come&ccedil;ar a ganhar.</p>
				
				<form name="serviconovo" class="servicos" action="/nexcafe/" method="post">
				
				<input type="hidden" name="template" value="cadastro_servico" />
				
				<ul class="servicos">
				
					<? foreach ($this->plusServico->todos as $serv){?>
					
					<li>
						<img src="img/<?=$serv->imagem;?>" alt="<?=$serv->servico;?>" class="servicos" />
						<label class="servicos"><input type="radio" value="<?=$serv->id;?>" name="servico" class="servicos"/><?=$serv->servico;?></label>
						<label class="servicos down"><?=$serv->descricao;?></label> 
					</li>
					
					<?}?>
					
				</ul>
				
				
				<a href="javascript:document.serviconovo.submit();" class="bt proximo">Pr&oacute;ximo Passo</a>
				
				</form>
			
			</div>
		
		</div>
		<?};*/?>
		
		<? if ($this->plusTemplate->template=='cadastro_servico') { ?>
		<!-- TEMPLATE: HOME SERVIÇOS -->
		
		<div class="main cadastroservicos">
		
			<div class="centro cadastroservicos">
			
				<h1>Ades&atilde;o de Servi&ccedil;o com NexCaf&eacute; PLUS+</h1>
				<h2><?=$this->plusServico->carrinho->servico;?></h2>
				
				<form id="cadastroservicos" name="cadastroservicos" action="#" method="post"/>
				
					<input type="hidden" name="template" value="execute" />
					<input type="hidden" name="execute" value="servico_novo" />
					<input type="hidden" name="servico" value="<?=$this->plusTemplate->parametros["servico"];?>" />
				
				
				<iframe src="<?=$this->plusServico->carrinho->urlcarrinho;?>" class="iservicos" scrolling="no">Habilite iframe para seguir</iframe>
				
				<a href="javascript:this.history.go(-1);" class="bt voltar">Voltar</a>
				
				</form>
				
			
			</div>
		
		</div>
		<?};?>
		
		
		<? if ($this->plusTemplate->template=='home_painel') { ?>
		<!-- TEMPLATE: HOME PAINEL -->
		
		<div class="main painel">
		
			<div class="centro homepainel">
			
				<h1>Painel de Controle</h1>
				<h2>Servi&ccedil;os Dispon&iacute;veis</h2>
				<p>Clique sobre o servi&ccedil;o abaixo para acessar o painel de controle:</p>
				<ul>
				<?foreach($this->plusServico->ativo as $serv){?>
					<li><a href="/nexcafe/?template=parceiro&servico=<?=$serv->id;?>"><?=$serv->servico;?></a></li>
				<?};?>
				</ul>
				
				<div class="menu">
					<a href="/nexcafe/?template=home_servicos" class="">Adicionar Servi&ccedil;os</a>
					<a href="" class="">Meu Cadastro</a>
					<a href="" class="">Conta Corrente (PAYPAL?)</a>
				</div>
				
			
			</div>
		
		</div>
		<?};?>
		
		<? if ($this->plusTemplate->template=='parceiro') { ?>
		<!-- TEMPLATE: PARCEIRO -->
		<div class="parceiro">
		
			<iframe src="<?=$this->plusServico->parceiro->urlpainel;?>" class="iparceiro" scrolling="yes">Habilite iframe para seguir</iframe>
				
		</div>
		<?};?>
		
		
		
	</div>


	<style>
	
	body{
		text-align:center;
		background:#eeeeee;
	}
	
	div.wrapper{
		margin:0 auto;
		width:800px;
		border:1px solid #cccccc;
		background:white;
	}
	
	div.header{
		display:block;
		height:120px;
		border-bottom:1px solid #aaaaaa;
	}
	
	div.main{
		padding:40px;
	}
	
	.bt{
		display:block;
		text-indent:-1000px;
		overflow:hidden;
	}
	
	a.logo{
		width:300px;
		height:90px;
		float:left;
		background:url(img/spriteplus.gif) no-repeat 0 0;
	}
	
	a.fundo{
		width:470px;
		height:110px;
		float:right;
		background:url(img/spriteplus.gif) no-repeat -15px -310px;
	}
	
	
	/* Centro */
	
	div.centro{
	  text-align: left;
	  font-family: tahoma,arial,sans-serif;
	}
	
	div.main h1, div.main h2{
		margin-bottom:0px;
	}
	
	div.main h1{
		margin:0px;
		font-size:24px;
	}
	
	div.main h2{
		font-size:18px;
		color:#4BB7E5;
		margin-left:35px;
		margin-top: 30px;
	}
	
	.homenovo p, .homenovo ul{
		font-size: 12px;
		width: 400px;
		margin-left:35px;
	}
	
	.main ul{
		padding-left: 20px;
		list-style:circle;
		
	}
	
	.main p cite{
		font-weight:bold;
		font-style:normal;
	}
	
	.main ul{
		font-size:14px;
	}
	
	a.cadastre{
		width:115px;
		height:32px;
		background:url(img/spriteplus.gif) no-repeat -16px -118px;
	}
	
	a.cadastre:hover{
		background-position:-16px -153px;
	}
	
	.main a.cadastre{
	    margin-left: 35px;
		margin-top: 25px;
	}
	
	div.main.ganhedinheiro{
		background:url("img/fundohome.jpg") no-repeat scroll 506px 40px transparent;
		height:300px;
	}
	
	/* Cadastro */
	
	label.error{
		float: left;
		margin-left: 270px;
	}
	
	.cadastronovo p, .cadastronovo ul{
		font-size: 12px;
		margin-right:35px;
		margin-left:35px;
		overflow:hidden;
	}
	
	.cadastronovo form.cadastro{
		padding-top:20px;
	}
	
	p.cadastro{
		overflow:hidden;
		display:block;
	}
	
	label.cadastro{
		display: block;
		float: left;
		width: 250px;
		margin-left:20px;
	}
	
	input.cadastro.text{
		border: 1px solid #CCCCCC;
		display: block;
		width: 300px;
	}
	
	input.cadastrom.text{
		border: 1px solid #CCCCCC;
		display: block;
		width: 180px;
		float:left;
	}
	
	input.cadastromm.text{
		border: 1px solid #CCCCCC;
		display: block;
		width: 120px;
		float:left;
	}
	
	input.cadastrop.text{
		border: 1px solid #CCCCCC;
		display: block;
		width: 70px;
		float:left;
	}
	
	label.cadastrop{
		display: block;
		float: left;
		width: 40px;
		margin-left:5px;
	}
	
	label.cadastrom{
		display: block;
		float: left;
		margin-left:5px;
	}
	
	label.cadastrom.mini{
		font-size:10px;
	}
	
	select.cadastro{
		border: 1px solid #CCCCCC;
		display: block;
		width: 200px;
	}
	
	select.cadastrop{
		border: 1px solid #CCCCCC;
		display: block;
		width: 70px;
	}
	
	a.proximo{
		width:80px;
		height:30px;
		background:url(img/spriteplus.gif) no-repeat -147px -116px;
	}
	
	a.proximo:hover{
		background-position:-147px -146px;
	}
	
	.main a.proximo{
	    margin: 0 auto;
		margin-top:25px;
	}
	
	/*Serviços*/
	
	.homeservicos p, .homeservicos ul{
		font-size: 12px;
		margin-right:35px;
		margin-left:35px;
		overflow:hidden;
	}
	
	.homeservicos ul{
		display: block;
		list-style: none outside none;
		padding: 0;
	}
	
	.homeservicos ul li{
		display:block;
		overflow:hidden;
		height:150px;
	}
	
	img.servicos{
		display: block;
		float: left;
		height: 120px;
		margin: 5px;
		width: 200px;
	}
	
	
	label.servicos{
		display: block;
		float: left;
		padding: 5px;
		width: 400px;
		font-weight:bold;
	}
	
	label.servicos.down{
		font-weight:normal;
		padding-left:10px;
	}
	
	iframe.iservicos{
		height: 400px;
		margin-left: 35px;
		width: 650px;
		border:1px solid #cccccc;
	}
	
	a.voltar{
		width:80px;
		height:30px;
		background:url(img/spriteplus.gif) no-repeat -235px -116px;
	}
	
	a.voltar:hover{
		background-position:-235px -146px;
	}
	
	.main a.voltar{
	    margin-left:35px;
		margin-top:15px;
	}
	
	/*Painel*/
	
	.homepainel p, .homepainel ul{
		font-size: 12px;
		margin-right:35px;
		margin-left:35px;
		overflow:hidden;
	}
	
	.homepainel ul{
		height:200px;
	}
	
	.homepainel ul li a{
		font-size: 18px;
	}
	
	div.painel{
		height:400px;
		
	}
	
	/* Parceiro */
	
	div.parceiro{
		display: block;
		overflow: hidden;
	}
	
	iframe.iparceiro{
		display: block;
		height: 400px;
		width: 800px;
	}
	</style>
	

	
	<?
		// Template
//echo print_r($this);

	
		?>
	
</body>
</html>