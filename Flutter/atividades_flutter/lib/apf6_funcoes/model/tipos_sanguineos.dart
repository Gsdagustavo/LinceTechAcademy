enum TipoSanguineo {
  a_Positivo,
  a_Negativo,
  b_Positivo,
  b_Negativo,
  o_Positivo,
  o_Negativo,
  ab_Positivo,
  ab_Negativo;

  static TipoSanguineo fromString(String? value) {
    return TipoSanguineo.values.firstWhere(
      (tipo) => tipo.name == value,
      orElse: () => TipoSanguineo.o_Negativo,
    );
  }

  static String fromTipo(TipoSanguineo tipo) {
    final s1 = tipo.toString().split('.');
    final s = s1.last.split('_');

    final prefixo = s.first.toUpperCase();
    final sufixo = s.last;

    return '$prefixo $sufixo';
  }
}
