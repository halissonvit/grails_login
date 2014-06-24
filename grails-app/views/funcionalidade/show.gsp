<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'funcionalidade.label', default: 'Funcionalidade')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-funcionalidade" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<g:sePermitido funcionalidade="Gerenciar Funcionalidades">
    <div id="show-funcionalidade" class="content scaffold-show" role="main">
        <h1><g:message code="default.show.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ol class="property-list funcionalidade">

            <g:if test="${funcionalidadeInstance?.dateCreated}">
                <li class="fieldcontain">
                    <span id="dateCreated-label" class="property-label"><g:message
                            code="funcionalidade.dateCreated.label"
                            default="Date Created"/></span>

                    <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                            date="${funcionalidadeInstance?.dateCreated}"/></span>

                </li>
            </g:if>

            <g:if test="${funcionalidadeInstance?.grupo}">
                <li class="fieldcontain">
                    <span id="grupo-label" class="property-label"><g:message code="funcionalidade.grupo.label"
                                                                             default="Grupo"/></span>

                    <span class="property-value" aria-labelledby="grupo-label"><g:fieldValue
                            bean="${funcionalidadeInstance}" field="grupo"/></span>

                </li>
            </g:if>

            <g:if test="${funcionalidadeInstance?.lastUpdated}">
                <li class="fieldcontain">
                    <span id="lastUpdated-label" class="property-label"><g:message
                            code="funcionalidade.lastUpdated.label"
                            default="Last Updated"/></span>

                    <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                            date="${funcionalidadeInstance?.lastUpdated}"/></span>

                </li>
            </g:if>

            <g:if test="${funcionalidadeInstance?.nome}">
                <li class="fieldcontain">
                    <span id="nome-label" class="property-label"><g:message code="funcionalidade.nome.label"
                                                                            default="Nome"/></span>

                    <span class="property-value" aria-labelledby="nome-label"><g:fieldValue
                            bean="${funcionalidadeInstance}"
                            field="nome"/></span>

                </li>
            </g:if>

        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${funcionalidadeInstance?.id}"/>
                <g:link class="edit" action="edit" id="${funcionalidadeInstance?.id}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</g:sePermitido>a
</body>
</html>
