import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      body: const Contain(),
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