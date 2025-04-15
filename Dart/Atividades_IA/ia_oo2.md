*Obs 1: Útil quando estamos trabalhando com classes abstratas e interfaces, pois permitem que as classes que implementem ou estendam de uma classe mãe definam individualmente como um método deve ser implementado, isto é, têm implementações próprias. Isso permite eliminar, em partes, a repetição de código*

### 🔁 **1. O que significa 'sobrescrever' um método em Dart e por que eu faria isso?**
**Sobrescrever** (override) significa redefinir um método herdado de uma classe pai para fornecer uma implementação diferente na subclasse.  
Você faz isso com a anotação `@override`.

🔧 **Por que fazer isso?**  
Para alterar ou estender o comportamento de um método herdado. Ex: uma classe `Animal` tem um método `falar()`, e você quer que `Cachorro` e `Gato` implementem esse método de forma diferente.

```dart
class Animal {
  void falar() => print('Som genérico');
}

class Cachorro extends Animal {
  @override
  void falar() => print('Au au!');
}
```

---

*Obs 2: É muito útil em métodos toString() em classes que herdem de uma classe mãe, pois permite adquirir o toString() da classe mãe e adicionar informações da classe filha*

### 🧭 **2. Como posso chamar o método original de uma classe pai em um método sobrescrito?**
Use a palavra-chave `super`.

```dart
class Animal {
  void falar() => print('Som genérico');
}

class Cachorro extends Animal {
  @override
  void falar() {
    super.falar(); // Chama o método da classe pai
    print('Au au!');
  }
}
```

---

*Obs 3: É um pouco diferente de outras linguagens, como o Java, onde é necessário usar keywords para definir o tipo de encapsulamento (private, protected ou public) para atributos e métodos de uma classe. Entretanto, o Dart proporciona uma forma menos verbosa e mais elegante de definir atributos privados utilizando o underscore*

### 🔒 **3. Como posso criar um getter para acessar um atributo privado de uma classe?**
Atributos privados em Dart começam com `_`. Você pode expor eles com um **getter**:

```dart
class Pessoa {
  final String _nome;

  Pessoa(this._nome);

  String get nome => _nome;
}
```

---

*Obs 4: O encapsulamento é um dos pilares do paradigma da Orientação a Objetos, e deve ser seguido para manter um código limpo, coerente e conciso, evitando futuras falhas e problemas de desenvolvimento, além de fornecer uma camada extra de proteção ao programa (eu não usei IA para escrever nenhuma dessas observações, por mais que pareça. Eu só gosto de escrever mesmo. Além disso, eu tenho um pouco de experiência em escrever artigos científicos, a qual me ajudou em muito a escrever essas observações)*

### 💡 **4. Em quais situações é melhor usar getters e setters em vez de acessar atributos diretamente?**
- Quando você quer **controlar o acesso** (ex: validações ou lógica antes de retornar/alterar valores).
- Para manter a **encapsulamento** e esconder detalhes internos.
- Permite mudar a lógica interna sem quebrar código que usa a classe.

---

*Obs 5: Muito útil para evitar duplicação de código e manter o código limpo*

### 🧱 **5. O que é uma 'classe abstrata' e como ela difere de uma classe normal?**
Uma **classe abstrata** é uma classe que **não pode ser instanciada diretamente** e pode conter métodos sem implementação (abstratos).

```dart
abstract class Forma {
  double calcularArea();
}
```

➡️ Uma **classe normal** pode ser instanciada e precisa ter todos os métodos implementados.

---

*Obs 6: Novamente, muito útil para evitar duplicação de código e manter o código limpo. Pode ser implementada em vários contextos onde é necessário implementar uma classe geral e, a partir dessa classe, implementar as outras classes com suas especializações, mantendo um código limpo e conciso*

### 🧩 **6. Quando devo usar classes abstratas em vez de classes concretas?**
Use uma **classe abstrata** quando:
- Você quer **forçar subclasses** a implementarem certos métodos.
- Está definindo uma **estrutura base comum** para várias classes.

---

*Obs 7: Um dos fundamentos da orientação a objetos. Aliás, é importante ter em mente que o paradigma de orientação a objetos foi "criado" para evitar a duplicação de código nos programas da década de 80.*

### 🧬 **7. O que é 'herança' em Dart e como ela funciona?**
Herança é quando uma classe **herda** características (atributos e métodos) de outra classe.

