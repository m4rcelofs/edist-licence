<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.erep.dist.i18n.edist" />

<t:wrapper>

	<jsp:attribute name="imports">
	</jsp:attribute>

	<jsp:body>
		<h2>
			<fmt:message key="prices.values" />
			<small><fmt:message key="prices.values.brOnly" /></small>
		</h2>

		<h3>
			<fmt:message key="prices.install" /> <small><fmt:message
					key="prices.install.small" /></small>
		</h3>


		<ul>
			<li><fmt:message key="prices.appengine.value" /></li>
		</ul>
		<p>
			<fmt:message key="prices.theme" />
		</p>
		<h3>
			<fmt:message key="prices.monthly" /> <small><fmt:message
					key="prices.monthly.small" /></small>
		</h3>

		<ul>
			<li><fmt:message key="prices.30p" /> - <fmt:message
					key="prices.30p.value" /></li>
			<li><fmt:message key="prices.70p" /> - <fmt:message
					key="prices.70p.value" /></li>
			<li><fmt:message key="prices.150p" /> - <fmt:message
					key="prices.150p.value" /></li>
			<li><fmt:message key="prices.150plus" /> - <fmt:message
					key="prices.150plus.value" /></li>
		</ul>
		<p>
			<fmt:message key="prices.obs" />
		</p>
		<p>
			<fmt:message key="prices.appengine.recommended" />
		</p>
		
		<p>
			<fmt:message key="prices.obs2" /> <a href="terms"><fmt:message
					key="header.terms" /></a>.
		</p>
	</jsp:body>

</t:wrapper>
