void main() async {
  print('Iniciando lançamento');

  await contagemRegressiva();

  print('Foguete lançado!');
}

Future<void> contagemRegressiva([int time = 5]) async {
  for (int i = time; i >= 1; i--) {
    print('$i...');
    await Future.delayed(Duration(seconds: 1));
  }
}