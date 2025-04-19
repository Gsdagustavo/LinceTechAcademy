import 'dart:io';

import 'package:projeto_final_dart/utils/csv_utils.dart';
import 'package:projeto_final_dart/utils/temperatura_utils.dart';
import 'package:projeto_final_dart/utils/umidade_utils.dart';
import 'package:projeto_final_dart/utils/vento_utils.dart';

import '../model/relatorio.dart';

/// Enum usado para saber qual tipo de relatório será mostrado ao usuário
enum Dado { temperatura, umidadeAr }

/// Enum usado para saber de qual mês um relatório é
enum Mes {
  janeiro,
  fevereiro,
  marco,
  abril,
  maio,
  junho,
  julho,
  agosto,
  setembro,
  outubro,
  novembro,
  dezembro,
  tercembro,
}

class RelatorioUtils {
  /// Armazena os relatorios de SC
  final relatoriosSc = <Relatorio>[];

  /// Armazena os relatorios de SP
  final relatoriosSp = <Relatorio>[];

  /// Entry point para carregar e formatar os relatórios
  Future<void> inicializar() async {
    await _gerarRelatorios();
  }

  /// Gera relatorios de todas as planilhas
  Future<void> _gerarRelatorios() async {
    List<File> files = [];

    try {
      files = await CSVUtils.getFiles();
    } on FileSystemException catch (e) {
      print(e);
    }

    for (final file in files) {
      List<List<dynamic>> linhas = [];

      try {
        linhas = await CSVUtils.getLinhas(file: file);
      } on FileSystemException catch (e) {
        print(e);
      }

      for (int i = 1; i < linhas.length; i++) {
        final linha = linhas[i];

        final int mes = linha[0] as int;
        final int dia = linha[1] as int;
        final int hora = linha[2] as int;
        final double temperatura = (linha[3] as num).toDouble();
        final double umidade = (linha[4] as num).toDouble();
        final double densidadeAr = (linha[5] as num).toDouble();
        final double velocidadeVento = (linha[6] as num).toDouble();
        final int direcaoVento = linha[7] as int;

        final data = DateTime(2024, mes, dia, hora);

        final estado = file.path.contains('SC') ? Estado.SC : Estado.SP;

        final relatorio = Relatorio(
          estado: estado,
          data: data,
          temperatura: temperatura,
          umidade: umidade,
          densidadeAr: densidadeAr,
          velocidadeVento: velocidadeVento,
          direcaoVento: direcaoVento,
        );

        file.path.contains('SC')
            ? relatoriosSc.add(relatorio)
            : relatoriosSp.add(relatorio);
      }
    }

    /// Organiza os relatórios por mês, dia e hora, em ordem crescente
    relatoriosSp.sort((a, b) => a.data.compareTo(b.data));
    relatoriosSc.sort((a, b) => a.data.compareTo(b.data));
  }

  /// Retorna uma lista contendo os relatorios do mes especificado
  List<Relatorio> _filtrarPorMesEstado(List<Relatorio> relatorios, Mes mes) {
    return relatorios
        .where((r) => r.data.month == Mes.values.indexOf(mes))
        .toList();
  }

  /// Mostra os resultados dos relatorios do dado analisado (temperatura ou umidade)
  Future<void> mostrarRelatorios({required Dado dadoAnalisado}) async {
    final String separador = '=-=' * 4;

    print('\n$separador MÉDIAS $separador\n');

    // medias
    _mediaPorEstadoPorAno(dadoAnalisado: dadoAnalisado);
    _mediaPorEstadoPorMes(dadoAnalisado: dadoAnalisado);

    print('$separador MÁXIMAS $separador\n');

    // maximas
    _maximaPorEstadoPorAno(dadoAnalisado: dadoAnalisado);
    _maximaPorEstadoPorMes(dadoAnalisado: dadoAnalisado);

    print('$separador MÍNIMAS $separador\n');

    // minimas
    _minimaPorEstadoPorAno(dadoAnalisado: dadoAnalisado);
    _minimaPorEstadoPorMes(dadoAnalisado: dadoAnalisado);

    if (dadoAnalisado == Dado.temperatura) {
      _temperaturaMediaPorHorarioPorEstadoPorAno();
    }
  }

