import 'package:flutter/material.dart';

import '../components/base_form.dart';
import '../components/my_appbar.dart';
import '../model/pessoa.dart';

/// This is a page that contains text fields for changing a person's attributes, such as name, email and others
class DetailsPessoaPage extends StatelessWidget {
  const DetailsPessoaPage({super.key, required this.pessoa});

  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,

      child: Scaffold(
        /// App bar
        appBar: const MyAppBar(title: 'Adicionar Pessoa'),

        /// fields
        body: BaseForm(pessoa: pessoa),
      ),
    );
  }
}
