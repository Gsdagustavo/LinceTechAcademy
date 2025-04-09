import 'dart:collection';
import 'dart:math';

final fila = Fila();

void main() {
  /// Popula a fila com pessoas
  popularFila();

  print('');

  /// Mostra a fila após a população
  fila.mostrarFila();

  /// Atende uma pessoa da fila
  fila.atenderPessoa();

  /// Mostra a fila após o atendimento
  fila.mostrarFila();

  /// Adiciona uma pessoa aleatória ao fim da fila e mostra a fila
  fila.adicionarPessoa(
    Pessoa.fromNomeCompleto(GeradorDeNomes.gerarNomeAleatorio()),
  );
  fila.mostrarFila();

  /// Atende todas as pessoas da fila
  fila.atenderTodasAsPessoas();

  /// Mostra a fila após atender todo mundo
  fila.mostrarFila();
}

/// Método auxiliar para popular a fila
void popularFila([int tamanho = 10]) {
  for (int i = 0; i < tamanho; i++) {
    fila.adicionarPessoa(
      Pessoa.fromNomeCompleto(GeradorDeNomes.gerarNomeAleatorio()),
    );
  }
}

/// Representa uma fila de pessoas do tipo FIFO (First In First Out), ou seja,
/// quem chegou primeiro, sai primeiro (ordem de chegada)
class Fila {
  final fila = Queue<Pessoa>();

  /// Adiciona uma pessoa no fim da fila
  void adicionarPessoa(Pessoa pessoa) {
    print('${pessoa} entrou na fila');
    fila.addLast(pessoa);
  }

  /// Atende a primeira pessoa da fila
  void atenderPessoa() {
    print('${fila.first} foi atendido(a)');
    fila.removeFirst();
  }

  /// Atende todas as pessoas da fila de uma vez só, por ordem de chegada
  void atenderTodasAsPessoas() {
    print('\n--- Modo Turbo! Atendendo todas as pessoas... ---\n');

    while (fila.length > 0) {
      atenderPessoa();
    }
  }

  /// Mostra a fila de atendimento, em ordem de chegada
  void mostrarFila() {
    print('\n---- Fila de Atendimento ----\n');

    if (fila.isEmpty) {
      print('Não há ninguém na fila de atendimento');
      return;
    }

    for (var (i, pessoa) in fila.indexed) {
      print('#${i + 1}. $pessoa');
    }
  }
}

/// Classe que representa uma pessoa
class Pessoa {
  final String _nome;
  final String _sobreNome;

  /// Rebece um nome completo como argumento no construtor,
  /// e transforma o nome completo em nome e sobrenome
  Pessoa.fromNomeCompleto(String nomeCompleto)
    : _nome = nomeCompleto.split(' ').first,
      _sobreNome = nomeCompleto.split(' ').last;

  Pessoa(this._nome, this._sobreNome);

  String get nome => _nome;

  String get sobreNome => _sobreNome;

  @override
  String toString() {
    return nome + ' ' + sobreNome;
  }
}

/// Possui apenas duas listas de nomes e sobrenomes e um método que gera
/// um nome aleatório a partir dessas listas
abstract class GeradorDeNomes {
  /// Usei as listas fornecidas no módulo de desafios 1

  static const List<String> _nomes = [
    'Ana',
    'Francisco',
    'Joao',
    'Pedro',
    'Gabriel',
    'Rafaela',
    'Marcio',
    'Jose',
    'Carlos',
    'Patricia',
    'Helena',
    'Camila',
    'Mateus',
    'Gabriel',
    'Maria',
    'Samuel',
    'Karina',
    'Antonio',
    'Daniel',
    'Joel',
    'Cristiana',
    'Sebastião',
    'Paula',
  ];

  static const List<String> _sobrenomes = [
    'Silva',
    'Ferreira',
    'Almeida',
    'Azevedo',
    'Braga',
    'Barros',
    'Campos',
    'Cardoso',
    'Teixeira',
    'Costa',
    'Santos',
    'Rodrigues',
    'Souza',
    'Alves',
    'Pereira',
    'Lima',
    'Gomes',
    'Ribeiro',
    'Carvalho',
    'Lopes',
    'Barbosa',
  ];

  /// Gera um nome aleatorio baseado nas listas de nomes e sobrenomes declarados na classe
  static String gerarNomeAleatorio() {
    final random = Random();

    final nome = _nomes[random.nextInt(_nomes.length)];
    final sobrenome = _sobrenomes[random.nextInt(_sobrenomes.length)];

    return nome + ' ' + sobrenome;
  }
}
