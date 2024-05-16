// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, avoid_print, use_build_context_synchronously

import 'package:app/data/gsheets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variable Controllers
  final _username = TextEditingController();

  final _password = TextEditingController();

  bool isloading = false;
  String errormessage = '';

  @override
  void initState() {
    super.initState();
    _Ginit();
  }

  GSheetsDatabase gs = GSheetsDatabase.getInstance();

  Future<void> _Ginit() async {
    try {
      await gs.init();
    } catch (e) {
      print(e);
    }
  }
  // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   snackbarKey.currentState?.showSnackBar(snackBar);
  //   // SnackBar(content: Text('Google Sheet initialized'));
  // });

  // void Login(String username, String password) async {
  //   try {
  //     bool check = await gs.checkLogin(username, password);
  //     await Future<void>.delayed(Duration(seconds: 2));
  //     if (check) {
  //       Navigator.pushNamed(context, '/homepage');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              // padding: EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "India Forge",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue.shade400,
                        letterSpacing: 1.5),
                    // style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Sign in",
                    style: TextStyle(fontSize: 19),
                  ),
                  // SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 35, 35, 0),
                    child: TextField(
                      controller: _username,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'User Name'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 5, 35, 0),
                    child: TextField(
                      controller: _password,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () async {
                        errormessage = '';
                        try {
                          bool check = await gs.checkLogin(
                              _username.text, _password.text);
                          setState(() {
                            isloading = true;
                          });
                          await Future<void>.delayed(Duration(seconds: 2));
                          setState(() {
                            isloading = false;
                          });
                          if (check) {
                            Navigator.pushNamed(context, '/homepage');
                          } else {
                            errormessage = 'Username or Password is Wrong';
                          }
                        } catch (e) {
                          print("lol");
                        }
                        // Login(_username.text, _password.text);
                        // Navigator.pushNamed(context, '/homepage');
                      },
                      child: Text("Sign In")),
                  SizedBox(
                    height: 10,
                  ),
                  Center(child: isloading ? CircularProgressIndicator() : null),
                  Center(
                    child: Text(
                      errormessage,
                      style: TextStyle(color: Colors.red.shade600),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
