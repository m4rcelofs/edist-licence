<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:wrapper>

	<jsp:attribute name="imports">
	</jsp:attribute>

	<jsp:body>
		<h2>Changelog</h2>
		
		<p>
			<strong>2014-01-29 v0.9</strong>
		</p>
		<ul>
			<li>Spanish translation <small>(thanks @Zebosk)</small></li>
			<li>New logo image <small>(thanks @CarlosMarighella)</small></li>
			<li>'Keep avatar history' is now a hidden option (defaults to true)</li>
			<li>'Show distributor inventory' is now a hidden option (defaults to true)</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/42">#42</a>: Rewrite on the dist algorithm to lower error %</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/49">#49</a>: i18n scheme</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/50">#50</a>: English translation</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/53">#53</a>: Smaller player list</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/55">#55</a>: Show distributor current inventory <small>(thanks @Bonna)</small></li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/56">#56</a>: Split up employer updates to avoid DeadlineExceededException</li>
			<li> Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/56/">#56</a>: Removed dupes check on employer script, let the server do it</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/58">#58</a>: Players List: History Tab improvements</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/59">#59</a>: moved 'fights' tab to /reports</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/61">#61</a>: Smaller dist list</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/63">#63</a>: Smaller fights list</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/65">#65</a>: Player parser gets 'eRepublik Ambassator' with the nick</li>
			<li>Bug Fix: avoids tombstoned task names</li>
			<li>Bug Fix: fight verification 'none' sets status to 'OK'</li>
		</ul>
		
		<p>
			<strong>2014-01-09 v0.8</strong>
		</p>
		<ul>
			<li>Improved player management links <small>(thanks @Zunker)</small></li>
			<li>Always shows distributor server access warning</li>
			<li>Implemented security headers to make XSS attacks even harder</li>
			<li>Employer script: added checks to avoid conflicting updates</li>
			<li>Employer script now uses its own version of jQuery to avoid Greasemonkey's access violation error</li>
			<li>Bug Fix: request UI not showing when player is suspended <small>(thanks @PiresFelix)</small></li>
			<li>Bug Fix: auto dist task npe</li>
			<li>Bug Fix: adding player with no group selected</li>
			<li>Bug Fix: removed loading states to allow button disabling after requests <small>(thanks @Sir Stark)</small></li>
			<li>Bug Fix: day change countdown not showing</li>
			<li>Bug Fix: employer script now clears cache when forcing update <small>(thanks @PiresFelix)</small></li>
		</ul>
		
		
		<p>
			<strong>2014-01-03 v0.7</strong>
		</p>
		<ul>
			<li>Added tips to player report links <small>(thanks @Wakko)</small></li>
			<li>CSS cleanup, moved to wider bootstrap-native container</li>
			<li>Bug fix: cache invalidation on adding new groups <small>(thanks @Sucrilhos)</small></li>
			<li>Bug fix: initial player stats fetching to avoid requests with no details <small>(thanks @Sucrilhos)</small></li>
			<li>Bug fix: unique names to avoid 'tombstoned' task errors on work verification <small>(thanks @Sucrilhos)</small></li>
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