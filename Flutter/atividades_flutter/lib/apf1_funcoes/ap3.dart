/*

Durante a resolução desta atividade, aprendi bastante sobre Flutter e layouts,
além de ampliar muito os meus conhecimentos sobre Stateful Widgets.

Eu fiquei um pouco empolgado e adicionei um botão extra para restar o placar,
pois senti a necessidade de fazer isso para treinar ainda mais a prática usando
stful widgets

 */

import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

enum GameStates { win, lose, playing }

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: _GameWidget(),
    );
  }
}

class _GameWidget extends StatefulWidget {
  const _GameWidget();

  @override
  State<_GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<_GameWidget> {
  final random = Random();

  var botaoCorreto = 0;
  var tentativas = 0;

  int vitorias = 0;
  int derrotas = 0;

  GameStates gameState = GameStates.playing;

  @override
  void initState() {
    super.initState();
    // Escolher um número de 0 a 2 para identificar escolher o botão correto
    botaoCorreto = random.nextInt(3);
  }

  /// Tratar a tentativa do usuário
  void tentativa(int opcao) {
    setState(() {
      // Verificar se a opção escolhida esta correta
      if (opcao == botaoCorreto) {
        gameState = GameStates.win;
        vitorias++;
      } else {
        // Se estiver errada, incrementa o contador de clicks
        tentativas++;
      }

      // Se a quantidade de clicks for maior ou igual a 2, o usuário perdeu
      if (tentativas >= 2 && !(gameState == GameStates.lose)) {
        gameState = GameStates.lose;
        derrotas++;
      }
    });
  }

  /// retorna o jogo ao estado inicial
  void resetGame() {
    setState(() {
      tentativas = 0;

      gameState = GameStates.playing;
      botaoCorreto = random.nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Se o usuário ganhou, retorna a mensagem de sucesso com o fundo em verde
    // Se o usuário perdeu, retorna a mensagem de fracasso com o fundo em vermelho
    switch (gameState) {
      case GameStates.win:
        return _GameEndPage(
          color: Colors.green.shade800,
          text: 'Você Ganhou!',
          onPlayAgain: resetGame,
          vitorias: vitorias,
          derrotas: derrotas,
        );

      case GameStates.lose:
        return _GameEndPage(
          color: Colors.red.shade800,
          text: 'Você Perdeu!',
          onPlayAgain: resetGame,
          vitorias: vitorias,
          derrotas: derrotas,
        );
      case GameStates.playing:
    }

    // define quais letras (e quantos botoes) serao exibidos
    final letters = ['A', 'B', 'C'];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 100),

          _ContadorVitoriasEDerrotas(
            vitorias: vitorias,
            derrotas: derrotas,
            isOnGameEndScreen: false,
          ),

          const SizedBox(width: 100),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  resetGame();
                  vitorias = 0;
                  derrotas = 0;
                });
              },
              child: Text('Resetar contador'),
            ),
          ),

          const SizedBox(height: 250),

          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // adiciona os botoes na tela
              children: List.generate(letters.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => tentativa(index),
                      child: Text(letters[index]),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/// page que sera exibida apos o fim do jogo
class _GameEndPage extends StatelessWidget {
  const _GameEndPage({
    required this.color,
    required this.text,
    required this.onPlayAgain,
    required this.vitorias,
    required this.derrotas,
  });

  final Color color;
  final String text;
  final VoidCallback onPlayAgain;

  final int vitorias;
  final int derrotas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 200),

          _ContadorVitoriasEDerrotas(
            vitorias: vitorias,
            derrotas: derrotas,
            isOnGameEndScreen: true,
          ),

          const SizedBox(height: 100),

          // container
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  // texto que sera exibido (ganhou ou perdeu)
                  Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),

                  // espacamento
                  const SizedBox(height: 25),

                  // botao de jogar novamente
                  ElevatedButton(
                    onPressed: onPlayAgain,
                    child: Text(
                      'Jogar novamente',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContadorVitoriasEDerrotas extends StatelessWidget {
  const _ContadorVitoriasEDerrotas({
    required this.vitorias,
    required this.derrotas,
    required this.isOnGameEndScreen,
  });

  final int vitorias;
  final int derrotas;

  final bool isOnGameEndScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment:
            isOnGameEndScreen
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
        children: [
          Text(
            'Vitórias: $vitorias\nDerrotas: $derrotas',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
