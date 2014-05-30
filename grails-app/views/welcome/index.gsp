<html>
<head>
	<meta name="layout" content="main"/>
	<title>Welcome</title>
</head>

<body>
<div class="body">
	<h1>Welcome</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:seLogado>
		<g:createLink controller="usuario">Gerenciar usuários</g:createLink>
		Seja bem vindo.
	</g:seLogado>
</div>
</body>
</html>