
*Obs 1: O widget principal de um app flutter. É importante saber os parametros principais para esse widget, pois é nele que alguuma características principais do aplicativo são definidas, como o título do app, rotas de navegação e o widget inicial que aparece ao iniciar o app, além de definir se o banner de debug deve ser visível ou não (eu geralmente desativo para deixar o visual mais limpo)*

**• Explique o MaterialApp e seus parâmetros:**  
O `MaterialApp` é o widget raiz que configura a estrutura básica de um aplicativo Flutter seguindo o padrão do Material Design. Ele envolve todo o app e define temas, rotas, título, página inicial, e outras configurações globais. É através dele que se definem os caminhos de navegação (`routes`), o widget inicial (`home`), o título da aplicação (`title`) e até mesmo o tema visual com `theme`. Ele também permite desativar a faixa de debug com `debugShowCheckedModeBanner: false`.

---

*Obs 2: Como falei anteriormente, é importante saber os parametros principais para deixar o app com visual mais limpo e organizado e usar sistemas mais avançados de navegação (routes)*

**• Quais parâmetros são importantes no MaterialApp?**  
Alguns dos parâmetros mais importantes são: `home`, que define a tela inicial do app; `routes`, que mapeia as rotas de navegação; `initialRoute`, que define a rota inicial; `theme`, que define o visual da interface; `title`, que dá nome ao app; e `debugShowCheckedModeBanner`, usado para ocultar a faixa de debug. Esses parâmetros ajudam a organizar o app de forma limpa, facilitando a navegação e o estilo.

---

*Obs 3: Assim como em qualquer outro framework ou linguagem, é possível importar pacotes e livrarias de outros projetos em um projeto Flutter. Além disso, o Flutter tem vários pacotes built-in e infinitos outros pacotes open source feitos pela comunidade*

**• Como funcionam os “import’s” no flutter?**  
Os `import`s no Flutter são usados para incluir bibliotecas e arquivos que contêm funções, widgets ou classes que queremos usar. Por exemplo, `import 'package:flutter/material.dart';` importa os widgets padrão do Material Design. Também podemos importar nossos próprios arquivos ou pacotes externos. Eles são essenciais para organizar e reutilizar código em projetos maiores.

---

*Obs 4: O material design não é algo exclusivo do Flutter, apesar de ter sido criado pela Google. Outros frameworks utilizam esse sistema, como o Objective-C e o Angular-JS. Entretanto, por ter sido criado pensando em sua aplicabilidade no ecossistema flutter, ele é extremamente otimizado para apps desenvolvidos nesse framework*

**• Explique o que é o Material Design e como ele é utilizado no Flutter:**  
Material Design é um sistema de design criado pelo Google que define diretrizes visuais e interativas para aplicativos. No Flutter, ele é utilizado por meio de widgets específicos como `AppBar`, `Scaffold`, `FloatingActionButton`, entre outros. O Flutter já vem com esses componentes prontos, facilitando a criação de interfaces bonitas e padronizadas com pouco esforço.

---

*Obs 5 É importante seguir os padrões de criação ao utilizar esses widgets, e saber muito bem como aplicá-los, pois ele são a base de qualquer app flutter*

**• Quais são os principais widgets do Material Design disponíveis no Flutter?**  
Os principais widgets incluem `Scaffold` (estrutura básica da tela), `AppBar` (barra superior), `TextField` (campo de texto), `ElevatedButton` (botão elevado), `FloatingActionButton` (botão flutuante), `Drawer` (menu lateral), `Card` (cartões de conteúdo), entre outros. Eles seguem as diretrizes do Material Design e ajudam a construir interfaces modernas e consistentes.

---

*Obs 6: A maiora dos Widgets que o programador Fluter cria são widgets Stateless (ou pelo menos deveriam ser), pois eles permitem manter o código organizado e conciso, além de serem mais otimizados que os widgets stateless*

**• O que são widgets Stateless e quando devemos utilizá-los?**  
Widgets Stateless são aqueles que não possuem estado interno, ou seja, seu conteúdo não muda após serem criados. Devem ser utilizados quando a interface do componente permanece a mesma, como por exemplo em textos fixos, ícones, ou botões que não dependem de variáveis para mudar. Eles são mais simples e rápidos de renderizar por não exigirem atualizações constantes.

---

*Obs 7: Mantêm seu estado durante toda sua vida, pois não é Stateful, isto é, seu estado é definido uma vez, e não é possível mudá-lo após sua criação, diferentemente dos widgets stateful*

