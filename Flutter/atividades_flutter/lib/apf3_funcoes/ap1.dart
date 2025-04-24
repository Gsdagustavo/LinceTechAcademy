import 'package:flutter/material.dart';

void main() {
  runApp(_MeuAppFormulario());
}

class _MeuAppFormulario extends StatelessWidget {
  const _MeuAppFormulario({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: _LoginPage(),
    );
  }
}

class _LoginPage extends StatefulWidget {
  const _LoginPage({super.key});

  @override
  State<_LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  final _formKey = GlobalKey<FormState>();

  // controllers to get the text of the fields
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  bool inativo = true;

  // save what name and age are valid
  String? savedName;
  int? savedAge;
  bool? savedInativo;

  // shows a custom snackbar with the given message
  void showCustomSnackbar({required String message, bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(milliseconds: 1500),
        backgroundColor: isError ? Colors.red.shade500 : Colors.black87,
      ),
    );
  }

  // valida o nome baseado em alguns criterios
  String? nameValidator(String? name) {
    // checar se o nome esta vazio
    if (name?.isEmpty ?? true) {
      return 'Nome inválido';
    }

    // checar se o nome tem menos de 3 caracteres
    if (name!.length < 3 ?? true) {
      return 'Nome não pode ter menos de 3 letras';
    }

    final primeiraLetra = name[0] ?? '';

    // checar se esta capitalizado (primeira letra maiuscula)
    if (primeiraLetra != primeiraLetra.toUpperCase()) {
      return 'Nome deve começar com letra maiúscula';
    }

    return null;
  }

  // valida a idade baseado em alguns criterios
  String? ageValidator(String? age) {
    int? intAge = int.tryParse(age ?? '');

    // checa se a idade é nula
    if (intAge == null) {
      return 'Idade inválida';
    }

    // mentiras puras
    if (intAge > 150 || intAge < 0) {
      return 'Mentiroso';
    }

    // checa se o usuario é menor de idade
    if (intAge < 18) {
      return 'Permitidos apenas maiores de 18 anos';
    }

    return null;
  }

  void sendForms() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        savedName = nameController.text;
        savedAge = int.parse(ageController.text);
        savedInativo = inativo;
      });
      showCustomSnackbar(message: 'Dados enviados com sucesso');

      FocusScope.of(context).unfocus();
    } else {
      showCustomSnackbar(message: 'Erro ao enviar os dados', isError: true);
    }

    nameController.clear();
    ageController.clear();
  }

  bool get isFormsSaved {
    return savedName != null && savedAge != null && savedInativo != null;
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      // caso o usuario esteja focalizado em alguma caixa de texto, e clique
      // em algum outro lugar da tela, o foco sai da caixa de texto
      onTap: FocusScope.of(context).unfocus,

      // scaffold principal onde ficam os widgets
      child: Scaffold(
        // centralizar
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),

            // listview para quem, caso o conteudo nao caiba na tela, o usuario
            // podera rolar para baixo para ver o resto do conteudo
            child: ListView(
              children: [
                Column(
                  children: [
                    // spacing
                    const SizedBox(height: 150),

                    // coluna conde estao os textos de introducao
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // login text
                        Text(
                          'Login',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: 50,
                          ),
                        ),

                        // subtitle
                        Text(
                          'Insira seus dados',
                          style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 75),

                    // Form para validacao dos dados do usuario
                    Form(
                      key: _formKey,

                      // faz com que os textos sejam validados sempre que o
                      // usuario digitar algo
                      autovalidateMode: AutovalidateMode.onUserInteraction,

                      child: Column(
                        children: [
                          // name text field
                          WidgetFormulario(
                            validator: nameValidator,
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            label: 'Nome',
                            icon: Icons.person,
                          ),

                          const SizedBox(height: 25),

                          // age text field
                          WidgetFormulario(
                            validator: ageValidator,
                            controller: ageController,
                            keyboardType: TextInputType.number,
                            label: 'Idade',
                            icon: Icons.timer,
                          ),

                          const SizedBox(height: 25),
                        ],
                      ),
                    ),

                    // checkbox para alternar entre Ativo e Inativo
                    Row(
                      children: [
                        Checkbox(
                          value: inativo,
                          onChanged: (value) {
                            setState(() {
                              inativo = value!;
                            });
                          },
                        ),

                        Text(inativo ? 'Ativo' : 'Inativo'),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // botao para salvar os dados
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: sendForms,
                            child: Text('Salvar'),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // exibe uma caixa contendo as informacoes do usuario
                    // caso ele esteja salvo
                    if (isFormsSaved)
                      UserData(
                        age: savedAge!,
                        name: savedName!,
                        inativo: !savedInativo!,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// classe padrao para criar um widget de formulario (TextFormField)
class WidgetFormulario extends StatelessWidget {
  const WidgetFormulario({
    super.key,
    required this.validator,
    required this.controller,
    required this.keyboardType,
    required this.label,
    required this.icon,
  });

  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,

      decoration: InputDecoration(
        border: OutlineInputBorder(),
        label: Text(label),
        suffixIcon: Icon(icon),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({
    super.key,
    required this.age,
    required this.name,
    required this.inativo,
  });

  final int age;
  final String name;
  final bool inativo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: inativo ? Colors.grey : Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // name text
            Text(
              'Nome: $name',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            // age text
            Text(
              'Idade: $age',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            // inativo text
            Text(
              inativo ? 'Inativo' : 'Ativo',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
