/// O desafio pede para reduzir ao máximo o número de iterações.
/// Eu fiz o melhor que eu pude, e consegui eliminar dois laços for
/// utilizando a estrutura Map<>
///
/// Entretanto, não consegui remover os dois for() restantes ao imprimir as
/// informações do mapa de pessoas.
/// 
/// Além disso, esses dois laços para imprimir os dados não demandam
/// muito poder de processamento, visto que eles apenas mostram o que está nas listas.
///
/// Os outros laços foram importantes de remover, pois eles tinham if's
/// em seus corpos, comparações, condições, etc, que demandam muito mais
/// do que um print()

void main() {
  final controle = ControleDePessoas();

  // Cadastrando pessoas no sistema
  controle
    ..cadastrarPessoa(Pessoa('Jose', Mes.abril))
    ..cadastrarPessoa(Pessoa('Arthur', Mes.agosto))
    ..cadastrarPessoa(Pessoa('Joao', Mes.abril))
    ..cadastrarPessoa(Pessoa('Jesse', Mes.dezembro))
    ..cadastrarPessoa(Pessoa('Roberta', Mes.fevereiro))
    ..cadastrarPessoa(Pessoa('Carla', Mes.fevereiro))
    ..cadastrarPessoa(Pessoa('Thania', Mes.agosto))
    ..cadastrarPessoa(Pessoa('Rafaela', Mes.marco))
    ..cadastrarPessoa(Pessoa('Yuri', Mes.junho))
    ..cadastrarPessoa(Pessoa('Jonas', Mes.setembro))
    ..cadastrarPessoa(Pessoa('Elias', Mes.outubro))
    ..cadastrarPessoa(Pessoa('Abel', Mes.maio))
    ..cadastrarPessoa(Pessoa('Danilo', Mes.abril))
    ..cadastrarPessoa(Pessoa('Jonathan', Mes.abril))
    ..cadastrarPessoa(Pessoa('Joseph', Mes.setembro))
    ..cadastrarPessoa(Pessoa('Abdul', Mes.janeiro))
    ..cadastrarPessoa(Pessoa('Jean', Mes.abril));

  /// Não encontrei uma maneira de remover esses laços.
  ///
  /// Seria possível reduzir isso com o método
  /// forEach(), entretanto isso iria apenas reduzir
  /// as linhas de código, mas o consumo de processamento
  /// e o número de iterações seria, a princípio, o mesmo
  for (final mes in controle.mesesComPessoas()) {
    print('\n${mes.name}');

    for (final pessoa in controle.pessoasPorMes(mes)) {
      print('  > ${pessoa.nome}');
    }
  }
}

/// Enum contendo os meses do ano
enum Mes {
  janeiro,
  fevereiro,
  marco,
  abril,
  maio,
  junho,
  julho,
  agosto,
  setembro,
  outubro,
  novembro,
  dezembro,
}

/// Classe pessoa
class Pessoa {
  Pessoa(this.nome, this.mesDeNascimento);

  final String nome;
  final Mes mesDeNascimento;
}

/// Classe para controlar o registro de pessoas e mostrar informações sobre as
/// pessoas e os meses de nascimento delas
class ControleDePessoas {
  /// Mapa para registrar as pessoas.
  ///
  /// As chaves são os meses de nascimento, e cada mês possui uma lista de pessoas
  /// vinculadas àquele mês
  final _pessoas = <Mes, List<Pessoa>>{
    Mes.janeiro: [],
    Mes.fevereiro: [],
    Mes.marco: [],
    Mes.abril: [],
    Mes.maio: [],
    Mes.junho: [],
    Mes.julho: [],
    Mes.agosto: [],
    Mes.setembro: [],
    Mes.outubro: [],
    Mes.novembro: [],
    Mes.dezembro: [],
  };

  /// Adiciona uma pessoa ao mapa de pessoas
  void cadastrarPessoa(Pessoa pessoa) {
    _pessoas[pessoa.mesDeNascimento]!.add(pessoa);
  }

  /// Retorna uma lista com meses onde existe ao menos uma pessoa vinculada
  List<Mes> mesesComPessoas() {
    return _pessoas.entries
        .where((e) => e.value.isNotEmpty)
        .map((e) => e.key)
        .toList()
      ..sort((a, b) => a.index.compareTo(b.index));
  }

  /// Retorna uma lista contendo todas as pessoas no mes especificado
  List<Pessoa> pessoasPorMes(Mes mes) => _pessoas[mes]!;
}
