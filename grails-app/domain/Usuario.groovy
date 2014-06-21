import grails.plugin.bcrypt.BCrypt

class Usuario {
    String login
    String password
    String nome
    Boolean admin = false

    static hasMany = [papeis: Papel]

    static constraints = {
        nome()
        login(unique: true)
        password(password: true)
        admin bindable: false, display: false
    }

    def beforeInsert() {
        password = BCrypt.hashpw(password, BCrypt.gensalt())
    }

    String toString() {
        login
    }

    boolean podeAcessar(String funcionalidade) {
        admin
    }
}
