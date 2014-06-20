class AutorizacaoTagLib {
	def sePermitido = { attrs, body ->
		if (session?.usuario?.podeAcessar(attrs.funcionalidade))
			out << body()
	}
}
