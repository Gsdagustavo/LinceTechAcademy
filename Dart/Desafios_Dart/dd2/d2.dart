import 'dart:math';

void main() {

  final pessoa = Pessoa();

  // Consumindo produtos fornecidos
  for (var i = 0; i < 5; i++) {
    pessoa.refeicao();
  }
  
  print('');

  pessoa.informacoes();

  print('');

  pessoa.mostrarRefeicoes();
}

/// Contém todos os tipos de produtos que podem ser fornecidos a uma pessoa
enum TipoFornecedor {
  bebidas,
  sanduiches,
  bolos,
  saladas,
  petiscos,
  ultraCaloricos
}

/// Contém os status para os níveis de calorias de uma pessoa
enum StatusNivelCalorias {
  deficitExtremo,
  deficit,
  satisfeita,
  excesso
}

/// Contém atributos básicos de um produto ([nome] e [calorias])
class Produto {
  /// Nome deste produto
  final String nome;

  /// Total de calorias
  final int calorias;

  Produto(this.nome, this.calorias);

  @override
  String toString() {
    return 'Nome: $nome, Calorias: $calorias';
  }
}

/// Classe abstrata que contem um factory constructor para instanciar um tipo de
/// fornecedor de acordo com o [TipoFornecedor] passado como argumento
///
/// Além disso, possui o método abstrato [fornecer] que deve ser implementado pelas classes filhas
abstract class FornecedorDeProdutos {
  final _random = Random();

  FornecedorDeProdutos();

  /// Factory constructor para criar fornecedores de acordo com o tipo
  factory FornecedorDeProdutos.criar(TipoFornecedor tipo) {
    switch (tipo) {
      case TipoFornecedor.bebidas:
        return FornecedorDeBebidas();
      case TipoFornecedor.sanduiches:
        return FornecedorDeSanduiches();
      case TipoFornecedor.bolos:
        return FornecedorDeBolos();
      case TipoFornecedor.saladas:
        return FornecedorDeSaladas();
      case TipoFornecedor.petiscos:
        return FornecedorDePetiscos();
      case TipoFornecedor.ultraCaloricos:
        return FornecedorDeUltraCaloricos();
    }
  }

  /// Retorna um produto que pode ser consumido por um consumidor
  Produto fornecer();
}

class FornecedorDeBebidas extends FornecedorDeProdutos {
  final _bebidasDisponiveis = <Produto>[
    Produto('Água', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Enrgético', 135),
    Produto('Café', 60),
    Produto('Chá', 35),
  ];

  /// Retorna uma bebida aleatória que pode ser consumida por um consumidor
  @override
  Produto fornecer() {
    return _bebidasDisponiveis[
      _random.nextInt(_bebidasDisponiveis.length)
    ];
  }
}

class FornecedorDeSanduiches extends FornecedorDeProdutos {
  final _sanduichesDisponiveis = <Produto>[
    Produto('Sanduíche natural', 100),
    Produto('Sanduíche de frango', 200),
    Produto('Sanduíche vegano', 50),
    Produto('Sanduíche de carne', 250),
  ];

  /// Retorna um sanduiche aleatório que pode ser consumido por um consumidor
  @override
  Produto fornecer() {
    return _sanduichesDisponiveis[
    _random.nextInt(_sanduichesDisponiveis.length)
    ];
  }
}

class FornecedorDeBolos extends FornecedorDeProdutos {
  final _bolosDisponiveis = <Produto>[
    Produto('Bolo de chocolate', 1000),
    Produto('Bolo de morango', 1250),
    Produto('Bolo de maracujá', 950),
    Produto('Bolo de uva', 975),
  ];

  /// Retorna um bolo aleatório que pode ser consumido por um consumidor
  @override
  Produto fornecer() {
    return _bolosDisponiveis[
    _random.nextInt(_bolosDisponiveis.length)
    ];
  }
}

class FornecedorDeSaladas extends FornecedorDeProdutos {
  final _saladasDisponiveis = <Produto>[
    Produto('Salada de frutas', 50),
    Produto('Salada de couve', 40),
    Produto('Salada de espinafre', 65),
    Produto('Salada de brócolis', 30),
  ];

  /// Retorna uma salada aleatória que pode ser consumida por um consumidor
  @override
  Produto fornecer() {
    return _saladasDisponiveis[
    _random.nextInt(_saladasDisponiveis.length)
    ];
  }
}

class FornecedorDePetiscos extends FornecedorDeProdutos {
  final _petiscosDisponiveis = <Produto>[
    Produto('Linguicinha', 100),
    Produto('Pão de alho', 75),
    Produto('Carne de gado com farofa', 150),
    Produto('Calabresa acebolada', 50),
    Produto('Frango à passarinho', 200),
  ];

