/**
 * Created by Halisson on 19/06/2014.
 */
class AutenticacaoService {
    def bcryptService

    boolean colocaUsuarioNaSessao(Usuario usuario, session) {
        session.usuario = usuario
    }

    boolean autenticaUsuario(String email, String password, session) {
        def usuario = Usuario.findByEmail(email)
        if (usuario && bcryptService.checkPassword(password, usuario.senha)) {
            colocaUsuarioNaSessao(usuario, session)
            return true
        } else {
            return false
        }
    }
}
