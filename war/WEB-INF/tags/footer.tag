<%@tag language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.erep.dist.i18n.edist" />

<div class="form-group"></div>
<div class="footer">
	<div class="pull-right">
		<img src="${baseUrl}/img/appengine-noborder-120x30.cache.gif"
			alt="Powered by Google App Engine" />
	</div>
	<p>
		eDist - &copy; 2013, <a
			href="http://www.erepublik.com/en/citizen/profile/5313713">nW0lf</a>
		& <a href="http://www.erepublik.com/en/citizen/profile/3885795">Guilpas</a>
	</p>
	<p>
		<a
			href="https://bitbucket.org/marcelofs/edist/issues?status=new&status=open"><fmt:message key="footer.bugs"/></a>
	</p>

</div>