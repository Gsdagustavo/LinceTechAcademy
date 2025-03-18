import 'dart:io';

// static class for input handling
class Input {

  /*
  Funcao que pede ao usuario para digitar uma string e retorna-a se for válida ...
  ... caso contrario, pede ao usuario para digita-la novamente ate ser validada
   */

  static String getStringInput() {
    String? input = stdin.readLineSync() ?? '';

    while (input == null) {
      stdout.write('Entrada invalida, tente novamente: ');
      input = stdin.readLineSync() ?? '';
    }

    while (input!.isEmpty) {
      stdout.write('Entrada invalida, tente novamente: ');
      input = stdin.readLineSync() ?? '';
    }

    return input;
  }

  /*
  Funcao que pede ao usuario para digitar um numero e retorna-o se for válido ...
  ... caso contrario, pede ao usuario para digita-lo novamente ate ser validado
   */

  static double getDoubleInput() {

    while (true) {
      String stringInput = getStringInput();
      double? doubleInput = double.tryParse(stringInput);

      if (doubleInput != null) {
        return doubleInput;
      }
      stdout.write('Entrada invalida, digite apenas numeros: ');

    }
  }

  /*
  Funcao que pede ao usuario para digitar um numero inteiro e retorna-o se for válido ...
  ... caso contrario, pede ao usuario para digita-lo novamente ate ser validado
   */

  static int getIntInput() {

    while (true) {
      String stringInput = getStringInput();
      int? intInput = int.tryParse(stringInput);

      if (intInput != null) {
        return intInput;
      }

      stdout.write('Entrada invalida, digite apenas numeros inteiros: ');
    }
  }
}