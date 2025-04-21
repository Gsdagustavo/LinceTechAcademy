*Obs 1: É um dos widgets fundamentais do flutter, juntamente com o Text e Column. Ele é importante para manter uma verticalização da UI, por isso é importante saber como utilizá-lo e aproveitar ao máximos seus parâmetros opcionais*

**• Explique o conceito de um widget Row em Flutter:**  
O `Row` é um widget que organiza seus filhos (outros widgets) na horizontal, ou seja, em uma única linha. Ele é útil quando você quer exibir elementos lado a lado, como ícones com texto ou botões alinhados. Cada filho é colocado um ao lado do outro, respeitando as configurações de alinhamento e espaçamento definidas.

---

*Obs 2: Na minha opinião, o melhor parâmetro de espaçamento que pode ser utilizado, tanto em rows quanto em columns, é o MainAxisAlignment.spaceAround, pois ele é mais "clean" que os outros, na minha visão*

**• Como posso adicionar espaçamento uniforme entre os widgets em um Row?**  
Você pode usar o parâmetro `mainAxisAlignment: MainAxisAlignment.spaceEvenly` ou `spaceBetween` para distribuir o espaço uniformemente. Outra opção é usar o widget `SizedBox(width: ...)` entre os widgets. Exemplo:
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [Icon(Icons.star), Icon(Icons.star), Icon(Icons.star)],
);
```

---

*Obs 3: Os axis em rows e columnns podem ser associados a um plano cartesiano. Nas rows, o eixo principal é o eixo vertical, enquanto que na column o eixo principal é o horizontal. Ao começar no Flutter, eu demorei um pouco pra conseguir assimiliar isso, mas depois que eu entendi, um mundo de possibilidades se abriu para mim*

**• Qual a diferença entre MainAxisAlignment e CrossAxisAlignment em um Row?**  
Em um `Row`, o `MainAxisAlignment` controla o alinhamento **horizontal** (da esquerda para a direita), enquanto o `CrossAxisAlignment` controla o alinhamento **vertical** (de cima para baixo). Por exemplo, você pode centralizar os widgets horizontalmente com `MainAxisAlignment.center` e alinhar verticalmente ao topo com `CrossAxisAlignment.start`.

---

*Obs 4: É literalmente o oposto de uma row, de certa forma. É possível usar o conceito de tabelas dos bancos de dados relacionais para melhor compreensão dos widgets Row e Column, pois eles seguem o mesmo "padrão de posicionamento"*

**• Explique o conceito de um widget Column em Flutter:**  
O `Column` é o oposto do `Row`: ele organiza os widgets verticalmente, ou seja, um em cima do outro. É ideal para criar layouts de listas, formulários ou colunas de texto e imagens. Ele também aceita alinhamentos e espaçamentos para distribuir os elementos da forma desejada.

---

*Obs 5: Da mesma forma, como expliquei anteriormente, o eixo principal (main axis) de uma coluna é o eixo vertical. Então, sabendo disso, é possível criar interfaces limpas de centralizadas*

**• Qual a diferença entre MainAxisAlignment e CrossAxisAlignment em um Column?**  
No `Column`, o `MainAxisAlignment` controla o alinhamento **vertical** (de cima para baixo), enquanto o `CrossAxisAlignment` controla o alinhamento **horizontal** (da esquerda para a direita). Por exemplo, `MainAxisAlignment.center` centraliza os widgets no meio da tela verticalmente, e `CrossAxisAlignment.end` os alinha à direita.

---

*Obs 6: Eu ainda não tive a oportunidade de utilizar um Stack em nenhum contexto enquanto estou trabalhando com Flutter. Porém, reconheço sua utilidade e versatilidade*

**• Explique o conceito de um widget Stack em Flutter:**  
O `Stack` permite empilhar widgets uns sobre os outros, como camadas. Ele é útil para criar interfaces com elementos sobrepostos, como um botão sobre uma imagem ou um ícone sobre um texto. O primeiro widget fica na camada mais baixa e os próximos vão sendo empilhados acima.

---

*Obs 7: Se combinarmos Stacks com Rows e Columns, podemos criar qualquer coisa, como um fundo semitransparente com uma lista de itens sobrepondo o Stack e gerando uma UI linda de bonita*

**• Quais as vantagens de usar Stack em vez de Row ou Column?**  
A principal vantagem do `Stack` é a sobreposição de widgets. Com ele, é possível criar interfaces mais complexas e dinâmicas, como menus flutuantes, banners com textos por cima de imagens ou avatares com status. Já `Row` e `Column` organizam apenas de forma linear.

---

*Obs 8: É possível também colocar várias imagens em um stack, e interagir dinamicamente com as imagens (algo como o scroll do Tinder, por exemplo)*

**• Como posso posicionar widgets específicos dentro de um Stack?**  
Para posicionar widgets em locais específicos dentro de um `Stack`, usamos o widget `Positioned`. Ele permite definir a posição com propriedades como `top`, `left`, `right` e `bottom`. Exemplo:
```dart
Stack(
  children: [
    Container(color: Colors.blue, width: 100, height: 100),
    Positioned(top: 10, left: 10, child: Icon(Icons.star)),
  ],
);
```

---

*Obs 9: Também é possível adicionar imagens da web com links externos, o que não é muito recomendável, pois isso tornaria o App dependente de uma rede wi-fi*

**• Como posso exibir uma imagem de um arquivo local em Flutter?**  
Para exibir uma imagem local, você deve adicioná-la na pasta do projeto (por exemplo, `assets/images/`) e declarar no `pubspec.yaml`. Depois, use o widget `Image.asset`:
```dart
Image.asset('assets/images/minha_imagem.png')
```

---

*Obs 10: É muito legal ver todos os parâmetros que os widgets do flutter aceitam. É muito interessante explorar os parâmetros e criar combinações únicas que formam um estilo característico e elegante*

**• Quais propriedades posso usar para controlar a aparência do texto (fonte, tamanho, cor)?**  
Você pode usar o widget `Text` com a propriedade `style`, que aceita um `TextStyle`. Com isso, é possível personalizar `fontSize`, `fontWeight`, `color`, `fontFamily`, `letterSpacing` e muito mais. Exemplo:
```dart
Text(
  'Olá mundo!',
  style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
)
```

---

*Obs 11: Útil quando queremos mostrar um texto grande com um estilo único, como em uma matéria de um blog ou algo do tipo*

**• Como posso exibir um texto em várias linhas?**  
Por padrão, o widget `Text` já suporta várias linhas, desde que o texto seja longo o suficiente ou tenha quebras de linha (`\n`). Para limitar ou configurar as linhas, você pode usar `maxLines` e `overflow`. Exemplo:
```dart
Text('Texto\nem\nvárias\nlinhas', maxLines: 4)
```

---

*Obs 12: Além disso, a classe ListView tem um parâmetro chamado scrollDirection, que aceita um Axis como argumento, e esse axis pode ser tanto vertical (padrão) quanto horizontal, o que permite a criação de barras de rolagem em forma de rows*

**• Como posso criar uma lista de rolagem vertical em Flutter?**  
Você pode usar o widget `ListView`, que já vem com rolagem vertical padrão. Basta adicionar os widgets filhos dentro dele:
```dart
ListView(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

---

*Obs 13: Para isso, o método List.generate() é muito útil, pois permite criar uma sequência de objetos baseados em uma função*

**• Como posso adicionar itens dinamicamente a um ListView?**  
Para adicionar itens dinamicamente, você pode usar `ListView.builder`, que constrói os itens conforme necessário, baseado em uma lista:
```dart
ListView.builder(
  itemCount: minhaLista.length,
  itemBuilder: (context, index) {
    return Text(minhaLista[index]);
  },
)
```

---

*Obs 14: O separatorBuilder deixaa a UI mais bonita no geral*

**• Quais as diferenças entre ListView.builder e ListView.separated?**  
`ListView.builder` cria uma lista contínua de itens. Já `ListView.separated` permite adicionar separadores (como linhas ou espaçamentos) entre os itens. É útil quando se quer separar visualmente cada item da lista.
```dart
ListView.separated(
  itemCount: 10,
  itemBuilder: (context, index) => Text('Item $index'),
  separatorBuilder: (context, index) => Divider(),
)
```

---

*Obs 15: Eu geralmente crio um widget padrão que retorna um ListTile com alguns argumentos adicionais para agilizar o processo de desenvolvimento e organizar o código*

**• Como posso usar ListTile para criar itens de lista em um ListView?**  
O `ListTile` é um widget pronto para criar listas com títulos, subtítulos, ícones e trailing widgets. Ele facilita a criação de listas bonitas e funcionais. Exemplo:
```dart
ListTile(
  leading: Icon(Icons.person),
  title: Text('Nome'),
  subtitle: Text('Descrição'),
  trailing: Icon(Icons.arrow_forward),
)
```

---

*Obs 16: Caso sejam usados widgets diferentes do ListTile, é possível dar um wrap neles com um GestureDetector e passar a função onTap neles. É o mesmo efeito, porém feito de maneira diferente*

**• Como posso tornar os itens ListTile interativos (clicáveis)?**  
Você pode adicionar a propriedade `onTap` no `ListTile`, que executa uma ação quando o item é tocado. Exemplo:
```dart
ListTile(
  title: Text('Clique aqui'),
  onTap: () {
    print('Item clicado!');
  },
)
```

---

*Obs 17: Como falei anteriormente, é possível criar tiles padrões e passar alguns parâmetros adicionais no widget geral (tile) para deixar o código mais organizado*

**• Quais as vantagens de usar ListTile em vez de widgets de texto simples?**  
O `ListTile` é mais completo e prático, pois já vem com uma estrutura de layout ideal para listas: ícone à esquerda, título, subtítulo e ação à direita. Ele também oferece interatividade com `onTap` e facilita a criação de listas organizadas sem precisar montar manualmente os layouts com `Row` e `Column`.
