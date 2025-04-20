import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const _MyApp());
}

int tentativas = 2;
bool won = false;

void resetGame() {
  tentativas = 2;
  won = false;
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ap1',
      debugShowCheckedModeBanner: false,

      routes: {
        '/gameover':
            (context) => GameEndScreen(color: Colors.red, text: 'Você Perdeu!'),
        '/win':
            (context) =>
                GameEndScreen(color: Colors.green, text: 'Você Venceu!'),
        '/gamescreen': (context) => GameScreen(),
      },

      home: GameScreen(),
    );
  }
}

/// Tela do jogo
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    final correctIndex = Random().nextInt(3);
    final buttonNames = ['A', 'B', 'C'];

    // coloquei esse print pra ver se o random estava funcionando
    print(correctIndex);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('ap2', style: TextStyle(color: Colors.white)),
      ),

      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SelectionButton(
                        isChosenButton: index == correctIndex,
                        name: buttonNames[index],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Classe geral para mostrar uma tela apos o fim de jogo, podendo ser customizada
/// com os parametros adicionais, fazendo com que ela seja flexivel para mostrar
/// tanto a tela de Win como a de Game Over
class GameEndScreen extends StatelessWidget {
  const GameEndScreen({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(color: Colors.white, fontSize: 50)),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                tentativas = 2;
                won = false;
                Navigator.pushNamed(context, '/gamescreen');
              },
              child: const Text('Jogar Novamente'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Classe que representa os botoes que o usuario pode selecionar
class SelectionButton extends StatefulWidget {
  const SelectionButton({
    super.key,
    required this.isChosenButton,
    required this.name,
  });

  final bool isChosenButton;
  final String name;

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  Color _color = Colors.blue;
  late final bool _isRightButton;
  late String _name;
  late bool _isDisabled = false;

  void _onPressed() {
    if (!_isDisabled) {
      setState(() {
        if (_isRightButton && !won) {
          _name = 'Acertou!';
          _color = Colors.green;
          won = true;
          Navigator.pushNamed(context, '/win');
        } else {
          _name = 'Errou!';
          _color = Colors.red;
          tentativas--;

          if (tentativas <= 0 && !won) {
            Navigator.pushNamed(context, '/gameover');
          }
        }

        _isDisabled = true;
        print('Tentativas: $tentativas');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _isRightButton = widget.isChosenButton;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: _color),
      child: Text(_name, style: TextStyle(color: Colors.white)),
    );
  }
}
