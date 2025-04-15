import 'dart:math';

/// Obs: um dos requisitos da atividade é criar uma estrutura extra para
/// armazenar as figuras duplicadas.
///
/// Entretanto, eu escolhi outra aproximação mais eficiente usando Sets e
/// métodos auxiliares

void main() async {
  final album = Album();

  album.mostrarTodasFiguras();
  album.mostrarFigurasColadas();
  album.mostrarFigurasRepetidas();

  album.completarAlbum();

  album.mostrarTodasFiguras();
  album.mostrarFigurasColadas();
  album.mostrarFigurasRepetidas();
}

/// Lista contendo 20 figuras
/// Obs: para gerar as figuras, pedi auxilio ao ChatGPT para reduzir o trabalho.
/// E ele teve um otimo gosto ao selecionar as musicas (:
final listaFiguras = [
  Figura('Echoes', 'pkflyd123'), // minha segunda favorita (:
  Figura('Bohemian Rhapsody', 'qn123'),
  Figura('Stairway to Heaven', 'lz456'),
  Figura('Hotel California', 'eag789'), // minha favorita (:
  Figura('Imagine', 'jl321'),
  Figura('Smells Like Teen Spirit', 'nirv234'),
  Figura('Comfortably Numb', 'pk456'),
  Figura('Sweet Child O\' Mine', 'gnr567'),
  Figura('Back in Black', 'acdc890'),
  Figura('One', 'metal111'),
  Figura('Hey Jude', 'beat999'),
  Figura('Like a Rolling Stone', 'bd101'),
  Figura('Losing My Religion', 'rem202'),
  Figura('Wonderwall', 'oas303'),
  Figura('Creep', 'rh404'),
  Figura('Come As You Are', 'nirv505'),
  Figura('Time', 'pk606'),
  Figura('Karma Police', 'rh707'), // minha terceira favorita (:
  Figura('Another One Bites the Dust', 'qn808'),
  Figura('Wish You Were Here', 'pk909'),
];

/// Classe que representa uma figura de um album
class Figura {
  String _nome;
  String _codigo;

  Figura(this._nome, this._codigo);

  String get codigo => _codigo;

  set codigo(String value) {
    _codigo = value;
  }

  String get nome => _nome;

  @override
  String toString() {
    return 'Nome: $nome, Código: $codigo';
  }
}

/// Classe que representa um pacote de figuras. Possui uma lista de figuras
/// iniciais que será populada aleatoriamente ao ser instanciado.
class PacoteFiguras {
  static final random = Random();
  static const figurasIniciais = 4;
  final _figuras = <Figura>[];

  PacoteFiguras() {
    /// Adiciona [figurasIniciais] figuras aleatorias à lista de figuras
    for (int i = 0; i < figurasIniciais; i++) {
      _figuras.add(_escolherFiguraAleatoria());
    }
  }

  get figuras => _figuras;

  /// Retorna uma figura aleatoria da lista de figuras disponiveis
  static _escolherFiguraAleatoria() {
    return listaFiguras[random.nextInt(listaFiguras.length)];
  }
}

/// Classe que representa um album de figurinhas
///
/// Para a lógica de mostrar apenas as figuras únicas (coladas), eu transformei
/// a lista com todas as figuras em um set e depois transformei em uma lista de novo,
/// removendo todos os elementos duplicados
class Album {
  static final random = Random();

  final _todasFiguras = <Figura>[];

  Album() {
    abrirPacoteFiguras();
  }

  /// Mostra todas as figuras coladas (sem repetição)
  void mostrarFigurasColadas() {
    /// Remove todas as duplicatas ao instanciar um Set com os valores da lista
    final setFigurasUnicas = _todasFiguras.toSet();

    /// Transforma o Set (sem duplicatas) em uma lista de novo e ordena os elementos
    /// com base no código
    final listaFigurasUnicas = _ordenarPorCodigo(
      lista: setFigurasUnicas.toList(),
    );

    _mostrarFiguras(
      lista: listaFigurasUnicas,
      mensagem: '\nFiguras coladas:\n',
    );
  }

  /// Mostra todas as figuras (com repetição)
  void mostrarTodasFiguras() {
    _mostrarFiguras(
      lista: _todasFiguras,
      mensagem: 'Todas as Figuras (com repetição):\n',
    );
  }

  /// Mostra todas as figuras repetidas na lista de figuras
  void mostrarFigurasRepetidas() {
    final vistos = <Figura>[];
    final duplicados = <Figura>[];

    for (final figura in _todasFiguras) {
      if (vistos.contains(figura)) {
        duplicados.add(figura);
        continue;
      }

      vistos.add(figura);
    }

    _mostrarFiguras(lista: duplicados, mensagem: '\nFiguras repetidas:\n');
    print('\nNúmero de figuras repetidas: ${duplicados.length}\n');
  }

  /// Método auxiliar para printar um [Iterable] e uma mensagem
  void _mostrarFiguras({
    required List<Figura> lista,
    required String mensagem,
  }) {
    if (lista.isEmpty) {
      print('\nNenhuma figura.\n');
      return;
    }

    print(mensagem);

    /// Ordena a lista
    _ordenarPorCodigo(lista: lista);

    for (final (i, figura) in _ordenarPorCodigo(lista: lista).indexed) {
      print('Figura #${i + 1}\n   > $figura');
    }
  }

  /// Recebe uma lista de figuras como argumento, e ordena a lista em ordem alfabética
  /// de acordo com os códigos das figuras
  static List<Figura> _ordenarPorCodigo({required List<Figura> lista}) {
    return lista..sort((a, b) => a.codigo.compareTo(b.codigo));
  }

  /// Abre pacotes de figuras até completar o álbum
  void completarAlbum() {
    print('\nComeçando a completar o álbum...\n');

    while (!isAlbumCompleto) {
      abrirPacoteFiguras();
    }

    print('\nÁlbum completo!\n');
  }

  /// Instancia um novo [PacoteFiguras], que ao ser intanciado, cria uma lista
  /// com 4 figuras. Após isso, adiciona as 4 figuras criadas à lista de figuras
  void abrirPacoteFiguras() {
    final pacote = PacoteFiguras();
    _todasFiguras.addAll(pacote.figuras);
  }

  /// Getter que retorna se o álbum possui todas as 20 figuras coladas
  bool get isAlbumCompleto {
    final figurasColadas = _todasFiguras.toSet();
    return listaFiguras.every((figura) => figurasColadas.contains(figura));
  }
}
