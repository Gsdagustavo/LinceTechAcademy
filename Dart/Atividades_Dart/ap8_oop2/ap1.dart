import 'dart:math';

enum GenerosMusicais {
  samba,
  rock,
  pagode,
  sertanejo,
  jazz,
  pop,
  grunge
}

void main() {

  final generoFavorito = gerarGeneroMusicalAleatorio();
  print('Meu genero musical favorito é o ${generoFavorito.name}');
}

/// Retorna um genero musical aleatorio de acordo com o enum [GenerosMusicais]
GenerosMusicais gerarGeneroMusicalAleatorio() {
  Random random = Random();

  final listaGeneros = GenerosMusicais.values;
  final numGeneros = listaGeneros.length;

  return listaGeneros[random.nextInt(numGeneros)];
}