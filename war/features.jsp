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
						<h2>
							<fmt:message key="features.1" />
						</h2> 
						<p>
							<fmt:message key="features.2" />
						</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/config_gradient.png">
					<div class="carousel-caption">
						<h2>
							<fmt:message key="features.3" />
						</h2>
						<p>
							<fmt:message key="features.4" />
						</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/players_gradient.png">
					<div class="carousel-caption">
						<h2>
							<fmt:message key="features.5" />
						</h2>
						<p>
							<fmt:message key="features.6" />
						</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/mod_gradient.png">
					<div class="carousel-caption">
						<h2>
							<fmt:message key="features.7" />
						</h2>
						<p>
							<fmt:message key="features.8" /> <a
								href="http://youtu.be/svSGKJFSl-8">No soup for you!</a>
						</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/bootstrap_gradient.png">
					<div class="carousel-caption">
						<h2>
							<fmt:message key="features.9" />
						</h2>
						<p>
							<fmt:message key="features.10" />
						</p>
					</div>
				</div>
				<div class="item">
					<img src="${baseUrl}/img/demo/development_gradient.png">
					<div class="carousel-caption">
						<h2>
							<fmt:message key="features.11" />
						</h2>
						<p>
							<fmt:message key="features.12" />
						</p>
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