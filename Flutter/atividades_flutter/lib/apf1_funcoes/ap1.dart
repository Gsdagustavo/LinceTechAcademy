import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const _MyApp());
}

/// Define uma lista de cores
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
      title: 'ap1',
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('ap1', style: TextStyle(color: Colors.white)),
        ),

        body: Center(child: ColorfulButton()),
      ),
    );
  }
}

class ColorfulButton extends StatefulWidget {
  const ColorfulButton({super.key});

  @override
  State<ColorfulButton> createState() => _ColorfulButtonState();
}

class _ColorfulButtonState extends State<ColorfulButton> {
  late final VoidCallback _onPressed;

  final random = Random();

  late Color _color = colorsList[random.nextInt(colorsList.length - 1)];

  @override
  void initState() {
    super.initState();

    _onPressed = () {
      setState(() {
        _color = colorsList[random.nextInt(colorsList.length - 1)];
        print(_color);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      child: Text('Sortear cor', style: TextStyle(color: _color),),
    );
  }
}
