// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'input.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/second': (context) => Home(),
        '/third': (context) => Input(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Page'),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          backgroundColor: Colors.blue[200],
        ),
        body: GridView.count(crossAxisCount: 2, children: [
          Padding(
              padding: const EdgeInsets.all(9),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.input,
                  color: Colors.black,
                  size: 40.0,
                ),
                label: const Text('Input',
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
                onPressed: () {
                  Navigator.pushNamed(context, '/third');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(9),
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.share_sharp,
                  color: Colors.black,
                  size: 40.0,
                ),
                label: const Text('Export',
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ))
        ]));
  }
}
