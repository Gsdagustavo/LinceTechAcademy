void main() {

}

class Item {
  String _nome;
  int _quantidadeDesejada;
  int _quantidadeComprada;

  Item(this._nome, this._quantidadeDesejada, this._quantidadeComprada);

  int get quantidadeDesejada => _quantidadeDesejada;

  set quantidadeDesejada(int value) {
    _quantidadeDesejada = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  int get quantidadeComprada => _quantidadeComprada;

  set quantidadeComprada(int value) {
    _quantidadeComprada = value;
  }

  @override
  String toString() {
    return 'Nome: $nome, quantidade desejada: $quantidadeDesejada, quantidade adquirida: $quantidadeComprada';
  }
}

class ControleDeItens {

  final _itensDesejados = <Item>[];
  final _itensComprados = <Item>[];

  void addItemDesejado(Item item) {
    _itensDesejados.add(item);
  }

  void addItemComprado(Item item) {

    if (_itensDesejados.isEmpty) {
      print('nao existem itens desejados a serem comprados');
      return;
    }

    _itensComprados.add(item);
    _itensDesejados.removeWhere((i) => i.nome.toUpperCase() == item.nome.toUpperCase());
  }

  void mostrarItensDesejados() {
    mostrarItens(itens: _itensDesejados, mensagem: 'Itens desejados');
  }

  void mostrarItensComprados() {
    mostrarItens(itens: _itensComprados, mensagem: 'Itens comprados:');
  }

  void mostrarItens({required Iterable<Item> itens, required String mensagem}) {
    print(mensagem);
    for (final (i, item) in itens.indexed) {
      print('Item #${i + 1}. $item');
    }
  }

  void mostrarProgresso() {
    print('Progresso: ${_itensComprados.length}/${_itensDesejados.length}');
  }
}
