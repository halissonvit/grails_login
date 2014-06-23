import grails.test.mixin.Mock
import grails.test.mixin.TestFor

@TestFor(UsuarioController)
@Mock(Usuario)
class UsuarioControllerTests {
    void testSaveNaoPermitePassarSeUsuarioEhAdmin() {
        params.nome = 'show'
        params.login = 'show'
        params.senha = 'show123'
        params.confirmacaoDeSenha = 'show123'
        params.email = 'show@email.com'
        params.admin = true

        controller.save()
        assertFalse Usuario.findByNome(params.nome).admin
    }

    void testSaveCriaNovoUsuarioComParametrosValidos() {
        params.nome = 'show'
        params.login = 'show'
        params.senha = 'show123'
        params.email = 'show@email.com'
        params.confirmacaoDeSenha = 'show123'

        controller.save()

        assert response.redirectedUrl == '/usuario/show/1'
        assert controller.flash.message != null
        assert Usuario.count() == 1
    }
}
