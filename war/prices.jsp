<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:wrapper>

	<jsp:attribute name="imports">
	</jsp:attribute>

	<jsp:body>
		<h2>Valores</h2>

		<h3>
			Taxa de Instalação <small>pagamento único, não reembolsável</small>
		</h3>


		<ul>
			<li>AppEngine: 10G</li>
			<li>Servidor Próprio (JBossAS7 + CapeDwarf): 50G</li>
		</ul>
		<p>Inclui personalização para a MU (imagens e CSS devem ser
			fornecidos).</p>

		<h3>
			Mensalidade <small>pagamento antecipado, reembolsável
				proporcionalmente</small>
		</h3>

		<ul>
			<li>Até 30 jogadores - 5g/mês</li>
			<li>Até 70 jogadores - 10g/mês</li>
			<li>Até 150 jogadores - 15g/mês</li>
			<li>150+ jogadores - 20g/mês</li>
		</ul>
		<p>A mensalidade cobre somente a despesa com software. Inclui
			correção de bugs e atualização de versões. Taxas do servidor
			AppEngine acima da quota gratuita são de responsabilidade do cliente.</p>
		<p>
			Sujeito aos <a href="terms">Termos e Condições</a>.
		</p>
	</jsp:body>

</t:wrapper>
