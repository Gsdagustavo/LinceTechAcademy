import 'dart:io';

void main() {

  // pede ao usuario para digitar um numero
  stdout.write('Insira o numero inicial: ');
  final int? numeroInicial = int.tryParse(stdin.readLineSync() ?? '');

  if (numeroInicial == null || numeroInicial <= 0) {
    print('Numero invalido. Insira apenas numeros positivos diferentes de zero');
    return;
  }

  final List<int> lista = getNumerosImpares(numeroInicial: numeroInicial);
  
  lista.forEach((num) {
    print('Impar: $num');
  });
}

/// Retorna uma lista contendo todos os numeros impares de 1 ate o numero fornecido (inclusivo)
List<int> getNumerosImpares({required int numeroInicial}) {

  final List<int> lista = [];
  
  for (int i = 1; i <= numeroInicial; i++) {
    if (i.isOdd) {
      lista.add(i);
    }
  }
  
  return lista;
}