import 'dart:io';

import 'ap1.dart';

void main() {
  // constantes para definir o tamanho da lista e o valor maximo dos numeros
  const quantNums = 50;
  const maxValue = 15;

  // instancia a lista de numeros e executa a funcao popularLista nela
  List<int> numeros = [];
  numeros = popularLista(numeros, quantNums, maxValue);

  // printa a lista original, sem modificacoes
  stdout.write('Lista original: ');
  printarLista(numeros);

  // usa o metodo .removeWhere() para remover os numeros pares da lista
  numeros.removeWhere((item) => item.isEven);

  // printa a lista apos remover os numeros pares
  stdout.write('\n\nLista atualizada: ');
  printarLista(numeros);
}

// funcao para printar a lista de acordo com o formato especificado
 void printarLista(List<int> lista) {
   for (int i = 0; i < lista.length; i++) {

     if (i != (lista.length - 1)) {
       stdout.write('${lista[i]} ; ');
     } else {
       stdout.write('${lista[i]}.');
     }
   }
 }