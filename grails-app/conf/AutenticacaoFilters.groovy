import I18nService
import org.springframework.context.MessageSource

class AutenticacaoFilters {
    def MessageSource messageSource
    def I18nService i18nService
    def UsuarioService usuarioService

    def noAuthenticationNeeded = [
            autenticacao: ['login', 'authenticate', 'index'],
            welcome     : ['index', 'primeiroAcesso', 'primeiroAdmin'],
            password    : ['esqueci', 'gerarEsqueciSenha', 'recuperar', 'recuperarSenha']

    ]

    def filters = {
        primeiroAcesso(controller: '*', action: '*') {
            before = {
                if (isWhiteList(controllerName, actionName)) {
                    return true
                } else if (usuarioService.primeiroAcesso) {
                    redirect(controller: 'welcome', action: 'primeiroAcesso')
                    return false
                } else {
                    return true
                }
            }
        }
        all(controller: '*', action: '*') {
            before = {
                if (isWhiteList(controllerName, actionName) || session.usuario) {
                    return true
                } else {
                    flash.message = i18nService.message(code: 'authentication.not.logged.in')
                    redirect(controller: 'autenticacao')
                    return false
                }
            }
        }
    }

    boolean isWhiteList(controllerName, actionName) {
        noAuthenticationNeeded[controllerName] && noAuthenticationNeeded[controllerName].contains(actionName)
    }
}
