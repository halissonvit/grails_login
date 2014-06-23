class EsqueciMinhaSenha {
    Date dateCreated
    Date lastUpdated

    String hash

    Usuario usuario

    static constraints = {
    }

    static EsqueciMinhaSenha build() {
        new EsqueciMinhaSenha(hash: UUID.randomUUID())
    }
}
