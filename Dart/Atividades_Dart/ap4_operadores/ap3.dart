void main() {
  final List<dynamic> lista = [
    1, 2, 3, 4, 5, 6, 7, 8, 9,
    'Joao', 'Pedro'
  ];

  // mostrar a lista antes de realiza as operacoes
  print('Lista: ${lista.join(', ')}\n');

  /* realizar operacoes com a lista */
  removerElemento(lista: lista, elemento: 5);
  removerElemento(lista: lista, elemento: 1);

  removerElemento(lista: lista, elemento: 'Joao');

  removerElemento(lista: lista, elemento: '123');

  // mostrar a lista apos as operacoes
  print('\nLista: ${lista.join(', ')}');
}

/**
 * Funcao que recebe uma lista e um elemento como argumento e retorna a lista
 * com o elemento removido caso a operacao de remover tenha dado certo.
 * Caso contrario, retorna uma lista vazia
 */
List removerElemento({required List? lista, required dynamic elemento}) {
  bool removido = lista?.remove(elemento) ?? false;

  print('O elemento $elemento ${removido ? 'foi' : 'nao foi'} removido da lista');

  return lista ?? [];
}