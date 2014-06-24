grails_login
============

Bootstrap de segurança para aplicações web. O grais_login é um pré-projeto genérico, podendo ser utilizado em outros projetos, que realiza autenticação de usuários e controle de acesso usando Groovy & Grails.

<h2>Autenticação</h2>

A autenticação do usuário é feita com e-mail e senha. A senha é criptografada com hash aleatório utilizando salt. Como isso, a senha nunca irá gerar dois códigos iguais. O hash gerado será utilizado para validar a senha e não poderá ser utilizado para recuperar a senha. Aumentando assim o nível de segurança. 

Feita a comparação da senha, a sessão do usuário será mantida com um sessionId via cookies.

<h2>Recuperação de Senha</h2>

Para recuperar a senha, o usuário deve fornercer o e-mail. Após validar o e-mail, é enviado um link para o e-mail cadastrado onde o usuário pode redefinir a senha.

<h2>Controle de Acesso</h2>

O controle de acesso dos usuários é baseado no RBAC (role-based access control), que é um padrão para restringir o acesso ao sistema para usuários autenticados. O RBAC é baseado em níveis hieráquicos, onde são definidos os acessos as funcionalidades e informações para grupos/perfís de usuários do sistema. Assim, além de criar usuários ou grupos de usuários que irão acessar determinado recurso, é possível também criar grupos de recursos e níveis de recursos que serão acessados.

Uma grande vantagem do RBAC, é a possibilidade de se trabalhar com diferentes níveis de granularidade na segurança do sistema, onde quanto mais alto é o nível de granularidade, maior possibilidades de controles de acesso serão possíveis, por possuir maior detalhamento a nível de sujeitos (usuários ou processos) acessando e objetos (arquivos ou outros recursos) sendo acessados.

Existém vários métodos de controles de acesso que são providos por meio do RBAC, cada um possui suas particularidades, vantagens e desvantagens, que devem ser ponderadas de acordo com as expecificações de cada projeto. Para o projeto em questão, foi utilizado como método de controlede de acesso, a Matriz de Controle de Acesso.

Matriz de Controle de Acesso –  este é o modelo mais simples de controle de acesso. Neste modelo é utilizada uma matriz para definir as permissões que os sujeitos terão ao acessar os objetos

A Matriz de Controle de Acesso pode parecer ideal para controlar acessos, porém sua implementação e um sistema com grande quantidade de sujeitos e objetos, pode gerar uma matriz gigantesca, oque seria muito dispendioso, tanto em termos de armazenamento quanto em gerenciamento.

<h2>Groovy</h2>

É uma linguagem dinâmica de programação orientada a objetos desenvolvida sob a plataforma java.

Com características de Python, Ruby e Smalltalk, faz com que o desenvolvimento de aplicações escritas em Java se torne mais produtivo e rápido, por conta de manipulação de recursos mais fáceis de utilizar do que na linguagem Java (manipulação de XML's). 

<h2>Grails</h2>

É um framework para construção de aplicações web através da linguagem dinâmica Groovy.
Baseado no Ruby on Rails, provê uma ferramenta MVC para os desenvolvedores de fácil e rápida

<h2>Membros</h2>

Membros: <ol/>Antônio Carlos <acarlossw@gmail.com></ol>
         <ol/>Arthur Oliveira <sskkun@gmail.com></ol>
         <ol/>Gabriel Benício <gabrielbla85@gmail.com></ol>
         <ol/>Halisson Vitor <halissonvit@gmail.com></ol>
         <ol/>Rogério Tristão <rogerio.tju@gmail.com> </ol>

<h2>Referência</h2>

Wikipédia. Groovy. Disponívem em: http://pt.wikipedia.org/wiki/Groovy. Acesso em: 23/04/2014
Devmedia. Um pouco de Groovy - Uma linguagem de scripts 100% compatível com Java. Disponívem em: http://www.devmedia.com.br/java-magazine-69-um-pouco-de-groovy-uma-linguagem-de-scripts-100-compativel-com-java/12542. Acesso em: 23/06/2014
Wikipédia. Grails. Disponível em: http://pt.wikipedia.org/wiki/Grails. Acesso em: 23/06/2014
Slideshare. Grails o que isso quer dizer. Disponível em: http://pt.slideshare.net/gscordeiro/grails-o-que-isso-quer-dizer. Acesso em: 23/06/2014
Infoq. Grails getting started. Disponível: http://www.infoq.com/minibooks/grails-getting-started. Acesso em: 23/06/2014
