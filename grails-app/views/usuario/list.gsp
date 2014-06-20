<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-usuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-usuario" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="nome" title="${message(code: 'usuario.nome.label', default: 'Nome')}"/>

            <g:sortableColumn property="login" title="${message(code: 'usuario.login.label', default: 'Login')}"/>

            <g:sePermitido>
                <g:sortableColumn property="admin" title="${message(code: 'usuario.admin.label', default: 'Admin')}"/>
            </g:sePermitido>

        </tr>
        </thead>
        <tbody>
        <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nome")}</g:link></td>

                <td>${fieldValue(bean: usuarioInstance, field: "login")}</td>

                <g:sePermitido funcionalidade="Visualizar propriedades avançadas de usuários">
                    <td><g:formatBoolean boolean="${usuarioInstance.admin}"/></td>
                </g:sePermitido>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${usuarioInstanceTotal}"/>
    </div>
</div>
</body>
</html>
