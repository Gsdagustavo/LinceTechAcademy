import 'dart:math';

void main() {
  final controle = ControleDeItens();

  // adicionar itens desejados
  controle.addItemDesejado(Item('Banana', 5));
  controle.addItemDesejado(Item('Maçã', 3));
  controle.addItemDesejado(Item('Leite', 2));

  // mostrar os itens desejados
  controle.mostrarItensDesejados();

  // marcar itens como comprados
  controle.comprarItem('Banana', 3);
  controle.comprarItem('Leite', 2);

  // marcar um item como sem estoque
  controle.marcarComoSemEstoque('Maçã');

  // mostrar as listas
  controle.mostrarItensComprados();
  controle.mostrarItensSemEstoque();
  controle.mostrarItensDesejados();
  controle.mostrarProgresso();
  controle.sugerirItemAleatorio();
}

/// Classe que representa um item e suas quantidades compradas e desejadas por um usuario
class Item {

  final String nome;
  int quantidadeDesejada;
  int quantidadeComprada = 0;

  Item(this.nome, this.quantidadeDesejada);

  int get pendentes => quantidadeDesejada - quantidadeComprada;

  @override
  String toString() {
    return 'Nome: $nome, Desejado: $quantidadeDesejada, Comprado: $quantidadeComprada';
  }
}

/// Classe para controlar a lógica de estoque e compra dos itens
class ControleDeItens {

  final _todosItens = <Item>[];
  final _itensSemEstoque = <Item>[];

  /// Adiciona um novo [Item] desejado à lista de itens desejados
  void addItemDesejado(Item item) {
    _todosItens.add(item);
  }

  /// Retorna uma lista contendo os itens pendentes (desejados)
  List<Item> _getItensPendentes() {
    final List<Item> pendentes = [];

    for (final item in _todosItens) {
      if (!_itensSemEstoque.contains(item) && item.pendentes > 0) {
        pendentes.add(item);
      }
    }

    return pendentes;
  }

  /// Compra uma certa quantidade de um item que está na lista de itens desejados
  void comprarItem(String nomeItem, int quantidade) {
    final item = _getItemByName(nomeItem);

    if (item == null) {
      print('Nome invalido.');
      return;
    }

    if (item.pendentes > 0) {
      final comprado = quantidade.clamp(0, item.pendentes);

      item.quantidadeComprada += comprado;
      print('\nComprado $comprado unidade(s) de ${item.nome}');
    } else {
      print('\nItem não encontrado ou já totalmente comprado');
    }
  }

  /// Adiciona um item à lista de itens sem estoque
  void marcarComoSemEstoque(String nomeItem) {
    final item = _getItemByName(nomeItem);

    if (item == null) {
      return;
    }

    _itensSemEstoque.add(item);
    print('\nItem "${item.nome}" marcado como sem estoque');
  }

  /// Método privado que retorna um [Item] de acordo com seu nome, caso ele exista na lista de itens
  ///
  /// Caso contrário, retorna [null]
  Item? _getItemByName(String nomeItem) {
    Item? item;

    for (final i in _todosItens) {
      if (i.nome == nomeItem) {
        item =  i;
      }
    }

    return item;
  }

  /// Mostra todos os itens desejados
  void mostrarItensDesejados() {
    final pendentes = _getItensPendentes();
    _mostrarLista(pendentes, 'Pendentes');
  }

  /// Mostra todos os itens desejados
  void mostrarItensComprados() {
    final comprados = <Item>[];

    for (final item in _todosItens) {
      if (item.quantidadeComprada > 0) {
        comprados.add(item);
      }
    }

    _mostrarLista(comprados, 'Itens comprados');
  }

  /// Mostra todos os itens sem estoque
  void mostrarItensSemEstoque() {
    _mostrarLista(_itensSemEstoque, 'Itens sem estoque');
  }

  /// Mostra o progresso de compra dos itens
  void mostrarProgresso() {

    /// As duas variaveis usam o metodo fold()
    /// para conseguir a soma de todas as quantidades de itens desejados
    int totalDesejado = _todosItens.fold(0, (soma, item) => soma + item.quantidadeDesejada);
    int totalComprado = _todosItens.fold(0, (soma, item) => soma + item.quantidadeComprada);
    print('\nProgresso: $totalComprado/$totalDesejado');
  }

  /// Sugere um item pendente aleatorio ao usuario para comprar
  void sugerirItemAleatorio() {
    final pendentes = _getItensPendentes();

    if (pendentes.isEmpty) {
      print('\nTodos os itens foram comprados ou estão sem estoque!');
      return;
    }

    final aleatorio = Random().nextInt(pendentes.length);
    print('\nItem sugerido para compra: ${pendentes[aleatorio]}');
  }

  /// Metodo privado auxiliar para mostrar uma lista
  void _mostrarLista(List<Item> lista, String titulo) {
    print('\n$titulo:');
    if (lista.isEmpty) {
      print('Nenhum item.');
      return;
    }
    for (var i = 0; i < lista.length; i++) {
      print('${i + 1}. ${lista[i]}');
    }
  }
}
