import grails.test.mixin.TestFor

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Papel)
class PapelTests {
    Papel papel

    public void setUp() throws Exception {
        papel = new Papel()
    }

    void testPodeAcessarFuncionalidadeSeContiver() {
        Funcionalidade funcionalidade = new Funcionalidade(nome: 'show')
        assertFalse(papel.podeAcessar(funcionalidade.nome))
        papel.funcionalidades = [funcionalidade]
        assertTrue(papel.podeAcessar(funcionalidade.nome))
    }
}
