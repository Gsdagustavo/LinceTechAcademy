
import 'dart:math';

/// Testar a implementação das classes criadas
void main() {

  try {

    const int descontoMaximo = 100;

    final Random random = Random();

    final Produto produto1 = Produto('Chaleira eletrica', 199.99);
    final Produto produto2 = Produto('Panela de pressao', 299.99);
    final Produto produto3 = Produto('Azeite Extravirgem', 50.12);
    final Produto produto4 = Produto('Arroz 5k', 33.50);
    final Produto produto5 = Produto('Oleo de soja', 15.63);

    print(produto1);
    produto1.calcularDesconto(random.nextInt(descontoMaximo), mostrarDesconto: true);

    print('');

    print(produto2);
    produto2.calcularDesconto(random.nextInt(descontoMaximo), mostrarDesconto: true);

    print('');

    print(produto3);
    produto3.calcularDesconto(random.nextInt(descontoMaximo), mostrarDesconto: true);

    print('');

    print(produto4);
    produto4.calcularDesconto(random.nextInt(descontoMaximo), mostrarDesconto: true);

    print('');

    print(produto5);
    produto5.calcularDesconto(random.nextInt(descontoMaximo), mostrarDesconto: true);

  } on ValorInvalidoException catch (e) {
    print(e);
  } on Exception catch (e, s) {
    print('Um erro inesperado ocorreu: $e \n$s');
  }

}

/// Interface a ser implementada pela classe [Produto], que define implementações
/// que a classe deve ter
abstract class IProduto {
  double calcularDesconto(int desconto, {bool mostrarDesconto});
}

/// Classe que simula um produto de uma loja, com valores básicos como [nome]
/// e [preco]
class Produto implements IProduto {
  late String nome;
  late double preco;

  Produto(this.nome, this.preco) {
    if (preco < 0) { throw ValorInvalidoException('Impossivel criar um produto com preco negativo'); }
  }

  @override
  double calcularDesconto(int desconto, {bool mostrarDesconto = false}) {
    if (desconto <= 0 || desconto > 100) {
      throw ValorInvalidoException('Impossivel calcular desconto de valor ${desconto.toStringAsFixed(2)}%');
    }

    final double valorFinal = preco - (preco * (desconto / 100));

    if (mostrarDesconto) {
      print('Preco do produto antes do desconto: R\$ ${preco.toStringAsFixed(2)}');
      print('Preco do produto após o desconto de ${desconto.toStringAsFixed(2)}%: R\$ ${valorFinal.toStringAsFixed(2)}');
    }

    return valorFinal;
  }

  @override
  String toString() {
    return 'Nome: $nome, Preco: ${preco.toStringAsFixed(2)}';
  }
}

/// Exceção que será lançada caso haja um erro na atribuição de preços de um produto
class ValorInvalidoException implements Exception {
  late final String message;

  ValorInvalidoException(this.message);

  @override
  String toString() {
    return 'ValorInvalidoException: $message';
  }
}