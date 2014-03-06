<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<t:wrapper>

	<jsp:attribute name="imports">
	</jsp:attribute>

	<jsp:body>
		<h2>Changelog</h2>

		<p>
			<strong>2014-03-05 v0.13</strong>
		</p>
		<ul>
			<li>Update do AppEngine SDK 1.9.0</li>
			<li>Enabled datanucleus L2 cache</li>
			<li>Removed unused entity links on Player</li>
			<li>Removed unused indexes</li>
			<li>Started tracking guerrilla stats and bombs used</li>
			<li>Slow down logged in queue to lower failure rate</li>
			<li>Automatically cancels supply tasks stuck in the queue for more than 200 executions</li>
			<li>Records player division</li>
			<li>Data migration servlet</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/51">#51</a>: Filtering by Division on /players/</li>
			<li>Bug Fix: properly check employer's auth key</li>
			<li>Bug Fix: properly check for concomitant distributor access</li>
			<li>Bug Fix: Some rank images would show with the wrong size</li>
		</ul>
			
		<p>
			<strong>2014-02-22 v0.12</strong>
		</p>
		<ul>
			<li>Added "licence expired" warning to homepage</li>
			<li>Added lastUpdatedAt text on employer's /reports/ select </li>
			<li>Added groups/player count to /management/</li>
			<li>Added player refresh server to transition player count</li>
			<li>Added parsing of player citizenship, MU and ban/dead status</li>
			<li>Automatically disables dead or permabanned players</li>
			<li>Hides header text on phones to get it out of the way</li>
			<li>Improved player links on reports</li> 
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/64">#64</a>: Max Hit is not calculated when first adding a player</li>
			<li>Bug Fix: Employer's auth key leak</li>
		</ul>

		<p>
			<strong>2014-02-19 v0.11</strong>
		</p>
		<ul>
			<li>Improved detection of failed supplies <small>(thanks @Guilpas and @junecaz)</small></li>
			<li>Added a CAPTCHA check to fail early if distributor is not Bronze+ <small>(thanks @Guilpas)</small></li>
			<li>Disabled auto dist while issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/54">#54</a> is not fixed</li>
			<li>Bug Fix: properly saves player if employer is null</li>
			<li>Bug Fix: Properly save player employer on /management/ <small>(thanks @Guilpas)</small></li>
			<li>Bug Fix: Fixed CSS for email input on /admin/config</li>
		</ul>
		
		
		<p>
			<strong>2014-02-15 v0.10</strong>
		</p>
		<ul>
			<li>Employers script now accepts multiple player accounts per user <small>(thanks @Guilpas)</small></li>
			<li>Improved client side caching on employers script</li>
			<li>Changed avatar resize to onClick instead of onMouseOver <small>(thanks @SpellCat)</small></li>
			<li>Removed white borders from avatars <small>(thanks @SpellCat)</small></li>
			<li>Pressing 'c' while forcing an update will now clear the auth key on the employer's script <small>(thanks @Guilpas)</small></li>
			<li>Better form images <small>(thanks @Bellenus)</small></li>
			<li>Updated to Bootstrap 3.1.0 and jQuery 1.11.0</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/40">#40</a>: distributor cannot send resources to itself</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/52">#52</a>: better work reports</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/62">#62</a>: smaller work list</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/69">#69</a>: rename 'granularity'</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/70">#70</a>: employers - add employee count</li>
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/72">#72</a>: wrapper: add a 'noscript' tag</li>	
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/73">#73</a>: distributors: add a warning about simultaneous logins</li>		
			<li>Issue <a
				href="https://bitbucket.org/marcelofs/edist/issue/75">#75</a>: add 'current employer' field on management</li>
			<li>Bug Fix: saving work would fail if there was no player status for the date <small>(thanks @Guilpas)</small></li> 
			<li>Bug Fix: not being able to select player's rocket factory level <small>(thanks @Bonna)</small></li>
			<li>Bug Fix: moved task creation outside of the transaction to avoid limits on rocket requests <small>(thanks @Bonna)</small></li>
			<li>Bug Fix: work verification status would sometimes be overwritten</li>
			<li>Bug Fix: report links would appear even user didn't have access to them</li>
		</ul>
		
		
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