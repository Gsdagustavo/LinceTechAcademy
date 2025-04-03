void main() {
  final List<int> anos = [2016, 1988, 2000, 2100, 2300, 1993];

  anos.forEach((ano) {
    // print('O ano $ano ${isBissexto(ano) ? '' : 'nao '}é bissexto');

    if (isBissexto(ano)) {
      print('O ano $ano é bissexto');
    } else {
      print('O ano $ano não é bissexto');
    }
  });
}

/// Retorna true caso o ano passado como argumento seja bissexto.
/// Caso contrario retorna false
bool isBissexto(int ano) {
  return (ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0);
}
