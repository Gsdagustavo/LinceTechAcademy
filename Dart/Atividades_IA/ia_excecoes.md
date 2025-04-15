
*Obs 1:  Pelo que eu entendi, os erros são falhas causadas pelo programador, seja por um argumento inesperado em uma função, manipulação incorreta de variáveis nullable ou non-nullable, estouro de memória, loops infinitos, etc. Já as exceptions são falhas que podem ser tratadas pelo código, com o uso do try-catch-finally e exceções personalizadas. Geralmente, representam uma falha que não está ao alcance do desenvolvedor, como o input incorreto do usuário (FormatException, IOException, etc.), porém que podem ser tratados e resolvidos pelo próprio código*

### **1. Qual a diferença entre um erro e uma exceção em Dart?**  
- **Erro (`Error`)**: Indica falhas graves no programa, geralmente causadas por problemas de lógica ou condições inesperadas que não deveriam ocorrer. Exemplo: `StackOverflowError`, `OutOfMemoryError`.  
- **Exceção (`Exception`)**: Representa situações que podem ser tratadas pelo código, como erros de entrada do usuário ou falhas em operações de rede. Exemplo: `FormatException`, `IOException`.  

---

*Obs 2: O ideal é que não hajam erros no código, pois se há erros, significa que o desenvolvedor fez algo que não deveria, ou deixou de fazer algo que deveria. Já as exceções são algo "esperado" em um código, permitindo tratar essa exceção e continuar o fluxo normal do código*

### **2. Em quais situações devo esperar encontrar um erro, e em quais devo esperar uma exceção?**  
- **Erro**: Quando há um problema crítico no código, como recursão infinita ou tentativa de acessar um índice inválido em uma lista.  
- **Exceção**: Quando há problemas que podem ser previstos e tratados, como falha ao abrir um arquivo ou entrada inválida do usuário.  

---

*Obs 3: Eles são fundamentais em qualquer linguagem de programação, como Java, C, C++, Dart, JavaScript, etc. Sem eles, qualquer tipo de exceção faria com que o programa fechasse/interrompesse a execução.*

### **3. O que fazem os blocos `try`, `catch` e `finally` em Dart?**  
- `try`: Contém o código que pode gerar uma exceção.  
- `catch`: Captura e trata exceções que ocorrerem no bloco `try`.  
- `finally`: Executado sempre, independentemente de exceções ocorrerem ou não, útil para liberar recursos.  

Exemplo:  
```dart
try {
  int resultado = 10 ~/ 0; // Erro: divisão por zero
} catch (e) {
  print("Ocorreu um erro: $e");
} finally {
  print("Este bloco sempre será executado");
}
```

---

*Obs 4: Muito útil quando uma exceção específica precisa ser tratada de forma diferente das demais exceções*

### **4. Como posso capturar diferentes tipos de exceções usando `catch`?**  
Você pode capturar todas as exceções ou um tipo específico:  
```dart
try {
  throw FormatException("Formato inválido");
} on FormatException catch (e) {
  print("Exceção de formato: $e");
} catch (e) {
  print("Outra exceção: $e");
}
```

---

*Obs 5: Não é muito utilizado, mas é fundamental quando estamos trabalhando com recursos que consomem muita memória ou que demandem algum tipo de conexão exterior e precisamos fechar essa conexão (banco de dados, API's, links, etc).*

### **5. Em quais situações é útil usar o bloco `finally`?**  
- Fechar conexões com banco de dados.  
- Liberar recursos alocados, como arquivos abertos.  
- Executar código que **sempre** deve rodar, mesmo em caso de erro.  

Exemplo:  
```dart
File file = File('dados.txt');
try {
  file.openSync();
} catch (e) {
  print("Erro ao abrir o arquivo: $e");
} finally {
  file.closeSync(); // Garante que o arquivo será fechado
}
```

---

*Obs 6: Além de poder mostrar ao usuário de forma amigável que um erro aconteceu, também é útil pois permite ao programa continuar executando mesmo que haja um erro.*

### **6. Por que eu precisaria lançar uma exceção em meu código?**  
Para **sinalizar um erro** quando um estado inválido ocorre, garantindo que o problema seja tratado corretamente.  

Exemplo:  
```dart
void validarIdade(int idade) {
  if (idade < 18) {
    throw Exception("Idade inválida: $idade");
  }
}
```

---

*Obs 7: Usar classes personalidas para exceções é muito mais recomendável do que usar a classe Exception() padrão, pois permite ao desenvolvedor saber de forma mais eficiente qual a exceção lançada e permite corrigir algum bug mais rapidamente*

### **7. Como posso personalizar mensagens de erro ao lançar exceções?**  
Você pode criar uma classe personalizada para exceções:  
```dart
class IdadeInvalidaException implements Exception {
  final String mensagem;
  IdadeInvalidaException(this.mensagem);
  @override
  String toString() => "Erro: $mensagem";
}
```

E lançar a exceção:  
```dart
void validarIdade(int idade) {
  if (idade < 18) {
    throw IdadeInvalidaException("Menores de idade não são permitidos");
  }
}
```

---

*Obs 8: O conceito de 'tratar exceções' é algo comum e rotineiro na vida de um desenvolvedor. Desse modo, é fundamental o programador ter conhecimentos e saber como tratar exceções, fornecendo mensagens amigáveis ao usuário e facilitando o processo de desenvolvimento de uma aplicação*

### **8. Quais são as melhores práticas para lançar exceções em Dart?**  
- **Evite usar exceções para controle de fluxo**. Elas devem ser usadas apenas para situações excepcionais.  
- **Forneça mensagens claras** sobre o erro.  
- **Crie exceções personalizadas** quando necessário.  
- **Sempre capture exceções que podem ser previstas**, evitando que o programa quebre inesperadamente.  

---

*Obs 9: O comando assert é muito útil para debugar um programa, pois ele mostra ao desenvolvedor o "status" de uma variável por meio de uma expressão. Por exemplo: se uma variável não pode ser nula pois será utilizada futuramente, é possível usar o comando assert() antes de usar a variável para grarantir que ela não seja nula*

### **9. Qual a diferença entre usar `assert` e lançar uma exceção para verificar condições?**  
- **`assert`**: Usado para depuração, verifica condições durante o desenvolvimento, mas é removido em builds de produção.  
- **Exceção**: Sempre está presente no código e pode ser tratada para evitar falhas inesperadas.  

Exemplo:  
```dart
void main() {
  int idade = 17;
  assert(idade >= 18, "Idade deve ser maior ou igual a 18"); // Somente no debug
}
```

---

*Obs 10: Como mencionado anteriormennte, o comando assert() é muito útil para validar variáveis, verificar expressões, etc. É muito usado para detectar alguma parte frágil do código, permitindo ao desenvolvedor resolver um bug durante as fases de desenvolvimento*

### **10. Em quais situações o `assert` é mais útil durante o desenvolvimento?**  
- Para verificar **pré-condições** antes de executar um código crítico.  
- Para validar valores que **não devem ser inválidos em condições normais**.  
- Para detectar bugs **durante a fase de testes e desenvolvimento**.  

Exemplo:  
```dart
void calcularArea(double raio) {
  assert(raio > 0, "O raio deve ser positivo");
  double area = 3.14 * raio * raio;
  print("Área: $area");
}
```

---

Essas práticas vão te ajudar a tratar erros e exceções de maneira eficiente no Dart. 🚀