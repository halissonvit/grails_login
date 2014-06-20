import Usuario

class UsuarioController {
    def scaffold = Usuario

    def save() {
        params.remove('admin')
        def usuario = new Usuario(params)
        if (!usuario.save(flush: true)) {
            render(view: "create", model: [usuario: usuario])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
        redirect(action: "show", id: usuario.id)
    }
}