  /// Mostra os relatórios referentes à direção do vento (frequências)
  Future<void> mostrarRelatoriosDirecaoVento() async {
    print('${'=-=' * 5} DIRECAO DO VENTO ${'=-=' * 5}\n');
    _direcaoVentoMaiorFrequenciaPorEstadoPorAno();
    _direcaoVentoMaiorFrequenciaPorEstadoPorMes();
  }

  /// Mostra a mensagem inicial do relatorio de acordo com o dado analisado
  void _mostrarMensagemRelatorio({
    required String mensagem,
    required Dado dadoAnalisado,
  }) {
    print(
      '${dadoAnalisado == Dado.temperatura ? 'Temperatura' : 'Umidade'} $mensagem:\n',
    );
  }

  /// ================= MEDIAS =======================

  /// Mostra o valor medio do dado analisado por estado por ano
  void _mediaPorEstadoPorAno({required Dado dadoAnalisado}) {
    _mostrarMensagemRelatorio(
      mensagem: 'média por estado por ano',
      dadoAnalisado: dadoAnalisado,
    );

    switch (dadoAnalisado) {
      case Dado.temperatura:
        final temperaturaMediaSc =
            relatoriosSc.fold(
              0.0,
              (soma, relatorio) => soma + relatorio.temperatura,
            ) /
            relatoriosSc.length;
        final temperaturaMediaSp =
            relatoriosSp.fold(
              0.0,
              (soma, relatorio) => soma + relatorio.temperatura,
            ) /
            relatoriosSp.length;
        print(
          '  > SC: ${TemperaturaUtils.getTemperaturaFormatada(celsius: temperaturaMediaSc)}',
        );
        print(
          '  > SP: ${TemperaturaUtils.getTemperaturaFormatada(celsius: temperaturaMediaSp)}\n',
        );
        break;
      case Dado.umidadeAr:
        final umidadeMediaSc =
            relatoriosSc.fold(
              0.0,
              (soma, relatorio) => soma + relatorio.umidade,
            ) /
            relatoriosSc.length;
        final umidadeMediaSp =
            relatoriosSp.fold(
              0.0,
              (soma, relatorio) => soma + relatorio.umidade,
            ) /
            relatoriosSp.length;
        print(
          '  > SC: ${UmidadeUtils.getUmidadeFormatada(umidade: umidadeMediaSc, tipoRelatorio: TipoRelatorioUmidade.media)}',
        );
        print(
          '  > SP: ${UmidadeUtils.getUmidadeFormatada(umidade: umidadeMediaSp, tipoRelatorio: TipoRelatorioUmidade.media)}',
        );
    }
  }

  /// Mostra o valor medio do dado analisado por estado por mes
  void _mediaPorEstadoPorMes({required Dado dadoAnalisado}) {
    _mostrarMensagemRelatorio(
      mensagem: 'média por mês e por estado',
      dadoAnalisado: dadoAnalisado,
    );

    switch (dadoAnalisado) {
      case Dado.temperatura:
        for (int mes = 1; mes <= 12; mes++) {
          final relatoriosMesSc = _filtrarPorMesEstado(
            relatoriosSc,
            Mes.values[mes - 1],
          );
          final relatoriosMesSp =
              relatoriosSp.where((r) => r.data.month == mes).toList();

          final mediaSc =
              relatoriosMesSc.isEmpty
                  ? 0.0
                  : relatoriosMesSc.fold(
                        0.0,
                        (soma, r) => soma + r.temperatura,
                      ) /
                      relatoriosMesSc.length;

          final mediaSp =
              relatoriosMesSp.isEmpty
                  ? 0.0
                  : relatoriosMesSp.fold(
                        0.0,
                        (soma, r) => soma + r.temperatura,
                      ) /
                      relatoriosMesSp.length;

          print('Mês $mes:');
          print(
            '  > SC: ${TemperaturaUtils.getTemperaturaFormatada(celsius: mediaSc)}',
          );
          print(
            '  > SP: ${TemperaturaUtils.getTemperaturaFormatada(celsius: mediaSp)}\n',
          );
        }

        break;
      case Dado.umidadeAr:
        for (int mes = 1; mes <= 12; mes++) {
          final relatoriosMesSc =
              relatoriosSc.where((r) => r.data.month == mes).toList();
          final relatoriosMesSp =
              relatoriosSp.where((r) => r.data.month == mes).toList();

          final umidadeMediaSc =
              relatoriosMesSc.isEmpty
                  ? 0.0
                  : relatoriosMesSc.fold(0.0, (soma, r) => soma + r.umidade) /
                      relatoriosMesSc.length;

          final umidadeMediaSp =
              relatoriosMesSp.isEmpty
                  ? 0.0
                  : relatoriosMesSp.fold(0.0, (soma, r) => soma + r.umidade) /
                      relatoriosMesSp.length;

          print('Mês $mes:');
          print(
            '  > SC: ${UmidadeUtils.getUmidadeFormatada(umidade: umidadeMediaSc, tipoRelatorio: TipoRelatorioUmidade.media)}',
          );
          print(
            '  > SP: ${UmidadeUtils.getUmidadeFormatada(umidade: umidadeMediaSp, tipoRelatorio: TipoRelatorioUmidade.media)}\n',
          );
        }

        break;
    }
  }