**• Explique o ciclo de vida de um widget Stateless:**  
O ciclo de vida de um widget Stateless é simples. Ele é criado, renderizado uma vez e permanece igual enquanto não for destruído. Se precisar mudar, o Flutter destrói o widget antigo e cria um novo com as novas informações. Não há métodos como `initState` ou `dispose`, pois ele não gerencia estado algum.

---

*Obs 8: Por essa maneira, eles devem ser usados apenas quando o conteúdo exibido é estático, isto é, não muda suas características. As Appbars geralmente são stateless widgets, pois normalmente nâo têm seu conteúdo alterado*

**• Quais são as limitações dos widgets Stateless?**  
A principal limitação é que eles não conseguem atualizar a interface por conta própria após serem construídos. Eles são úteis apenas quando o conteúdo da interface não muda. Se o widget precisar reagir a interações do usuário, como cliques ou entradas de texto que alterem a aparência ou o conteúdo, é necessário usar um widget Stateful.

---

*Obs 9: Botões, caixas de texto, labels, scaffolds (a depender da aplicação) geralmente são stateful, enquanto AppBars são normalmente stateless*

**• O que são widgets Stateful e quando devemos utilizá-los?**  
Widgets Stateful são aqueles que armazenam e gerenciam um estado interno, permitindo que a interface seja atualizada dinamicamente. Eles devem ser usados quando o widget precisa reagir a interações, como um botão que incrementa um número ou uma tela que muda ao tocar em algum item. Eles são compostos por duas classes: o widget em si e sua classe de estado (`State`).

---

*Obs 10: Têm um ciclo dinâmico, diferentemente dos stateless, pois permitem que seu conteúdo seja alterado, além de possuírem mais métodos referentes ao estado do widget (creteState, setState, initState, etc)*


**• Explique o ciclo de vida de um widget Stateful:**  
O ciclo de vida começa com o método `createState`, que cria a instância do estado. Depois, `initState` é chamado uma vez para inicializações. O método `build` é executado sempre que o widget precisa ser redesenhado. Quando o widget é removido, o método `dispose` é chamado para liberar recursos. Outros métodos como `didUpdateWidget` também são usados em certas situações.

---

*Obs 11: o setState() permite mudar o estado de um stateful widget, seja mudando o texto de um label, adicionando um gestureDetector com uma animação que muda algo na aplicação, etc.*

**• Como o gerenciamento de estado é feito em widgets Stateful?**  
O estado é armazenado em uma classe separada (subclasse de `State`) e qualquer alteração no estado deve ser feita dentro de `setState()`. Ao chamar `setState`, o Flutter entende que o widget precisa ser redesenhado com os novos dados. Essa abordagem funciona bem para widgets simples, mas para projetos maiores, é comum usar gerenciadores de estado externos como Provider, Riverpod ou Bloc.

---

*Obs 12: Como foi especificado, ele permite mudar o estado (isto é, as características de um widget), fazendo com que o widget apresente características diferentes a cada build. Entretanto, não é recomendado utilizá-los em excesso, apenas onde é estritamente necessário.*

**• Como funciona o “setState” em Flutter?**  
A função `setState` atualiza o estado interno do widget e avisa o Flutter que precisa reconstruir a interface. Dentro dela, fazemos a alteração da variável e o Flutter automaticamente chama o método `build` novamente para refletir as mudanças. Exemplo: `setState(() { contador++; });`. É importante usá-la corretamente para evitar reconstruções desnecessárias.

---

*Obs 13: Como foi dito anteriormente, é importante refatorar o código de modo que não haja chamadas do setState() em excesso, pois isso pode prejudicar o desempenho geral da aplicação*

**• Quais cuidados tomar no gerenciamento de estado?**  
Deve-se evitar atualizar o estado de forma exagerada ou desnecessária, pois isso pode causar lentidão na interface. Também é importante organizar bem o código para separar lógica e visual. Usar muitas variáveis dentro do estado sem controle pode dificultar a manutenção. Para apps maiores, é recomendável usar uma abordagem mais estruturada de gerenciamento de estado.

---

*Obs 14: Sabendo essas diferenças, pode-se dizer que um inivíduo tem a base fundamental dos widgets em Flutter, pois eles são os moldes que criam tudo o que é feito em Flutter*

**• Quais as principais diferenças entre widgets Stateless e Stateful?**  
Stateless widgets não armazenam estado e são usados para interfaces fixas. Stateful widgets têm estado e permitem mudanças na interface com interações do usuário. Stateless são mais leves e rápidos, enquanto Stateful são mais poderosos e flexíveis. A escolha entre eles depende da necessidade de atualização da interface durante a execução do app.