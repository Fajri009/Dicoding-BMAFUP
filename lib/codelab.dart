import 'dart:ui';

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

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea( // SafeArea untuk margin atas menyesuaikan status bar device
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // stretch = match_parent di Android
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: const Text(
                    "Farm House Lembang",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ), // Judul
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8.0),
                        Text("Open Everyday")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        SizedBox(height: 8.0),
                        Text("09.00 - 20:00")
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.attach_money_rounded),
                        SizedBox(height: 8.0),
                        Text("Rp 25.000")
                      ],
                    ),
                  ],
                ),
              ), // Informasi dari tempat wisata
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                    "Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0)
                ),
              ) // Deskripsi
            ],
          ),
        )
    );
  }
}