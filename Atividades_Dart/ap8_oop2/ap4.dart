
/// Testar a implementação da classe [Calculadora]
void main(List<String> args) {

  // caso o usuário não passe nenhum argumento para a função main, o programa é encerrado
  if (args.isEmpty) {
    print('Entrada invalida');
    return;
  }
  
  try {
      
    double numero = double.parse(args[0]);
    print('O dobro de $numero é ${Calculadora.dobro(numero)}');

  } on FormatException catch (e) {
    print('$e: Entrada invalida');
  } on Exception catch (e, s) {
    print('Um erro inesperado ocorreu: $e\nStackTrace: $s');
  }
}

/// Classe abstrata (não pode ser instanciada) que possui um método estático ([dobro])
/// que retorna o dobro do número recebido como argumento
abstract class Calculadora {
  static double dobro(double numero) => numero * 2;
}