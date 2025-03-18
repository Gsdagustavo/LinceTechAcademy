import 'dart:io';

import '../Util/Input.dart';

void main() {
  stdout.write('Insira a quantidade X de numeros: ');
  int quantNumeros = Input.getIntInput();

  List<double> numeros = [];

  for (int i = 0; i < quantNumeros; i++) {
    stdout.write('${i + 1}: ');
    double value = Input.getDoubleInput();

    numeros.add(value);
  }

  // testes
  List<double> sortedList = bubbleSort(numeros);
  sortedList.forEach(print);
}

// funcao para mostrar os numeros da lista em ordem crescente
void imprimirOrdemCrescente(List<double> numeros, bool isSorted) {

  if (!isSorted) {
    numeros = bubbleSort(numeros);
  }

  for (int i = 0; i < numeros.length; i++) {
    print('${i + 1}: ${numeros[i]}');
  }
}

// funcao para mostrar os numeros da lista em ordem decrescente
void imprimirOrdemDecrescente(List<double> numeros, bool isSorted) {

  if (!isSorted) {
    numeros = bubbleSort(numeros);
  }

  for (int i = numeros.length; i > 0; i--) {
    print('${i + 1}: ${numeros[i]}');
  }
}

// implementacao do algoritmo de bubble sort
List<double> bubbleSort(List<double> numeros) {
  bool isSorted;

  do {
    isSorted = true;  // assumir que a lista esta ordenada (melhor caso)
    int lastIndexSorted = 0;

    for (int i = 0; i < numeros.length - 1 - lastIndexSorted; i++) {

      // se o numero atual for maior que o proximo numero da lista, eles trocam de lugar
      if (numeros[i] > numeros[i + 1]) {


        double temp = numeros[i];
        numeros[i] = numeros[i + 1];
        numeros[i + 1] = temp;

        isSorted = false;
        lastIndexSorted = i;  // atualizar o indice do ultimo elemento sortado
      }
    }
  } while (!isSorted);

  return numeros;
}
