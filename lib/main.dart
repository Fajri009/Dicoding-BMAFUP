import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const Codelab());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstScreen()
    );
  }
}

// Contoh StatelessWidget
class Heading extends StatelessWidget {
  final String text;

  const Heading({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold
      ),
    );
  }
}

// Contoh StatefulWidget
class BiggerText extends StatefulWidget {
  final String text;

  const BiggerText({
    super.key,
    required this.text
  });

  @override
  State<StatefulWidget> createState() => _BiggerTextState();
}

class _BiggerTextState extends State<BiggerText> {
  double _textSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.text,
          style: TextStyle(fontSize: _textSize),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _textSize += 16.0;
            });
          },
          child: const Text("Perbesar"),
        )
      ],
    );
  }
}

// Contoh Scaffold
class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white
            ),
            onPressed: () {}
          )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white
          ),
          onPressed: () {}
        ),
      ),
      body: const RowColumn(),
        // const Center(
        //   child: Text("Hello World!"),
        // ),
      // Floating Action Button (FAB)
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

// Contoh Container
class Contain extends StatelessWidget {
  const Contain({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.green,
          width: 3
        ),
        // borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 6),
            blurRadius: 10
          )
        ]
      ),
      // color: Colors.red,
      // width: 200,
      // height: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: const Text(
        "Hi",
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}

// Contoh Row dan Column
class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.share),
            Icon(Icons.thumb_up),
            Icon(Icons.thumb_down)
          ],
        ), 
        Column(
          children: [
            Text(
              "Sebuah Judul",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text("Lorem ipsum dolor sit amet")
          ],
        )
      ],
    );
  }
}

// Codelab
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