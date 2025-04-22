import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(_MyApp());
}

const innerContainerWidth = 50;
const innerContainerHeight = 50;

const outerContainerWidth = 100;
const outerContainerHeight = 100;

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      home: _HomePage(),
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ap2', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      body: Center(

        /// aqui eu usei um listview pois nao tinha espaco na tela para
        /// mostrar todos os exemplos (estava dando pixel overflow)
        ///
        /// Obs: eu uso meu celular para testar todos os programas em flutter
        /// que eu escrevo :)
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                /// primeiro layout
                stackContainer(
                  backgroundColor: Colors.grey,
                  colors: [Colors.red, Colors.green, Colors.blue],
                ),

                /// segundo layout
                stackContainer(
                  backgroundColor: Colors.black,
                  colors: [Colors.cyan, Colors.purple, Colors.yellow],
                ),

                /// terceiro layout
                stackContainer(
                  backgroundColor: Colors.transparent,
                  colors: [Colors.red, Colors.blue, Colors.yellow],
                ),

                /// quarto layout
                stackContainer(
                  backgroundColor: Colors.white,
                  colors: [
                    Colors.deepPurple,
                    Colors.deepOrange,
                    Colors.yellow,
                    Colors.lightGreen,
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget stackContainer({
  required Color backgroundColor,
  required List<Color> colors,
}) {
  return Container(
    margin: const EdgeInsets.all(8),

    width: outerContainerHeight.toDouble(),
    height: outerContainerWidth.toDouble(),

    color: backgroundColor,

    child: Stack(
      alignment: Alignment.center,

      children: [
        // mais em cima, à esquerda
        Positioned(
          left: 12,
          top: 12,
          child: Container(
            width: innerContainerWidth.toDouble(),
            height: innerContainerHeight.toDouble(),
            color: colors[0],
          ),
        ),

        // ainda em cima e à esquerda
        Positioned(
          left: 18,
          top: 18,
          child: Container(
            width: innerContainerWidth.toDouble(),
            height: innerContainerHeight.toDouble(),
            color: colors[1],
          ),
        ),

        // ao centro
        Container(
          width: innerContainerWidth.toDouble(),
          height: innerContainerHeight.toDouble(),
          color: colors[2],
        ),

        // um pouco abaixo à direita
        Positioned(
          right: 18,
          bottom: 18,
          child: Container(
            width: innerContainerWidth.toDouble(),
            height: innerContainerHeight.toDouble(),
            color: colors.length > 3 ? colors[3] : Colors.transparent,
          ),
        ),
      ],
    ),
  );
}
