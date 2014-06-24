import Usuario
import org.springframework.dao.DataIntegrityViolationException

class UsuarioController {
    def UsuarioService usuarioService
    def scaffold = Usuario

    def save() {
        params.remove('admin')
        def usuario = new Usuario(params)
        usuario.senha = params.senha
        usuario.confirmacaoDeSenha = params.confirmacaoDeSenha

        if (!usuario.save(flush: true)) {
            render(view: "create", model: [usuarioInstance: usuario])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
        redirect(action: "show", id: usuario.id)
    }

    def update(Long id, Long version) {
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (usuario.version > version) {
                usuario.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'usuario.label', default: 'Usuario')] as Object[],
                        "Another user has updated this Usuario while you were editing")
                render(view: "edit", model: [usuario: usuario])
                return
            }
        }

        usuario.properties = params

        try {
            if (!usuarioService.tenteAtualizar(session.usuario, usuario)) {
                render(view: "edit", model: [usuarioInstance: usuario])
                return
            }
            flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
            redirect(action: "show", id: usuario.id)
        }
        catch (IllegalStateException e) {
            flash.message = e.message
            render(view: "edit", model: [usuarioInstance: usuario])
        }
    }

    def delete(Long id) {
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        try {
            usuarioService.tenteRemover(session.usuario, usuario)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
        }
        catch (IllegalStateException e) {
            flash.message = e.message
            redirect(action: "show", id: id)
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "show", id: id)
        }
    }

}
