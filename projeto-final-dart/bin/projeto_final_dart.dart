import 'dart:io';

import 'package:projeto_final_dart/utils/input_utils.dart';
import 'package:projeto_final_dart/utils/relatorio_utils.dart';

void main() async {
  final controladorRelatorios = RelatorioUtils();
  await controladorRelatorios.inicializar();

  while (true) {
    stdout.write(
      '\nOlá, Marcelo. Que relatório você precisa?\n'
      '1- Temperatura\n'
      '2 - Umidade\n'
      '3 - Direção do vento\n'
      'Digite o número da opção desejada: ',
    );

    final input = Input.getInput();

    switch (input) {
      case '1':
        await controladorRelatorios.mostrarRelatorios(dadoAnalisado: Dado.temperatura);
        break;
      case '2':
        await controladorRelatorios.mostrarRelatorios(dadoAnalisado: Dado.umidadeAr);
        break;
      case '3':
        controladorRelatorios.mostrarRelatoriosDirecaoVento();
        break;
    }
  }
}