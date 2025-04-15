void main() {
  // cria 3 contas bancarias, realiza 1 operação em cada conta e ao final
  // mostra os status das contas

  ContaBancaria conta1 = ContaBancaria(5000, 'Joao');
  ContaBancaria conta2 = ContaBancaria(1000, 'Pedro');
  ContaBancaria conta3 = ContaBancaria(0, 'Lucas');

  try {
    conta1.depositar(150);
    conta2.sacar(2000);

    // conta3.depositar(6000) vai gerar uma exceção propositalmente
    conta3.depositar(6000);
  } on ContaBancariaExceptions catch (e) {
    print(e);
  } on Exception catch (e, s) {
    print('Um erro inesperado ocorreu: $e \n$s');
  }

  print('');
  print(conta1);
  print(conta2);
  print(conta3);
}

/// Classe auxiliar para tratar exceções relacionadas às transações bancárias
class ContaBancariaExceptions {}

/// Classe que simula uma conta bancaria, com atributos basicos ([_titular] e [_saldo]
/// e com metodos para simular transações bancárias ([depositar] e [sacar]
class ContaBancaria {
  late double _saldo;
  late String _titular;

  // representa o valor maximo que pode ser depositado em uma unica transacao
  static const double valorMaximoTransacao = 5000;

  ContaBancaria(this._saldo, this._titular);

  /// Adiciona saldo à conta bancaria de acordo com o valor passado como argumento
  /// no parametro [valor]
  void depositar(double valor) {
    if (valor <= 0) {
      throw ValorInvalidoException(
        'Impossivel depositar R\$ ${valor.toStringAsFixed(2)}',
      );
    }

    if (valor > valorMaximoTransacao) {
      throw ValorInvalidoException(
        'Impossivel depositar mais de R\$ ${valorMaximoTransacao.toStringAsFixed(2)}',
      );
    }

    _saldo += valor;
    print('Transação aprovada!');
  }

  /// Remove saldo da conta bancaria de acordo com o valor passado como argumento
  /// no parametro [valor] e retorna o valor sacado caso a transacao seja aprovada
  double sacar(double valor) {
    if (valor <= 0) {
      throw ValorInvalidoException(
        'Impossivel sacar R\$ ${valor.toStringAsFixed(2)}',
      );
    }

    if (valor > valorMaximoTransacao) {
      throw ValorInvalidoException(
        'Impossivel sacar mais de R\$ ${valorMaximoTransacao.toStringAsFixed(2)}',
      );
    }

    if (valor > _saldo) {
      throw SaldoInsuficienteException(
        'Impossivel sacar R\$ ${valor.toStringAsFixed(2)} '
        'de uma conta com saldo R\$ ${_saldo.toStringAsFixed(2)}',
      );
    }

    _saldo -= valor;
    print('Transação aprovada!');
    return valor;
  }

  // é possivel usar tanto o metodo mostrarSaldo() quando o metodo toString()
  // para obter informacoes sobre o saldo da conta.

  // O metodo toString() mostra tambem o nome do titular

  /// Mostra o saldo da conta de acordo com o valor da variavel [saldo]
  void mostrarSaldo() {
    print('Saldo disponivel: R\$ ${_saldo.toStringAsFixed(2)}');
  }

  /// Mostra o nome do titular da conta e o saldo da conta, de acordo com as
  /// variaveis [_titular] e [_saldo]
  @override
  String toString() {
    return 'Titular: $_titular, Saldo Disponivel: R\$ ${_saldo.toStringAsFixed(2)}';
  }
}

/// Exceção que será lançada caso uma transação inválida (saldo insuficiente)
/// seja requerida
class SaldoInsuficienteException extends ContaBancariaExceptions
    implements Exception {
  late final String message;

  SaldoInsuficienteException(this.message);

  @override
  String toString() {
    return 'SaldoInsuficienteException: $message';
  }
}

/// Exceção que será lançada caso uma transação com valores inválidos (numeros negativos)
/// seja requerida
class ValorInvalidoException extends ContaBancariaExceptions
    implements Exception {
  late final String message;

  ValorInvalidoException(this.message);

  @override
  String toString() {
    return 'ValorInvalidoException: $message';
  }
}
