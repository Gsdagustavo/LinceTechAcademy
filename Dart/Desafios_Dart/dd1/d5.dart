import 'dart:math';

void main() {
  final List<String> nomes = [
    'Ana', 'Francisco', 'Joao', 'Pedro', 'Gabriel', 'Rafaela', 'Marcio',
    'Jose', 'Carlos', 'Patricia', 'Helena', 'Camila', 'Mateus', 'Gabriel',
    'Maria', 'Samuel', 'Karina', 'Antonio', 'Daniel', 'Joel', 'Cristiana',
    'Sebastião', 'Paula'
  ];

  final List<String> sobrenomes = [
    'Silva', 'Ferreira', 'Almeida', 'Azevedo', 'Braga', 'Barros', 'Campos',
    'Cardoso', 'Teixeira', 'Costa', 'Santos', 'Rodrigues', 'Souza', 'Alves',
    'Pereira', 'Lima', 'Gomes', 'Ribeiro', 'Carvalho', 'Lopes', 'Barbosa'
  ];

  final nome = sugerirNomeAleatorio(nomes);
  final sobreNome = sugerirNomeAleatorio(sobrenomes);

  final nomeCompleto = nome + ' ' + sobreNome;

  print('Nome: $nomeCompleto');

}

String sugerirNomeAleatorio(List<String> lista) {
  final random = Random();
  return lista[random.nextInt(lista.length)];
}