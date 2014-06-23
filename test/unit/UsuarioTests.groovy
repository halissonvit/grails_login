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

    void testPrecisaDeConfirmacaoDeSenhaIdenticaParaSerValido() {
        usuario.nome = "show"
        usuario.email = "show@show.om"
        usuario.senha = "123"
        assertFalse(usuario.validate())
    }

    void testEncriptaSenhaAntesDeSalvar() {
        assertFalse(usuarioValidoPersistido.senha == "123")
    }

    void testAlterarSenhaDeveVerificarSeSenhaAtualEstaCorretaAntesDeAlterar() {
        usuario = usuarioValidoPersistido
        assertFalse(usuario.alterarSenha("senhaInvalida", "novaSenha", null))
    }

    void testAlterarSenhaDeveVerificarSeConfirmacaoDeNovaSenhaEstaCorretaAntesDeAlterar() {
        usuario = usuarioValidoPersistido
        assertFalse(usuario.alterarSenha("123", "novaSenha", null))
        assertTrue(usuario.alterarSenha("123", "novaSenha", "novaSenha"))
    }

    private Usuario getUsuarioValidoPersistido(Map params = [nome: "show", email: "w@show.com", senha: "123", confirmacaoDeSenha: '123']) {
        Usuario usuario = new Usuario(params)
        usuario.save(flush: true)
        usuario
    }
}
