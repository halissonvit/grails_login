<nav class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

        <g:sePermitido funcionalidade="Gerenciar Usuários">
            <li><g:link class="list" controller="usuario">Usuários</g:link>
                <ul>
                    <li><g:link class="create" controller="usuario" action="create"><g:message code="default.new.label"
                                                                                               args="['Usuario']"/></g:link></li>
                </ul>

            </li>

        </g:sePermitido>

        <g:sePermitido funcionalidade="Gerenciar Papéis">
            <li><g:link class="list" controller="papel">Papéis</g:link>
                <ul>
                    <li><g:link class="create" controller="papel" action="create"><g:message code="default.new.label"
                                                                                             args="['Papel']"/></g:link></li>
                </ul>
            </li>
        </g:sePermitido>

        <g:sePermitido funcionalidade="Gerenciar Funcionalidades">
            <li><g:link class="list" controller="funcionalidade">Funcionalidades</g:link>
                <ul>
                    <li><g:link class="create" controller="funcionalidade" action="create"><g:message
                            code="default.new.label"
                            args="['Funcionalidade']"/></g:link></li>
                </ul>
            </li>
        </g:sePermitido>

        <li><g:link class="list" controller="usuario" action="edit"
                    params="[id: session.usuario.id]">Minha Conta</g:link>
            <ul>
                <li><g:link controller="password">Alterar senha</g:link></li>
                <li><g:link controller="autenticacao" action="logout">Sair</g:link></li>
            </ul>
        </li>

    </ul>
</nav>
