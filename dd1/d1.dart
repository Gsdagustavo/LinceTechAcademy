import 'dart:math';

void main() {
  final circulos = [5, 8, 12, 7.3, 18, 2, 25].map((r) => Circulo(r.toDouble())).toList();

  print(circulos.join('\n'));
}

abstract class Forma {
  double calcularArea();
  double calcularPerimetro();
}

class Circulo implements Forma {
  final double raio;

  Circulo(this.raio) {
    if (raio <= 0) {
      throw RaioInvalidoException('o raio não pode ser $raio');
    }
  }

  @override
  double calcularArea() {
    return pi * raio * raio;
  }

  @override
  double calcularPerimetro() {
    return 2 * pi * raio;
  }

  @override
  String toString() {
    return
        'Raio: ${raio.toStringAsFixed(2)}, '
        'área: ${calcularArea().toStringAsFixed(2)}, '
        'perímetro: ${calcularPerimetro().toStringAsFixed(2)}';
  }
}

class RaioInvalidoException implements Exception {
  final String message;

  RaioInvalidoException(this.message);

  @override
  String toString() {
    return 'RaioInvalidoException: $message';
  }
}