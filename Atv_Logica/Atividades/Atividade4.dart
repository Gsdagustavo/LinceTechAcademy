import 'dart:io';

import '../Util/Input.dart';

void main() {
  // pede ao usuario para inserir os numeros
  stdout.write('Insira o primeiro numero: ');
  double a = Input.getDoubleInput();

  stdout.write('Insira o segundo numero: ');
  double b = Input.getDoubleInput();

  print('Menor multiplo comum entre $a e $b: ${calcularMMC(a, b)}');

}

// aplicando o algoritmo de Euclides para calcular o mdc
double calcularMDC(double a, double b) {
  while (b != 0) {
    double tempB= b;
    b = a % b;
    a = tempB;
  }

  return a;
}

// funcao para calcular o mmc entre dois numeros
double calcularMMC(double a, double b) {
  return a * (b / calcularMDC(a, b));
}