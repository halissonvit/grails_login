<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'papel.label', default: 'Papel')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-papel" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<g:sePermitido funcionalidade="Gerenciar Papéis">
<div id="show-papel" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list papel">

        <g:if test="${papelInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="papel.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${papelInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${papelInstance?.funcionalidades}">
            <li class="fieldcontain">
                <span id="funcionalidades-label" class="property-label"><g:message code="papel.funcionalidades.label"
                                                                                   default="Funcionalidades"/></span>

                <g:each in="${papelInstance.funcionalidades}" var="f">
                    <span class="property-value" aria-labelledby="funcionalidades-label"><g:link
                            controller="funcionalidade" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

        <g:if test="${papelInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="papel.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${papelInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${papelInstance?.nome}">
            <li class="fieldcontain">
                <span id="nome-label" class="property-label"><g:message code="papel.nome.label" default="Nome"/></span>

                <span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${papelInstance}"
                                                                                        field="nome"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${papelInstance?.id}"/>
            <g:link class="edit" action="edit" id="${papelInstance?.id}"><g:message code="default.button.edit.label"
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
