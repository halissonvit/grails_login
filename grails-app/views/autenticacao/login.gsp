<html>
<head>
    <meta name="layout" content="main"/>
    <title>Login</title>
</head>

<body>
<div class="body">
    <h1>Login</h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:form action="authenticate" method="post">
        <div class="dialog">
            <table>
                <tbody>
                <tr class="prop">
                    <td class="name">
                        <label for="email">Email:</label>
                    </td>
                    <td>
                        <input type="email" id="email" name="email" required/>
                    </td>
                </tr>

                <tr class="prop">
                    <td class="name">
                        <label for="senha">Senha:</label>
                    </td>
                    <td>
                        <input type="password" id="senha" name="senha" required/>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button">
                <input class="save" type="submit" value="Login"/>
                <g:link controller="password" action="esqueci">Esqueci minha senha</g:link>
            </span>
        </div>
    </g:form>
</div>
</body>
</html>