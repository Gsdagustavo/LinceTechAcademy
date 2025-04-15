import 'dart:math';

void main() {

  // cria e popula uma lista de acordo com a funcao 'criarListaPopulada()'
  final List<int> lista = criarListaPopulada();

  mostrarLista(lista);
}

/// Mostra a lista ao usuario, convertendo cada numeroero da lista em diferentes bases numeroericas
void mostrarLista(List<int> lista) {

  lista.forEach((numero) {
    print('Decimal: $numero');
    print('Binario: ${decimalParaBinario(numero)}');
    print('Octal: ${decimalParaOctal(numero)}');
    print('Hexadecimal: ${decimalParaHexadecimal(numero)}\n');
  });
}

/// Recebe uma lista de numeroeros como argumento e a popula de acordo com os argumentos recebidos,
/// ou popula automaticamente com os argumentos predefenidos
List<int> criarListaPopulada({int valorMinimo = 15, int valorMaximo = 5000, int length = 15}) {
  final Random random = Random();
  final List<int> lista = [];

  // adiciona elementos à lista de acordo com o parametro length.
  // os elementos possuem valor decimal entre 'valorMinimo' (15 por padrao)
  // e 'valorMaximo (5000 por padrao)
  for (int i = 0; i < length; i++) {
    lista.add(random.nextInt(valorMaximo) + valorMinimo);
  }

  lista.sort();

  return lista;
}

// define funcoes para a conversao de bases
String decimalParaBinario(int numero) => numero.toRadixString(2);
String decimalParaOctal(int numero) => numero.toRadixString(8);
String decimalParaHexadecimal(int numero) => numero.toRadixString(16).toUpperCase();