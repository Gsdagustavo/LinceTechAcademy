*Obs 1: Uteis quando queremos navegar de uma página para outra de forma fácil e rápida. Entretanto, é mais recomendável utilizar rotas nomeadas, a fim de manter o código mais organizado, limpo e legível*

### 🛣️ **Rotas Anônimas**
**• O que são rotas anônimas em Flutter e como elas funcionam?**  
Rotas anônimas são criadas diretamente no momento da navegação usando `MaterialPageRoute`, sem um nome pré-definido.  
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SegundaPagina()),
);
```

*Obs 2 Deve-se tomar cuidado ao usar o comando pop(), pois ele não retorna à tela anterior, mas remove o widget mais recente na pilha. Por exemplo: se um Drawer estiver aberto, e o comando pop(context) for chamado, o Drawer será fechado, ao invés de retornar à tela. Desse modo, convém ao programador escolher cautelosamente quando é seguro usar o comando pop()*

**• Quais métodos do Navigator são comumente utilizados e por quê?**  
- `Navigator.push()`: empilha uma nova rota (navega para outra tela).  
- `Navigator.pop()`: remove a rota atual (volta à tela anterior).  
- `Navigator.pushReplacement()`: substitui a tela atual.  
- `Navigator.pushAndRemoveUntil()`: remove rotas anteriores até a condição definida.

*Obs 3: Muito útil em qualquer aplicação, desde um sistema de comércio eletrônico até aplicativos de banco. Por exemplo: quando o usuário loga com sua conta, o aplicativo "navega" para a próxima tela*

**• Qual a função do Navigator.push()?**  
Ele serve para *navegar* para uma nova tela (rota), adicionando ela no topo da pilha de navegação.

*Obs 4: O ideal é sempre programar orientado à organização. Desse modo, evito usar métodos e classes que deixem o código frágil com o tempo. Entretanto, em aplicações menores, não tem problema em usar rotas anônimas, mas em aplicações maiores, isso pode se tornar um problema*

**• Vantagens e desvantagens de usar rotas anônimas:**  
✅ **Vantagens:**  
- Flexibilidade total: você pode passar argumentos diretamente.  
- Ideal para rotas simples e temporárias.

❌ **Desvantagens:**  
- Difícil reutilizar a navegação em diferentes partes do app.  
- Código pode ficar bagunçado em apps grandes.

---

*Obs 5: Permitem deixar o código mais organizado e legível, sem muitas chamadas de métodos ou criação de classes auxiliares*

### 🏷️ **Rotas Nomeadas**
**• O que são rotas nomeadas em Flutter e como elas funcionam?**  
São rotas identificadas por *strings* (nomes), definidas no `MaterialApp`, o que permite navegar por nome:  
```dart
Navigator.pushNamed(context, '/home');
```

*Obs 6: É muito mais legível do que usar rotas anônimas. Por isso, prefiro usar rotas nomeadas em minhas aplicações*

**• Como navegar para uma rota nomeada específica?**  
```dart
Navigator.pushNamed(context, '/detalhes');
```

*Obs 7: Novamente, é fundamental programar orientado à organização, e ao utilizar rotas nomeadas ao invés de rotas anônimas, o programador está dando um passo em direção à um código mais organizado e legível, isto é, está programando orientado à organização*

**• Vantagens das rotas nomeadas sobre as anônimas:**  
✅ Mais organização  
✅ Navegação mais limpa  
✅ Fácil reutilização  
✅ Útil em apps grandes

*Obs 8: Muito mais simples que as rotas anônimas. Além disso, caso o programador queira mudar para onde uma rota aponta, basta trocar o nome/rota em MaterialApp->routes*

**• Como definir rotas nomeadas no app Flutter?**  
```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => TelaInicial(),
    '/detalhes': (context) => TelaDetalhes(),
  },
)
```

*Obs 9: Útil quando queremos passar algum valor importante para uma outra tela. Por exemplo, os dados de login de um usuário*

**• Como acessar os parâmetros passados em uma rota nomeada?**  
Ao navegar:  
```dart
Navigator.pushNamed(context, '/detalhes', arguments: 'mensagem');
```

Na nova tela:  
```dart
final args = ModalRoute.of(context)!.settings.arguments as String;
```

*Obs 10: Permite, de certa forma, alterar o fluxo do código ao passar para um outra tela. Por exemplo: em uma tela de login (como tela inicial), é passado como argumento o último login do usuário. Entretanto, se o último login for nulo, pede para entrar com os dados (primeiro login)*

**• Como tornar parâmetros opcionais?**  
Basta checar se `arguments` é `null` ou fazer *casting* com `as?`:  
```dart
final args = ModalRoute.of(context)!.settings.arguments as String?;
```

---

*Obs 11: Eu pessoalmente não gosto de usar rotas mistas, isto é, rotas nomeadas e rotas anônimas. O correto é utilizar somente um tipo de rota, a fim de deixar o código mais organizado e legível*

### 🧠 **Boas Práticas e Cuidados**
**• Cuidados ao usar rotas:**  
- Evitar misturar navegação anônima e nomeada em excesso  
- Garantir que rotas estejam registradas corretamente  
- Sempre tratar erros de navegação e parâmetros ausentes

*Obs 12: *

**• Boas práticas com rotas em Flutter:**  
✅ Usar rotas nomeadas para telas reutilizáveis  
✅ Organizar rotas em um arquivo separado (`routes.dart`)  
✅ Nomear rotas de forma clara (`/detalhes_produto`, `/perfil`)  
✅ Usar `onGenerateRoute` para controle avançado e parâmetros complexos  
✅ Evitar colocar lógica pesada diretamente nas telas que recebem rotas


*OBS: Decidi fazer as perguntas opcionais pois as achei interessantes*

*Obs 13.1: *

## 🖼️ **Exemplo de Galeria com Rotas Anônimas**

Aqui temos uma **tela principal** com miniaturas e, ao clicar, navegamos para uma tela de imagem **usando `MaterialPageRoute` (rota anônima)**.

```dart
// main.dart
import 'package:flutter/material.dart';

