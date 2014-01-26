<%@tag language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.erep.dist.i18n.edist" />

<div id="language-select" class="dropdown pull-right">
	<button class="btn dropdown-toggle" type="button" id="dropdownMenu1"
		data-toggle="dropdown"
		title="<fmt:message key="header.languageSelect"/>">
		<span class="caret"></span>
	</button>
	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
		<li role="presentation"><a role="menuitem" tabindex="-1"
			onclick="Navigation.setLanguage('en');"> <img
				src="${baseUrl}/img/flags/us.png"> English
		</a></li>
<!-- 		<li role="presentation"><a role="menuitem" tabindex="-1" -->
<!-- 			onclick="Navigation.setLanguage('es');" title="by @Zebosk"> <img -->
<%-- 				src="${baseUrl}/img/flags/es.png"> Español --%>
<!-- 		</a></li> -->
		<li role="presentation"><a role="menuitem" tabindex="-1"
			onclick="Navigation.setLanguage('pt');"> <img
				src="${baseUrl}/img/flags/br.png"> Português
		</a></li>
	</ul>
</div>

<div class="header">
	<ul class="nav nav-pills pull-right">
		<li id="features"><a href="${baseUrl}/features"><fmt:message key="header.features"/></a></li>
		<li id="prices"><a href="${baseUrl}/prices"><fmt:message key="header.prices"/></a></li>
		<li id="terms"><a
			href="${baseUrl}/terms"><fmt:message key="header.terms"/></a></li>
		<li id="changelog"><a
			href="${baseUrl}/changelog"><fmt:message key="header.changelog"/></a></li>
	</ul>
	<h1 class="sr-only">eDist</h1>
	<h2 class="text-primary">
		<a id="muNameHeader" href="${baseUrl}">eDist</a>
	</h2>
</div>