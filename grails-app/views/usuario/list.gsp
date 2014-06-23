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

<g:sePermitido funcionalidade="Gerenciar Usuários">
    <div id="list-usuario" class="content scaffold-list" role="main">
        <h1><g:message code="default.list.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <table>
            <thead>
            <tr>

                <g:sortableColumn property="nome" title="${message(code: 'usuario.nome.label', default: 'Nome')}"/>

                <g:sortableColumn property="email" title="${message(code: 'usuario.email.label', default: 'Email')}"/>

                <g:sePermitido funcionalidade="Visualizar propriedades avançadas de usuários">
                    <g:sortableColumn property="admin"
                                      title="${message(code: 'usuario.admin.label', default: 'Admin')}"/>
                </g:sePermitido>

                <th>Ações</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
                <g:if test="${session.usuario != usuarioInstance}">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show"
                                    id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "nome")}</g:link></td>

                        <td>${fieldValue(bean: usuarioInstance, field: "email")}</td>

                        <g:sePermitido funcionalidade="Visualizar propriedades avançadas de usuários">
                            <td><g:formatBoolean boolean="${usuarioInstance.admin}"/></td>
                        </g:sePermitido>

                        <td>
                            <g:form class="list_actions" action="delete" params="[id: usuarioInstance.id]">
                                <fieldset class="buttons">
                                    <g:link class="edit" action="edit" id="${usuarioInstance?.id}"><g:message
                                            code="default.button.edit.label"
                                            default="Edit"/></g:link>
                                    <g:actionSubmit class="delete" action="delete"
                                                    value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                    onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                                </fieldset>
                            </g:form>
                        </td>

                    </tr>
                </g:if>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${usuarioInstanceTotal}"/>
        </div>
    </div>
</g:sePermitido>
</body>
</html>
