import 'package:flutter/material.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('My App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
      ),

      // Centralizar tudo
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // primeira row com os 3 quadrados
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Quadrado(color: Colors.red),
              Quadrado(color: Colors.green),
              Quadrado(color: Colors.blue),
            ],
          ),

          // segunda row com os retangulos
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.yellow,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Retangulo(color: Colors.deepPurple),
                    Retangulo(color: Colors.blue),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Quadrado(color: Colors.deepPurple),
                        Quadrado(color: Colors.blue),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ultima row com o quadrado preto
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: 100,
                  color: Colors.grey,
                  alignment: Alignment.center,
                  child: Quadrado(color: Colors.black),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Quadrado extends StatelessWidget {
  const Quadrado({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(8),
      color: color,
    );
  }
}

class Retangulo extends StatelessWidget {
  const Retangulo({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      margin: EdgeInsets.all(8),
      color: color,
    );
  }
}
