import 'dart:io';

import '../Util/Input.dart';

void main() {

  // pede ao usuario para inserir os numeros
  stdout.write('Insira o primeiro numero: ');
  double n1 = Input.getDoubleInput();

  stdout.write('Insira o segundo numero: ');
  double n2 = Input.getDoubleInput();

  double resultado = (n1 - n2).abs();

  print('Resultado de $n1 - $n2 em modulo: ${resultado}');
}