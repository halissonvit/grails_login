class Papel {
    Date dateCreated
    Date lastUpdated

    String nome

    static hasMany = [funcionalidades: Funcionalidade]

    static constraints = {
    }

    String toString() {
        nome
    }

    boolean podeAcessar(String funcionalidade) {
        funcionalidades.any { it.nome == funcionalidade }
    }
}
