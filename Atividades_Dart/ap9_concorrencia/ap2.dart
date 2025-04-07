Future<void> main() async {
  List<String> urls = [
    'https://example.com/imagem1.jpg',
    'https://example.com/imagem2.jpg',
    'https://example.com/imagem3.jpg',
  ];

  print('Baixando imagens...');

  await baixarImagens(urls);

  print('Download concluído!');
}

Future<void> baixarImagens(List<String> urls) async {
  for (int i = 0; i < urls.length; i++) {
    await Future.delayed(Duration(seconds: 1));
    print('Imagem <imagem${i + 1}> baixada com sucesso!');
  }
}