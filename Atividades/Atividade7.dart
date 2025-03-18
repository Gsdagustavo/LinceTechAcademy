import 'dart:io';

import '../Util/Input.dart';

void main() {
  stdout.write('Insira um numero e calcularei seu fatorial: ');
  int n = Input.getIntInput();

  int fatorial = calcularFatorial(n);

  if (fatorial != 0) {
    print('Fatorial de $n: $fatorial');
  }
}

int calcularFatorial(int n) {

  if (n == 1 || n == 0) {
    return 1;
  }

  if (n < 0) {
    print('Valor invalido');
    return 0;
  }

  int resultado = n;

  for (int i = n - 1; i > 1; i--) {
    resultado *= i;
  }

  return resultado;
}