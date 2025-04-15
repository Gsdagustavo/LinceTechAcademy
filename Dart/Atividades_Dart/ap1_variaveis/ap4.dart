import 'dart:math';

void main() {
  // instancia um objeto da classe Random para gerar numeros aleatorios
  final Random random = Random();

  // cria dois numeros aleatorios, com range entre 1 e 100
  int n1 = random.nextInt(100) + 1;
  int n2 = random.nextInt(100) + 1;

  // divide a primeira variavel pela segunda
  double resultado = (n1 / n2);

  // salva a parte inteira do resultado utilizando o metodo .toInt();
  int parteInteira = resultado.toInt();

  // salva a parte decimal do resultado subtraindo o resultado da parte inteira (ex: 3.14 - 3 = 0.14)
  double parteDecimal = resultado - parteInteira;

  // mostra os numeros
  print('Numero 1: $n1');
  print('Numero 2: $n2');

  // mostra o resultado da divisao
  print('Resultado da divisao: $resultado');

  // mostra a parte inteira do resultado
  print('Parte inteira: $parteInteira');

  // mostra a parte decimal do resultado
  print('Parte decimal: $parteDecimal');
}