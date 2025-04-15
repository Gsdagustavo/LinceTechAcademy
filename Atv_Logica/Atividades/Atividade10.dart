import 'dart:io';

import '../Util/Input.dart';

void main() {
  stdout.write('Insira a quantidade X de numeros: ');
  int quantNumeros = Input.getIntInput();

  List<double> numeros = [];

  // pede ao usuario para digitar X numeros e armazena-os em uma lista
  for (int i = 0; i < quantNumeros; i++) {
    stdout.write('${i + 1}: ');
    double value = Input.getDoubleInput();

    numeros.add(value);
  }

  List<double> sortedList = bubbleSort(numeros);

  // imprime os numeros da lista em ordem crescente
  print('\n=-=-=-=-=- IMPRIMIR EM ORDEM CRESCENTE =-=-=-=-=-\n');
  imprimirOrdemCrescente(numeros);

  // imprime os numeros da lista em ordem crescente
  print('=-=-=-=-=- IMPRIMIR EM ORDEM DECRESCENTE =-=-=-=-=-\n');
  imprimirOrdemDecrescente(numeros);


  // print para separar as seções do programa
  print('=-' * 25);

  // imprime o ultimo item da lista, a qual esta organizada em ordem crescente
  print('\n -- Maior numero: ${numeros[numeros.length - 1]}');

  // imprime o primeiro item da lista, a qual esta organizada em ordem crescente
  print('\n -- Menor numero: ${numeros[0]}');

  double soma = somaNumeros(numeros);

  // imprime a soma de todos os numeros da lista utilizando uma funcao auxiliar
  print('\n -- Soma de todos os numeros: ${soma}');

  double media = soma / numeros.length;

  // imprime a media de todos os numeros da lista a partir do valor da soma e da quantidade de numeros
  print('\n -- Media dos numeros: $media');

  // inicializa um mapa contendo os valores da soma dos numeros pares e impares
  Map<String, double> somas = somaPares_Impares(numeros);

  // inicializa duas variaveis, com uma delas contendo o valor da soma dos numeros pares ...
  // e a outra contendo o valor da soma dos numeros impares
  double somaPares = somas['pares']!;
  double somaImpares = somas['impares']!;

  // imprime as variaveis somaPares e somaImpares
  print('\n -- Soma dos numeros pares: $somaPares');
  print('\n -- Soma dos numeros impares: $somaImpares');

}

// funcao que retorna um mapa contendo duas chaves com um valor associado a cada uma delas:
// a soma dos numeros pares para a chave 'pares' e a soma dos numeros impares para a chave 'impares'
Map<String, double> somaPares_Impares(List<double> numeros) {

  // inicializa as variaveis de soma dos numeros pares e imapares
  double somaPares = 0;
  double somaImpares = 0;

  /*
   Iitera por todos os elementos da lista.
   Caso o elemento da iteracao seja um numero par, a variavel somaPares terá
   o valor desse elemento adicionada a ela. O mesmo vale para a variavel somaImpares,
   porem somente quando o elemento da iteracao seja um numero impar
  */
  for (int i = 0; i < numeros.length; i++) {

    double num = numeros[i];

    if (num % 2 == 0) {
      somaPares += num;
    } else {
      somaImpares += num;
    }
  }

  Map<String, double> somas = {
    'pares': somaPares,
    'impares': somaImpares
  };

  return somas;
}

// funcao que recebe uma lista de doubles como argumento e ...
// ... retorna a soma de todos os elementos
double somaNumeros(List<double> numeros) {
  double resultado = 0;

  for (int i = 0; i < numeros.length; i++) {
    resultado += numeros[i];
  }

  return resultado;
}

// funcao para mostrar os numeros da lista em ordem crescente
void imprimirOrdemCrescente(List<double> numeros) {
  numeros = bubbleSort(numeros);

  for (int i = 0; i <= numeros.length - 1; i++) {
    print('${i + 1}: ${numeros[i]}');
  }
}

// funcao para mostrar os numeros da lista em ordem decrescente
void imprimirOrdemDecrescente(List<double> numeros) {
  numeros = bubbleSort(numeros);

  for (int i = numeros.length - 1; i >= 0; i--) {
    print('${numeros.length - i}: ${numeros[i]}');
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
