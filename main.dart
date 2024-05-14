// ignore_for_file: prefer_const_constructors

import 'package:app/data/globals.dart';
import 'package:app/pages/dropdown_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';
// import 'package:app/pages/input_page.dart';
import 'package:flutter/material.dart';

// import 'pages/login_page.dart';

void main() {
  runApp(const RootPage());
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      // home: LoginPage(),
      // home: InputPage(ifcode: 'hello'),
      // home: Dropdown(),
      scaffoldMessengerKey: snackbarKey,
      routes: {
        '/homepage': (context) => HomePage(),
        // '/input': (context) => InputPage(),
        '/dropdown': (context) => Dropdown(),
      },
    );
  }
}
