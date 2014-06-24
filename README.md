grails_login
============

Bootstrap de segurança para aplicações web. O grais_login é um pré-projeto genérico, podendo ser utilizado em outros projetos, que realiza autenticação de usuários e controle de acesso usando Groovy & Grails.

<h2>Autenticação</h2>

A autenticação do usuário é feita com e-mail e senha. A senha é criptografada com hash aleatório utilizando salt. Como isso, a senha nunca irá gerar dois códigos iguais. O hash gerado será utilizado para validar a senha e não poderá ser utilizado para recuperar a senha. Aumentando assim o nível de segurança. 

Feita a comparação da senha, a sessão do usuário será mantida com um sessionId via cookies.

Para recuperar a senha, o usuário deve fornercer o e-mail. Após validar o e-mail, é enviado um link para o e-mail cadastrado onde o usuário pode redefinir a senha.

<h2>Controle de Acesso</h2>

O controle de acesso dos usuários é baseado no RBAC (role-based access control), que é um padrão para restringir o acesso ao sistema para usuários autenticados. O RBAC é baseado em níveis hieráquicos, onde são definidos os acessos as funcionalidades e informações para grupos/perfís de usuários do sistema.  

<h2>Tutorial</h2>


<h2>Membros</h2>

Membros: <ol/>Antônio Carlos <acarlossw@gmail.com></ol>
         <ol/>Arthur Oliveira <sskkun@gmail.com></ol>
         <ol/>Gabriel Benício <gabrielbla85@gmail.com></ol>
         <ol/>Halisson Vitor <halissonvit@gmail.com></ol>
         <ol/>Rogério Tristão <rogerio.tju@gmail.com> </ol>
