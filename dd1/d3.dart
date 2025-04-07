void main() {
  String paragrafo = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.';

  var quantPalvras = quantPalavras(paragrafo);
  var tamTexto = tamanhoTexto(paragrafo);
  var numFrases = quantFrases(paragrafo);
  var numVogais = quantVogais(paragrafo);
  var consoantesNoTexto = consoantesPresentes(paragrafo);

  print('Número de palavras: $quantPalvras');
  print('Tamanho do texto: $tamTexto');
  print('Numero de frases: $numFrases');
  print('Numero de vogais: $numVogais');
  print('Consoantes encontradas: $consoantesNoTexto');

}

void mostrarTexto(String texto) {
  print(texto);
}

int quantPalavras(String texto) {
  return texto.split(' ').length;
}

int tamanhoTexto(String texto) {
  return texto.split('').length;
}

int quantFrases(String texto) {
  return texto.split('.').length;
}

int quantVogais(String texto) {
  const vogais = 'AEIOUaeiou';

  int numVogais = 0;

  for (String letra in texto.split('')) {
    if (vogais.contains(letra)) {
      numVogais++;
    }
  }

  return numVogais;
}

String consoantesPresentes(String texto) {
  const consoantes = 'bcdfghjklmnpqrstvwxyz';

  String consoantesNoTexto = '';

  for (String letra in texto.split('')) {
    if (consoantes.contains(letra.toLowerCase())) {
      if (!consoantesNoTexto.contains(letra.toLowerCase())) {
        consoantesNoTexto += letra.toLowerCase();
      }
    }
  }

  List<String> cons = consoantesNoTexto.split('');
  cons.sort();
  consoantesNoTexto = cons.join(', ');

  return consoantesNoTexto;
}