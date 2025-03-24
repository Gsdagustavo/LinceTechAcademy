import 'dart:math';

void main() {

  // constantes para definir o tamanho da lista e o valor maximo dos numeros
  const quantNums = 10;
  const maxValue = 100;

  // instancia a lista de numeros e executa a funcao popularLista nela
  List<int> numeros = [];
  numeros = popularLista(numeros, quantNums, maxValue, 0);

  // imprime todos os numeros da lista no formato especificado
  for (int i = 0; i < numeros.length; i++) {
    print('Posicao $i, valor: ${numeros[i]}');
  }
}

// funcao para popular uma lista com numeros aleatorios dada a lista,
// a quantidade de numeros e o valor maximo dos numeros
List<int> popularLista(List<int> lista, int quantNums, int maxValue, int minValue) {
  Random random = Random();
  
  for (int i = 0; i < quantNums; i++) {
    lista.add(random.nextInt(maxValue - minValue + 1) + minValue);
  }
  
  return lista;
}