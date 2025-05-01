*Obs : Fundamental para qualquer aplicação em Flutter. O básico é utilizar um statefulwidget juntamente com o setState() para gerenciar os estados de um widget. Porém, isso não é muito escalonável tampouco recomendado para aplicações de grande porte, sendo que o recomendado é utilizar outros métodos de gerenciamento de estados, como o Provider, Bloc, etc.*
 
### **1. O que é gerenciamento de estados em Flutter e por que é importante?**  
Gerenciar o estado significa **controlar as informações que afetam a interface** do app. Por exemplo, se você tem um contador e clica em um botão para aumentar seu valor, o número exibido na tela precisa mudar — isso é uma mudança de estado.

É importante porque Flutter reconstrói a interface com base no estado atual. Sem uma forma organizada de controlar isso, seu código fica bagunçado, difícil de manter e propenso a erros.

---

*Obs 2: Geralmente, stful widgets com gerenciamento de estados local incluem botões com animação, campos de texto customizados, barras de scrollagem e outros widgets "pequenos" que não necessitem de comunicação de estados com outros widgets*

### **2. Qual a diferença entre estado local e estado global em um aplicativo Flutter?**  
- **Estado local**: afeta apenas um widget ou um conjunto muito pequeno (ex: uma animação, um campo de texto). Usado com `setState()` em widgets `StatefulWidget`.
  
- **Estado global**: afeta várias partes do app. É melhor usar uma ferramenta de gerenciamento como `Provider`, `Riverpod` ou `Bloc`. Um exemplo seria o estado de um usuário logado ou o tema da aplicação.

---

*Obs 3: TLDR: Para manter o codigo limpo, simples e organizado*

### **3. Quais as vantagens de usar um gerenciador de estados em um projeto Flutter?**
- Organização do código, separando UI de lógica de negócios.  
- Reutilização de lógica em múltiplas telas.  
- Evita reconstruções desnecessárias, economizando desempenho.  
- Facilita testes automatizados.  
- Torna o app mais escalável conforme cresce.

---

*Obs 4: É uma forma simples e prática de gerenciar estados de um widget e compartilhar dados entre widgets, tornando o código mais organizado em comparação ao usar stful widgets comuns*

### **4. O que é o pacote Provider em Flutter e para que ele serve?**
É um pacote oficial do Flutter para **gerenciamento de estado**. Ele fornece uma forma de **compartilhar dados entre widgets** e **notificar a interface sobre mudanças**. Funciona muito bem com o padrão `ChangeNotifier`.

Exemplo:
```dart
final contador = Provider.of<Contador>(context);
```

---

*Obs 5:  Reduz significativamente a quantidade de recursos necessários para rodar uma aplicação, além evitar um StackOverflow em algumas situações*

### **5. Como o Provider ajuda a evitar a reconstrução desnecessária de widgets?**
O `Provider` só reconstrói widgets que **estão observando** uma mudança de estado. Isso significa que partes da tela que não precisam mudar não são redesenhadas, economizando recursos.

---

*Obs 6: Ele proporciona gerenciar um ou mais objetos ao longo das telas do aplicativo, proporcionando escalabilidade e mantendo o código organizado*

### **6. Como o Provider simplifica o gerenciamento de estados em Flutter?**
Ele centraliza os dados em classes chamadas `ChangeNotifier` e permite a UI se inscrever automaticamente para ouvir mudanças. Você não precisa passar dados manualmente entre widgets pais e filhos.

---

*Obs 7: Me lembra o paradigma de programação orientada a eventos, onde uma classe ou função pode notificar um determinado evento, e outras funções que estão "escutando" esse evento executam determinadas ações quando o evento é disparado*

### **7. O que é o ChangeNotifierProvider e como ele funciona?**
É um widget que **fornece uma instância de uma classe com `ChangeNotifier`** para toda a árvore de widgets abaixo dele. Sempre que algo mudar nessa classe, os widgets que usam esse dado são atualizados.

