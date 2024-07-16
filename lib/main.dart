import 'dart:ui';

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
        home: const InputWidget()
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

// Contoh Button
class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<StatefulWidget> createState() => _Button();
}

class _Button extends State<Button> {
  String? language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
              onPressed: () {},
              child: const Text("Tombol")
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Text Button"),
          ),
          OutlinedButton(
              onPressed: () {},
              child: const Text("Outlined Button")
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.volume_up),
            tooltip: "Increase volume by 10", // sebagai hint
          ),
          DropdownButton(
              items: const [
                DropdownMenuItem(value: "Dart", child: Text("Dart")),
                DropdownMenuItem(value: "Kotlin", child: Text("Kotlin")),
                DropdownMenuItem(value: "Swift", child: Text("Swift"))
              ],
              value: language,
              hint: const Text("Select Language"),
              onChanged: (String? value) {
                setState(() {
                  language = value;
                });
              }
          )
        ],
      ),
    );
  }
}

// Contoh Input Widget
class InputWidget extends StatefulWidget {
  const InputWidget({super.key});

  @override
  State<StatefulWidget> createState() => _InputWidget();
}

class _InputWidget extends State<InputWidget> {
  String _name = ""; // TextField
  bool lightOn = false; // Switch
  String? language; // Radio
  bool agree = false; // Checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Widget"),
      ),
      // body: Column(
      //   children: [
      //     TextField(
      //       onChanged: (String value) {
      //         setState(() {
      //           _name = value;
      //         });
      //       },
      //       // Jika tidak ingin mengambil nilai setiap perubahan, tetapi hanya ketika seluruh input sudah selesai di-submit
      //       // onSubmitted: (String value) {
      //       //   setState(() {
      //       //     _name = value;
      //       //   });
      //       // },
      //     )
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: "Write your name here",
                labelText: "Your Name"
              ),
              onChanged: (String value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Switch(
              value: lightOn,
              onChanged: (bool value) {
                setState(() {
                  lightOn = value;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(lightOn ? "Light On" : "Light Off"),
                      duration: const Duration(seconds: 1)
                    )
                );
              }
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: Radio<String>(
                value: "Dart",
                groupValue: language,
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    showSnackbar();
                  });
                },
              ),
              title: const Text("Dart"),
            ),
            ListTile(
              leading: Radio<String>(
                value: "Kotlin",
                groupValue: language,
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    showSnackbar();
                  });
                },
              ),
              title: const Text("Kotlin"),
            ),
            ListTile(
              leading: Radio<String>(
                value: "Swift",
                groupValue: language,
                onChanged: (String? value) {
                  setState(() {
                    language = value;
                    showSnackbar();
                  });
                },
              ),
              title: const Text("Swift"),
            ),
            ListTile(
              leading: Checkbox(
                value: agree,
                onChanged: (bool? value) {
                  setState(() {
                    agree = value!;
                  });
                },
              ),
              title: const Text("Agree / Disagree"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text("Hello $_name"),
                    );
                  }
                );
              },
              child: const Text("Submit")
            )
          ],
        ),
      ),
    );
  }

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$language selected'),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}