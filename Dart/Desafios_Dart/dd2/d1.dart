import 'dart:math' as math;

void main() {

  // instancia um [MeioDeComunicacao] aleatório de acordo com a função [aleatorio]
  final meioDeComunicacao = aleatorio();
  meioDeComunicacao.fazerLigacao('(47) 99876-5432');
}

/// Retorna um MeioDeComunicacao aleatório
MeioDeComunicacao aleatorio() {
  final List<MeioDeComunicacao> meiosDeComunicacao = // alterei a declaração da lista a fim de deixá-la mais legível
  [
    Telefone(),
    Celular(),
    Orelhao(),
  ];

  final random = math.Random();

  // retorna um elemento aleatorio da lista meiosDeComunicacao
  return meiosDeComunicacao[random.nextInt(
    meiosDeComunicacao.length,
  )];
}

/// Classe abstrata que representa um meio de comunicação e possui o método abstrato
/// [fazerLigacao], que recebe um numero de telefone como argumento e deve ser
/// implementado pelas classes que estendam a classe [MeioDeComunicacao]
abstract class MeioDeComunicacao {

  /// Metodo a ser implementado pelas classes que extendam a classe [MeioDeComunicacao]
  void fazerLigacao(String outroNumero);
}

/// Classe Telefone que estende a classe [MeioDeComunicacao]
class Telefone extends MeioDeComunicacao {

  @override
  void fazerLigacao(String outroNumero) {
    print('[TELEFONE] Ligando para $outroNumero');
  }
}

/// Classe Celular que estende a classe [MeioDeComunicacao]
class Celular extends MeioDeComunicacao {

  @override
  void fazerLigacao(String outroNumero) {
    print('[CELULAR] Ligando para $outroNumero');
  }

  Celular();
}

/// Classe Orelhao que estende a classe [MeioDeComunicacao]
class Orelhao extends MeioDeComunicacao {

  @override
  void fazerLigacao(String outroNumero) {
    print('[ORELHAO] Ligando para $outroNumero');
  }
}