<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome</title>
</head>

<body>

<h1>Welcome</h1>
<g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
</g:if>
<g:seLogado>
    Seja bem vindo.

</g:seLogado>
</body>
</html>