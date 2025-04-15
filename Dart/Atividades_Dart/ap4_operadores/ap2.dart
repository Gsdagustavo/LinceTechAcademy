import 'dart:math';

void main() {

  final List<String> listaStrings = [
    '10',
    '2XXL7',
    'JOJ0',
    '99',
    '381',
    'AD44',
    '47',
    '2B',
    '123',
    '78'
  ];

  final List<int> listaConvertida = converterLista(listaStrings);
  print('Lista convertida: ${listaConvertida.join(', ')}');
}


/// Essa funcao recebe uma lista de strings como argumento, e retorna uma lista
/// onde cada elemento da lista de strings é representado por sua forma numerica,
/// caso ela seja diretamente convertivel. Caso nao seja, sera representado pelo numero 0
List<int> converterLista(List<String> lista) {
  final List<int> listaConvertida = [];

  lista.forEach((element) {
    final int num = int.tryParse(element) ?? 0;
    listaConvertida.add(num);
  });

  return listaConvertida;
}