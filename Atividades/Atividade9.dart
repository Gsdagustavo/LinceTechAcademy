import 'dart:io';

import '../Util/Input.dart';

const String vogais = 'aeiouAEIOU';
const String consoantes = 'bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ';

void main() {
  stdout.write('Insira um texto e eu o analisarei: ');
  String texto = Input.getStringInput();

  print('Texto: $texto');

  Map<String, int> letras = calcularQuantVogais_Consoantes(texto);
  int quantVogais = letras['vogais']!;
  int quantConsoantes = letras['consoantes']!;

  int quantLetras = calcularQuantLetras(texto);

  print('Quantidade de vogais: ${quantVogais}');
  print('Quantidade de consoantes: ${quantConsoantes}');

  print('Quantidade de letras: ${quantLetras}');



}

Map<String, int> calcularQuantVogais_Consoantes(String texto) {

  int quantVogais = 0;
  int quantConsoantes = 0;

  // contar cada letra de acordo com sua classificacao (vogal ou consoante)
  for (String letra in texto.split('')) {

    if (vogais.contains(letra)) {
      quantVogais++;
    } else if (consoantes.contains(letra)){
      quantConsoantes++;
    }
  }

  // cria um mapa (chave, valor), onde as chaves sao os tipos de letras ...
  // ... e os valores sao suas quantidades
  Map<String, int> letras = {
    'consoantes': quantConsoantes,
    'vogais': quantVogais
  };

  return letras;
}

int calcularQuantLetras(String texto) {
  int quantLetras = 0;

  for (String letra in texto.split('')) {
    if (consoantes.contains(letra) || vogais.contains(letra)) {
      quantLetras++;
    }
  }

  return quantLetras;
}

