class Usuario {
	def bcryptService

	String login
	String password
	String nome

	String toString() {
		login
	}

	static constraints = {
		login(unique: true)
		password(password: true)
		nome()
	}

	def beforeInsert() {
		this.password = bcryptService.hashPassword(password)
	}
}
