<div class="fieldcontain ${hasErrors(bean: funcionalidadeInstance, field: 'grupo', 'error')} ">
    <label for="grupo">
        <g:message code="funcionalidade.grupo.label" default="Grupo"/>

    </label>
    <g:textField name="grupo" value="${funcionalidadeInstance?.grupo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionalidadeInstance, field: 'nome', 'error')} ">
    <label for="nome">
        <g:message code="funcionalidade.nome.label" default="Nome"/>

    </label>
    <g:textField name="nome" value="${funcionalidadeInstance?.nome}"/>
</div>

