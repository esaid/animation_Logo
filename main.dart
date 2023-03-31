import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Logo extends StatelessWidget {
  const Logo({super.key});
  @override
  Widget build(BuildContext context) {
    return const FlutterLogo(
      size: 90.0,
      textColor: Colors.black,
      style: FlutterLogoStyle.stacked,
      curve: Curves.bounceInOut,
      duration: Duration(seconds: 2),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected; // logo appuye
        });
      },
      child: Column(
        children: [
          Logo(), // affichage Logo
          Center(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: selected ? 150.0 : 155.0, // logo appuye
                height: selected ? 150.0 : 155.0, // on modifie la taille
                alignment: Alignment.center,
                curve: Curves.bounceOut, // effet de rebondissement
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // bord arrondi
                  border: selected // logo appuye  on change la couleur
                      ? Border.all(
                          width: 3,
                          color: Colors.amber,
                          style: BorderStyle.solid)
                      : Border.all(
                          width: 3,
                          color: Colors.purpleAccent,
                          style: BorderStyle.solid),
                  color: selected ? Colors.blue : Colors.blueAccent,
                ),
                child: const Logo(), // affichage Logo
              ),
            ),
          ),
        ],
      ),
    );
  }
}
