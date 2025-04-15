*Obs 1: Muito úteis quando precisamos ler um arquivo ou abrir uma conexão com um banco de dados, ou se precisamos executar uma função que pode demorar a terminar sua execução.*

### 🕒 **1. O que é um `Future` em Dart e como ele me ajuda a lidar com tarefas que levam tempo?**
Um **`Future`** representa **um valor que estará disponível no futuro**, ou seja, uma **operação assíncrona**.

Ele é útil pra:
- Acessar a internet (ex: buscar dados de uma API),
- Ler arquivos,
- Esperar tempo (`Future.delayed`), etc.

💡 **Ajuda a manter o app responsivo**, executando tarefas demoradas **sem travar a interface**.

---

*Obs 2: Eu já tinha trabalhado um pouco com programação assíncrona usando a lingaugem Lua e as Threads no Java, então eu já estou um pouco familiarizado com os conceitos de assincronicidade*

### 🧭 **2. O que significam os termos 'assíncrono' e 'síncrono'?**
- **Síncrono**: código que **executa linha por linha**, esperando uma tarefa terminar antes de passar pra próxima.
- **Assíncrono**: código que **não bloqueia a execução**, permitindo que outras tarefas continuem enquanto espera o resultado.

📌 Exemplo:
```dart
print("1");
await Future.delayed(Duration(seconds: 2));
print("2");
```
Durante os 2 segundos, o programa pode continuar executando outras coisas.

---

*Obs 3: Eu acho que a primeira opção é mais recomendável de se utilizar, pois ela é mais legível e permite lançar exceções customizadas, enquanto a segunda forma lança apenas um tipo de exceção*

### ❌ **3. O que acontece se um Future falhar e como posso lidar com esse erro?**
Se um `Future` falhar, ele **lança uma exceção**.

Você pode:
- Usar `try/catch` com `await`:
  ```dart
  try {
    await minhaFuncao();
  } catch (e) {
    print("Erro: $e");
  }
  ```
- Usar `catchError()` com `then()`:
  ```dart
  minhaFuncao().then((valor) {
    print(valor);
  }).catchError((erro) {
    print("Erro: $erro");
  });
  ```

---

*Obs 4: Pelo que entendi, a forma mais recomendável é utilizar o Future.wait() para realizar as tarefas, pois o await espera as tarefas dependendo de sua ordem, enquando o Future.wait() não depende de ordens de posicionamento*

### 🔀 **4. Existe uma forma de executar várias tarefas assíncronas em paralelo?**
Sim! Com `Future.wait()` ou usando `async` sem `await` nas tarefas:

```dart
Future<void> executar() async {
  var f1 = Future.delayed(Duration(seconds: 2), () => "A");
  var f2 = Future.delayed(Duration(seconds: 3), () => "B");

  var resultados = await Future.wait([f1, f2]);
  print(resultados); // [A, B]
}
```

⚡ Executa em paralelo e espera ambas concluírem.

---

*Obs 5: Eu tentei conectar o MySQL ao Dart, porém eu tive muita dificuldade pois é necessário usar concorrência para fazê-lo e, na época, eu não tinha conhecimento algum sobre concorrência em Dart, e mesmo lendo a documentação, eu ainda tive dificuldade. Agora, creio que eu consiga conectar ao banco de dados tranquilamente*

### 🧰 **5. Em quais situações devo usar Futures em meu código Dart?**
Use `Future` quando:
- Uma operação **leva tempo** (como rede, arquivos, delays).
- Você quer **manter o programa fluido** sem travar a execução.
- Está integrando com **funções assíncronas**, como APIs, Banco de Dados, etc.

---

*Obs 6: Pelo que eu entendi, o await 'força' o programa esperar a instrução executar, deixando o código menos suscetível a erros inesperados. Entretanto, pode deixar a instrução mais lenta*

### ⚠️ **6. Quais cuidados devo tomar ao não usar `await` em funções Future?**
Se você **não usar `await` ou `then()`**, o `Future` **ainda será executado**, mas:
- Pode **não capturar o erro** (não tratado).
- Pode **não esperar o resultado**, causando comportamentos imprevisíveis.
- O Dart **pode até emitir warnings** se o `Future` for ignorado.

➡️ Dica: Sempre **aguarde o resultado** ou **trate o erro**.

---

*Obs 7: É muito importante manter o tratamento de exceções conciso e coerente, pois assim o código vai ser mais limpo e fácil de entender, além de fornecer informações sobre o erro, facilitando a procura por bugs*

### 🛠️ **7. Como lidar com erros usando Future?**
Depende do estilo:

- **Com `await`**:
  ```dart
  try {
    var resposta = await buscarDados();
  } catch (e) {
    print("Erro: $e");
  }
  ```

- **Com `then()`**:
  ```dart
  buscarDados()
    .then((resposta) => print(resposta))
    .catchError((erro) => print("Erro: $erro"));
  ```

Você também pode usar o `on` pra tratar tipos específicos:
```dart
try {
  await algo();
} on TimeoutException {
  print("Timeout!");
} catch (e) {
  print("Erro genérico: $e");
}
```