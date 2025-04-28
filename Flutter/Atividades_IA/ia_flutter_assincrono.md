*Obs 1: Sem ela, não seria possível a conexão entre a aplicação e API's externas e bancos de dados. Sendo assim, ela é extremamente importante para qualquer apliação em Flutter*

**1. O que é programação assíncrona em Flutter e por que ela é importante?**  
➡️ Programação assíncrona permite que o app execute tarefas demoradas (como buscar dados da internet) **sem travar a interface do usuário (UI)**. Em Flutter, isso é fundamental para manter a experiência fluida e responsiva.

---

*Obs 2: Vários erros e exceções podem ocorrer ao trabalhar com transações assíncronas. Sendo assim, cabe ao programador tratar essas exceções de forma consistente e efetiva para fazer com que o código fique mais confiável e responsivo*

**2. Quais cuidados devo ter usando programação assíncrona?**  
➡️ Sempre tratar possíveis erros (`try-catch`), evitar chamadas assíncronas excessivas no `build()`, usar o `await` corretamente para garantir que a sequência das operações esteja correta e manter a consistência de estados assíncronos.

---

*Obs 3: Muito parecidas com as Threads do Java, porém com um funcionamento um pouco diferente. É fundamental dominar os conceitos básicos de Isolates e Threads, pois o multiparalelismo (ou multithreading para os mais chegados) é fundamental quando estamos trabalhando com códigos que façam requisições externas (API's, bancos de dados, etc) ou quando precisamos executar uma função/tarefa que demande muito poder de processamento.*

**3. O que são isolates em Flutter?**  
➡️ **Isolates** são como "threads independentes". Em Flutter, o código roda em um único isolate principal, mas é possível criar novos isolates para tarefas muito pesadas, evitando travar o app.

---

*Obs 4: Realmente, só devem ser criados isolates separados quando for necessário executar uma função que demande muito poder de processamento, ou uma requisição que use muita memória, etc.*

**4. Quais cuidados devo ter ao usar isolates em Flutter?**  
➡️ Isolates **não compartilham memória** entre si, então a comunicação precisa ser feita por mensagens. Criar isolates desnecessários pode aumentar o uso de memória. Prefira o isolate principal para tarefas leves.

---

*Obs 5: É como se fosse a engine de um jogo rodando a todo momento, tentando manter framerates altas a todo custo, porém ainda assim tratando de eventos externos*

**5. Qual o conceito do Loop de Eventos em Flutter?**  
➡️ Flutter usa um **Event Loop**: uma fila de eventos que são processados um por vez. Promises (Futures) e Streams são agendados no loop. Isso garante que a UI continue atualizada enquanto tarefas assíncronas são processadas.

---

*Obs 6: Futures são peças fundamentais na programação assíncrona em Dart, pois eles podem representar qualquer valor em um determinado prazo de tempo. Em um tempo A ele tem valor null, e em um tempo B ele tem algum valor diferente (algum número, String, etc). Sendo assim, é primordial dominar as Futures e entender como elas funcionam para que, somente assim, possamos escrever um código coerente com os princípios da programação assíncrona*

**6. O que é um 'Future' em Dart e como ele funciona?**  
➡️ Um `Future` representa **um valor que estará disponível no futuro** (depois de alguma operação assíncrona terminar). Ele pode estar em três estados: **pendente**, **concluído com sucesso** ou **com erro**.

---

*Obs 7: o await força o programa a esperar aquela tarefa executar, e somente aí é que o fluxo do programa continua.*

**7. Como posso usar 'async' e 'await' para trabalhar com 'Futures'?**  
➡️ `async` transforma uma função em assíncrona e permite usar `await` para **esperar o resultado** de um Future:

```dart
Future<void> buscarDados() async {
  var resposta = await http.get(Uri.parse('https://api.exemplo.com'));
  print(resposta.body);
}
```

---


*Obs 8: Tratar as exceções (ou corrigir os erros, nesse caso) é fundamental para manter o código conciso e seguro, pois caso não haja o tratamento adequado, o programa pode quebrar, muitas vezes frustrando o usuário*

**8. Como posso lidar com erros em operações assíncronas usando 'try-catch'?**  
➡️ Use `try-catch` para capturar erros que acontecem em chamadas assíncronas:

```dart
try {
  var resposta = await http.get(Uri.parse('https://api.exemplo.com'));
  print(resposta.body);
} catch (e) {
  print('Erro: $e');
}
```

---

*Obs 9: Muito parecido com as querys dos bancos de dados (select, insert, update, delete, etc), porém específico para Web*

**9. Traga a explicação dos métodos HTTP.**  
| Método  | Uso                                      |
|---------|------------------------------------------|
| GET     | Buscar dados                             |
| POST    | Enviar novos dados                       |
| PUT     | Atualizar dados existentes (completo)    |
| PATCH   | Atualizar parte dos dados existentes     |
| DELETE  | Remover dados                            |

---

*Obs 10: Nesse caso, a aproximação ideal seria utilizar estruturas switch-case para manter o código mais limpo, pois as numerações dos erros foram feitas justamente para esse tipo de estrutura.*

**10. Como posso lidar com diferentes códigos de resposta HTTP (200, 404, 500)?**  
➡️ Analise o `statusCode` da resposta:

```dart
if (resposta.statusCode == 200) {
  print('Sucesso!');
} else if (resposta.statusCode == 404) {
  print('Não encontrado!');
} else if (resposta.statusCode == 500) {
  print('Erro interno no servidor!');
}
```

---

*Obs 11: Útil para representar qualquer tipo de dado existente, desde datas até objetos complexos modelados em 3D. Além disso, o formato JSON é leve e compatível com quase qualquer linguagem, tornando-o um método eficaz e prático de enviar e receber dados*

**11. O que é JSON e como ele é usado em Flutter?**  
➡️ **JSON** (JavaScript Object Notation) é um formato leve de troca de dados. Em Flutter, APIs geralmente enviam/recebem dados em JSON, que você converte para objetos Dart.

---

*Obs 12: É muito incrível o fato de a linguagem Dart possuir métodos built-in para decodificar JSON's, pois isso facilita e muito a vida do programador*

**12. Como posso acessar valores específicos em um objeto JSON?**  
➡️ Convertendo o JSON para `Map` e acessando com a chave:

```dart
var dados = jsonDecode(resposta.body);
print(dados['nome']);
```

---

*Obs 13: Na minha opinião, refazer o desafio final de Dart (da leitura de planilha) utilizando JSON seria um desafio interessante. Na verdade, acredito que seria até mais fácil de fazer, pois o JSON é estruturado de uma maneira muito organizada, fazendo com que não gastemos muitas linhas de código para formatar os dados obtidos*

**13. Como posso lidar com arrays (listas) em JSON em Flutter?**  
➡️ Arrays JSON viram `List` em Dart:

```dart
var lista = jsonDecode(resposta.body);
for (var item in lista) {
  print(item['nome']);
}
```

---

*Obs 14: Como foi dito anteriormente, JSON's possuem uma estrutura e formatação mais organizados, fazendo com que não sejam necessárias muitas linhas de código para receber, atribuir e mapear os dados em um formato organizado e legível*

**14. Como posso iterar sobre os elementos de um array JSON?**  
➡️ Usando `for`, `forEach` ou `map`:

```dart
for (var item in lista) {
  print(item['id']);
}
```
ou
```dart
lista.forEach((item) => print(item['id']));
```

---

*Obs 15: Um exemplo é criar uma classe Produtos para mapear todos os atributos de um JSON de Produtos. Fazendo isso, o código ficará muito mais organizado e modularizado*

**15. Por que é útil mapear JSON para classes Dart?**  
➡️ Porque facilita a manipulação de dados de forma **segura e tipada**. Você não precisa ficar acessando campos como strings o tempo todo, evitando erros.

---

*Obs 16: Finalmente encontrei uma aplicação prática do factory constructor em Dart, e ele foi extremamente útil para converter um map JSON em uma instância de uma classe (Produto, nesse caso)*

**16. Como posso usar 'factory' para criar objetos Dart a partir de JSON?**  
➡️ Usando um `factory constructor`:

```dart
class Produto {
  final String nome;
  Produto({required this.nome});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(nome: json['nome']);
  }
}
```

---

*Obs 17: Assim como é possível criar um factory constructor para mapear um JSON em um objeto, também é possível fazer o processo inverso: mapear um objeto e um map JSON, para posteriormente atualizar os dados de um JSON Server ou algo parecido*

**17. Como posso usar 'toJson()' para converter objetos Dart em JSON?**  
➡️ Criando um método `toJson` na sua classe:

```dart
class Produto {
  final String nome;
  Produto({required this.nome});

  Map<String, dynamic> toJson() {
    return {'nome': nome};
  }
}
```

---

*Obs 18: A modularização do código é um dos pilares da programação orientada a organização (invenção minha), pois modularizar o código o deixa mais limpo, organizado, legível e manutenível*

**18. Como organizar minhas requisições no meu código Flutter?**  
➡️ Crie **services** para separar as lógicas de API. Exemplo:

```dart
class ApiService {
  static Future<List<Produto>> fetchProdutos() async {
    final resposta = await http.get(Uri.parse('https://api.exemplo.com/produtos'));
    final List<dynamic> dados = jsonDecode(resposta.body);
    return dados.map((e) => Produto.fromJson(e)).toList();
  }
}
```
Assim o seu `Widget` fica limpo e sua lógica de API separada!