void main() => runApp(GaleriaApp());

class GaleriaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria',
      home: GaleriaPage(),
    );
  }
}

*Obs 13.2: Um exemplo simples de navegação usando rotas anônimas*

class GaleriaPage extends StatelessWidget {
  final List<String> imagens = [
    'https://picsum.photos/id/1015/400',
    'https://picsum.photos/id/1016/400',
    'https://picsum.photos/id/1018/400',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Galeria')),
      body: ListView.builder(
        itemCount: imagens.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(imagens[index], width: 50),
            title: Text('Imagem ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImagemDetalhe(url: imagens[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ImagemDetalhe extends StatelessWidget {
  final String url;

  ImagemDetalhe({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imagem Detalhe')),
      body: Center(
        child: Image.network(url),
      ),
    );
  }
}
```

---

*Obs 14.1: Agora, com exemplos práticos, pude assimilar melhor o conceito de rotas nomeadas e suas aplicações*

## 🇧🇷 **Fluxo com Times Brasileiros usando Rotas Nomeadas e Parâmetros**

Vamos criar 3 telas:
- Home (`/`)
- Lista de Times (`/times`)
- Detalhe do Time (`/detalhe_time`), com parâmetro (nome + escudo)

### 🧠 `main.dart`

```dart
import 'package:flutter/material.dart';

void main() => runApp(TimesApp());

class TimesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Times Brasileiros',
      initialRoute: '/',
      routes: {
        '/': (context) => TelaHome(),
        '/times': (context) => TelaTimes(),
        '/detalhe_time': (context) => TelaDetalheTime(),
      },
    );
  }
}
```

### 🏠 `TelaHome`

```dart
class TelaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/times');
          },
          child: Text('Ver Times'),
        ),
      ),
    );
  }
}
```

### 📃 `TelaTimes`

```dart
class TelaTimes extends StatelessWidget {
  final List<Map<String, String>> times = [
    {'nome': 'Flamengo', 'escudo': 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png'},
    {'nome': 'Palmeiras', 'escudo': 'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png'},
    {'nome': 'Corinthians', 'escudo': 'https://logodetimes.com/times/corinthians/logo-corinthians-256.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Times Brasileiros')),
      body: ListView(
        children: times.map((time) {
          return ListTile(
            leading: Image.network(time['escudo']!, width: 40),
            title: Text(time['nome']!),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detalhe_time',
                arguments: time,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
```

### ⚽ `TelaDetalheTime`

```dart
class TelaDetalheTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(title: Text(args['nome']!)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(args['escudo']!, width: 100),
            SizedBox(height: 20),
            Text('Time: ${args['nome']!}', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}