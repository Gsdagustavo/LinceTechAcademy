
import 'package:atividades_flutter/apf6_funcoes/model/tipos_sanguineos.dart';

/// Define uma pessoa com as características necessárias para a resolução do problema
class Pessoa {
  String nome;
  String email;
  String telefone;
  String github;
  TipoSanguineo tipoSanguineo;

  Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  /// Usado para comparar os atributos entre duas pessoas
  ///
  /// Se os atributos forem iguais, significa que é a mesma pessoa (retorna [true])
  /// Caso contrário, retorna [false]
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pessoa &&
          runtimeType == other.runtimeType &&
          nome == other.nome &&
          email == other.email &&
          telefone == other.telefone &&
          github == other.github &&
          tipoSanguineo == other.tipoSanguineo;

  /// Necessário para a função acima [operator ==]
  @override
  int get hashCode => Object.hash(nome, email, telefone, github, tipoSanguineo);

  /// Mudar os dados da pessoa
  void mudarPessoa({required Pessoa other}) {
    nome = other.nome;
    email = other.email;
    telefone = other.telefone;
    github = other.github;
    tipoSanguineo = other.tipoSanguineo;
  }
}
