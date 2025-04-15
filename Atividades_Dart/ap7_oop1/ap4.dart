import 'dart:math';

void main() {

  final Random random = Random();

  const int idadeMinima = 1;
  const int idadeMaxima = 100;

  final Pessoa pessoa = Pessoa();

  pessoa.nome = 'Anami';
  pessoa.idade = random.nextInt(idadeMaxima) + idadeMinima;
  pessoa.altura = gerarAlturaAleatoria(random);

  print('Nome: ${pessoa.nome}');
  print('Idade: ${pessoa.idade} anos');
  print('Altura: ${pessoa.altura.toStringAsFixed(2)} m');
}

/// Gera uma valor aleatorio entre 1.0 e 2.3, representando a altura de uma pessoa
double gerarAlturaAleatoria(Random random) {
  const double alturaMinima = 1.0;
  const double alturaMaxima = 2.3;

  // para calcular a altura aleatoria, eu pedi ajuda ao ChatGPT para chegar
  // em uma "fórmula" para calculara altura, pois tive um pouco de dificuldade
  // para entender o método nextDouble()
  return random.nextDouble() * (alturaMaxima - alturaMinima) + alturaMinima;
}

/// Classe que simula uma pessoa, com os atributos [_nome], [_idade] e [_altura]
class Pessoa {
  late String _nome;
  late int _idade;
  late double _altura;

  int get idade => _idade;

  set idade(int value) {
    if (value < 0 || value > 100) { throw ValorInvalidoExcepion('idade nao pode ser $value'); }

    _idade = value;
  }

  double get altura => _altura;

  set altura(double value) {
    if (value < 0 || value > 2.3) { throw ValorInvalidoExcepion('idade nao pode ser $value'); }

    _altura = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }
}

/// Exceção que será lançada caso haja um erro na atribuição dos atributos de uma [Pessoa]
class ValorInvalidoExcepion implements Exception {
  late final String message;

  ValorInvalidoExcepion(this.message);

  @override
  String toString() {
    return 'ValorInvalidoExcepion: $message';
  }
}