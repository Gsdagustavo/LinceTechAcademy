void main() {
  List<int> numeros = {3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021}.toList();

  for (int num in numeros) {
    print(getDataNumero(num));
  }
}

String getDataNumero(int numero) {
  return 'Decimal: $numero, '
      'binário: ${decimalParaBinario(numero)}, '
      'octal: ${decimalParaOctal(numero)}, '
      'hexadecimal: ${decimalParaHexadecimal(numero)}';
}

String decimalParaBinario(int numero) => numero.toRadixString(2);
String decimalParaOctal(int numero) => numero.toRadixString(8);
String decimalParaHexadecimal(int numero) => numero.toRadixString(16).toLowerCase();