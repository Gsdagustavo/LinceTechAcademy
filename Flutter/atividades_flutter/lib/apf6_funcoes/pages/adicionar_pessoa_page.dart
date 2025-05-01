import 'package:flutter/material.dart';

import '../components/base_form.dart';
import '../components/my_appbar.dart';

/// Página para adicionar uma pessoa, com os campos de texto necessários
class PaginaAdicionarPessoa extends StatelessWidget {
  const PaginaAdicionarPessoa({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,

      child: Scaffold(
        /// App bar
        appBar: const MyAppBar(title: 'Adicionar Pessoa'),

        /// fields
        body: BaseForm(),
      ),
    );
  }
}
