import 'dart:math';

void main() {
  const double valorMaximo = 99;

  final Random random = Random();

  /* 
  
  aqui esta comentado pois essa seção foi usada para testes

  final double randomBase = 0;
  final double randomAltura = 0;
  */

  final double randomBase = random.nextDouble() * valorMaximo;
  final double randomAltura = random.nextDouble() * valorMaximo;

  Retangulo? retangulo;

  try {
    retangulo = Retangulo(randomBase, randomAltura);
  } on DimensoesInvalidasException catch (e) {
    print(e);
  } catch (e) {
    print(e);
  }

  if (retangulo != null) {
    final double area = retangulo.calcularArea();

    print('Area do retangulo: $area');
  }
}

/// Exceção que será lançada caso uma das medidas sejam menores ou iguais a zero
class DimensoesInvalidasException implements Exception {
  late final String message;

  DimensoesInvalidasException(this.message);

  @override
  String toString() {
    return 'DimensoesInvalidasException: $message';
  }
}

/// Interface que representa uma forma geométrica, contendo um método abstrato para o cálculo da área
abstract class Forma {
  double calcularArea();
}

class Retangulo implements Forma {
  late double _base;
  late double _altura;

  Retangulo(this._base, this._altura) {
    if (_base <= 0 || _altura <= 0) {
      throw DimensoesInvalidasException(
          'Dimensões invalidas, informe apenas valores positivos maiores que zero');
    }
  }

  @override
  calcularArea() => _base * _altura;
}
