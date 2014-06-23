<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div id="edit-usuario" class="content scaffold-edit" role="main">
    <h1>Esqueci minha senha</h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:form method="post" action="gerarEsqueciSenha">
        <fieldset class="form">
            Digite seu email e receba instruções por email...
            <div>
                <label for="email">
                    <g:message code="usuario.email.label" default="Email"/>

                </label>
                <g:field type="email" name="email" value=""/>
            </div>

        </fieldset>

        <fieldset class="buttons">
            <g:submitButton name="gerarEsqueciSenha" class="save" value="Enviar"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
