import 'dart:collection';

/// Lista constante contendo os valores das cartas válidas
const cartasValidas = ['\u2663', '\u2665', '\u2660', '\u2666'];

void main() {

  /// Testar a implementação da classe [ControladorBaralho]
  try {

    final baralho = ControladorBaralho();

    // aciciona 4 cartas ao baralho
    baralho.adicionarCarta('\u2663');
    baralho.adicionarCarta('\u2665');
    baralho.adicionarCarta('\u2660');
    baralho.adicionarCarta('\u2666');

    /// Mostra as cartas, remove todas as cartas e mostra as cartas novamente

    baralho.mostrarCartas();

    baralho.removerTodasAsCartas();

    baralho.mostrarCartas();

  } on CartaInvalidaException catch (e) {
    print(e);
  }
}

/// Classe que simula um baralho e possui métodos para sua manipulação
class ControladorBaralho {
  final _cartas = Queue<String>();

  /// Adiciona uma carta no topo do baralho
  void adicionarCarta(String carta) {
    if (!cartasValidas.contains(carta)) {
      throw CartaInvalidaException('carta invalida: $carta');
    }

    _cartas.addLast(carta);
  }

  /// Remove a útlima carta do baralho
  void removerUltimaCarta() {
    _cartas.removeLast();
  }

  /// Mostra todas as cartas no baralho, ordenadas por ordem de inclusão
  ///
  /// Se não houver nenhuma carta no baralho, avisa ao usuário
  void mostrarCartas() {

    if (_cartas.isEmpty) {
      print('Não há cartas no baralho');
      return;
    }

    for (final (i, carta) in _cartas.indexed) {
      print('Carta ${i + 1}. $carta');
    }
    print('');
  }

  /// Remove todas as cartas do baralho, usando o método auxiliar [removerUltimaCarta]
  void removerTodasAsCartas() {
    while (_cartas.length > 0) {
      removerUltimaCarta();
    }
  }
}

/// Exception que será lançada caso uma carta inválida seja adicionada ao baralho
class CartaInvalidaException implements Exception {
  final String message;

  CartaInvalidaException(this.message);

  @override
  String toString() {
    return 'CartaInvalidaException: $message';
  }
}
