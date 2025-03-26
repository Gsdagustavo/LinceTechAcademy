void main() {
  final List<int> lista = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  removerElemento(lista, );

  print('Lista: ${lista.join(', ')}');
}

List removerElemento(List lista, [dynamic elemento]) {
  return (lista ?? [])..remove(elemento);
}