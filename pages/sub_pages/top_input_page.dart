// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:app/data/globals.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class TopNav extends StatelessWidget {
  final String ifcode;
  final String? partName;
  final String? basisDimension;
  final String? uclDimension;
  final String? lclDimension;
  final String? machineno;

  const TopNav(
      {super.key,
      required this.ifcode,
      required this.partName,
      required this.uclDimension,
      required this.lclDimension,
      required this.basisDimension,
      required this.machineno});

  @override
  Widget build(BuildContext context) {
    String operatorName = toBeginningOfSentenceCase(mainuser);

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
                    Text("IF CODE: $ifcode"),
                    Text("Part Name: $partName"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Dimension: $basisDimension"),
                    Text("UCL: $uclDimension"),
                    Text("LCL: $lclDimension"),
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
                Text("Machine No: $machineno"),
                Text("Operator Name: $operatorName"),
              ],
            )),
      ],
    );
  }
}