  /// Retorna um petisco aleatório que pode ser consumido por um consumidor
  @override
  Produto fornecer() {
    return _petiscosDisponiveis[
    _random.nextInt(_petiscosDisponiveis.length)
    ];
  }
}

class FornecedorDeUltraCaloricos extends FornecedorDeProdutos {
  final _ultraCaloricosDisponiveis = <Produto>[
    Produto('Batata frita', 500),
    Produto('Hambúrguer', 1000),
    Produto('Chocolate', 350),
    Produto('Pizza', 2000),
    Produto('Refrigerante', 200),
  ];

  /// Retorna um petisco aleatório que pode ser consumido por um consumidor
  @override
  Produto fornecer() {
    return _ultraCaloricosDisponiveis[
    _random.nextInt(_ultraCaloricosDisponiveis.length)
    ];
  }
}

class Pessoa {

  // Lista para armazenar todas as refeicoes feitas por uma pessoa
  final _refeicoes = <Produto>[];

  // Acumulador de calorias
  int _caloriasConsumidas = 0;

  static final _random = Random();

  // Constantes para controlar a logica das calorias
  static const _maxCaloriasIniciais = 500;
  static const _quantidadeIdealCalorias = 2500;

  /// Construtor para instanciar uma pessoa
  /// com uma quantidade inicial aleatoria  de calorias consumidas
  Pessoa() {
    _caloriasConsumidas = _random.nextInt(_maxCaloriasIniciais);
  }

  /// Imprime as informacoes desse consumidor
  void informacoes() {
    print('Calorias consumidas: $_caloriasConsumidas');

    final status = _calcularStatus();

    switch (status) {
      case StatusNivelCalorias.deficitExtremo:
        print('Status: Deficit Extremo. '
            '${_quantidadeIdealCalorias - _caloriasConsumidas} calorias necessarias para atingir o nivel ideal');
        break;
      case StatusNivelCalorias.deficit:
        print('Status: Deficit. '
            '${_quantidadeIdealCalorias - _caloriasConsumidas} calorias necessarias para atingir o nivel ideal');
        break;
      case StatusNivelCalorias.satisfeita:
        print('Status: Satisfeita');
        break;
      case StatusNivelCalorias.excesso:
        print('Status: Excesso. '
            '${_caloriasConsumidas - _quantidadeIdealCalorias} calorias acima do ideal');
        break;
    }
  }

  /// Funcao para calcular o status calorico de uma pessoa de acordo com a quantidade de calorias consumidas.
  ///
  /// Retorna um [StatusNivelCalorias] indicando o status da pessoa
  StatusNivelCalorias _calcularStatus() {
    if (_caloriasConsumidas <= 500) {
      return StatusNivelCalorias.deficitExtremo;
    } else if (_caloriasConsumidas <= 1800) {
      return StatusNivelCalorias.deficit;
    } else if (_caloriasConsumidas <= 2500) {
      return StatusNivelCalorias.satisfeita;
    }

    return StatusNivelCalorias.excesso;
  }

  /// Mostra ao usuario todas as refeicoes feitas por uma pessoa e o total de calorias
  void mostrarRefeicoes() {
    for (final (index, refeicao) in _refeicoes.indexed) {
      print('Refeição ${index + 1}. ${refeicao.toString()}');
    }

    // mostra ao usuário a quantidade de refeições realizadas e o total de calorias consumidas
    print('\nTotal de refeições: ${_refeicoes.length}');
    print('Calorias consumidas: $_caloriasConsumidas');
  }

  /// Retorna uma instãncia de uma classe filha de [FornecedorDeProdutos] aleatória
  FornecedorDeProdutos fornecedorAleatorio() {
    // retorna um tipo de fornecedor aleatorio
    final tipoFornecedor = TipoFornecedor.values[_random.nextInt(TipoFornecedor.values.length)];

    // instancia um Fornecedor aleatorio de acordo com o valor da variavel [tipoFornecedor]
    final fornecedor = FornecedorDeProdutos.criar(tipoFornecedor);
    return fornecedor;
  }

  /// Consome um produto e aumenta o número de calorias
  void refeicao() {
    final fornecedor = fornecedorAleatorio();
    final produto = fornecedor.fornecer();

    // mostra ao usuario o nome do produto consumido e a quantidade de calorias consumidas
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    // incrementa as calorias do produto ao total de calorias consumidas
    _caloriasConsumidas += produto.calorias;

    // adiciona o produto consumido à lista de refeições
    _refeicoes.add(produto);
  }
}