import 'dart:math';

void main() {
  
  Random random = Random();
  const int valorMaximo = 100;
  
  // define as variaveis representando o valor inicial de um
  // produto qualquer
  final int valorInicial = random.nextInt(valorMaximo + 1) + 1;

  // eu passei o valorFinal como argumento para a funcao de gerar numeros aleatorios
  // para que o valor final nao seja maior que o valor incial
  final int valorFinal = random.nextInt(valorInicial);
  
  // define o desconto calculado para o produto
  final double desconto = calcularPercentualDesconto(valorInicial, valorFinal);
  
  print('O produto custava $valorInicial reais, foi vendido por $valorFinal reais. O desconto dado foi ${desconto.toStringAsFixed(2)}%.');
}

/// Funcao que recebe o valorInicial e o valorFinal de um produto qualquer e retorna 
/// o desconto obtido (em %) a partir dos valores
double calcularPercentualDesconto(num valorInicial, num valorFinal) {
  final double desconto = (valorInicial - valorFinal) / valorInicial * 100;

  return (valorInicial != 0) ? desconto : 0;
}