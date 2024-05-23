import 'package:app/data/globals.dart';
import 'package:flutter/material.dart';

class DialogTuple {
  String text;
  IconData icon;
  String lastMessage;
  Color color;

  DialogTuple(
      {required this.text,
      required this.icon,
      required this.lastMessage,
      required this.color});
}

DialogTuple check({required double value}) {
  String message;
  IconData icon;
  String lastMessage;
  Color textColor;

  // var temp = value < double.parse(ucl);
  // print(value);
  // print(double.parse(ucl));
  // print(temp);

  if (value <= double.parse(ucl) && value >= double.parse(lcl)) {
    message = "Dimension is below mean and within tolerance";
    icon = Icons.check;
    lastMessage = "OK";
    textColor = Colors.green;
  } else if (value < double.parse(lcl)) {
    message = "Dimension is below LCL";
    icon = Icons.clear;
    lastMessage = "NOT OK";
    textColor = Colors.red;
  } else {
    message = "Dimension is above UCL";
    icon = Icons.clear;
    lastMessage = "NOT OK";
    textColor = Colors.red;
  }

  return DialogTuple(
      text: message, icon: icon, lastMessage: lastMessage, color: textColor);
}
