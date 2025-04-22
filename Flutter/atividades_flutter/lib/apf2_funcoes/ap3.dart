import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const _MyApp());
}

// defines a list of colors that can be used on the shape
final colorsList = [
  Colors.blue,
  Colors.amber,
  Colors.brown,
  Colors.green,
  Colors.cyan,
  Colors.indigo,
  Colors.deepPurple,
];

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: const _HomePage(),
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({super.key});

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  // 0 represents square, 100 represents circle
  double _shape = 0;

  // represents the color of the widget
  Color _color = Colors.red;

  // toggles the shape of the widget (square or circle)
  void _toggleShape() {
    setState(() {
      _shape = _shape == 0 ? 100 : 0;
    });
  }

  // changes the color attribute to a random color based on the colors list
  void _changeColor() {
    setState(() {
      _color = colorsList[Random().nextInt(colorsList.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    final shape = _shape == 0 ? 'Quadrado' : 'Circulo';

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              /// shape aleatorio button
              Expanded(
                child: _ChangesButton(
                  onTap: _toggleShape,
                  child: Text(
                    'Mudar para $shape',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              /// spacing
              const SizedBox(width: 25),

              /// cor aleatoria button
              Expanded(
                child: _ChangesButton(
                  onTap: _changeColor,
                  child: Text(
                    'Cor aleatória',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),

          // widget (square/circle)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),

              /// aqui eu usei um animated container para fazer com que a transicao
              /// de estados do objeto (circulo <-> quadrado, cores, etc) seja
              /// fluida.
              ///
              /// Eu sabia da existencia desse widget pois ja o usei em um projeto
              /// que estava fazendo para aprender Flutter
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                width: 100,
                height: 100,

                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_shape),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// button to handle all interactions
class _ChangesButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const _ChangesButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: child,
    );
  }
}
