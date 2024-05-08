// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // Variable Controllers

  final _username = TextEditingController();
  final _password = TextEditingController();

  LoginPage({super.key});

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
                      onPressed: () {
                        Navigator.pushNamed(context, '/homepage');
                      },
                      child: Text("Sign In"))
                ],
              )),
        ],
      ),
    );
  }
}
