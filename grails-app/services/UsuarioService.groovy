import grails.plugin.mail.MailService

/**
 * Created by Halisson on 19/06/2014.
 */
class UsuarioService {
    def MailService mailService

    boolean isPrimeiroAcesso() {
        !Usuario.count
    }

    void tenteRemover(Usuario usuario, Usuario usuarioARemover) {
        if (!usuario.podeAcessar("Gerenciar Usuários")) {
            throw new IllegalStateException("Você não tem permissão para gerenciar usuários!")
        } else if (!usuario.admin && usuarioARemover.admin) {
            throw new IllegalStateException("Somente administradores podem gerenciar administradores!")
        } else if (Usuario.findAllByAdmin(true).size() <= 1) {
            throw new IllegalStateException("Não é permitido remover o único administrador do sistema!")
        }

        usuarioARemover.delete(flush: true)
    }

    boolean tenteAtualizar(Usuario usuario, Usuario usuarioAAtualizar) {
        if (!usuario.podeAcessar("Gerenciar Usuários")) {
            throw new IllegalStateException("Você não tem permissão para gerenciar usuários!")
        } else if (!usuario.admin && usuarioAAtualizar.admin) {
            throw new IllegalStateException("Somente administradores podem gerenciar administradores!")
        }

        usuarioAAtualizar.save(flush: true)
    }
}
