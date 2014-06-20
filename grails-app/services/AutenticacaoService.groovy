/**
 * Created by Halisson on 19/06/2014.
 */
class AutenticacaoService {
    def bcryptService

    boolean colocaUsuarioNaSessao(Usuario usuario, session) {
        session.usuario = usuario
    }

    boolean autenticaUsuario(String login, String password, session) {
        def usuario = Usuario.findByLogin(login)
        if (usuario && bcryptService.checkPassword(password, usuario.password)) {
            colocaUsuarioNaSessao(usuario, session)
            return true
        } else {
            return false
        }
    }
}
