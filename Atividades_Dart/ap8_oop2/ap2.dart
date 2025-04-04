
/// Testar a implementação da classe [Gato]
void main() {
  Gato gato = Gato();

  gato.comer();
  gato.beber();
  gato.miar();
}

/// Classe que possui dois méotos simulando o comportamento de uma animal comum
abstract class Animal {

  void comer() {
    print('O animal está comendo');
  }

  void beber() {
    print('O animal está bebendo');
  }
}

/// Classe que estende a classe abstrata [Animal] e possui um método próprio ([miar])
class Gato extends Animal {

  void miar() {
    print('O gato está miando');
  }
}