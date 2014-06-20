class AutenticacaoController {
    def AutenticacaoService autenticacaoService

    def index = {
        redirect(action: 'login')
    }

    def login = {
        render(view: 'login')
    }

    def authenticate = {
        if (!params.login || !params.password) {
            flash.message = message(code: 'authentication.login.invalid.params')
            redirect(action: "login")
        }

        if (autenticacaoService.autenticaUsuario(params.login, params.password)) {
            flash.message = message(code: 'authentication.login.success.message', args: [session.usuario.nome])
            redirect(controller: "welcome")
        } else {
            flash.message = message(code: 'authentication.login.failure.message', args: [params.login])
            redirect(action: "login")
        }
    }

    def logout = {
        if (session.usuario) {
            flash.message = message(code: 'authentication.logout.message', args: [session.usuario.nome])
            session.usuario = null
        }
        redirect(controller: "welcome")
    }
}
