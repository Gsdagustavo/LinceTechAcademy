import 'dart:io';
import 'dart:math';

void main() {

  // instancia as duas listas com a funcao criarLista()
  final List<int> lista1 = criarLista();
  final List<int> lista2 = criarLista();

  printarLista(lista1);
  printarLista(lista2);

  List<int> resultado = somarListas(lista1, lista2);

  if (resultado.length == 0) {
    return;
  }

  printarLista(resultado);
}

/// funcao que instancia uma lista, e adiciona 'tamanhoLista' elementos nela,
///  de acordo com os argumentos 'minNum' e 'maxNum'
List<int> criarLista({final int tamanhoLista = 5, final int minNum = 0,  final int maxNum = 100}) {

  final List<int> lista = [];
  final Random random = new Random();

  // adiciona numeros aleatorios à lista de acordo com os argumentos da funcao
  for (int i = 0; i < tamanhoLista; i++) {
      lista.add(random.nextInt(maxNum + 1));
  }

  return lista;
}

void printarLista(final List<int> lista) {
  if (lista.isEmpty) {
    print('Lista vazia');
    return;
  }

  print('Lista: ${lista.join(', ')}');
}


/// a funcao recebe duas listas como argumento, e retorna uma lista reprensentando a
///
List<int> somarListas(final List<int> lista1, final List<int> lista2) {
  final List<int> resultado = [];

  // caso as listas possuam tamanhos diferentes, nao sera possivel soma-las.
  // mostra uma mensagem ao usuario e retorna null

  // instancia uma lista que contera o resultado da soma das listas

  for (int i = 0; i < lista1.length; i++) {
    resultado.add(lista1[i] + lista2[i]);
    print('${lista1[i]} + ${lista2[i]}');
  }

  return resultado;
}