  /// ================ MAXIMAS =================================

  /// Mostra o valor maximo do dado analisado por estado por ano
  void _maximaPorEstadoPorAno({required Dado dadoAnalisado}) {
    _mostrarMensagemRelatorio(
      mensagem: 'máxima por estado por ano',
      dadoAnalisado: dadoAnalisado,
    );

    switch (dadoAnalisado) {
      case Dado.temperatura:
        final maxTempSc =
            relatoriosSc
                .reduce((a, b) => a.temperatura > b.temperatura ? a : b)
                .temperatura;
        final maxTempSp =
            relatoriosSp
                .reduce((a, b) => a.temperatura > b.temperatura ? a : b)
                .temperatura;
        print(
          '  > SC: ${TemperaturaUtils.getTemperaturaFormatada(celsius: maxTempSc)}',
        );
        print(
          '  > SP: ${TemperaturaUtils.getTemperaturaFormatada(celsius: maxTempSp)}\n',
        );

        break;
      case Dado.umidadeAr:
        final maxUmidadeSc =
            relatoriosSc
                .reduce((a, b) => a.umidade > b.umidade ? a : b)
                .umidade;
        final maxUmidadeSp =
            relatoriosSp
                .reduce((a, b) => a.umidade > b.umidade ? a : b)
                .umidade;
        print(
          '  > SC: ${UmidadeUtils.getUmidadeFormatada(umidade: maxUmidadeSc, tipoRelatorio: TipoRelatorioUmidade.maxima)}',
        );
        print(
          '  > SP: ${UmidadeUtils.getUmidadeFormatada(umidade: maxUmidadeSp, tipoRelatorio: TipoRelatorioUmidade.maxima)}\n',
        );
        break;
    }
  }

  /// Mostra o valor maximo do dado analisado por estado por mes
  void _maximaPorEstadoPorMes({required Dado dadoAnalisado}) {
    _mostrarMensagemRelatorio(
      mensagem: 'máxima por mês e por estado',
      dadoAnalisado: dadoAnalisado,
    );

    for (int mes = 1; mes <= 12; mes++) {
      final relatoriosMesSc = relatoriosSc.where(
        (relatorio) => relatorio.data.month == mes,
      );
      final relatoriosMesSp = relatoriosSp.where(
        (relatorio) => relatorio.data.month == mes,
      );

      switch (dadoAnalisado) {
        case Dado.temperatura:
          final maxTempSc =
              relatoriosMesSc
                  .reduce((a, b) => a.temperatura > b.temperatura ? a : b)
                  .temperatura;
          final maxTempSp =
              relatoriosMesSp
                  .reduce((a, b) => a.temperatura > b.temperatura ? a : b)
                  .temperatura;

          print('Mês $mes:');
          print(
            '  > SC: ${TemperaturaUtils.getTemperaturaFormatada(celsius: maxTempSc)}',
          );
          print(
            '  > SP: ${TemperaturaUtils.getTemperaturaFormatada(celsius: maxTempSp)}\n',
          );

          break;
        case Dado.umidadeAr:
          final maxUmidadeSc =
              relatoriosMesSc
                  .reduce((a, b) => a.umidade > b.umidade ? a : b)
                  .umidade;
          final maxUmidadeSp =
              relatoriosMesSp
                  .reduce((a, b) => a.umidade > b.umidade ? a : b)
                  .umidade;

          print('Mês $mes:');
          print(
            '  > SC: ${UmidadeUtils.getUmidadeFormatada(umidade: maxUmidadeSc, tipoRelatorio: TipoRelatorioUmidade.maxima)}',
          );
          print(
            '  > SP: ${UmidadeUtils.getUmidadeFormatada(umidade: maxUmidadeSp, tipoRelatorio: TipoRelatorioUmidade.maxima)}\n',
          );

          break;
      }
    }
  }

