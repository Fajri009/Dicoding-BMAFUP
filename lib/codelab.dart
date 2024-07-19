import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() {
  runApp(const Codelab());
}

class Codelab extends StatelessWidget {
  const Codelab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wisata Bandung",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MainScreen(),
    );
  }
}