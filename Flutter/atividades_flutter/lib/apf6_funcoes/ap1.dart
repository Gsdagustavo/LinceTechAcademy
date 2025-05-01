import 'package:atividades_flutter/apf6_funcoes/pages/adicionar_pessoa_page.dart';
import 'package:atividades_flutter/apf6_funcoes/pages/details_pessoa_page.dart';
import 'package:atividades_flutter/apf6_funcoes/pages/lista_pessoas_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../apf2_funcoes/ap1.dart';
import 'model/pessoa.dart';
import 'model/pessoa_states.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

/// Usei um provider para "rastrear" o PessoaStates
void main() {
  runApp(ChangeNotifierProvider(create: (_) => PessoaStates(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: darkBlue)),
      debugShowCheckedModeBanner: false,

      /// Rotas para as telas do aplicativo
      routes: {
        '/': (context) => HomePage(),
        '/addPessoa': (context) => PaginaAdicionarPessoa(),
        '/listaPessoas': (context) => ListaPessoasPage(),
        '/detailsPessoa':
            (context) =>
                DetailsPessoaPage(pessoa: ModalRoute.of(context)!.settings.arguments as Pessoa),
      },

      /// Define a HomePage como rota inicial
      initialRoute: '/',
    );
  }
}
