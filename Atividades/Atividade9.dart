import 'dart:io';

import '../Util/Input.dart';

void main() {
  stdout.write('Insira um texto e eu o analisarei: ');
  String texto = Input.getStringInput();

  print('Texto: $texto');

  Map<String, int> letras = calcularQuantVogais_Consoantes(texto);
  int quantVogais = letras['vogais']!;
  int quantConsoantes = letras['consoantes']!;

  print('Quantidade de vogais: ${quantVogais}');
  print('Quantidade de consoantes: ${quantConsoantes}');

}

Map<String, int> calcularQuantVogais_Consoantes(String texto) {

  int quantVogais = 0;
  int quantConsoantes = 0;

  const String vogais = 'aeiouAEIOU';
  const String consoantes = 'bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ';

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