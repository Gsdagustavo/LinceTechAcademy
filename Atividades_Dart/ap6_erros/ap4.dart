void main() {
  try {
    final String nome = 'teste.txt';

    ArquivoTexto arquivoTexto = ArquivoTexto(nome);
    arquivoTexto.abrir();
  } catch (e) {
    print('Entrada invalida, digite um nome valido');
    rethrow;
  } finally {
    print('Fim');
  }
}

abstract class Arquivo {
  void abrir();
}

class ArquivoTexto implements Arquivo {
  late String _nome;

  ArquivoTexto(this._nome);

  @override
  void abrir() {
    try {
      print('Abrindo o arquivo $_nome...');
    } catch (e) {
      throw Exception('Erro ao abrir o arquivo $_nome');
    }
  }
}
