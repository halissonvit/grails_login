class BootStrap {

	def init = { servletContext ->
		Usuario.withTransaction {
			Usuario usuario = Usuario.findOrCreateByLoginAndNomeAndPassword('usuario', 'usuário comum', 'usuario')
			usuario.save()
			Usuario admin = Usuario.findOrCreateByLoginAndNomeAndPassword('admin', 'usuário admin', 'admin')
			admin.save()
		}
	}
	def destroy = {
	}
}
