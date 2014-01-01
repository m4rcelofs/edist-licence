<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:wrapper>

	<jsp:attribute name="imports">
	</jsp:attribute>

	<jsp:body>
		<h2>Changelog</h2>
		
		<p>
			<strong>2014-01-XX v0.7</strong> <small>(not released)</small>
		</p>
		<ul>
			<li>Bug fix: cache invalidation on adding new groups <small>(thanks @Sucrilhos)</small></li>
			<li>Bug fix: initial player stats fetching to avoid requests with no details <small>(thanks @Sucrilhos)</small></li>
		</ul>
		
		<p>
			<strong>2013-12-31 v0.6</strong>
		</p>
		<ul>
			<li>Enabled aggresive caching of static files</li>
			<li>Enabled memcache</li>
			<li>Case insensitive player search <small>(thanks @Sir Stark)</small></li>
			<li>Small UI improvements</li>
			<li>Bug Fix: Employer userscript <small>(thanks @Zunker)</small></li>
		</ul>
			
		
		<p>
			<strong>2013-12-27 v0.5</strong>
		</p>
		<ul>
			<li>Player stats/fight reports</li>
			<li>Now tracks player names/avatars over time</li>
		</ul>
	 
	 
		<p>
			<strong>2013-12-23 v0.4</strong>
		</p>
		<ul>
			<li>Filtering for managing players</li>
			<li>Allowed manual status change while managing players</li>
		</ul>
	
	
		<p>
			<strong>2013-12-21 v0.3</strong>
		</p>
		<ul>
			<li>Bug fixes</li>
			<li>UI improvements</li>
			<li>Work reports</li>
		</ul>
	
	
		<p>
			<strong>2013-12-16 0.2</strong>
		</p>
		
		<ul>
			<li>Dist reports</li>
		</ul>
	
	
		<p>
			<strong>2013-12-07 v0.1</strong>		
		</p>
		<ul>
			<li>Initial release: form, admin and management</li>	
		</ul>

	</jsp:body>
</t:wrapper>