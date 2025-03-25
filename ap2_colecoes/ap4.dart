void main() {

  // cria o mapa com a sigla dos estados e suas cidades
  Map<String, List<String>> mapaCidades = {
    'MG': ['Belo Horizonte', 'Juiz de Fora', 'Berlinda'],
    'PR': ['Cascavel', 'Curitiba', 'Foz do Iguaçu'],
    'SC': ['Blumenau', 'Florianopolis', 'Gaspar'],
    'SP': ['Campinas', 'Guarulhos', 'Sao Paulo']
  };

  // mostra todas as siglas dos estados
  print('Estados: ${mapaCidades.keys.join(' ; ')}');

  print('');

  // mostra as cidades de SC em ordem alfabetica usando o metodo .sort()
  if (mapaCidades.containsKey('SC')) {
    List<String> cidadesSC = mapaCidades['SC']!;
    cidadesSC.sort();
    print('Cidades de SC: ${cidadesSC.join(' ; ')}');
  }

  print('');

  // cria uma lista e adiciona todas as cidades do mapa de cidades com suas siglas nela
  List<String> todasCidades = [];

  mapaCidades.forEach((sigla, cidades) {
    cidades.forEach((cidade) {
      todasCidades.add('$cidade - $sigla');
    });
  });

  // mostra todas as cidades em ordem alfabetica
  for (String cidade in todasCidades) {
    print(cidade);
  }
}