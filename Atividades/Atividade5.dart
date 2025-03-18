import 'dart:io';
import 'dart:math';

import '../Util/Input.dart';

void main() {

  stdout.write('Insira o coeficiente A: ');
  double a = Input.getDoubleInput();

  stdout.write('Insira o coeficiente B: ');
  double b = Input.getDoubleInput();

  stdout.write('Insira o coeficiente C: ');
  double c = Input.getDoubleInput();

  double delta = calcularDelta(a, b, c);

  if (delta < 0) {
    print('Erro: não existem raizes reais para esta equação');
    return;
  }

}

// funcao para calcular o valor de delta a partir dos 3 coeficientes
double calcularDelta(double a, double b, double c) {
  return (pow(b, 4) - (4 * a * c));
}

double pow(double x, double expoente) {
  for (int i = 0; i < expoente; i++) {
    x *= x;
  }

  return x;
}