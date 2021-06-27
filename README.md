## 🧐 DESAFIO IOS - MOBILE PLATFORM

Uma das principais responsabilidades do time de *mobile platform* da OLX Brasil é evoluir constantemente a arquitetura dos nossos apps.

Para isto, as pessoas engenheiras da nossa squad precisam dominar as melhores práticas de arquitetura de software (ex: modularização e desacoplamento), assim como garantir a qualidade e segurança.

Desafio:

Faça um fork desse repo e refatore o aplicativo para uma nova arquitetura que garanta:

* Escalabilidade, ou seja, permita que novas features sejam adicionadas sem necessidade de alterar o código existente
* Reuso, ou seja, permitir que partes do app possam ser reaproveitadas em outros apps  
* Testabilidade - Aqui gostaríamos de analisar sua implementação de testes unitários e de UI 

Você poderá ganhar pontos extras se (totalmente opcional):

* Implementar automação de CI/CD
* Habilitar ferramenta de análise estática de seu código  

Dica:

* Como somos um time de plataforma, estamos mais interessados em analisar seus skills em arquitetura, portanto você não precisa evoluir a UI (usabilidade / telas / interface)
* Para que possamos analisar o seu processo de desenvolvimento, não desenvolva tudo em uma única branch ou em um único commit

Boa sorte :)

### Essa documentação também pode ser conferida na [WIKI](https://github.com/ViniciusDeep/desafio-mobile-platform/wiki/1--%F0%9F%9B%A0-Setup-&-Workflow-do-Projeto) do projeto
 
 ## 🛠 Setup & Workflow do Projeto
 
 ### Setup

* 1- Clonar a branch
* 2- CMD + R
* 3- Para rodar os testes CMD + U

#### Requisitos:

* Swift 5.0
* Xcode 12.1 || 12.2 || 12.3 || 12.4 || 12.5(Versões garantidas a serem suportadas pelo projeto)
* iOS 14.4

 ### Workflow

 O projeto conta com um workflow de git que consiste na qual todo artefato que deve ser publicado em master, deve passar pela esteira de integração e rodar os testes para garantir maior integridade no projeto.
 
 #### GitHub Project
 
 Todo PR criado será automatizado no Project do Github, e passará pelas esteiras de In Progress até chegar em Done

 <img width="352" alt="Captura de Tela 2021-06-27 às 14 53 28" src="https://user-images.githubusercontent.com/32227073/123554672-703b6780-d757-11eb-8b5d-9db149012523.png">


 ### CI + Fastlane + Code Climate = 💜 

 Como CI utilizamos o Github Action rodando uma pipe de teste em todo PR aberto para master em busca de maior integridade.

 <img width="903" alt="Captura de Tela 2021-06-27 às 00 49 22" src="https://user-images.githubusercontent.com/32227073/123532185-84dd1880-d6e1-11eb-89d5-b48954e9f8b3.png">

 O Code Climate entra como uma ferramenta que gera alguns métricas do nosso código como testes, manutenabilidade, code smells e também é um dos nossos revisores:

 <a href="https://codeclimate.com/github/ViniciusDeep/desafio-mobile-platform/maintainability"><img src="https://api.codeclimate.com/v1/badges/63c71574fd97656ca0df/maintainability" /></a>

 <img width="368" alt="Captura de Tela 2021-06-27 às 00 51 34" src="https://user-images.githubusercontent.com/32227073/123532223-d4234900-d6e1-11eb-989c-ccad153a5e2b.png">
 
 #### Branchs:
 
 Temos a branch protected sendo a master
 
 As branchs devem segui o padrão:
 
 * feature/[Name]
 * test/[Name]
 * task/[Name]
 * fix/[Name]
 
 #### Commits:
 
 Temos um guide de commit, onde o commit deve conter um emoji + prefix sendo eles:
 
 ✅ Referente a testes, 🔖 Documentação, 🛠 Ajuste no projeto, 🖌 Mudança no layout, 👨🏽‍🎨 Mudança na Scene
 
*  Add: 
*  Chore:
 * Test:
 * Improvement: 
 * Update:
 * Create:


 ## 💡 Arquitetura:

 A arquitetura do projeto é visada pensando em garantir maior manutenabilidade do código, com código desacoplado que nos possibilita realizar testes de maneira mais exata, para isso decidimos por usar o [Clean Swift (VIP)](https://clean-swift.com/handbook/)

 Nossas camadas consistem em:

 Scene: É a feature englobada no contexto que está sendo aplicada
 View: Apresenta e representa o contexto de apresentação
 Interactor: Representa nossa lógica de negócio referente ao contexto da Scene
 Presenter: Responsável pela lógica de apresentação


 ![](https://zonneveld.dev/wp-content/uploads/2019/05/VIP-CleanSwift-cycle.png)

 ## 🕸 Módulos:

 A modularização foi definida nos seguintes módulos:

 - OUIKit: Módulo com componentes de UI e segmentações de UI
 - ONetwork: Módulo com a camada de network.
 - Desafio: Módulo principal do app com as seguintes scenes

🔖 Débitos Técnicos

Devido ao tempo alguns pontos no projeto entraram como débito técnico, e aqui elucidaremos formas de resolver 

* [] Testes de UI utilizando o próprio XCUITest
* [] Refatorar a célula para o uso de ViewCode afim de reaproveitar mais ainda
* [] Refatorar o download da imagem, para incluir cache e desacoplar a lógica a extesion de UIImageView como exemplo `[Nuke](https://github.com/kean/Nuke)`
* [] Utilizar project tool para gerar os módulos e evitar o uso de XcodeProj([Xcode Gen](https://github.com/yonaskolb/XcodeGen), [Tuist](https://tuist.io/))
* [] Refatorar os modelos para retirar o uso de camel case , e usar DTO's para ficarem responsáves pela parte de transferencia de dados entre os objetos concretos
* [] Utilização de lint e Dagner para aferir style  guide no source


