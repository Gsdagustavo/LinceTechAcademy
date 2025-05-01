import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../model/pessoa.dart';
import '../model/pessoa_states.dart';
import '../model/tipos_sanguineos.dart';

/// Tile que será utilizado para listar as pessoas
class PessoaTile extends StatelessWidget {
  const PessoaTile({super.key, required this.pessoa});

  final Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = TextStyle(color: Colors.white);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colorScheme.primary,
        ),

        child: ListTile(
          leading: Icon(Icons.person, color: Colors.white),

          // title with the person's name
          title: Text(pessoa.nome, style: textStyle),

          // subtitle with other infos
          subtitle: Column(
            children: [
              const SizedBox(height: 5),
              _customField(icon: Icons.email, value: pessoa.email),
              _customField(icon: Icons.phone, value: pessoa.telefone),
              _customField(icon: FontAwesomeIcons.github, value: pessoa.github),
              _customField(
                icon: Icons.bloodtype,
                value: TipoSanguineo.fromTipo(pessoa.tipoSanguineo),
              ),
            ],
          ),

          // remove person icon
          trailing: IconButton(
            onPressed:
                () => showDialog(
                  context: context,
                  builder: (context) => _removePessoaDialog(context, pessoa),
                ),
            icon: Icon(Icons.delete, color: Colors.white),
            color: Colors.white,
            iconSize: 25,
          ),

          onTap: () => Navigator.pushNamed(context, '/detailsPessoa', arguments: pessoa),
        ),
      ),
    );
  }
}

Widget _customField({required IconData? icon, required String value}) {
  final textStyle = TextStyle(color: Colors.white);

  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(icon, color: Colors.white, size: 13),
      const SizedBox(width: 5),

      Expanded(child: Text(value, style: textStyle)),
    ],
  );
}

/// Dialog utilizado para confirmar a remoção de uma pessoa
Widget _removePessoaDialog(BuildContext context, Pessoa pessoa) {
  return AlertDialog(
    title: Text('Deseja remover a pessoa?'),
    actionsAlignment: MainAxisAlignment.spaceAround,

    actions: [
      // não remover a pessoa
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },

        child: Text('Não'),
      ),

      // remover a pessoa
      TextButton(
        onPressed: () {
          // remove a pessoa da lista
          Provider.of<PessoaStates>(context, listen: false).removePessoa(pessoa);

          // fecha a caixa de dialogo
          Navigator.of(context).pop();

          // mostra uma snackbar confirmando a remoção da pessoa
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Pessoa removida')));
        },

        child: Text('Sim'),
      ),
    ],
  );
}
