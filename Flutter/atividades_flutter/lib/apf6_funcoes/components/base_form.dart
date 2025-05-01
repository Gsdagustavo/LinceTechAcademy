import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../model/pessoa.dart';
import '../model/pessoa_states.dart';
import '../model/tipos_sanguineos.dart';
import '../util/validator.dart';
import 'custom_text_field.dart';

/// Este é um widget completo que tem todos os campos necessários para a criação ou alteração dos
/// dados de uma pessoa, de acordo com as especificações da questão proposta

class BaseForm extends StatefulWidget {
  const BaseForm({super.key, this.pessoa});

  final Pessoa? pessoa;

  @override
  State<BaseForm> createState() => _BaseFormState();
}

class _BaseFormState extends State<BaseForm> {
  /// key for validation
  final _formKey = GlobalKey<FormState>();

  /// text controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _githubController = TextEditingController();

  /// O- é o padrão
  TipoSanguineo? _selectedTipoSanguineo = TipoSanguineo.o_Negativo;

  @override
  void dispose() {
    /// dispose all text editing controllers
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  /// shows a custom snackbar with the given message
  void showCustomSnackbar({required String message, bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(milliseconds: 1500),
        backgroundColor: isError ? Colors.red.shade500 : Colors.black87,
      ),
    );
  }

  /// fetches the texts in the text fields and try to add a new person to the list
  void _sendForms(PessoaStates pessoaStates) {
    if (_formKey.currentState!.validate()) {
      debugPrint('Forms sent');

      final name = _nameController.text;
      final email = _emailController.text;
      final phone = _phoneController.text;
      final github = _githubController.text;
      final tipoSanguineo = _selectedTipoSanguineo;

      /// Cria uma nova pessoa a partir dos dados dos campos
      final Pessoa newPessoa = Pessoa(
        nome: name,
        email: email,
        telefone: phone,
        github: github,
        tipoSanguineo: tipoSanguineo ?? TipoSanguineo.o_Negativo,
      );

      /// caso uma pessoa seja passada como parametro para o BaseForms, entao essa pessoa sera alterada
      if (widget.pessoa != null) {
        pessoaStates.mudarPessoa(pessoa: widget.pessoa!, other: newPessoa);
        showCustomSnackbar(message: 'Dados alterados com sucesso!');
        return;
      }

      /// Caso já exista uma pessoa com as credenciais especificadas, retorna uma mensagem de erro
      if (pessoaStates.pessoas.contains(newPessoa)) {
        showCustomSnackbar(message: 'A pessoa já está cadastrada!', isError: true);
        return;
      }

      /// Cadastrar uma nova pessoa no sistema
      pessoaStates.addPessoa(newPessoa);
      showCustomSnackbar(message: 'Pessoa cadastrada com sucesso!');
    } else {
      /// Erro de validacao
      showCustomSnackbar(message: 'Dados inválidos!', isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      child: Padding(
        padding: const EdgeInsets.all(30.0),

        /// column that contains the text fields
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// coloquei esse Consumer para lembrar da sintaxe,
              /// apesar de não ser necessário para a resolução da questão
              Consumer<PessoaStates>(
                builder: (context, pessoaStates, child) {
                  return Text('Quantidade de pessoas cadastradas: ${pessoaStates.pessoas.length}');
                },
              ),

              const SizedBox(height: 25),

              // name text field
              CustomTextField(
                validator: Validator.validateName,
                label: 'Nome',
                iconData: Icons.person,
                controller: _nameController,
                textInputType: TextInputType.name,
                initialValue: widget.pessoa?.nome,
              ),

              /// email text field
              CustomTextField(
                validator: Validator.validateEmail,
                label: 'Email',
                iconData: Icons.email,
                controller: _emailController,
                textInputType: TextInputType.emailAddress,
                initialValue: widget.pessoa?.email,
              ),

              /// phone text field
              CustomTextField(
                validator: Validator.validatePhoneNumber,
                label: 'Telefone',
                iconData: Icons.phone,
                controller: _phoneController,
                textInputType: TextInputType.phone,
                initialValue: widget.pessoa?.telefone,
              ),

              /// github text field
              CustomTextField(
                validator: Validator.validateGithubLink,
                label: 'Github',
                iconData: FontAwesomeIcons.github,
                controller: _githubController,
                textInputType: TextInputType.url,
                initialValue: widget.pessoa?.github,
              ),

              /// tipo sanguineo menu
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.bloodtype),
                  Text('Tipo sanguíneo', style: TextStyle(fontSize: 18)),
                  DropdownMenu(
                    initialSelection: widget.pessoa?.tipoSanguineo ?? _selectedTipoSanguineo,
                    onSelected: (newValue) {
                      setState(() {
                        _selectedTipoSanguineo = newValue;
                      });
                    },
                    dropdownMenuEntries:
                        TipoSanguineo.values.map((tipo) {
                          return DropdownMenuEntry<TipoSanguineo>(
                            value: tipo,
                            label: TipoSanguineo.fromTipo(tipo),
                          );
                        }).toList(),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              /// send forms button
              Consumer<PessoaStates>(
                builder:
                    (_, pessoaStates, child) => ElevatedButton(
                      /// sets the button style
                      style: ElevatedButton.styleFrom(backgroundColor: colorScheme.primary),

                      /// if the user press the button, the _sendForms function will be executed and
                      /// the current state of PessoaStates will be passed as argument
                      onPressed: () => _sendForms(pessoaStates),
                      child: child,
                    ),

                child: Text(
                  widget.pessoa == null ? 'Enviar dados' : 'Alterar dados',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
