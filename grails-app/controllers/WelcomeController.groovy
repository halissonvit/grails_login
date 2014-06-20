class WelcomeController {
    def UsuarioService usuarioService
    def AutenticacaoService autenticacaoService
    static allowedMethods = [primeiroAdmin: 'POST']

    def index() {
        render(view: 'index')
    }

    def primeiroAcesso() {
        render(view: 'primeiroAcesso', model: [usuarioInstance: new Usuario()])
    }

    def primeiroAdmin() {
        if (usuarioService.primeiroAcesso) {
            def usuario = new Usuario(params)
            usuario.admin = true
            if (!usuario.save()) {
                render(view: "create", model: [usuario: usuario])
                return
            }

            autenticacaoService.colocaUsuarioNaSessao(usuario, session)
            flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
            redirect(controller: 'usuario', action: "show", id: usuario.id)
        } else {
            redirect(controller: 'autenticacao', action: "logout")
        }
    }
}