  /// ================ MINIMAS =================================

  /// Mostra o valor mínimo do dado analisado por estado por ano
  void _minimaPorEstadoPorAno({required Dado dadoAnalisado}) {
    _mostrarMensagemRelatorio(
      mensagem: 'mínima por estado por ano',
      dadoAnalisado: dadoAnalisado,
    );

    switch (dadoAnalisado) {
      case Dado.temperatura:
        final minTempSc =
            relatoriosSc
                .reduce((a, b) => a.temperatura < b.temperatura ? a : b)
                .temperatura;
        final minTempSp =
            relatoriosSp
                .reduce((a, b) => a.temperatura < b.temperatura ? a : b)
                .temperatura;

        print(
          '  > SC: ${TemperaturaUtils.getTemperaturaFormatada(celsius: minTempSc)}',
        );
        print(
          '  > SP: ${TemperaturaUtils.getTemperaturaFormatada(celsius: minTempSp)}\n',
        );
        break;

      case Dado.umidadeAr:
        final minUmidadeSc =
            relatoriosSc
                .reduce((a, b) => a.umidade < b.umidade ? a : b)
                .umidade;
        final minUmidadeSp =
            relatoriosSp
                .reduce((a, b) => a.umidade < b.umidade ? a : b)
                .umidade;

        print(
          '  > SC: ${UmidadeUtils.getUmidadeFormatada(umidade: minUmidadeSc, tipoRelatorio: TipoRelatorioUmidade.minima)}',
        );
        print(
          '  > SP: ${UmidadeUtils.getUmidadeFormatada(umidade: minUmidadeSp, tipoRelatorio: TipoRelatorioUmidade.minima)}\n',
        );
        break;
    }
  }

  /// Mostra o valor mínimo do dado analisado por estado por mês
  void _minimaPorEstadoPorMes({required Dado dadoAnalisado}) {
    _mostrarMensagemRelatorio(
      mensagem: 'mínima por mês e por estado',
      dadoAnalisado: dadoAnalisado,
    );

    for (int mes = 1; mes <= 12; mes++) {
      final relatoriosMesSc = relatoriosSc.where(
        (relatorio) => relatorio.data.month == mes,
      );
      final relatoriosMesSp = relatoriosSp.where(
        (relatorio) => relatorio.data.month == mes,
      );

      if (relatoriosMesSc.isEmpty && relatoriosMesSp.isEmpty) continue;

      print('Mês $mes:');

      switch (dadoAnalisado) {
        case Dado.temperatura:
          final minTempSc =
              relatoriosMesSc.isEmpty
                  ? 0.0
                  : relatoriosMesSc
                      .reduce((a, b) => a.temperatura < b.temperatura ? a : b)
                      .temperatura;
          final minTempSp =
              relatoriosMesSp.isEmpty
                  ? 0.0
                  : relatoriosMesSp
                      .reduce((a, b) => a.temperatura < b.temperatura ? a : b)
                      .temperatura;

          print(
            '  > SC: ${TemperaturaUtils.getTemperaturaFormatada(celsius: minTempSc)}',
          );
          print(
            '  > SP: ${TemperaturaUtils.getTemperaturaFormatada(celsius: minTempSp)}\n',
          );
          break;

        case Dado.umidadeAr:
          final minUmidadeSc =
              relatoriosMesSc.isEmpty
                  ? 0.0
                  : relatoriosMesSc
                      .reduce((a, b) => a.umidade < b.umidade ? a : b)
                      .umidade;
          final minUmidadeSp =
              relatoriosMesSp.isEmpty
                  ? 0.0
                  : relatoriosMesSp
                      .reduce((a, b) => a.umidade < b.umidade ? a : b)
                      .umidade;

          print(
            '  > SC: ${UmidadeUtils.getUmidadeFormatada(umidade: minUmidadeSc, tipoRelatorio: TipoRelatorioUmidade.minima)}',
          );
          print(
            '  > SP: ${UmidadeUtils.getUmidadeFormatada(umidade: minUmidadeSp, tipoRelatorio: TipoRelatorioUmidade.minima)}\n',
          );
          break;
      }
    }
  }

