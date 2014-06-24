class Papel {
    Date dateCreated
    Date lastUpdated

    String nome

    static hasMany = [funcionalidades: Funcionalidade]

    static constraints = {
        nome unique: true
    }

    static mapping = {
        funcionalidades lazy: false
    }

    String toString() {
        nome
    }

    boolean podeAcessar(String funcionalidade) {
        funcionalidades.any { it.nome == funcionalidade }
    }
}
