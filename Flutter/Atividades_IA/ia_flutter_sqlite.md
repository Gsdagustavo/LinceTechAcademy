*Obs 1: O SQLite, quando comparado com outros bancos de dados, se sobressai em muitos aspectos, principalmente no que diz respeito sobre performance e usabilidade. Ele fornece ferramentas como qualquer outro banco de dados, porém é feito especificamente para pequenas aplicações, incluindo mobile. Desse modo, é fundamental para qualquer programador Flutter ter os conhecimentos básicos desse banco de dados*

### 📌 **1. O que é um banco de dados SQLite e como ele funciona em Flutter?**

SQLite é um sistema de banco de dados leve, local, relacional e baseado em arquivos. No Flutter, ele funciona por meio de pacotes como `sqflite`, que permitem ler, escrever e gerenciar dados diretamente no dispositivo do usuário.

---

*Obs 2: Novamente, ele fornece várias ferramentas de bancos de dados tradicionais, porém de forma mais leve e fácil para pequenas aplicações, incluindo aquelas que não necessitem de conexão à internet*

### 📌 **2. Quais são as vantagens de usar SQLite em aplicativos Flutter?**

* Não requer servidor: é local.
* Simples e leve.
* Armazena dados estruturados de forma persistente.
* Ideal para apps offline.
* Suporta consultas SQL completas.

---

*Obs 3: Muito parecido (se não idêntico) a outros bancos de dados. Na verdade, todos os bancos de dados relacionais utilizam a mesma linguagem de modelagem, que é a linguagem SQL. Sendo assim, sua estrutura de código sempre será parecida, porém com algumas diferenças sintáticas aqui e ali. É como se fossem os "jargões" da linguagem*

### 📌 **3. Quais são os tipos de dados básicos que posso armazenar em um banco de dados SQLite?**

* `INTEGER`: números inteiros.
* `REAL`: números com ponto flutuante.
* `TEXT`: cadeias de caracteres.
* `BLOB`: dados binários (ex: imagens).
* `NULL`: valores nulos.

---

*Obs 4: É importante trabalhar com funções e tarefas assíncronas quando formos realizar alguma operação com o banco de dados, pois nem sempre a informação estará a pronta entrega para o programa, gerando gargalos e atraso.*

### 📌 **4. Como posso inserir novos registros em uma tabela SQLite usando Flutter?**

```dart
await db.insert('pessoas', {'nome': 'Gustavo'});
```

---

*Obs 5: Transações são muito úteis quando precisamos executar uma série de comandos, e todos os comandos precisam executar sem erros, pois caso contrário toda modificação feita no banco de dados será revertida ao estado incial da transação (rollback)*

### 📌 **5. Como posso inserir vários registros de uma vez em uma tabela SQLite?**

Use um loop dentro de uma **transação**:

```dart
await db.transaction((txn) async {
  for (var pessoa in lista) {
    await txn.insert('pessoas', pessoa.toMap());
  }
});
```

---

*Obs 6: Essa é uma das formas, pois ao inserir um registro no banco de dados, um int é retornado indicando o ID. Porém, isso só é possível quando um novo registro está sendo inserido. Caso seja necessário recuperar o ID (ou algum outro atributo), será necessário utilizar a instrução SELECT*

### 📌 **6. Como posso obter o ID do último registro inserido em uma tabela SQLite?**

O método `insert` retorna o ID:

```dart
int id = await db.insert('pessoas', {'nome': 'Maria'});
```

---

*Obs 7: É mais recomendável utilizar o método query com os argumentos where whereArgs do que usar o rawQuery, pois a SQL Injection se torna possível nessa última opção.*

### 📌 **7. Como posso filtrar os resultados de uma consulta usando a cláusula WHERE?**

```dart
final result = await db.query(
  'pessoas',
  where: 'nome = ?',
  whereArgs: ['Gustavo'],
);
```

---

*Obs 8: Útil para retornar informações específicas com um tipo de organização, mantendo os dados mais consistentes e organizados*

### 📌 **8. Como posso agrupar os resultados de uma consulta usando a cláusula GROUP BY?**

```dart
final result = await db.query(
  'pessoas',
  columns: ['nome', 'COUNT(*)'],
  groupBy: 'nome',
);
```

---

*Obs 9: É MUITO importante usar os parâmetros where whereArgs, pois caso apenas o nome da tabela seja passado na função, TODOS os registros serão apagados do banco de dados, e isso é muito perigoso*

### 📌 **9. Como posso excluir registros de uma tabela SQLite usando Flutter?**

```dart
await db.delete('pessoas', where: 'id = ?', whereArgs: [1]);
```

---

*Obs 10: Como eu disse anteriormente, usar o where em cláusulas como update e delete garante que todos os dados não sejam modificados ou removidos*

### 📌 **10. Quais os cuidados necessários ao usar UPDATE, INSERT e DELETE?**

* Sempre use `where` para evitar alterar tudo acidentalmente.
* Use transações para garantir atomicidade.
* Trate erros com try/catch.
* Valide os dados antes de modificar.

---