  /// Mostra a temperatura média por horário por estado por ano
  void _temperaturaMediaPorHorarioPorEstadoPorAno() {

    print('Temperatura media por horario por estado:\n');

    for (int horario = 0; horario <= 23; horario++) {
      final mediaSc = _getTemperaturaMediaPorHorario(relatorios: relatoriosSc, horario: horario);
      final mediaSp = _getTemperaturaMediaPorHorario(relatorios: relatoriosSp, horario: horario);

      print('$horario:00 - SC: ${TemperaturaUtils.getTemperaturaFormatada(celsius: mediaSc)}');
      print('$horario:00 - SC: ${TemperaturaUtils.getTemperaturaFormatada(celsius: mediaSp)}\n');
    }
  }

  /// Retorna a temperatura media de um relatorio anual por horario
  double _getTemperaturaMediaPorHorario({required List<Relatorio> relatorios, required int horario}) {
      double somaTemperatura = relatorios.fold(
          0.0, (soma, r) => r.data.hour == horario ? soma + r.temperatura : soma);

      /// Sabendo que existem 24 horarios em um dia, e cada dia aparece 365 vezes no ano
      /// outra forma de calcular a media seria dividir o valor da soma por 365,
      final mediaTemperatura =  somaTemperatura / relatorios.where((r) => r.data.hour == horario).toList().length;
      return mediaTemperatura;
  }

  /// Mostra a direção do vento de maior frequência e o número de registros por estado por ano
  void _direcaoVentoMaiorFrequenciaPorEstadoPorAno() {
    print('Direção do vento com maior frequência por estado por ano:\n');

    final ventoMaisFrequenteSc = VentoUtils.getVentoMaiorFrequencia(
      relatorios: relatoriosSc,
    );
    final ventoMaisFrequenteSp = VentoUtils.getVentoMaiorFrequencia(
      relatorios: relatoriosSp,
    );

    print(
      '  > SC: ${VentoUtils.getDirecaoVentoFormatada(vento: ventoMaisFrequenteSc)}',
    );
    print(
      '  > SP: ${VentoUtils.getDirecaoVentoFormatada(vento: ventoMaisFrequenteSp)}',
    );
  }

  /// Mostra a direção do vento de maior frequência e o número de registros por estado por mês
  void _direcaoVentoMaiorFrequenciaPorEstadoPorMes() {
    print('Direção do vento com maior frequência por mês e por estado:\n');

    for (int mes = 1; mes <= 12; mes++) {
      final relatoriosMesSc =
          relatoriosSc
              .where((relatorio) => relatorio.data.month == mes)
              .toList();
      final relatoriosMesSp =
          relatoriosSp
              .where((relatorio) => relatorio.data.month == mes)
              .toList();

      if (relatoriosMesSc.isEmpty && relatoriosMesSp.isEmpty) continue;

      print('Mês $mes:');

      final ventoMaisFrequenteSc = VentoUtils.getVentoMaiorFrequencia(
        relatorios: relatoriosMesSc,
      );
      final ventoMaisFrequenteSp = VentoUtils.getVentoMaiorFrequencia(
        relatorios: relatoriosMesSp,
      );

      print(
        '  > SC: ${VentoUtils.getDirecaoVentoFormatada(vento: ventoMaisFrequenteSc)}',
      );
      print(
        '  > SP: ${VentoUtils.getDirecaoVentoFormatada(vento: ventoMaisFrequenteSp)}\n',
      );
    }
  }
}
