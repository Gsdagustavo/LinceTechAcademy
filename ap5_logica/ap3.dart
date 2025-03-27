import 'dart:math';

void main() {

  // constantes para representar o range do valor minimo e maximo a ser gerado
  const int valorMinimo = 100;
  const int valorMaximo = 1000;
  
  final Random random = Random();

  // gera um valor aleatorio entre 'valorMinimo' e 'valorMaximo' (inclusivo)
  final int numero = random.nextInt(valorMaximo) + valorMinimo + 1;

  /// recebe o resultado da funcao [somaConsecutiva], passando a variavel [numero] como argumento
  final soma = somaConsecutiva(numero);

  // mostra o resultado ao usuario
  print('A soma dos numeros pares entre 0 e $numero -> $soma');
}

/// Retorna a soma de todos os numeros pares entre 0 e [numero]
int somaConsecutiva(int numero) {

  int soma = 0;

  for (int i = 0; i <= numero; i++) {
    if (i.isEven) { soma += i; }
  }

  return soma;
}