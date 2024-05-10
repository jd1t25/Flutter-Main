// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TopNav extends StatelessWidget {
  final String ifcode;

  const TopNav({super.key, required this.ifcode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child:
                Center(child: const Text("Inprocess Inspection : X-R Chart")),
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
                    Text("IF CODE: ifcode"),
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
    );
  }
}
