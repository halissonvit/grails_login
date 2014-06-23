class PasswordController {

    static allowedMethods = [index: "GET", alterar: "POST"]

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

        if (usuario.alterarSenha(params.senhaAtual, params.senha, params.confirmacaoDeSenha)) {
            flash.message = "Senha alterada com sucesso"
            redirect(controller: 'usuario', action: 'show', id: usuario.id)
        } else {
            flash.message = "Erro ao alterar a senha, verifique se digitou a senha atual corretamente, e se a verificação de senha está correta!"
            render(view: 'index', model: [usuarioInstance: usuario])
        }
    }
}
