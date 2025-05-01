*Obs 1: *

### **1. O que é persistência de dados em aplicativos Flutter e por que é importante?**

Persistência de dados é a capacidade de um aplicativo **salvar informações que serão mantidas mesmo após ele ser fechado ou reiniciado**. Isso é essencial para manter preferências do usuário, dados de login, configurações, progresso em jogos, entre outros. Sem persistência, tudo seria perdido ao fechar o app.

---

*Obs 2: *

### **2. Quais são os diferentes tipos de dados que podem ser persistidos em um aplicativo Flutter?**

Os dados podem ser persistidos de várias formas, dependendo da complexidade e necessidade:

* **Chave-valor simples** (ex: `SharedPreferences`)
* **Arquivos locais** (ex: leitura e escrita de arquivos `.txt`, `.json`)
* **Bancos de dados locais** (ex: `SQLite`, `Drift`, `Isar`)
* **Armazenamento seguro** (ex: `flutter_secure_storage`, para dados sensíveis como tokens)
* **Armazenamento na nuvem** (ex: Firebase, Supabase)

---

*Obs 3: *

### **3. O que é o pacote SharedPreferences em Flutter e como ele funciona?**

`SharedPreferences` é um pacote que fornece uma **forma simples de salvar dados do tipo chave-valor** de forma persistente no armazenamento local do dispositivo. Ele armazena dados em formato simples: `String`, `int`, `double`, `bool` e `List<String>`.

Exemplo de uso:

```dart
final prefs = await SharedPreferences.getInstance();
await prefs.setBool('temaEscuro', true);
```

---

*Obs 4: *

### **4. Quais são as limitações do SharedPreferences em termos de armazenamento de dados?**

* Armazena apenas **tipos de dados simples**.
* **Não é criptografado**, ou seja, não é seguro para dados sensíveis.
* Armazenamento limitado (não ideal para grandes quantidades de dados).
* Não é transacional (sem garantias robustas de consistência em gravações simultâneas).
* Lento para grandes volumes de leitura/escrita.

---

### **5. Quando devo usar SharedPreferences em vez de outras opções de persistência de dados?**

Use `SharedPreferences` quando:

* Precisa salvar **preferências simples** do usuário (tema, idioma, login automático).
* Os dados são pequenos, não sensíveis e não exigem estrutura complexa.
* Deseja inicializar o app com configurações salvas.

**Evite usá-lo para:**

* Dados confidenciais (tokens, senhas).
* Listas complexas de objetos.
* Grandes volumes de dados.

---

*Obs 6: *

### **6. Como posso lidar com erros ao usar SharedPreferences?**

Embora o pacote seja simples, erros podem ocorrer. Para lidar com eles:

* Use `try-catch` para capturar exceções (como erro de leitura ou permissão).
* Sempre aguarde a `Future` com `await`.
* Verifique se os valores existem antes de usá-los:

```dart
if (prefs.containsKey('temaEscuro')) {
  bool temaEscuro = prefs.getBool('temaEscuro')!;
}
```

---

*Obs 7: *

### **7. Quais são as melhores práticas para usar SharedPreferences de forma eficiente?**

* **Evite usar no build**: nunca chame `SharedPreferences.getInstance()` diretamente no `build()`. Prefira usar em `initState()` ou em uma função assíncrona separada.
* **Crie uma classe utilitária** para encapsular o uso (evita repetição de código).
* **Prefira tipos seguros** (`getBool`, `getString`, etc.) e verifique se os dados existem.
* **Não armazene objetos complexos ou sensíveis**.
* **Faça limpeza de dados** se o usuário deslogar ou resetar o app.

---

Claro! Abaixo estão **dois exemplos completos de apps Flutter** utilizando `SharedPreferences`.

---

*Obs 8: Basicamente o mesmo aplicativo feito durante a aula sobre persistência, porém sem usar Providers, apenas o setState dos Stateful Widgets, e sem separar o código em diferentes classes. Mesmo assim é muito interessante salvar esses dados localmente sem precisar usar Jsons ou bancos de dados*

## ✅ **8. App: Salvar Nome e Sobrenome com SharedPreferences**

```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(NomeApp());

class NomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: NomeScreen());
  }
}

class NomeScreen extends StatefulWidget {
  @override
  State<NomeScreen> createState() => _NomeScreenState();
}

class _NomeScreenState extends State<NomeScreen> {
  final nomeController = TextEditingController();
  final sobrenomeController = TextEditingController();
  String nomeCompleto = '';

  @override
  void initState() {
    super.initState();
    carregarNome();
  }

  Future<void> carregarNome() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nomeCompleto = prefs.getString('nomeCompleto') ?? '';
    });
  }

  Future<void> salvarNome() async {
    final prefs = await SharedPreferences.getInstance();
    final nome = nomeController.text;
    final sobrenome = sobrenomeController.text;
    await prefs.setString('nomeCompleto', '$nome $sobrenome');
    carregarNome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Salvar Nome')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nomeController, decoration: InputDecoration(labelText: 'Nome')),
            TextField(controller: sobrenomeController, decoration: InputDecoration(labelText: 'Sobrenome')),
            SizedBox(height: 16),
            ElevatedButton(onPressed: salvarNome, child: Text('Salvar')),
            SizedBox(height: 32),
            Text('Nome salvo: $nomeCompleto', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
```

---

*Obs 9: Eu tinha feito um projeto de lista de tarefas anteriormente, e toda vez que eu dava um hot restart, eu precisava ficar adicionando as tarefas novamente. Se eu tivesse usado o SharedPreferences, tudo teria sido muito mais fácil*

## ✅ **9. App: Lista de Tarefas com SharedPreferences**

```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(ListaDeTarefasApp());

class ListaDeTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TarefasScreen());
  }
}

class TarefasScreen extends StatefulWidget {
  @override
  State<TarefasScreen> createState() => _TarefasScreenState();
}

class _TarefasScreenState extends State<TarefasScreen> {
  final tarefaController = TextEditingController();
  List<String> tarefas = [];

  @override
  void initState() {
    super.initState();
    carregarTarefas();
  }

  Future<void> carregarTarefas() async {
    final prefs = await SharedPreferences.getInstance();
    final lista = prefs.getStringList('tarefas') ?? [];
    setState(() => tarefas = lista);
  }

  Future<void> adicionarTarefa(String tarefa) async {
    setState(() => tarefas.add(tarefa));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tarefas', tarefas);
    tarefaController.clear();
  }

  Future<void> removerTarefa(int index) async {
    setState(() => tarefas.removeAt(index));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('tarefas', tarefas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: tarefaController, decoration: InputDecoration(labelText: 'Nova Tarefa')),
            ElevatedButton(
              onPressed: () {
                if (tarefaController.text.isNotEmpty) {
                  adicionarTarefa(tarefaController.text);
                }
              },
              child: Text('Adicionar'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tarefas[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => removerTarefa(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```