void main() {
  final List<int> numeros = {10, 35, 999, 126, 95, 7, 348, 462, 43, 109}.toList();
  
  final somaUsandoFor = somaFor(numeros);
  final somaUsandoWhile = somaWhile(numeros);
  final somaUsandoRecursao = somaRecursiva(numeros);
  final somaUsandoLista = somaLista(numeros);

  print('for: $somaUsandoFor');
  print('while: $somaUsandoWhile');
  print('recursão: $somaUsandoRecursao');
  print('lista: $somaUsandoLista');
}

int somaFor(List<int> numeros) {

  int soma = 0;

  for (int i = 0; i < numeros.length; i++) {
    soma += numeros[i];
  }

  // outra forma de fazer, utilizando foreach
  // for (int num in numeros) {
  //   soma += num;
  // }

  return soma;
}

int somaWhile(List<int> numeros) {
  int soma = 0;
  int cont = 0;

  while (cont < numeros.length) {
    soma += numeros[cont];
    cont++;
  }

  return soma;
}

// aqui eu demorei um pouquinho pra fazer funcionar,
// entao apliquei uma logica parecido com a do calculo de fibonacci
int somaRecursiva(List<int> numeros, [int indice = 0]) {
  if (indice >= numeros.length) {
    return 0;
  }

  return numeros[indice] + somaRecursiva(numeros, indice + 1);
}

int somaLista(List<int> numeros) {

  // primeiramente, eu usei o metodo foreach para calcular a soma.
  // Porem, ao ler um pouco a documentacao, encontrei o metodo redue(),
  // que eu acredito que seja um metodo mais adequado para essa situacao

  return numeros.reduce((a, b) => a + b);

  // metodo antigo
  // int soma = 0;
  // numeros.forEach((n) => soma += n);
  // return soma;
}