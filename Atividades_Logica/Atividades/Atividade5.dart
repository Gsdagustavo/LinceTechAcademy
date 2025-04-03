import 'dart:io';

import '../Util/Input.dart';

void main() {

  print('=-=-=-=-=-=- CALCULADORA BASKHARA =-=-=-=-=-\n');

  const double precisao = 0.0000000001;

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

  double x1 = (-b + raizQuadrada(delta, precisao)) / (2 * a);
  double x2 = (-b - raizQuadrada(delta, precisao)) / (2 * a);

  print('A: $a, B: $b, C: $c');
  print('X1: $x1, X2: $x2');
}

// funcao que utiliza o metodo de Newton-Rhapson para calcular a raiz quadrada aproximada
double raizQuadrada(double n, double precisao) {
  if (n < 0) {
    print('Erro: não existem raizes reais para o numero $n');
    return 0;
  }

  double r = n / 2;

  while ((r * r - n).abs() > precisao) {
    r = (r + n / r) / 2; // formula de Newton-Raphson
  }

  return r;
}

// funcao para calcular o valor de delta a partir dos 3 coeficientes
double calcularDelta(double a, double b, double c) {
  return (pow(b, 2) - (4 * a * c));
}

double pow(double x, double expoente) {
  double resultado = 1;

  for (int i = 0; i < expoente; i++) {
    resultado *= x;
  }

  return resultado;
}