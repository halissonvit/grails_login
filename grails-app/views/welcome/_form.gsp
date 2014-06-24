<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} ">
    <label for="nome">
        <g:message code="usuario.nome.label" default="Nome"/>

    </label>
    <g:textField name="nome" value="${usuarioInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="usuario.email.label" default="email"/>

    </label>
    <g:field type="email" name="email" value="${usuarioInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} ">
    <label for="senha">
        <g:message code="usuario.senha.label" default="Senha"/>

    </label>
    <g:passwordField name="senha" value="${usuarioInstance?.senha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} ">
    <label for="confirmacaoDeSenha">
        <g:message code="usuario.confirmacaoDeSenha.label" default="Confirmação de Senha"/>

    </label>
    <g:passwordField name="confirmacaoDeSenha" value="${usuarioInstance?.confirmacaoDeSenha}"/>
</div>


