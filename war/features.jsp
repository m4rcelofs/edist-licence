<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:wrapper>

	<jsp:attribute name="imports">
	</jsp:attribute>

	<jsp:body>
		<div id="carousel-example-generic" class="carousel slide center-block"
			data-ride="carousel" style="max-width: 800px; max-height: 600px;">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				<li data-target="#carousel-example-generic" data-slide-to="4"></li>
				<li data-target="#carousel-example-generic" data-slide-to="5"></li>
			</ol>
		
			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="${baseUrl}/img/demo/form_gradient.png">
					<div class="carousel-caption">
						<h2>Distribuição Facilitada</h2> 
						<p>Suprimentos, rockets...</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/config_gradient.png">
					<div class="carousel-caption">
						<h2>Configuração Simples</h2>
						<p>O sistema se adequa à sua UM, não o contrário!</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/players_gradient.png">
					<div class="carousel-caption">
						<h2>Acompanhamento de Jogadores</h2>
						<p>Rastreie o crescimento de seus jogadores: status, treinos, lutas...</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/mod_gradient.png">
					<div class="carousel-caption">
						<h2>Bloqueio por Lutas ou Trabalho</h2>
						<p>Seus jogadores lutam pouco ou não trabalham para seus gestores? <a
								href="http://youtu.be/svSGKJFSl-8">No soup for you!</a>
						</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/bootstrap_gradient.png">
					<div class="carousel-caption">
						<h2>Confiável e Personalizável</h2>
						<p>Rígido controle de acesso com https padrão (somente AppEngine) e criptografia AES-128. 
						Desenvolvido com o Bootstrap 3, é facilmente personalizável com o tema de sua UM!</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/development_gradient.png">
					<div class="carousel-caption">
						<h2>Desenvolvimento Constante</h2>
						<p>Encontrou um bug? Quer uma funcionalidade? Sem problemas! O desenvolvimento é constante e a atualização é gratuita.</p>
					</div>
				</div>
			</div>
		
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#carousel-example-generic"
				data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</jsp:body>

</t:wrapper>