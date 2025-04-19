import 'package:yaansi/yaansi.dart';

/// Classe utilitária para controlar a conversão de temperatura e mostrar ao usuário
/// a temperatura formatada
abstract class TemperaturaUtils {
  /// Define quantas casas decimais serão mostradas ao mostrar o valor da temperatura
  static const int precisao = 2;

  /// Recebe uma temperatura em Celsius e retorna seu valor em Fahrenheit
  static double _celsiusParaFahrenheit({required double celsius}) {
    return (celsius * 9 / 5) + 32;
  }

  /// Recebe uma temperatura em Celsius e retorna seu valor em Kelvin
  static double _celsiusParaKelvin({required double celsius}) {
    return celsius + 273.15;
  }

  /// Retorna uma string contendo a temperatura formatada conforme a questao pede
  static String getTemperaturaFormatada({required double celsius}) {
    return ''
        '${red(celsius.toStringAsFixed(precisao))} C | '
        '${yellow(_celsiusParaFahrenheit(celsius: celsius).toStringAsFixed(precisao))} F | '
        '${blue(_celsiusParaKelvin(celsius: celsius).toStringAsFixed(precisao))} K';
  }
}
