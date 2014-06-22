import grails.test.mixin.TestFor

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Usuario)
class UsuarioTests {
    Usuario usuario

    public void setUp() throws Exception {
        usuario = new Usuario()
    }

    void testNaoPodeAcessarSeNaoTiverFuncionalidade() {
        assertFalse(usuario.podeAcessar(null))
        assertFalse(usuario.podeAcessar(""))
        usuario.admin = true
        assertFalse(usuario.podeAcessar(null))
        assertFalse(usuario.podeAcessar(""))
    }

    void testPodeAcessarQualquerFuncionalidadeSeForAdmin() {
        usuario.admin = true
        assertTrue(usuario.podeAcessar("qualquerFuncionalidade"))
    }

    void testPodeAcessarSeQualquerUmDosSeusPapeisTiverAcessoAFuncionalidade() {
        Funcionalidade funcionalidade = new Funcionalidade(nome: 'show')
        Papel papel = new Papel(funcionalidades: [funcionalidade])
        usuario.papeis = [papel]
        assertTrue(usuario.podeAcessar(funcionalidade.nome))
    }
}
