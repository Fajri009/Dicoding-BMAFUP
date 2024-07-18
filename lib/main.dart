
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
        home: const Navigation()
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

// Contoh Image
class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              "https://picsum.photos/200/300",
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 30),
            Image.asset(
              "images/android.png",
              width: 200,
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}

// Contoh Font
class Font extends StatelessWidget {
  const Font({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Font"),
      ),
      body: const Text(
        "Custom Font",
        style: TextStyle(
          fontFamily: "Oswald",
          fontSize: 30
        ),
      ),
    );
  }
}

// Contoh ListView
class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '2',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '3',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '4',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Contoh ListView Dinamis
class ScrollingScreenDinamis extends StatelessWidget {
  const ScrollingScreenDinamis({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      body: ListView(
        children: numberList.map((number) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '$number', // Ditampilkan sesuai item
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        }).toList(), // perlu mengembalikan fungsi map menjadi objek List lagi
      ),
    );
  }
}

// Contoh ListView Builder
class ScrollingScreenListViewBuilder extends StatelessWidget {
  const ScrollingScreenListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      body: ListView.builder(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Contoh ListView Separated
class ScrollingScreenListViewSeparated extends StatelessWidget {
  const ScrollingScreenListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      body: ListView.separated(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}

// Contoh Expanded
class RainbowExpended extends StatelessWidget {
  const RainbowExpended({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.indigo,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}

// Contoh Flexible
class CompareExpandedFlexibleWidget extends StatelessWidget {
  const CompareExpandedFlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ExpandedWidget(),
                FlexibleWidget()
              ],
            ),
            Row(
              children: [
                ExpandedWidget(),
                ExpandedWidget(),
              ],
            ),
            Row(
              children: [
                FlexibleWidget(),
                FlexibleWidget(),
              ],
            ),
            Row(
              children: [
                FlexibleWidget(),
                ExpandedWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Expanded',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class FlexibleWidget extends StatelessWidget {
  const FlexibleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          border: Border.all(color: Colors.white),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Flexible',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

// Contoh Navigation
class Navigation extends StatelessWidget {
  const Navigation({super.key});
  final String message = "Hello from First Screen!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return Navigation2(message);
              })
            );
          },
        ),
      ),
    );
  }
}

class Navigation2 extends StatelessWidget {
  final String message;
  const Navigation2(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            OutlinedButton(
              child: const Text('Kembali'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}