<div class="fieldcontain ${hasErrors(bean: papelInstance, field: 'funcionalidades', 'error')} ">
    <label for="funcionalidades">
        <g:message code="papel.funcionalidades.label" default="Funcionalidades"/>

    </label>
    <g:select name="funcionalidades" from="${Funcionalidade.list()}" multiple="multiple" optionKey="id" size="5"
              value="${papelInstance?.funcionalidades*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: papelInstance, field: 'nome', 'error')} ">
    <label for="nome">
        <g:message code="papel.nome.label" default="Nome"/>

    </label>
    <g:textField name="nome" value="${papelInstance?.nome}"/>
</div>

