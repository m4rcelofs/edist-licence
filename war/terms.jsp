<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:wrapper>

	<jsp:attribute name="imports">
	</jsp:attribute>

	<jsp:body>
<h2>Termos e Condições</h2>
		
		<h3>Das Funcionalidades</h3>
		<p>O eDist é um sistema de gerenciamento de Unidades Militares
			para o jogo eRepublik, que fornece funcionalidades de distribuição de
			suprimentos e acompanhamento de jogadores.</p>

		<h3>Do Servidor</h3>
		<p>
			O sistema eDist pode ser instalado tanto na plataforma Google AppEngine
			quanto em um servidor dedicado (VPS) que suporte a instalação de
			JBoss e <a href="https://www.jboss.org/capedwarf">CapeDwarf</a>.
		</p>
		<p>
			Em ambos os casos, o pagamento de possíveis taxas de manutenção do
			servidor <strong>é de responsabilidade do cliente.</strong>
		</p>
		<p>
			A plataforma AppEngine fornece uma <a
				href="https://developers.google.com/appengine/docs/quotas#Resources">quota
				diária gratuita</a>, e cobra <a
				href="https://developers.google.com/appengine/pricing#cost_resource">somente
				o excedente utilizado</a>.
		</p>
		<p>O acesso de administrador/root deve ser fornecido ao
			desenvolvedor para instalação de novas versões. Por motivos de
			segurança, é facultativo ao cliente a retirada das permissões durante
			o uso normal da aplicação.</p>
		<p>O desenvolvedor não é responsável por possíveis downtimes no
			servidor, e os mesmos não intitulam o cliente a ressarcimento da
			mensalidade.</p>

		<h3>
			Dos Custos de Licenciamento <small><a href="prices">Valores</a></small>
		</h3>
		<p>É cobrado de cada Unidade Militar licenciada um valor de
			instalação do sistema e uma mensalidade de manutenção.</p>
		<p>A taxa de instalação varia conforme plataforma escolhida e deve
			ser paga no momento da primeira instalação/configuração do sistema
			pelo deselvolvedor, não sendo reembolsável.</p>
		<p>A mensalidade tem seu valor variável conforme o número de
			usuários cadastrados no sistema, e deve ser paga antecipadamente. É
			reembolsável proporcionalmente ao número de dias restantes até o
			término da licença.</p>
		<p>Uma licença é válida para uma única Unidade Militar. Não é permitido 
			o uso compartilhado de uma mesma licença entre múltiplas Unidades Militares.</p>
		<p>Instalações que não estiverem em dia com o pagamento do licenciamento  
			terão suas funcionalidades bloqueadas automaticamente.</p>
		<p>O licenciamento pode ser cancelado pelo cliente ou pelo desenvolvedor 
			com aviso prévio de 48h, com direito a reembolso como especificado 
			acima.</p>
		

		<h3>Das Atualizações de Software</h3>
		<p>Está incluída na mensalidade a correção de bugs reportados e
			atualização para novas versões.</p>
		<p>
			Bugs no software devem ser reportados no <a
				href="https://bitbucket.org/marcelofs/edist/issues?status=new&status=open">Rastreador</a>
			e serão corrigidos em nova versão assim que possível, sob critério do
			desenvolvedor e sujeitos a  limitações de tempo, estruturais e
			técnicas.
		</p>
		<p>
			A implementação de novas funcionalidades pode ser requisitada pelo
			cliente no <a
				href="https://bitbucket.org/marcelofs/edist/issues?status=new&status=open">Rastreador</a>.
			Tais funcionalidades poderão sob critério do desenvolvedor ser
			implementadas em versões futuras, sujeitas a  limitações de tempo,
			estruturais e técnicas. É facultativo ao desenvolvedor a cobrança de
			valor adicional pela implementação de funcionalidades consideradas
			fora do escopo da aplicação.
		</p>
		<p>O desenvolvedor não é responsável pelo resultado de bugs no
			aplicativo, devendo o cliente acompanhar os relatórios de modo a
			evitar perda de itens.</p>

		<h3>Dos Termos e Condições</h3>
		<p>A utilização do sistema eDist implica na plena aceitação destes
			Termos e Condições.</p>
		<p>Situações omissas dos Termos e Condições serão julgadas única e exclusivamente pelo desenvolvedor.</p>
		<p>Os Termos e Condições estão sujeitos a mudanças pelo
			desenvolvedor, com aviso prévio de 48h.</p>

	</jsp:body>

</t:wrapper>
