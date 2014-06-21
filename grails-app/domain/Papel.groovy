class Papel {
    String nome

    static hasMany = [features: Funcionalidade]

    static constraints = {
    }

    String toString() {
        nome
    }
}
