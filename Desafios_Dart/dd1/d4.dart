void main() {
  final DateTime dataAtual = DateTime.now();

  print('Data Atual: ${getFormattedData(dataAtual)}');

  final DateTime dataCalculada = somarDiasDaSemana(dataAtual, 18);

  print('Data Calculada: ${getFormattedData(dataCalculada)}');
}

DateTime somarDiasDaSemana(DateTime data, [int dias = 18]) {
  return data.add(Duration(days: dias));
}

String getFormattedData(DateTime data) {
  return '${data.day}/${data.month}/${data.year}';
}