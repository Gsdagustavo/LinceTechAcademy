
/// [temperatura] representa a temperatura informada no relatorio, medida em graus Celsius. É do tipo [double]
///
/// [umidade] representa a humidade coletada no relatório. É do tipo [double]
///
/// [densidadeAr] representa a densidade do ar coletada no relatório. É do tipo [double]
///
/// [velocidadeVento] representa a velocidade do vento coletada no relatório. É do tipo [double]
///
/// [direcaoVento] representa a direção do vento coletada no relatório, em graus. É do tipo [int]

// o editor contextualizou que a documentação no começo do arquivo pode ser convertida
// para uma library
library;

enum Estado {
  SC,
  SP
}

class Relatorio {
  final Estado estado;
  final DateTime data;
  final double temperatura;
  final double umidade;
  final double densidadeAr;
  final double velocidadeVento;
  final int direcaoVento;

  Relatorio({
    required this.estado,
    required this.data,
    required this.temperatura,
    required this.umidade,
    required this.densidadeAr,
    required this.velocidadeVento,
    required this.direcaoVento,
  });
}