*Obs 11: As foreign keys e os relacionamentos são fundamentais em qualquer banco de dados, pois a chave estrangeira permite o relacionamento entre entidades. Por exemplo: a tabela Usuario possui o campo ID, e a tabela Carrinho possui os produtos desejados pelo usuario e uma chave estrangeira referenciando o ID do usuario. A partir desses conceitos, é possível criar relacionamentos entre as tabelas*

### 📌 **11. Como posso criar tabelas relacionadas em um banco de dados SQLite?**

```sql
CREATE TABLE contatos (
  id INTEGER PRIMARY KEY,
  nome TEXT
);

CREATE TABLE telefones (
  id INTEGER PRIMARY KEY,
  numero TEXT,
  contato_id INTEGER,
  FOREIGN KEY(contato_id) REFERENCES contatos(id)
);
```

---

*Obs 12: Útil para mostrar dados relacionados entre diferentes tabelas*

### 📌 **12. Como posso consultar dados de tabelas relacionadas usando JOIN?**

```dart
final result = await db.rawQuery('''
  SELECT contatos.nome, telefones.numero
  FROM contatos
  INNER JOIN telefones ON contatos.id = telefones.contato_id
''');
```

---

*Obs 13: As transações garantem que todas as operações dentro do bloco de código executem sem erro, e caso haja algum erro, os dados no banco de dados são revertidos ao estado inicial (rollback)*

### 📌 **13. O que são transações em um banco de dados SQLite e por que são importantes?**

Transações agrupam várias operações em um único bloco atômico. Se uma falhar, todas são desfeitas. Isso evita inconsistências.

---

*Obs 14: Praticamente todos os bancos de dados relacionais possuem essa característica, pois as transações e seu funcionamento sáo intrínsecos da linguagem SQL*

### 📌 **14. Como posso reverter uma transação em caso de erro?**

O método `transaction` do `sqflite` já trata rollback automaticamente se ocorrer erro:

```dart
await db.transaction((txn) async {
  await txn.insert(...);
  throw Exception('erro'); // faz rollback automático
});
```

---

*Obs 15: O famoso ACID. Atomicidade diz respeito quanto à não-divisibiliade dos dados em um banco de dados. Esse termo é curioso, pois na Grécia antiga, no tempo dos filósofos gregos, era postulado que a matéria é composta por "átomos", que literalmente significam "indivisíveis", tal qual são os dados de um banco de dados*

### 📌 **15. Quais são as vantagens de usar transações para garantir a integridade dos dados?**

* **Atomicidade**: tudo ou nada.
* **Consistência**: dados sempre válidos.
* **Isolamento**: operações não interferem entre si.
* **Durabilidade**: dados persistem mesmo após falhas.

*Obs 16: Tenho a impressão de que o SQLite foi desenvolvido especialmente para o Flutter e Dart, pois para criar um novo banco de dados SQLite e realizar as operações é muito simples em Dart, fora que ele atende requisitos primordiais para uma aplicação mobile, pois ele é leve, pode funcionar offline e roda na porta local*

### ✅ **Como criar um banco de dados e uma tabela em SQLite usando Flutter**

Para isso, você usa o pacote [`sqflite`](https://pub.dev/packages/sqflite). Exemplo completo:

#### 1. **Adicione o pacote ao `pubspec.yaml`:**

```yaml
dependencies:
  sqflite: ^2.3.0
  path: ^1.8.0
```

#### 2. **Função para inicializar o banco e criar a tabela:**

```dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'pessoas.db');

  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE pessoas (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT
        )
      ''');
    },
  );
}
```

*Obs 17: É muito importante seguir os conceitos de otimização, principalmente quando estamos trabalhando com bancos de dados, pois um código mal escrito ou uma função mal desenvolvida pode gerar muitos problemas no futuro, como falta de performance, manutebilidade limitada,  baixa (ou nenhuma) escalabilidade, etc.*

### 🚀 **Dicas para otimizar suas consultas no SQLite (Flutter)**

1. **Use `where` com índices (preferencialmente com colunas primárias ou únicas):**

   ```dart
   await db.query('pessoas', where: 'id = ?', whereArgs: [1]);
   ```

2. **Evite `SELECT *`, especifique colunas necessárias:**

   ```dart
   await db.query('pessoas', columns: ['id', 'nome']);
   ```

3. **Use `LIMIT` para evitar sobrecarregar a memória com muitos registros:**

   ```dart
   await db.query('pessoas', limit: 50);
   ```

4. **Crie índices manuais se fizer buscas frequentes por campos não primários:**

   ```sql
   CREATE INDEX idx_nome ON pessoas(nome);
   ```

5. **Agrupe inserções/lotes em transações:**

   ```dart
   await db.transaction((txn) async {
     for (var pessoa in lista) {
       await txn.insert('pessoas', pessoa.toMap());
     }
   });
   ```

6. **Use `rawQuery` para consultas mais complexas (JOINs, agregações, etc.):**

   ```dart
   await db.rawQuery('SELECT * FROM pessoas WHERE nome LIKE ?', ['%gus%']);
   ```