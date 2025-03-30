import 'dart:io';

void main(List<String> args) {

  stdout.write('Digite um numero: ');
  String input = stdin.readLineSync() ?? '';

  int? num = converterStringParaInt(string: input);

  if (num != null) {
    print('Numero digitado: $num');
  }
}

int? converterStringParaInt({required String string}) {
  
  try {
    return int.parse(string);
  } catch (e) {
    print('Entrada invalida. Digite apenas números inteiros');
    return null;
  }
}