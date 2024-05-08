// ignore_for_file: must_be_immutable, recursive_getters

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  final String ifcode;

  const InputPage({super.key, required this.ifcode});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("InputPage"),
          centerTitle: true,
          backgroundColor: Colors.blue[400],
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
        body: Center(child: Text(widget.ifcode)));
  }
}
