// ignore_for_file: must_be_immutable, recursive_getters, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  final String ifcode;

  const InputPage({super.key, required this.ifcode});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  get _ifcode => widget.ifcode;

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
          Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Center(
                      child: const Text("Inprocess Inspection : X-R Chart")),
                  color: Colors.lightBlue.shade100,
                  width: MediaQuery.of(context).size.width),
              Container(
                  color: Colors.grey.shade300,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("IF CODE: $_ifcode"),
                          Text("Part Name: "),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Dimension: "),
                          Text("UCL: "),
                          Text("LCL: "),
                        ],
                      ),
                    ],
                  )),
              Container(
                  color: Colors.yellow.shade100,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Machine No: "),
                      Text("Operator Name: "),
                    ],
                  )),
            ],
          ),
          // ListView.builder(itemBuilder: itemBuilder)
        ],
      ),
    );
  }
}
