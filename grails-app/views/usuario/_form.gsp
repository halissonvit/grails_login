<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} ">
    <label for="nome">
        <g:message code="usuario.nome.label" default="Nome"/>

    </label>
    <g:textField name="nome" value="${usuarioInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'login', 'error')} ">
    <label for="login">
        <g:message code="usuario.login.label" default="Login"/>

    </label>
    <g:textField name="login" value="${usuarioInstance?.login}"/>
</div>
