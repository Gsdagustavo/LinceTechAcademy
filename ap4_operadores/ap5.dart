void main() {

  // instancia o mapa contendo o nome da pessoa como chave e a idade como valor
  final Map<String, int?> pessoas = {
    'Nelson': null,
    'Jane': null,
    'Jack': 16,
    'Rupert': 37,
    'Andy': 13,
    'Kim': 27,
    'Robert': 31,
  };

  // itera pelo mapa de pessoas e mostra o nome e a idade. Caso a idade seja 'null',
  // informa ao usuario
  pessoas.forEach((nome, idade) {
    print('$nome - ${idade ?? 'idade nao informada'}');
  });
}