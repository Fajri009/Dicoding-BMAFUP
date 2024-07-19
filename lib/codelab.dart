import 'package:dicoding_bmafup/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_bmafup/model/tourism_place.dart';

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
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wisata Bandung"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];

        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(place.imageAsset),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(place.location)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: tourismPlaceList.length
      )
    );
  }
}
