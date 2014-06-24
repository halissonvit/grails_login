class Funcionalidade {
    Date dateCreated
    Date lastUpdated

    String nome
    String grupo

    static constraints = {
        nome unique: ['grupo']
    }

    String toString() {
        nome
    }
}
