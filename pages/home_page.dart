// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Page'),
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
          backgroundColor: Colors.blue[400],
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
                  // Get.toNamed('/dropwdown');
                  Navigator.pushNamed(context, '/dropdown');
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
