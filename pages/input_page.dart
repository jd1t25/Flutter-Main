// ignore_for_file: must_be_immutable, recursive_getters, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:app/data/database.dart';
import 'package:app/pages/sub_pages/top_input_page.dart';
import 'package:app/util/listview.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  final String ifcode;

  const InputPage({super.key, required this.ifcode});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // List Database
  ListDatabase db = ListDatabase();
  get _ifcode => widget.ifcode;
  // final List _inputlist = [];

  // Add

  void addInput() {
    // db.inputlistdata =
    setState(() {
      db.inputlistdata.add(TextEditingController());
      db.inputlistbutton.add(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "India Forge and Drop Stampings Ltd.",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
      ),
      body: Column(
        children: [
          TopNav(ifcode: _ifcode),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListViewInput(
            inputlistdata: db.inputlistdata,
            inputlistbutton: db.inputlistbutton,
          )),
          // Center(
          //     child: ElevatedButton(
          //   child: Text('heloo'),
          //   onPressed: () {},
          // ))
          // ListView.builder(itemBuilder: itemBuilder)
          FloatingActionButton(
              onPressed: () {
                addInput();
              },
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}
