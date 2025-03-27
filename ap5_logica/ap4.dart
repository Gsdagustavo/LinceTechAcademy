void main() {
  final listaNomes = [
    "Joao",
    "Maria",
    "Pedro",
    "Maria",
    "Ana",
    "Joao",
    "Maria",
    "Fernanda",
    "Carlos",
    "Maria"
  ];

  final nome = 'Ana';
  final quantidade = contarNome(listaNomes, nome);

  if (quantidade == 1) {
    print('O nome $nome foi encontrado 1 vez');
  } else if (quantidade > 0) {
    print('O nome $nome foi encontrado $quantidade vezes');
  } else {
    print('O nome nao foi encontrado');
  }

  print(listaNomes);
}

/// Retorna a quantidade de vezes que o elemento [nome] foi encontrado na lista [listaNomes]
///
/// Eu criei uma lista igual à lista [listaNomes] e usei o metodo removeWhere na nova lista
/// para remover todos os nomes que nao forem iguais ao [nome], e retornei o tamanho da nova lista
/// após
int contarNome(List<String> listaNomes, String nome) {
  List<String> novaLista = listaNomes.toList();

  novaLista.removeWhere((elemento) => elemento != nome);

  return novaLista.length;
}