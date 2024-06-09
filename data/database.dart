// ignore_for_file: override_on_non_overriding_member, unused_local_variable

import 'package:flutter/material.dart';

class ListDatabase {
  ListDatabase._privateConstructor();
  static final ListDatabase _instance = ListDatabase._privateConstructor();

  factory ListDatabase.getInstance() {
    return _instance;
  }

  List<TextEditingController> inputlistdata = [];
  List<bool> inputlistbutton = [];
  List<bool> inputlistdataenable = [];

  // void initialized() {
  //   List<TextEditingController> inputlistdata = [];
  //   List<bool> inputlistbutton = [];
  //   List<bool> inputlistdataenable = [];
  // }
  // List<bool> inputlistbuttonenable = [];
  // List<Color> inputlistcolor = [];

  // @override
  // Widget build(BuildContext context) {
  //   return const Placeholder();
  // }
}
