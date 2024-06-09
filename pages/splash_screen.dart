// ignore_for_file: non_constant_identifier_names, avoid_print, must_be_immutable

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app/data/gsheets.dart';
import 'package:app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // Initialization
  final GSheetsDatabase gs = GSheetsDatabase.getInstance();
  bool status = false;
  late List<String> usernameList;

  // Gsheet Initialized
  Future<void> _Ginit() async {
    try {
      await gs.init();
      status = true;
    } catch (e) {
      // print(e);
      status = false;
    }
  }

  // Future<List<String>> _UserName() async {
  //   return gs.getUserName();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen.withScreenFunction(
            splash: Column(
              children: [
                Center(
                  child: LottieBuilder.asset(
                    'assets/Lottie/logo_main.json',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.2,
                    // fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            // nextScreen: const LoginPage(),
            screenFunction: () async {
              await _Ginit();
              // usernameList = await _UserName();
              usernameList = await gs.getUserName();
              return LoginPage(status: status, usernameList: usernameList);
            },
            // splashIconSize: MediaQuery.of(context).size.width,
            splashIconSize: 200,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
