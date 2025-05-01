import 'package:flutter/material.dart';

import '../components/my_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: colorScheme.surface,

      appBar: const MyAppBar(title: 'Início'),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// botão que leva à página de adicionar pessoas
            CustomButton(label: 'Adicionar pessoa', route: '/addPessoa'),

            /// botão que leva à página de listar pessoas
            CustomButton(label: 'Listar pessoas', route: '/listaPessoas'),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.route});

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(label, style: TextStyle(color: Colors.black87)),
    );
  }
}
