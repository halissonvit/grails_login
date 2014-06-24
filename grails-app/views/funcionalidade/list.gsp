<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'funcionalidade.label', default: 'Funcionalidade')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-funcionalidade" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                     default="Skip to content&hellip;"/></a>

<g:sePermitido funcionalidade="Gerenciar Funcionalidades">
    <div id="list-funcionalidade" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="dateCreated"
                                  title="${message(code: 'funcionalidade.dateCreated.label', default: 'Date Created')}"/>

                <g:sortableColumn property="grupo"
                                  title="${message(code: 'funcionalidade.grupo.label', default: 'Grupo')}"/>

                <g:sortableColumn property="lastUpdated"
                                  title="${message(code: 'funcionalidade.lastUpdated.label', default: 'Last Updated')}"/>

                <g:sortableColumn property="nome"
                                  title="${message(code: 'funcionalidade.nome.label', default: 'Nome')}"/>

            </tr>
            </thead>
            <tbody>
            <g:each in="${funcionalidadeInstanceList}" status="i" var="funcionalidadeInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show"
                                id="${funcionalidadeInstance.id}">${fieldValue(bean: funcionalidadeInstance, field: "dateCreated")}</g:link></td>

                    <td>${fieldValue(bean: funcionalidadeInstance, field: "grupo")}</td>

                    <td><g:formatDate date="${funcionalidadeInstance.lastUpdated}"/></td>

                    <td>${fieldValue(bean: funcionalidadeInstance, field: "nome")}</td>

                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${funcionalidadeInstanceTotal}"/>
        </div>
    </div>
</g:sePermitido>
</body>
</html>
