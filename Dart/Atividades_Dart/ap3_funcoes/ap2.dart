import 'dart:math';

void main() {

  // instancia uma variavel do tipo inteiro contendo a execucao da funcao A,
  // passando a funcao B como argumento
  final int resultadoAB = funcaoA(funcaoB);

  // instancia uma variavel do tipo inteiro contendo a execucao da funcao A,
  // passando a funcao C como argumento
  final int resultadoAC = funcaoA(funcaoC);

  // instancia uma variavel contendo a soma dos resultados das exeucoes anteriores
  final resultadoFinal = resultadoAB + resultadoAC;

  // exibe o resultado final
  print('Resultado: $resultadoFinal');
}

/// Recebe uma funcao como parametro e a executa duas vezes, fornecendo
/// numeros aleatorios como parametros
int funcaoA(final Function) {

  // define qual o range da geracao de numeros aleatorios
  const int minNum = 1;
  const int maxNum = 100;

  final Random random = Random();

  // cria duas variaveis, cada uma contendo a execucao da funcao recebida como parametro,
  // passando um numero aleatorio compreendido entre 1 e 100 como argumento
  final resultadoA = Function(random.nextInt(maxNum) + minNum);
  final resultadoB = Function(random.nextInt(maxNum) + minNum);

  // retorna o resultado da soma entre as duas variaveis criadas anteriormente
  return resultadoA + resultadoB;
}

/// Recebe um inteiro como argumento e retorna o triplo de seu valor somado com 5
int funcaoB(final int num) {
  final resultado = num * 3 + 5;
  return resultado;
}

/// Recebe um inteiro como argumento e retorna o seu valor somado a um numero
/// aleatorio compreendido entre 0 e 255
int funcaoC(final int num) {
  final Random random = Random();
  final resultado = num + random.nextInt(255 + 1);

  return resultado;
}