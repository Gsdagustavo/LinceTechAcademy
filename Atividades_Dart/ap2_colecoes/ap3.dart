import 'dart:io';

import 'ap1.dart';
import 'ap2.dart';

void main() {
  // constantes para definir o tamanho da lista e o valor maximo dos numeros
  const int quantNums = 50;
  const int maxValue = 21;
  const int minValue = 10;

  // instancia a lista de numeros e executa a funcao popularLista nela
  List<int> lista = [];
  lista = popularLista(lista, quantNums, maxValue, minValue);

  // printa a lista original, sem modificacoes
  stdout.write('Lista original: ');
  printarLista(lista);

  // usa o metodo .toSet() para transformar a lista original em um Set, removendo
  // todos os elementos duplicados. Apos isso, usa o metodo .toList() para transformar
  // o set em uma lista novamente e printa a lista
  stdout.write('\n\nItens unicos: ');
  List<int> listaSemRepetidos = lista.toSet().toList();
  printarLista(listaSemRepetidos);
}