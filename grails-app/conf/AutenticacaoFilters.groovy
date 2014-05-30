import I18nService
import org.springframework.context.MessageSource

class AutenticacaoFilters {
	def MessageSource messageSource
	def I18nService i18nService

	def whiteList = [autenticacao: ['login', 'authenticate', 'index']]

	def filters = {
		all(controller: '*', action: '*') {
			before = {
				if (whiteList[controllerName] && whiteList[controllerName].contains(actionName) || session.usuario) {
					return true
				} else {
					flash.message = i18nService.message(code: 'authentication.not.logged.in')
					redirect(controller: 'autenticacao')
					return false
				}
			}
		}
	}
}
