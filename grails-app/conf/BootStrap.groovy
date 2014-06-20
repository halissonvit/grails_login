class BootStrap {

    def init = { servletContext ->
        environments {
            development {
                Funcionalidade.withTransaction {
                    Map funcionalidadesPadrao = [
                            "Administração": [
                                    "Visualizar propriedades avançadas de usuários",
                                    "Cadastrar Administradores"
                            ]
                    ]

                    funcionalidadesPadrao.each { String grupo, List funcionalidades ->
                        funcionalidades.each { String nomeFuncionalidade ->
                            Funcionalidade funcionalidade = Funcionalidade.findOrCreateByGrupoAndNome(grupo, nomeFuncionalidade)
                            funcionalidade.save()
                        }
                    }
                }
            }
        }
    }
    def destroy = {
    }
}
