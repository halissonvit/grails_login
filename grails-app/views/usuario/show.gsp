<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>
<g:sePermitido funcionalidade="Gerenciar Usuários">

    <div id="show-usuario" class="content scaffold-show" role="main">
        <h1><g:message code="default.show.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ol class="property-list usuario">

            <g:if test="${usuarioInstance?.nome}">
                <li class="fieldcontain">
                    <span id="nome-label" class="property-label"><g:message code="usuario.nome.label"
                                                                            default="Nome"/></span>

                    <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${usuarioInstance}"
                                                                                            field="nome"/></span>

                </li>
            </g:if>

            <g:if test="${usuarioInstance?.email}">
                <li class="fieldcontain">
                    <span id="email-label" class="property-label"><g:message code="usuario.email.label"
                                                                             default="Email"/></span>

                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usuarioInstance}"
                                                                                             field="email"/></span>

                </li>
            </g:if>


            <g:sePermitido funcionalidade="Visualizar propriedades avançadas de usuários">
                <g:if test="${usuarioInstance?.admin}">
                    <li class="fieldcontain">
                        <span id="admin-label" class="property-label"><g:message code="usuario.admin.label"
                                                                                 default="Admin"/></span>

                        <span class="property-value" aria-labelledby="admin-label"><g:formatBoolean
                                boolean="${usuarioInstance?.admin}"/></span>

                    </li>
                </g:if>
            </g:sePermitido>

            <g:sePermitido funcionalidade="Visualizar propriedades avançadas de usuários">
                <g:if test="${usuarioInstance?.papeis}">
                    <li class="fieldcontain">
                        <span id="papeis-label" class="property-label"><g:message code="usuario.papeis.label"
                                                                                  default="Papeis"/></span>

                        <g:each in="${usuarioInstance.papeis}" var="p">
                            <span class="property-value" aria-labelledby="papeis-label"><g:link controller="papel"
                                                                                                action="show"
                                                                                                id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
                        </g:each>

                    </li>
                </g:if>
            </g:sePermitido>

        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${usuarioInstance?.id}"/>
                <g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message
                        code="default.button.edit.label"
                        default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</g:sePermitido>
</body>
</html>
