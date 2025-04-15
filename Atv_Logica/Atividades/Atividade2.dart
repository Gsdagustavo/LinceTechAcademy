import 'dart:io';

import '../Util/Input.dart';

void main() {

  // constante para armazenar o tamanho maximo da lista
  const int numsSize = 5;
  List<int> numeros = [];

  // um for que pede o input do usuario 5 vezes e armazena cada input na lista
  for (int i = 0; i < numsSize; i++) {
    stdout.write('Insira o ${i + 1} numero: ');
    int num = Input.getIntInput();
    numeros.add(num);
  }

  print('\nMostrando todos os numeros impares\n');

  // loop que itera por todos os elementos
  for (int i = 0; i < numsSize; i++) {

    // se o numero for impar, mostre ao usuario, indicando sua posicao na lista
    if (numeros[i] % 2 != 0) {
      print('${i + 1}. ${numeros[i]}');
    }
  }
}