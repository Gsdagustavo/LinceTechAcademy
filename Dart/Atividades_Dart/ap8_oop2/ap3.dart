
/// Testar a implementação da classe [Vendedor]
void main() {
  Vendedor vendedor = Vendedor();
  vendedor.andar();
  vendedor.trabalhar();
}

/// Classe que define um método abstrato simples ([falar])
abstract class Pessoa {
  void andar();
}

/// Classe que define um método abstrato simples ([trabalhar])
abstract class Funcionario {
  void trabalhar();
}

/// Classe que implementa as classes abstratas [Pessoa] e [Funcionario] e implementa
/// os métodos abstratos dessas classes
class Vendedor implements Pessoa, Funcionario {
  @override
  void andar() {
    print('O vendedor está andando');
  }

  @override
  void trabalhar() {
    print('O vendedor está trabalhando');
  }
}