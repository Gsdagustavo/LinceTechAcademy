void main() {
  late final Retangulo? r1;
  late final Retangulo? r2;
  late final Retangulo? r3;

  try {
    r1 = Retangulo(10, 5);
    r2 = Retangulo(5, 0);
    r3 = Retangulo(15, -5);
  } on DimensoesInvalidasException catch (e) {
    print(e);
  } on FormaException catch (e) {
    print(e);
    return;
  } on Exception catch (e, s) {
    print('Erro inesperado: $e\nStackTrace: $s');
    return;
  }

  print(r1);
}

/// Interface a ser implementada por outras classes (formas). Possui o método
/// [calcularArea], que deve ser implementado em todas as classes que implementem a classe Forma
abstract class Forma {
  double calcularArea();
}

/// Classe retangulo com os atributos [largura] e [altura]
/// que implementa a interface [Forma], além de uma implementação da do método [calcularArea]
class Retangulo implements Forma {
  late final double largura;
  late final double altura;

  Retangulo(this.largura, this.altura) {
    if (largura <= 0 || altura <= 0) {
      throw DimensoesInvalidasException(
        ''
        'Não é possível criar um retângulo com largura ${largura.toStringAsFixed(2)} '
        'e altura ${altura.toStringAsFixed(2)}',
      );
    }
  }

  @override
  double calcularArea() => largura * altura;

  @override
  String toString() {
    return 'Largura: ${largura.toStringAsFixed(2)} cm, '
        'Altura: ${altura.toStringAsFixed(2)} cm, '
        'Área: ${calcularArea().toStringAsFixed(2)} cm2';
  }
}

/// Classe geral para exceções ao criar e manipular formas
class FormaException implements Exception {
  late final String message;

  FormaException(this.message);

  @override
  String toString() {
    return 'FormaException: $message';
  }
}

/// Exceção que será lançada caso uma forma com dimensões inválidas
/// (menores ou iguais a zero) seja instanciada
class DimensoesInvalidasException implements Exception {
  late final String message;

  DimensoesInvalidasException(this.message);

  @override
  String toString() {
    return 'DimensoesInvalidasException: $message';
  }
}
