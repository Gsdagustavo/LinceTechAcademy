import 'dart:io';

import '../Util/Input.dart';

void main() {

  // testar a funcao pegar inputs de strings
  stdout.write('string: ');
  String name = Input.getStringInput();
  print(name);

  // testar a funcao para pegar inputs de inteiros
  stdout.write('\nint: ');
  int num = Input.getIntInput();
  print(num);

  // testar a funcao para pegar inputs de doubles
  stdout.write('\ndouble: ');
  double dNum = Input.getDoubleInput();
  print(dNum);
}