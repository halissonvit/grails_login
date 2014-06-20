class AutenticacaoTagLib {
	def seLogado = { attrs, body ->
		if (session.usuario)
			out << body()
	}
}
