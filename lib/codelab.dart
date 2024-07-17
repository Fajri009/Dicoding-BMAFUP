import 'package:dicoding_bmafup/detail_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Codelab());
}

class Codelab extends StatelessWidget {
  const Codelab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wisata Bandung",
      theme: ThemeData(),
      home: const DetailScreen(),
    );
  }
}