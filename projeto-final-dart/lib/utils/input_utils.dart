import 'dart:io';

/// Classe utilitária para controlar o input do usuário
abstract class Input {
  /// Define as opções de escolha válidas no menu
  static const _opcoesValidas = ['1', '2', '3'];

  /// Contém a lógica de validação de input
  static String getInput() {
    String input = (stdin.readLineSync() ?? '').trim();

    /// Enquanto a entrada estiver vazio ou não corresponder a nenhum valor definido
    /// em [_opcoesValidas], pede ao usuário para dar outra entrada
    while (input == '' || input.isEmpty || !_opcoesValidas.contains(input)) {
      stdout.write('Entrada invalida, tente novamente: ');
      input = (stdin.readLineSync() ?? '').trim();
    }

    return input;
  }
}
