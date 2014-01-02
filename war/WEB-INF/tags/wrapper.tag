<%@tag language="java" description="Default Wrapper"
	pageEncoding="UTF-8"%>

<%@tag import="java.util.Date"%>

<%@attribute name="imports" fragment="true"%>

<%
	// 1 week
	// https://groups.google.com/forum/#!topic/google-appengine/6xAV2Q5x8AU
	response.setDateHeader("Expires", new Date().getTime() + 172800L);
	response.setHeader("Cache-Control", "public, max-age=172800");
	response.setHeader("Pragma", "Public");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-BR">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="eDist, distribution and management app for eRepublik military units">
<meta name="author" content="Guilpas and nW0lf">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<title>eDist</title>

<%@ include file="baseimports.tag"%>
<jsp:invoke fragment="imports" />

</head>
<body>

	<div class="container">

		<h1>eDist</h1>

		<hr />

		<jsp:doBody />

		<%@ include file="footer.tag"%>
	</div>
</body>
</html>