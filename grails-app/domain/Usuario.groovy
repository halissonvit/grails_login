import grails.plugin.bcrypt.BCrypt

class Usuario {
    String login
    String password
    String nome
    Boolean admin

//    static hasMany = [papeis: Papel]
//    static belongsTo = [Papel]

    static constraints = {
        nome()
        login(unique: true)
        password(password: true, display: false)
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