Exemplo:
```dart
ChangeNotifierProvider(
  create: (_) => Contador(),
  child: MyApp(),
)
```

---

*Obs 8: Geralmente isso é feito na função main, quando a primeira tela do aplicativo é chamda (geralmente a HomePage ou LoginPage). Desse modo, todos os widgets que partam desse widget pai têm acesso ao Provider*

### **8. Como posso fornecer um ChangeNotifier para a árvore de widgets usando ChangeNotifierProvider?**
Você envolve seu widget raiz (ou parte dele) com `ChangeNotifierProvider`, passando a instância que deseja compartilhar:

```dart
ChangeNotifierProvider(
  create: (_) => MinhaClasseComEstado(),
  child: MeuWidgetFilho(),
)
```

---

*Obs 9: Toda vez que o notifyListeners() é chamado, os widgets que estiverem "escutando" o provider serão reconstruídos com o novo valor (nesse caso, valor++)*

### **9. Como posso atualizar o estado do meu aplicativo usando providers?**
Você cria métodos dentro da classe que estende `ChangeNotifier` e chama `notifyListeners()` após modificar os dados:

```dart
class Contador extends ChangeNotifier {
  int valor = 0;

  void incrementar() {
    valor++;
    notifyListeners();
  }
}
```

---

*Obs 10: Útil para salvar recursos do sistema e simplificar a sintaxe onde o provider é chamado várias vezes. Entretanto, só é possível usar Consumer dentro de um widget, pois o Consumer necessita do BuildContext para funcionar*

### **10. O que é o Consumer e como ele funciona?**
`Consumer` é um widget que **escuta mudanças no provider** e **reconstrói apenas a parte necessária** da UI.

Exemplo:
```dart
Consumer<Contador>(
  builder: (_, contador, __) => Text('${contador.valor}'),
)
```

---

*Obs 11: Ótimo para otimizar quando um widget deve ou não ser reconstruído, fazendo com que o widget seja redesenhado apenas quando estritamente necessário.*

### **11. Como o Consumer ajuda a reconstruir apenas os widgets que dependem do estado?**
Ao usar `Consumer`, você delimita **exatamente onde** a atualização deve ocorrer. Isso evita que a árvore inteira do widget seja redesenhada — apenas o `Text`, por exemplo.

---

*Obs 12: Útil para evitar ficar chamando o Provider.of<T>(context).metodo, diminuindo a repetição de código, além de utilizar da característica principal do Consumer, que é garantir que apenas o widget que foi modificado seja redesenhado na tela*

### **12. Como posso usar o Consumer para acessar o estado fornecido pelo ChangeNotifierProvider?**
Você usa o builder do `Consumer` para acessar a instância fornecida e construir a UI:

```dart
Consumer<MinhaClasse>(
  builder: (context, minhaClasse, _) {
    return Text(minhaClasse.valor.toString());
  }
)
```

---

*Obs 13: O Consumer deve ser usado em widgets dentro do metodo build(), fazendo com que apenas o widget dentro do Consumer seja reconstruído, enquanto que o Provider.of() deve ser usado quando é necessário realizar alguma lógica da aplicação, como ler um dado.*

### **13. Qual a diferença entre usar Consumer e Provider.of() para acessar o estado?**
- `Provider.of()` reconstrói **todo o widget** onde for chamado (caso `listen: true`).
- `Consumer` permite **reconstruir apenas um widget específico**, mesmo que esteja dentro de um widget maior.

Para melhor performance e controle, prefira `Consumer`.

---

*Obs 14: Ao utilizar o Consumer, apenas o widget que está dentro dele será reconstruído quando o estado mudar, permitindo gerenciar a reconstrução dos widgets dinamicamente*

### **14. Como posso otimizar o uso do Consumer para evitar reconstruções desnecessárias?**
Você pode:
- Usar `Consumer` apenas no widget que realmente precisa da atualização.
- Evitar colocar `Consumer` no topo de grandes árvores de widgets.
- Usar `Selector` se quiser escutar **apenas partes específicas** do estado.

