void main() {

  final temperaturas = {0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0 }.map((t) => Temperatura(t));
  
  for (var temperatura in temperaturas) {
    print(temperatura);
  }
}

class Temperatura {
  final double celsius;

  Temperatura(this.celsius);

  @override
  String toString() {
    return 'Celsius: ${celsius.toStringAsFixed(2)}, '
        'Fahrenheit: ${CalcularTemperaturas.celsiusParaFahrenheit(celsius).toStringAsFixed(2)}, '
        'Kelvin: ${CalcularTemperaturas.celsiusParaKelvin(celsius).toStringAsFixed(2)}';
  }
}

class CalcularTemperaturas {

  static double celsiusParaFahrenheit(double celsius) {
    return (1.8 * celsius) + 32;
  }

  static double celsiusParaKelvin(double celsius) {
    return celsius + 273.15;
  }
}

