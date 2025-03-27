import 'dart:io';

void main() {

  // pede ao usuario para digitar um numero
  stdout.write('Insira o numero inicial: ');
  final int? numeroInicial = int.tryParse(stdin.readLineSync() ?? '');

  if (numeroInicial == null || numeroInicial <= 0) {
    print('Numero invalido. Insira apenas numeros positivos diferentes de zero');
    return;
  }

  imprimirNumeros(numeroInicial: numeroInicial);
}

/// Imprime todos os numeros impares de 1 ate o numero fornecido (inclusivo)
void imprimirNumeros({required int numeroInicial}) {

  for (int i = 1; i <= numeroInicial; i++) {
    if (i.isOdd) {
      print('Impar: $i');
    }
  }
}