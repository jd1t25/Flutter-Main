// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, avoid_print, use_build_context_synchronously, prefer_typing_uninitialized_variables, sized_box_for_whitespace

// import 'package:app/data/gsheets.dart';
// import 'package:app/util/custom_dropdown.dart';
import 'package:app/data/gsheets.dart';
// import 'package:app/util/title_case.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final bool status;
  final List<String> usernameList;

  const LoginPage(
      {super.key, required this.status, required this.usernameList});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Variable Controllers
  // final _username = TextEditingController();
  late final usernameList;
  var username;
  final _password = TextEditingController();

  // late List<String> _usernameList = [];

  bool isloading = false;
  String errormessage = '';
  GSheetsDatabase gs = GSheetsDatabase.getInstance();

  final snackBar = const SnackBar(content: Text('Google Sheet Initialized'));
  final snackBarError = const SnackBar(
    content: Text(
      "Error: Something's Wrong",
      style: TextStyle(color: Colors.red),
    ),
    backgroundColor: Color.fromARGB(255, 185, 185, 185),
  );

  @override
  void initState() {
    super.initState();
    if (widget.status) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
      usernameList = widget.usernameList;
      // usernameList = usernameList.map((str) => str.capitalize()).toList();
      username = usernameList.first;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(snackBarError);
      }); // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  // Future<void> getUserName() async {
  //   _usernameList = await gs.getUserName();
  //   _usernameList = _usernameList.map((str) => str.capitalize()).toList();
  //   // _username = _usernameList[0];
  // }

  // Future<void> _Ginit() async {
  //   try {
  //     await gs.init();
  //     _usernameList = await gs.getUserName();
  //   } catch (e) {
  //     print(e);
  //   }
  // }
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
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      padding: EdgeInsets.fromLTRB(35, 5, 35, 0),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: "Username"),
                      isExpanded: true,
                      isDense: true,
                      focusColor: Colors.grey.shade100,
                      dropdownColor: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      value: username,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      elevation: 16,
                      // style: const TextStyle(color: Colors.deepPurple),
                      // underline: Container(
                      //   height: 2,
                      //   color: Colors.deepPurpleAccent,
                      // ),
                      onChanged: (String? value) {
                        setState(() {
                          username = value!;
                        });
                      },
                      items: usernameList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(35, 35, 35, 0),
                  //   child: DropdownButton(
                  //     // Initial Value
                  //     value: _usernameList[0],

                  //     // Down Arrow Icon
                  //     icon: const Icon(Icons.keyboard_arrow_down),

                  //     // Array list of items
                  //     items: _usernameList.map((String items) {
                  //       return DropdownMenuItem(
                  //         value: items,
                  //         child: Text(items),
                  //       );
                  //     }).toList(),
                  //     // After selecting the desired option,it will
                  //     // change button value to selected value
                  //     onChanged: (String? newValue) {
                  //       setState(() {
                  //         _username = newValue!;
                  //         print(_username);
                  //       });
                  //     },
                  //   ),
                  //   // child: DropdownButton(
                  //   //     items: _usernameList.map((String value) {
                  //   //       return DropdownMenuItem(
                  //   //           value: value, child: Text(value));
                  //   //     }).toList(),
                  //   //     onChanged: (String? value) {
                  //   //       setState(() {
                  //   //         _username = value;
                  //   //         print(_username);
                  //   //       });
                  //   //     })
                  //   // child: TextField(
                  //   //   controller: _username,
                  //   //   decoration: const InputDecoration(
                  //   //       border: OutlineInputBorder(), labelText: 'User Name'),
                  //   // ),
                  // ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
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
                        // List<String> _username = await gs.getUserName();
                        errormessage = '';
                        // print(username);
                        // print(_password.text);
                        try {
                          bool check =
                              await gs.checkLogin(username, _password.text);
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
