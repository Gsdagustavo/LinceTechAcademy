import 'dart:io';

import '../Util/Input.dart';

void main() {

  // pede ao usuario para inserir os numeros
  stdout.write('Insira o primeiro numero: ');
  double n1 = Input.getDoubleInput();

  stdout.write('Insira o segundo numero: ');
  double n2 = Input.getDoubleInput();

  // inicializa a variavel para armazenar o valor do resultado
  double resultado = 0;

  // forma mais compacta de resolver, porem menos legivel
  // resultado = (n1 > n2) ? n1 / n2 : n2 / n1;

  // forma mais longa, porem legivel
  if (n1 > n2) {
    resultado = n1 / n2;
  } else {
    resultado = n2 / n1;
  }

  // mostra o resultado final ao usuario
  print('Resultado: $resultado');
}