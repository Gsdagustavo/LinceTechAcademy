import 'package:yaansi/yaansi.dart';

enum TipoRelatorioUmidade { maxima, media, minima }

abstract class UmidadeUtils {

  /// Define quantas casas decimais serão mostradas ao mostrar o valor da umidade
  static const int precisao = 5;

  /// Retorna uma string contendo a umidade formatada conforme a questao pede
  static String getUmidadeFormatada({
    required double umidade,
    required TipoRelatorioUmidade tipoRelatorio,
  }) {

    /// Se for um relatório de umidade máxima, mostra o valor em cor vermelha
    ///
    /// Se for um relatório de umidade média, mostra o valor em cor verde
    ///
    /// Se for um relatório de umidade mínima, mostra o valor em cor azul
    switch (tipoRelatorio) {
      case TipoRelatorioUmidade.maxima:
        return '${red(umidade.toStringAsFixed(precisao))} Kg/m3';
      case TipoRelatorioUmidade.media:
        return '${green(umidade.toStringAsFixed(precisao))} Kg/m3';
      case TipoRelatorioUmidade.minima:
        return '${blue(umidade.toStringAsFixed(precisao))} Kg/m3';
    }
  }
}
