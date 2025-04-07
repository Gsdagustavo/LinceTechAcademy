class Pessoa {
  String _nome;
  int _idade;

  Pessoa(this._nome, this._idade);

  int get idade => _idade;

  set idade(int value) {
    _idade = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  @override
  String toString() {
    return 'Nome: $nome, idade: $idade';
  }
}

void main() async {

  // define 5 pessoas
  final pessoa1 = Pessoa('Gustavo', 16);
  final pessoa2 = Pessoa('Daniel', 20);
  final pessoa3 = Pessoa('Enzo', 16);
  final pessoa4 = Pessoa('Márcio', 34);
  final pessoa5 = Pessoa('Gabriel', 17);

  // adiciona as 5 pessoas declaradas acima ao set
  final Set<Pessoa> dados = {pessoa1, pessoa2, pessoa3, pessoa4, pessoa5};

  // define a pessoa 5 como alvo da busca
  final alvo = pessoa5;

  // espera a função buscarDados() executar e atribui o retorno da função à variável
  final resultadoBusca = await buscarDados(alvo: alvo, dados: dados);

  // mostra o resultado da busca
  print(resultadoBusca);

  // fim do programa
  await Future.delayed(Duration(seconds: 1));
  print('Fim.');
}

/// Recebe uma [Pessoa] como alvo da busca e uma coleção [Iterable] onde a pessoa será buscada.
///
/// Retorna a [Pessoa] se ela for encontrada. Caso contrário, retorna [null]
Future<Pessoa?> buscarDados({required Pessoa alvo, required Iterable<Pessoa> dados}) async {
  print('Iniciando busca...');

  await Future.delayed(Duration(seconds: 1));

  for (var pessoa in dados) {
    if (alvo.nome == pessoa.nome && alvo.idade == pessoa.idade) {
      print('Pessoa encontrada! retornando para a funcao main...');
      await Future.delayed(Duration(seconds: 1));
      return pessoa;
    }

    print('Pessoa ainda não encontrada. Indo para a próxima entrada.');
    await Future.delayed(Duration(seconds: 1));
  }

  print('Pessoa não encontrada na lista de dados.');
  await Future.delayed(Duration(seconds: 1));
  return null;
}