import 'package:flutter/material.dart';

// defines a list of Named Colors that will be shown to the user
final _colorsList = [
  _NamedColor('Red', Colors.red),
  _NamedColor('Green', Colors.green),
  _NamedColor('Blue', Colors.blue),
  _NamedColor('Brown', Colors.brown),
  _NamedColor('Black', Colors.black),
  _NamedColor('Amber', Colors.amber),
  _NamedColor('Grey', Colors.grey),
  _NamedColor('Cyan', Colors.cyan),
  _NamedColor('Orange', Colors.orange),
  _NamedColor('Yellow', Colors.yellow),
];

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cores',
      debugShowCheckedModeBanner: false,

      routes: {
        // home page
        '/': (context) => const _HomePage(),

        // colors routes
        '/details': (context) {
          final namedColor = ModalRoute.of(context)!.settings.arguments as _NamedColor;
          return _ColorDetails(color: namedColor.color, colorName: namedColor.name);
        },
      },

      // defines the homepage as initial route
      initialRoute: '/',
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // appbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Choose a color', style: TextStyle(color: Colors.white)),
      ),

      // defines a list view of colors that the user can interact with
      body: ListView.builder(
        itemCount: _colorsList.length,
        itemBuilder: (context, index) {
          final namedColor = _colorsList[index];

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: _ColorTile(
              color: namedColor.color,
              colorName: namedColor.name,

              // navigate to the detailed color page
              onPressed: () {
                Navigator.pushNamed(context, '/details', arguments: namedColor);
              },
            ),
          );
        },
      ),
    );
  }
}

// tile to click to go to the color page
class _ColorTile extends StatelessWidget {
  const _ColorTile({super.key, required this.color, required this.onPressed, required this.colorName});

  final Color color;
  final String colorName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),

      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(child: Text(colorName, style: TextStyle(color: Colors.white))),
            const SizedBox(width: 100),
            ElevatedButton(onPressed: onPressed, child: Text('See color')),
          ],
        ),
      ),
    );
  }
}

// detailed color page
class _ColorDetails extends StatelessWidget {
  const _ColorDetails({super.key, required this.color, required this.colorName});

  final Color color;
  final String colorName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // color name text
            Text(colorName, style: TextStyle(color: Colors.white, fontSize: 50)),

            const SizedBox(height: 25),

            // button to go back to the home page
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },

              child: Text('Back to the Home Page', style: TextStyle(fontSize: 40)),
            ),
          ],
        ),
      ),
      backgroundColor: color,
    );
  }
}

// util class to keep track of the color with its name
class _NamedColor {
  final String name;
  final Color color;

  _NamedColor(this.name, this.color);
}
