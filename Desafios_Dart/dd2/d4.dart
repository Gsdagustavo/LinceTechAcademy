import 'dart:math' as math;

void main() {

  // Definindo o comparador de formas
  final comparador = ComparadorFormasGeometricas();

  // Definindo as formas geométricas
  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);

  final retanguloA = Retangulo('Retângulo A', 4, 3);
  final retanguloB = Retangulo('Retângulo B', 19, 11);

  /// Áreas

  // define qual é o círculo e o retãngulo com maior área
  final circuloDeMaiorArea = comparador.formaDeMaiorArea(circuloA, circuloB);
  final retanguloDeMaiorArea = comparador.formaDeMaiorArea(retanguloA, retanguloB,);

  // retorna a forma com maior área
  final formaMaiorArea = comparador.formaDeMaiorArea(circuloDeMaiorArea, retanguloDeMaiorArea);
  print('A maior área é ${formaMaiorArea.calcularArea().toStringAsFixed(2)} e pertence a ${formaMaiorArea.nome}');

  /// Perimetros

  // define qual é o círculo e o retãngulo com maior perímetro
  final circuloDeMaiorPerimetro = comparador.formaDeMaiorPerimetro(circuloA, circuloB,);
  final retanguloDeMaiorPerimetro = comparador.formaDeMaiorPerimetro(retanguloA, retanguloB,);

  // retorna a forma com maior perímetro
  final formaMaiorPerimetro = comparador.formaDeMaiorPerimetro(circuloDeMaiorPerimetro, retanguloDeMaiorPerimetro);
  print('O maior perímetro é ${formaMaiorPerimetro.calcularPerimetro().toStringAsFixed(2)} e pertence a ${formaMaiorPerimetro.nome}');
}

/// Compara características de formas geométricas
// corrigi o nome da classe. Antes era 'ComparadorFormasgeometricas'. Eu mudei para seguir o padrão camelCase
class ComparadorFormasGeometricas {

  /// Retorna a forma com a maior área, ou [formaA] caso as áreas sejam
  /// iguais
  Forma formaDeMaiorArea(Forma formaA, Forma formaB) {
    return (formaA.calcularArea() >= formaB.calcularArea()) ? formaA : formaB;
  }

  /// Retorna a forma com o maior perímetro, ou [formaA] caso os perímetros
  /// sejam iguais
  Forma formaDeMaiorPerimetro(Forma formaA, Forma formaB) {
    return (formaA.calcularPerimetro() >= formaB.calcularPerimetro()) ? formaA : formaB;
  }
}

/// Representa uma forma geométrica comum
abstract class Forma {
  final String nome;

  Forma(this.nome);

  /// Calcula a área da forma geométrica
  double calcularPerimetro();

  /// Calcula o perímetro da forma geométrica
  double calcularArea();
}

/// Representa a forma geométrica "círculo"
class Circulo extends Forma {

  final double raio;

  Circulo(String nome, this.raio) : super(nome);

  /// Calcula a área do círculo
  @override
  double calcularArea() => math.pi * raio * raio;

  /// Calcula o perímetro do círculo
  @override
  double calcularPerimetro() => 2 * math.pi * raio;
}

/// Representa a forma geométrica "retângulo"
class Retangulo extends Forma {

  final double largura;
  final double altura;

  Retangulo(String nome, this.altura, this.largura) : super(nome);

  /// Calcula a área do retângulo
  @override
  double calcularArea() => altura * largura;

  /// Calcula o perímetro do retângulo
  @override
  double calcularPerimetro() => (altura * 2) + (largura * 2);
}

/// Representa a forma geométrica "quadrado", que é um formato especial de
/// retângulo, onde todos os lados possuem o mesmo tamanho
class Quadrado extends Forma {

  final double lado;

  Quadrado(String nome, this.lado) : super(nome);

  /// Calcula a área do quadrado
  @override
  double calcularArea() => lado * lado;

  /// Calcula o perímetro do quadrado
  @override
  double calcularPerimetro() => lado * 4;
}

/// Classe que representa a forma "triângulo equilátero"
class TrianguloEquilatero extends Forma {
  final double lado;

  TrianguloEquilatero(String nome, this.lado) : super(nome);

  /// Calcula a área do triângulo equilátero
  @override
  double calcularArea() => (lado * lado * math.sqrt(3)) / 4;

  /// Calcula o perímetro do triângulo equilátero
  @override
  double calcularPerimetro() => lado * 3;
}

/// Classe que representa a forma "triângulo retângulo"
class TrianguloRetangulo extends Forma {
  final double base;
  final double altura;

  TrianguloRetangulo(String nome, this.base, this.altura) : super(nome);

  /// Calcula a área do triângulo retângulo
  @override
  double calcularArea() => (base * altura) / 2;

  /// Calcula o perímetro do triângulo retângulo
  @override
  double calcularPerimetro() {
    final hipotenusa = math.sqrt((base * base) + (altura * altura));
    return base + altura + hipotenusa;
  }
}

/// Classe que representa a forma "pentágono"
class Pentagono extends Forma {
  final double lado;

  Pentagono(String nome, this.lado) : super(nome);

  /// Calcula a área do pentágono
  @override
  double calcularArea() {
    return (5 * lado * lado) / (4 * math.tan(math.pi / 5));
  }

  /// Calcula o perímetro do pentágono
  @override
  double calcularPerimetro() => lado * 5;
}

/// Classe que representa a forma "hexágono"
class Hexagono extends Forma {
  final double lado;

  Hexagono(String nome, this.lado) : super(nome);

  /// Calcula a área do hexágono
  @override
  double calcularArea() => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;

  /// Calcula o perímetro do hexágono
  @override
  double calcularPerimetro() => lado * 6;
}