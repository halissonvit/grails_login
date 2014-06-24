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
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${usuarioInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${usuarioInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <g:form method="post" action="recuperarSenha">
        <fieldset class="form">
            <g:hiddenField name="key" value="${params.key}"/>

            <div class="fieldcontain  ${error ? 'error' : ''} ">
                <label for="senha">
                    <g:message code="usuario.novaSenha.label" default="Nova Senha"/>
                </label>
                <g:field type="password" name="senha" value=""/>
            </div>

            <div class="fieldcontain  ${error ? 'error' : ''} ">
                <label for="confirmacaoDeSenha">
                    <g:message code="usuario.confirmacaoDeNovaSenha.label" default="Confirmação Da Nova Senha"/>

                </label>
                <g:field type="password" name="confirmacaoDeSenha" value=""/>
            </div>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="recuperarSenha" class="save" value="Enviar"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
