import Usuario

class AutenticacaoController {
	def bcryptService

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

		def usuario = Usuario.findByLogin(params.login)

		if (usuario && bcryptService.checkPassword(params.password, usuario.password)) {
			session.usuario = usuario
			flash.message = message(code: 'authentication.login.success.message', args: [usuario.nome])
			redirect(controller: "welcome")
		} else {
			flash.message = message(code: 'authentication.login.failure.message', args: [params.login])
			redirect(action: "login")
		}
	}

	def logout = {
		flash.message = message(code: 'authentication.logout.message', args: [session.usuario.nome])
		session.usuario = null
		redirect(controller: "welcome")
	}
}