```dart
class Animal {
  void dormir() => print('Dormindo...');
}

class Gato extends Animal {
  void miar() => print('Miau!');
}
```

A classe `Gato` herda `dormir()` de `Animal`.

---

*Obs 8: Na maioria dos casos, não é recomendado utilizar composição nos códigos, pois seu uso traz um alto nível de acoplamento no código, o que pode gerar problemas futuros no desenvolvimento da aplicação*

### 🔧 **8. Qual a diferença entre herança e composição?**
- **Herança**: "é um tipo de"  
  Ex: `Cachorro` é um `Animal`.

- **Composição**: "tem um"  
  Ex: `Carro` tem um `Motor`.

```dart
class Motor {
  void ligar() => print('Ligando motor');
}

class Carro {
  final Motor motor = Motor();

  void ligar() {
    motor.ligar(); // composição
  }
}
```

---

*Obs 9: Eu achei curiosos o fato de não existir a keyword 'interface' na linguagem Dart, e faz muito sentido a forma com que as interfaces são "feitas" em Dart, pois garante maior flexibilidade para utilizar a herança*

### 📜 **9. O que é uma 'interface' em Dart e como ela define um contrato de comportamento?**
Toda classe em Dart pode ser usada como **interface**. Ela define **métodos que devem ser implementados**.

```dart
class Animal {
  void comer();
}
```

---

*Obs 10: Vale lembrar que caso uma classe implemente outra e o programador não codifique as implementações dos métodos da classe implementada na outra classe, um UnimplementedError será lançado.*

### 🧪 **10. Como uma classe pode implementar uma interface?**
Use `implements` e **implemente todos os métodos**:

```dart
class Animal {
  void comer() {}
}

class Pessoa implements Animal {
  @override
  void comer() => print('Pessoa comendo');
}
```

---

*Obs 11: Geralmente, é mais recomendável programar orientado a interfaces (implementações) do que heranças para reduzir o nível de acoplamento entre as classes*

### 🧠 **11. Qual a diferença entre herança e implementação de interfaces?**
- `extends` (herança): você **herda** comportamentos e pode sobrescrevê-los.
- `implements` (interface): você **não herda código**, só **assina o contrato** e precisa **implementar tudo do zero**.

---

*Obs 12: Úteis em classes controller, por exemplo para conectar um banco de dados ou registrar usuários, onde não faz sentido instanciar uma classe ConectarBanco ou ControladorUsuarios apenas para fazer isso*

### ⚙️ **12. Quais cenários devo usar métodos estáticos em vez de métodos de instância?**
Use **métodos estáticos** quando:
- A lógica **não depende de atributos da instância**.
- Você quer criar **funções utilitárias**.

```dart
class Matematica {
  static int somar(int a, int b) => a + b;
}
```

---

*Obs 13: Sintaxe simples. É curioso saber que utilizamos métodos estáticos desde o início de nosso aprendizado sobre orientação a objetos (geralmente utilizamos métodos da classe Math em vários contextos, principalmente na matéria de lógica de programação).*

### 📞 **13. Como posso acessar um método estático sem criar uma instância da classe?**
Chame usando o **nome da classe**:

```dart
int resultado = Matematica.somar(2, 3);
```

---

*Obs 14: Muito úteis para controlar regras de negócio de uma aplicação, além de serem extremamente poderosos quando utilizados em switch-cases*

### 🔢 **14. O que são 'enumeradores' em Dart e para que servem?**
**Enums** são tipos que representam um conjunto fixo de valores.

```dart
enum Status { ativo, inativo, pendente }
```

São úteis para **controlar estados** de forma mais clara e segura.

---

*Obs 15: Além das vantagens citadas, também é importante ter em mente que é muito mais fácil declarar um enum com 10 valores diferentes e manipular seus valores utilizando métodos do que instanciar 10 constantes. Além, disso, eles são úteis pois reduzem a redundância de código e o deixam mais limpo*

### ✅ **15. Em quais situações é melhor usar enumeradores em vez de constantes?**
Use enums quando:
- Você tem um **conjunto fechado de opções**.
- Precisa de **segurança de tipo** (Dart não deixa passar valores fora do enum).
- Quer **código mais legível** e organizado.

---

Se quiser, posso montar um resuminho bonitinho em PDF com essas explicações. Quer?