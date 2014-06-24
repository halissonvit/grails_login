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
