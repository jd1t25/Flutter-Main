// ignore_for_file: prefer_const_constructors

// import 'package:app/data/globals.dart';
// import 'package:app/data/gsheets.dart';
import 'package:app/pages/dropdown_page.dart';
import 'package:app/pages/home_page.dart';
// import 'package:app/pages/login_page.dart';
import 'package:app/pages/splash_screen.dart';
// import 'package:app/pages/input_page.dart';
import 'package:flutter/material.dart';

// import 'pages/login_page.dart';

void main() {
  runApp(RootPage());
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});
  // GSheetsDatabase gs = GSheetsDatabase.getInstance();

  // @override // void initState() {
  //   super.initState();
  //   _Ginit();
  // }

  // Future<void> _Ginit() async {
  //   try {
  //     await gs.init();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      // home: LoginPage(),
      // home: InputPage(ifcode: 'hello'),
      // home: Dropdown(),
      // scaffoldMessengerKey: snackbarKey,
      routes: {
        '/homepage': (context) => HomePage(),
        // '/input': (context) => InputPage(),
        '/dropdown': (context) => Dropdown(),
      },
    );
  }
}
