<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nome', 'error')} ">
    <label for="nome">
        <g:message code="usuario.nome.label" default="Nome"/>

    </label>
    <g:textField name="nome" value="${usuarioInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="usuario.email.label" default="Email"/>

    </label>
    <g:field type="email" name="email" value="${usuarioInstance?.email}"/>
</div>

<g:if test="${renderizaCamposDeSenha}">

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'senha', 'error')} ">
        <label for="senha">
            <g:message code="usuario.senha.label" default="Senha"/>

        </label>
        <g:field type="password" name="senha" value="${usuarioInstance?.senha}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'confirmacaoDeSenha', 'error')} ">
        <label for="confirmacaoDeSenha">
            <g:message code="usuario.confirmacaoDeSenha.label" default="Confirmação De Senha"/>

        </label>
        <g:field type="password" name="confirmacaoDeSenha" value="${usuarioInstance?.confirmacaoDeSenha}"/>
    </div>
</g:if>


<g:if test="${!usuarioInstance?.admin}">
    <div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'papeis', 'error')} ">
        <label for="papeis">
            <g:message code="usuario.papeis.label" default="Papeis"/>

        </label>
        <g:select name="papeis" from="${Papel.list()}" multiple="multiple" optionKey="id" size="5"
                  value="${usuarioInstance?.papeis*.id}" class="many-to-many"/>
    </div>
</g:if>
