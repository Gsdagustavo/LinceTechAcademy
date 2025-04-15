Obs 1: *É muito importante manter as boas práticas em todo o código, pois isso o torna mais legível aos outros programadores e até a si mesmo no futuro*

### 1. Quais as boas práticas em Dart declarando variáveis?
- **Use tipos explícitos**: Declare variáveis com tipos explícitos para facilitar a leitura do código e evitar problemas de tipo.
- **Inicialização imediata**: Sempre inicialize a variável no momento da declaração, se possível.
- **Utilize `var` ou `final` quando adequado**: Se a variável não vai ser alterada depois, use `final`.
- **Siga convenções de nomes**: Use o estilo camelCase para variáveis, como `minhaVariavel`.

Obs 2: *Eu estudei Java por muito tempo, então estou acostumado a sempre declarar o tipo da variável antes de atribuir um valor a ela (evito usar 'dynamic' sempre quando posso)*
### 2. O que evitar na hora de declarar variáveis em Dart?
- **Evitar usar `dynamic` excessivamente**: Embora `dynamic` seja flexível, ele pode resultar em erros de tipo difíceis de detectar.
- **Evitar variáveis sem valor inicial**: Sempre inicialize variáveis para evitar problemas com valores nulos inesperados.

Obs 3: *Dart é bem exigente quando formos trabalhar com variáveis. Seus valores não podem ser nulos a não ser que especiquemos que eles podem. Isso é algo exclusivo da linguagem
e é uma feature muito poderosa, pois torna o código mais seguro e conciso*
### 3. Quais cuidados tomar quando crio variáveis com valor nulo trabalhando com Dart?
- **Verifique a nulidade antes de usar**: Sempre faça checagens de nulidade (com `!= null` ou `?`) antes de usar uma variável que pode ser nula.
- **Considere o tipo de nulidade**: Se você estiver usando um tipo que pode ser nulo, use o operador `?` ou `late` adequadamente para evitar exceções.

Obs 4: *Quando eu comecei a estudar Dart, vi algumas aulas de POO na linguagem, e geralmente eram usados esses operadores para declarar atributos de uma classe*.
*Verei mais para frente o por quê disso quando começar o módulo de POO do curso de Dart no Decola.*
### 4. No Dart, quando usar variáveis nulas e quando usar o modificador `late`?
- **Variáveis nulas**: Use quando você tem certeza de que a variável pode ser nula em algum momento. Exemplo: `String? nome`.
- **`late`**: Use quando você sabe que a variável será inicializada em algum ponto antes de ser acessada, mas não imediatamente. Exemplo: `late String nome`.

Obs 5: É útil para valores "globais", isto é, variáveis geralmente fora de qualquer função, pois pode ser atribuído por qualquer função a qualquer momento, e todas as seções
// do código reconhecerá o novo valor da variável. Eu fiz um projeto de Gerenciador de Senhas em Dart e utilizei uma "variável global", porém sem usar o modificador final. Agora,
// sei que isso não foi uma boa prática e pretendo revisar aquele código com os conhecimentos adquiridos durante o curso de formação de Dart.
### 5. Gostaria de entender quais os benefícios de utilização do modificador "late" no Dart.
- O modificador `late` permite que você adie a inicialização de uma variável, o que é útil quando você não pode inicializá-la no momento da declaração, mas sabe que ela será inicializada antes de ser usada.
- Isso evita a necessidade de usar valores nulos ou iniciais padrão e melhora o controle sobre a inicialização.

Obs 6: *Foi bem confuso para entender no início, pois eu pensava que ao instanciar uma classe (criar um objeto) com o modificador final, ela não poderia ser modificada, isto é,*
*eu pensava que uma lista final não poderia receber nenhum valor pelo método .add(). Dessa forma, eu não utilizei o modificador final em nenhuma das listas, até que eu entendi*
*que objetos, apesar de possuirem o modificador final, ainda podem ter seus valores internos (atributos) mudados, apenas a instancia que não poderia mudar.*
### 6. Quais as diferenças entre `final` e `const` em Dart?
- **`final`**: A variável pode ser inicializada uma vez e depois não pode ser alterada. No entanto, seu valor pode ser calculado em tempo de execução.
- **`const`**: A variável deve ser inicializada com um valor constante, conhecido em tempo de compilação, e o valor nunca pode ser alterado.

Obs 7: *É importante para manter a coesão no código e garantir que certos valores imutáveis de um programa não sejam alterados erroenamente*
### 7. Por que no Dart usar variáveis `final` e `const` ao invés de usar somente seus valores padrão?
- Usar `final` ou `const` permite garantir que o valor de uma variável não seja alterado acidentalmente, proporcionando imutabilidade e segurança no código.
- `final` e `const` ajudam a otimizar o código e melhorar a legibilidade, além de reduzir a chance de erros.

Obs 8: *Todos esses métodos são "padrão" na maioria das linguagens de programação, e são muito utilizados em aplicativos onde é necessário criar senhas, gerenciar nomes, etc.*
### 8. Quais métodos possuem as variáveis strings no Dart?
- Alguns métodos úteis de `String` no Dart incluem:
  - `.length`: Retorna o tamanho da string.
  - `.isEmpty`: Verifica se a string está vazia.
  - `.substring(int start, [int end])`: Retorna uma parte da string.
  - `.toUpperCase()` e `.toLowerCase()`: Converte a string para maiúsculas ou minúsculas.
  - `.trim()`: Remove espaços em branco do início e fim da string.
  - `.contains(String other)`: Verifica se a string contém a substring especificada.

Obs 9: *Eu achei muito curioso existir os métodos isEven() e isOdd(), pois eu nunca vi nenhuma linguagem possuir esses métodos built-in. São métodos/funções que geralmente*
*fazemos para aprender os conceitos de funções e etc. mas aqui eles existem e são utilizados.*
### 9. Traga a documentação dos métodos de variáveis inteiras.
Aqui está o link para a documentação oficial dos métodos de inteiros no Dart: [Integers in Dart](https://api.dart.dev/stable/dart-core/int-class.html).

Esses métodos incluem operações matemáticas como `abs()`, `isEven`, `isOdd`, entre outros, que ajudam no trabalho com números inteiros.

Se precisar de mais detalhes sobre algum método, posso explicar com mais profundidade!