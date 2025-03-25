import 'dart:math';

void main() {

  // instancia uma lista com valores double que é populada pelo metodo criarListaPopulada()
  final List<double> raios = criarListaPopulada();

  for (int i = 0; i < raios.length; i++) {

    final double raio = raios[i];

    // utiliza as funcoes calcularPerimetro() e calcularArea() e armazena
    // os resultados em variaveis
    final perimetro = calcularPerimetro(raio);
    final area = calcularArea(raio);

    // mostra os resultados obtidos (aqui eu decidi mudar a formatacao do
    // output porque, na minha opiniao, as informacoes ficam mais claras dessa forma
    print(''
        'Circulo ${i + 1}#\n'
        'Raio: ${raio.toStringAsFixed(2)} cm\n'
        'Perimetro: ${perimetro.toStringAsFixed(2)} cm\n'
        'Area: ${area.toStringAsFixed(2)} cm²\n');
  }

  // metodo mais compacto, porem menos legivel
  /*

  raios.forEach((raio) {
    final perimetro = calcularPerimetro(raio);
    final area = calcularArea(raio);

    print
      (
        'Circulo ${raios.indexOf(raio)}#\n'
        'Raio: ${raio.toStringAsFixed(2)} cm\n'
        'Perimetro: ${perimetro.toStringAsFixed(2)} cm\n'
        'Area: ${area.toStringAsFixed(2)} cm²\n'
    );
  });

  */
}

/// Recebe uma lista de numeros como argumento e a popula de acordo com os argumentos recebidos,
/// ou popula automaticamente com os argumentos predefenidos
List<double> criarListaPopulada({int valorMinimo = 1, int valorMaximo = 100, int length = 10}) {
  final Random random = Random();
  final List<double> lista = [];

  // adiciona elementos à lista de acordo com o parametro length.
  // os elementos possuem valor decimal entre 0.0 e 1.0, e valor inteiro entre 0 e 'valorMaximo'
  for (int i = 0; i < length; i++) {
    lista.add((random.nextDouble() * valorMaximo) + valorMinimo);
  }

  return lista;
}

/// Retorna o perimetro de um circulo dado o seu raio
double calcularPerimetro(final double raio) {
  final double resultado = 2 * pi * raio;
  return resultado;
}

/// Retorna a area um circulo dado o seu raio
double calcularArea(double raio) {
  final double resultado = pi * raio * raio;
  return resultado;
}