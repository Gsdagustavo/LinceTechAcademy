import 'dart:io';

import '../Util/Input.dart';

void main() {
  stdout.write('Insira um numero e mostrarei sua tabuada: ');
  int n = Input.getIntInput();

  mostrarTabuada(n);
}

void mostrarTabuada(int n) {
  for (int i = 1; i <= 9; i++) {
    print('$n X $i = ${n * i}');
  }
}