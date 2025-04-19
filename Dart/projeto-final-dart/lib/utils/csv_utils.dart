import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

/// Classe utilitaria para ler arquivos .csv
class CSVUtils {
  /// Caminho para a pasta com os arquivos dos sensores
  static const filePath = 'C:\\sensores';

  /// Retorna uma lista de Files de acordo com o caminho declarado em [filePath]
  static Future<List<File>> getFiles() async {
    final dir = Directory(filePath);

    /// Se o diretorio não existir, lança um [FileSystemException]
    if (!await dir.exists()) {
      throw FileSystemException('Diretorio não encontrado: ', filePath);
    }

    /// Retorna uma lista de files do formato .csv no diretório [filePath]
    return dir
        .listSync()
        .whereType<File>()
        .where((file) => file.path.toLowerCase().endsWith('.csv'))
        .toList();
  }

  /// Retorna uma lista que contém listas de dados de relatórios brutos
  ///
  /// Os dados devem ser tratados e assimilados em uma função separada
  static Future<List<List<dynamic>>> getLinhas({required File file}) async {
    /// Se o arquivo não existir, lança um [FileSystemException]
    if (!await file.exists()) {
      throw FileSystemException('Arquivo não encontrado: ${file.path}');
    }

    /// Contém os conteúdos do arquivo separados por vírgula
    final conteudo = await file.readAsString(encoding: latin1);

    /// Retorna as linhas do arquivo
    return CsvToListConverter().convert(conteudo);
  }
}
