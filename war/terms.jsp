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
			<fmt:message key="header.terms" />
		</h2>
		
		<h3>
			<fmt:message key="terms.1" />
		</h3>
		<p>
			<fmt:message key="terms.2" />
		</p>

		<h3>
			<fmt:message key="terms.3" />
		</h3>
		<p>
			<fmt:message key="terms.4" />
		</p>
		<p>
			<fmt:message key="terms.5" />
		</p>
		<p>
			<fmt:message key="terms.6" />
		</p>
		<p>
			<fmt:message key="terms.7" />
		</p>
		<p>
			<fmt:message key="terms.8" />
		</p>

		<h3>
			<fmt:message key="terms.9" /> <small><a href="prices"><fmt:message
						key="prices.values" /></a></small>
		</h3>
		<p>
			<fmt:message key="terms.10" />
		</p>
		<p>
			<fmt:message key="terms.11" />
		</p>
		<p>
			<fmt:message key="terms.12" />
		</p>
		<p>
			<fmt:message key="terms.13" />
		</p>
		<p>
			<fmt:message key="terms.14" />
		</p>
		<p>
			<fmt:message key="terms.15" />
		</p>
		

		<h3>
			<fmt:message key="terms.16" />
		</h3>
		<p>
			<fmt:message key="terms.17" />
		</p>
		<p>
			<fmt:message key="terms.18" />
		</p>
		<p>
			<fmt:message key="terms.19" />
		</p>
		<p>
			<fmt:message key="terms.20" />
		</p>

		<h3>
			<fmt:message key="terms.21" />
		</h3>
		<p>
			<fmt:message key="terms.22" />
		</p>
		<p>
			<fmt:message key="terms.23" />
		</p>
		<p>
			<fmt:message key="terms.24" />
		</p>
	</jsp:body>

</t:wrapper>
