import 'dart:math';

void main() {
  final Random random = Random();

  const int tamanhoLista = 5;
  const int valorMaximo = 26;

  // gera uma lista com valores aleatorios entre 1 e 26, com tamanho 'tamanhoLista'
  final List<int> lista = List.generate(tamanhoLista, (_) => random.nextInt(valorMaximo) + 1);

  // para cada numero da lista, mostra a sua letra correspondente no alfabeto
  lista.forEach((num) {
    print('Numero $num -> Letra ${getLetra(num)}');
  });
}

/// Retorna uma letra de acordo com sua posicao no alfabeto
///
/// [indice] representa o indice da letra no alfaebeto (inclusivo)
String? getLetra(int indice) {

  if (indice <= 0 || indice > 26) {
    print('Indice invalido');
    return null;
  }

  const String alfabeto = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  return alfabeto[indice - 1];
}