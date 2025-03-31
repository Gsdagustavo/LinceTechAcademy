import 'dart:io';

void main() {
    stdout.write('Digite um numero: ');
    int input = int.parse(stdin.readLineSync() ?? '');

    try {
        checarPar(num: input);
    } catch (e) {
        print(e);
    }
}

void checarPar({required int num}) {
    if (num % 2 != 0) {
        throw Exception("Entrada invalida: Insira apenas numeros pares");
    }

    print('Entrada correta, voce inseriu um numero par');
}