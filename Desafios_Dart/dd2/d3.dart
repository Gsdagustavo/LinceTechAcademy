void main() {

  /// Instancia uma biblioteca para controlar as músicas
  final biblioteca = BibliotecaMusicas();

  /// Instancia uma lista de músicas e a adiciona à lista de músicas da biblioteca
  final musicas = <Musica>[
    Musica('Echoes', 'Pink Floyd', 'Meddle', 1412),
    Musica('Hotel California', 'Eagles', 'Hotel California', 391), // minha favorita (:
    Musica('Eye In The Sky', 'The Alan Parsons Project', 'Eye In The Sky', 276),
    Musica('Maria Magdalena', 'Sandra', 'Sandra\'s 18 Greatest Hits', 240),
    Musica('Another Brick in the Wall, Pt.2', 'Pink Floyd', 'The Wall', 238),
    Musica('San Tropez', 'Pink Floyd', 'Meddle', 223)
  ];

  biblioteca.addMusicasFromList(musicas);

  /// Mostra todas as musicas registradas na biblioteca
  biblioteca.mostrarBiblioteca();

  const pesquisaTitulo = 'hotel california';
  const pesquisaAlbum = 'meddle';
  const pesquisaArtista = 'pink floyd';

  /// Realiza as pesquisas de acordo com as constantes declaradas anteriormente
  final pesquisa1 = biblioteca.buscarPorTitulo('hotel california');
  final pesquisa2 = biblioteca.buscarPorAlbum('meddle');
  final pesquisa3 = biblioteca.buscarPorArtista('pink floyd');

  /// Mostra os resultados das pesquisas
  print('Musicas com titulo $pesquisaTitulo:\n$pesquisa1');

  print('Musicas do album $pesquisaAlbum:');
  biblioteca.mostrarMusicas(pesquisa2);

  print('Musicas do artista $pesquisaArtista:');
  biblioteca.mostrarMusicas(pesquisa3);
}

/// Classe que representa uma música em uma biblioteca de músicas
class Musica {

  final String _titulo;
  final String _nomeArtista;
  final String _nomeAlbum;
  final int _duracao;

  Musica(this._titulo, this._nomeArtista, this._nomeAlbum, this._duracao);

  String get titulo => _titulo;
  String get nomeArtista => _nomeArtista;
  String get nomeAlbum => _nomeAlbum;
  int get duracao => _duracao;

  /// Retorna uma string formatada com os minutos e segundos de uma música,
  /// de acordo com sua duração em segundos
  String get duracaoFormatada {
    final minutos = _duracao ~/ 60;
    final segundos = _duracao % 60;

    return '${minutos}m ${segundos}s';
  }

  @override
  String toString() {
    return 'Titulo: $titulo\nArtista: $nomeArtista\nAlbum: $nomeAlbum\nDuracao: $duracaoFormatada\n';
  }
}

/// Classe controladora de uma biblioteca de músicas
///
/// Permite adicionar músicas à biblioteca com os métodos [addMusicaFromMusica],
/// [addMusicaFromAttributes] e [addMusicasFromList]
///
/// Além disso, permite buscar musicas na biblioteca com os métodos
/// [buscarPorTitulo], [buscarPorAlbum] e [buscarPorArtista]
class BibliotecaMusicas {

  /// Lista para manter registro das músicas cadastradas
  final _musicasDisponiveis = <Musica>[];

  /// Adiciona uma música à lista de músicas por referência
  void addMusicaFromMusica(Musica musica) {
    _musicasDisponiveis.add(musica);
  }

  /// Instancia uma música de acordo com os argumentos passados
  /// e a adiciona à lista de músicas
  void addMusicaFromAttributes(String titulo, String nomeArtista, String nomeAlbum, int duracao) {
    final musica = Musica(
        titulo,
        nomeArtista,
        nomeAlbum,
        duracao
    );

    _musicasDisponiveis.add(musica);
  }

  /// Adiciona uma lista de músicas à lista de músicas de uma só vez
  void addMusicasFromList(Iterable<Musica> musicas) {
    _musicasDisponiveis.addAll(musicas);
  }

  /// Retorna uma [Musica] de acordo com o título passado como argumento.
  ///
  /// Caso a música não exista, retorna [null]
  Musica? buscarPorTitulo(String titulo) {
    try {
      return _musicasDisponiveis.firstWhere((musica) => musica.titulo.toUpperCase() == titulo.toUpperCase());
    } catch (e) {
      return null;
    }
  }

  /// Retorna uma lista de [Musica] de acordo com o nome do album passado como argumento.
  ///
  /// Caso não exista nenhuma [Musica] de acordo com o nome do album, retorna [null]
  List<Musica> buscarPorAlbum(String album) {
    return _musicasDisponiveis.
      where((musica) =>
      musica.nomeAlbum.toUpperCase() == album.toUpperCase())
      .toList();
  }

  /// Retorna uma lista de [Musica] de acordo com o nome do artista passado como argumento.
  ///
  /// Caso não exista nenhuma [Musica] de acordo com o nome do artista, retorna uma lista vazia
  List<Musica> buscarPorArtista(String artista) {
    return _musicasDisponiveis.
    where((musica) =>
    musica.nomeArtista.toUpperCase() == artista.toUpperCase())
        .toList();
  }

  /// Mostra todas as músicas registradas na biblioteca
  void mostrarBiblioteca() {
    print('Músicas cadastradas:\n');
    mostrarMusicas(_musicasDisponiveis);
  }

  /// Método auxiliar para mostrar as músicas de uma lista
  void mostrarMusicas(List<Musica> musicas) {
    for (final (index, musica) in musicas.indexed) {
      print('${index + 1}#\n$musica');
    }
  }
}