Aqui estão dois exemplos simples de aplicativos em Flutter usando `ChangeNotifierProvider` e `Consumer` para gerenciar o estado.

*Obs: É muito interessante observar como o gerenciamento de estados usando Provider é muito mais eficiente e pode substituir os stateful widgets em muitos casos.* 

### Exemplo 1: Contador com Incremento e Decremento

Neste exemplo, criamos um aplicativo com um contador que pode ser incrementado e decrementado.

#### 1. Adicione as dependências no `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
```

#### 2. Crie a classe `Counter` (modelo de dados):

```dart
import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
```

#### 3. Crie o arquivo `main.dart` com o contador:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart'; // Importando a classe Counter

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Contador com ChangeNotifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contador:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${counter.count}',
              style: TextStyle(fontSize: 48),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: counter.decrement,
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: counter.increment,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

*Obs: Eu não sei se esse método é o mais apropriado para grandes aplicações, mas ele é muito eficiente em pequenas aplicações com poucas telas*

### Exemplo 2: Aplicativo de Tema Claro e Escuro

Aqui, o aplicativo permite ao usuário alternar entre o tema claro e escuro.

#### 1. Crie a classe `ThemeNotifier`:

```dart
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
```

#### 2. Crie o arquivo `main.dart` para alternar temas:

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_notifier.dart'; // Importando a classe ThemeNotifier

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          theme: themeNotifier.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Tema Claro e Escuro"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: themeNotifier.toggleTheme,
          child: Text(
            themeNotifier.isDarkMode ? "Trocar para Tema Claro" : "Trocar para Tema Escuro",
          ),
        ),
      ),
    );
  }
}
```

*Obs 15: É bem parecido com o código que fizemos durante a aula de leitura de Jsons*

### ***15. Como consumir APIs em Flutter

1. **Adicionar dependências:**
   No seu arquivo `pubspec.yaml`, adicione a dependência `http` para fazer requisições HTTP:
   ```yaml
   dependencies:
     http: ^0.14.0
   ```

2. **Consumir API no Flutter:**
   Aqui está um exemplo simples de como consumir uma API e exibir os dados em uma lista.

   #### 1. Crie um arquivo `api_service.dart`:
   ```dart
   import 'dart:convert';
   import 'package:http/http.dart' as http;

   class ApiService {
     final String url = "https://jsonplaceholder.typicode.com/posts";

     Future<List<dynamic>> fetchPosts() async {
       final response = await http.get(Uri.parse(url));
       
       if (response.statusCode == 200) {
         return json.decode(response.body);
       } else {
         throw Exception('Failed to load posts');
       }
     }
   }
   ```

   #### 2. Use a API no seu aplicativo:
   ```dart
   import 'package:flutter/material.dart';
   import 'api_service.dart';

   void main() {
     runApp(MyApp());
   }

   class MyApp extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         home: PostsPage(),
       );
     }
   }

   class PostsPage extends StatefulWidget {
     @override
     _PostsPageState createState() => _PostsPageState();
   }

   class _PostsPageState extends State<PostsPage> {
     late Future<List<dynamic>> posts;

     @override
     void initState() {
       super.initState();
       posts = ApiService().fetchPosts();
     }

     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text("Posts"),
         ),
         body: FutureBuilder<List<dynamic>>(
           future: posts,
           builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator());
             } else if (snapshot.hasError) {
               return Center(child: Text('Error: ${snapshot.error}'));
             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
               return Center(child: Text("No posts available"));
             } else {
               final posts = snapshot.data!;
               return ListView.builder(
                 itemCount: posts.length,
                 itemBuilder: (context, index) {
                   return ListTile(
                     title: Text(posts[index]['title']),
                     subtitle: Text(posts[index]['body']),
                   );
                 },
               );
             }
           },
         ),
       );
     }
   }
   ```
