class PasswordController {

    static allowedMethods = [index: "GET", alterar: "POST", gerarEsqueciSenha: "POST", recuperarSenha: "POST"]

    def index = {
        Usuario usuario = session.usuario
        if (!usuario) {
            redirect(controller: 'autenticacao', action: 'login')
        } else {
            render(view: 'index', model: [usuarioInstance: usuario])
        }
    }

    def alterar = {
        Usuario usuario = session.usuario
        if (!usuario) {
            redirect(controller: 'autenticacao', action: 'login')
            return
        }

        if (usuario.alterarSenha(params.senhaAtual, params.senha, params.confirmacaoDeSenha) && usuario.merge()) {
            flash.message = "Senha alterada com sucesso"
            redirect(controller: 'usuario', action: 'show', id: usuario.id)
        } else {
            flash.message = "Erro ao alterar a senha, verifique se digitou a senha atual corretamente, e se a verificação de senha está correta!"
            render(view: 'index', model: [usuarioInstance: usuario, error: true])
        }
    }

    def esqueci = {}

    def recuperar = {}

    def recuperarSenha = {
        Usuario usuario = Usuario.findByEsqueciMinhaSenha(params.key)

        if (!params.key || !usuario) {
            flash.message = "Chave de recuperação inválida"
            redirect(controller: 'autenticacao', action: 'login')
            return
        }

        if (usuario.criarSenhaComEsqueciMinhaSenha(params.senha, params.confirmacaoDeSenha) && usuario.merge()) {
            flash.message = "Senha alterada com sucesso"
            redirect(controller: 'autenticacao', action: 'login')
        } else {
            flash.message = "Erro ao alterar a senha, verifique se digitou a senha atual corretamente, e se a verificação de senha está correta!"
            render(view: 'index', model: [usuarioInstance: usuario, error: true])
        }
    }

    def gerarEsqueciSenha = {
        Usuario usuario = Usuario.findByEmail(params.email)
        if (!usuario) {
            flash.message = "Usuário não encontrado... Verifique o email e tente novamente."
            render(view: 'esqueci')
            return
        } else {
            flash.message = "Instruções enviadas com sucesso para o email!"
            usuario.gerarEsqueciMinhaSenha()

            String linkRecuperarSenha = g.createLink(
                    controller: 'password',
                    action: 'recuperar',
                    absolute: true,
                    params: [key: usuario.esqueciMinhaSenha]
            )

            sendMail {
                async true
                to usuario.email
                subject "Recuperação de Senha"
                html "Para trocar a senha acesse o link: ${linkRecuperarSenha}"
            }

            redirect(controller: 'autenticacao', action: 'login')
        }
    }
}
