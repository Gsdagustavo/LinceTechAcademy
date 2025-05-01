import 'package:flutter/material.dart';

import 'pessoa.dart';

class PessoaStates with ChangeNotifier {
  /// Lista que irá armazenar as pessoas cadastradas
  final List<Pessoa> _pessoas = [];

  List<Pessoa> get pessoas => _pessoas;

  /// Adiciona uma pessoa à lista
  void addPessoa(Pessoa pessoa) {
    _pessoas.add(pessoa);
    debugPrint('Pessoa com nome ${pessoa.nome} adicionada');
    notifyListeners();
  }

  /// Remove uma pessoa da lista
  void removePessoa(Pessoa pessoa) {
    _pessoas.remove(pessoa);
    notifyListeners();
  }

  /// Muda os atributos de uma pessoa de acordo com os argumentos passados
  ///
  /// Eu escolhi usar o 'Pessoa other' para mudar os atributos para não ter que passar todos os
  /// atributos nos parâmetros, pois isso deixaria a função muito grande
  void mudarPessoa({required Pessoa pessoa, required Pessoa other}) {
    pessoa.mudarPessoa(other: other);
  }
}
