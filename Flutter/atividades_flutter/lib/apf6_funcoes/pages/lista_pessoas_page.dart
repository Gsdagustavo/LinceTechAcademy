import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_appbar.dart';
import '../components/pessoa_tile.dart';
import '../model/pessoa.dart';
import '../model/pessoa_states.dart';

class ListaPessoasPage extends StatefulWidget {
  const ListaPessoasPage({super.key});

  @override
  State<ListaPessoasPage> createState() => _ListaPessoasPageState();
}

class _ListaPessoasPageState extends State<ListaPessoasPage> {
  var _pessoas = <Pessoa>[];
  final _searchController = TextEditingController();

  /// filtra a lista de pessoas de acordo com o nome
  void _searchPersonByName() {
    setState(() {
      List<Pessoa> searchResults =
          Provider.of<PessoaStates>(context, listen: false).pessoas
              .where((pessoa) => pessoa.nome.toLowerCase().contains(_searchController.text.trim()))
              .toList();

      _pessoas = searchResults;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _pessoas = Provider.of<PessoaStates>(context, listen: false).pessoas;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Consumer<PessoaStates>(
      builder:
          (context, pessoaStates, child) => GestureDetector(
            onTap: FocusScope.of(context).unfocus,

            child: Scaffold(
              backgroundColor: colorScheme.surface,

              appBar: MyAppBar(title: 'Listar Pessoas'),

              body: Column(
                children: [
                  // search bar
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (_) => _searchPersonByName(),

                      decoration: InputDecoration(
                        label: Text('Pesquisar pessoa'),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),

                  // lista de pessoas
                  Expanded(
                    child:
                        _pessoas.isEmpty
                            ? Center(child: Text('Nenhuma pessoa encontrada'))
                            : ListView.builder(
                              itemCount: _pessoas.length,
                              itemBuilder: (context, index) {
                                return PessoaTile(pessoa: _pessoas[index]);
                              },
                            ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
