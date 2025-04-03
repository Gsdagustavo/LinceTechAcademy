void main() {

  // instancia uma lista constante do tipo double e atribui alguns valores a ela
  const List<double> numeros = [ 7.0 , 8.0 , 5.3 , 9.7 ];

  // instancia a variavel final media, que recebe a soma dos elementos da lista 'numeros'..
  // atraves da funcao .reduce(); e divide pelo numero de elementos da lista
  final double media = numeros.reduce((a, b) => a + b) / numeros.length;

  // mostra o valor da variavel 'media' com 2 casas decimais
  print('A media entre $numeros = ${media.toStringAsFixed(2)}');
}