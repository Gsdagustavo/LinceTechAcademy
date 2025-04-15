import 'dart:io';
import 'dart:math';

void main() {
  // instancia um objeto da classe Random para gerar numeros aleatorios
  final Random random = Random();

  // declara uma constante para determinar o valor de sleep() na linha 17
  const int sleepTime = 1500;

  // cria dois numeros aleatorios, com range entre 1 e 100
  int n1 = random.nextInt(100) + 1;
  int n2 = random.nextInt(100) + 1;

  // mostra os valores das variaveis antes da troca
  print('N1: $n1, N2: $n2');

  print('Invertendo...');

  // pausa o programa por 'sleepTime' milisegundos
  sleep(Duration(milliseconds: sleepTime));

  // inverte os valores das variaveis utilizando a tecnica de atribuicao multipla
  n1 = n1 + n2;
  n2 = n1 - n2;
  n1 = n1 - n2;

  // mostra os valores das variaveis depois da troca
  print('N1: $n1, N2: $n2');
}