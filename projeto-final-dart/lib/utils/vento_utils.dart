import 'dart:math';

import 'package:yaansi/yaansi.dart';

import '../model/relatorio.dart';

abstract class VentoUtils {

  /// Retorna uma string contendo a direção do vento e frequência formatada conforme a questao pede
  static String getDirecaoVentoFormatada({required (int, int) vento}) {
    return 'Vento de direção '
        '${yellow(vento.$1.toString())} graus | '
        '${yellow(_grausParaRadianos(graus: vento.$1).toStringAsFixed(2))} radianos '
        'apareceu ${yellow(vento.$2.toString())} vezes';
  }

  /// Recebe um ângulo em graus e retorna seu valor em radianos
  static double _grausParaRadianos({required int graus}) {
    return graus * (pi / 180);
  }

  /// Retorna um mapa representando o vento mais frequente de acordo com a lista de relatórios
  /// passada como argumento
  static (int, int) getVentoMaiorFrequencia({
    required List<Relatorio> relatorios,
  }) {
    final frequencias = _getMapaFrequencias(relatorios: relatorios);

    int maiorFrequencia = 0;
    int direcaoMaiorFrequencia = 0;

    for (final vento in frequencias.entries) {
      if (vento.value > maiorFrequencia) {
        direcaoMaiorFrequencia = vento.key;
        maiorFrequencia = vento.value;
      }
    }

    return (direcaoMaiorFrequencia, maiorFrequencia);
  }

  /// Retorna um mapa, onde a [key] representa a direcao do vento e o [value]
  /// representa o número de vezes que a direção do vento com aquele valor foi registrada
  static Map<int, int> _getMapaFrequencias({
    required List<Relatorio> relatorios,
  }) {
    final frequencias = <int, int>{};

    for (var relatorio in relatorios) {
      frequencias[relatorio.direcaoVento] =
          (frequencias[relatorio.direcaoVento] ?? 0) + 1;
    }

    return frequencias;
  }
}
