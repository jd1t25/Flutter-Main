// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:main/data/variables.dart';

void main() {
  runApp(Input());
}

class Input extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Input Here'),
        centerTitle: true,
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.done_all_rounded,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       createExcel();
        //     },
        //   )
        // ],
      ),
      body: HomePage(),
    ));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Map<String, dynamic> localMap = getValue();

  final ScrollController _scrollController = ScrollController();
  List<TextEditingController> listController = [TextEditingController()];
  List<bool> buttonEnabledList = [true];
  List<bool> textEnabledList = [true];
  final Color initialBorder = Colors.black;
  final Color finalBorder = Colors.green;

  List<String> values = [];
  DateTime today = DateTime.now();
  var dateFormat = DateFormat('dd-MM-yyyy');
  var timeFormat = DateFormat('hh:mm:ss');
  String currentDate = "";
  String currentTime = "";

  Color borderColor = Colors.black;

  void snackBar(String val) {
    String snackBarVal;
    if (val.isEmpty) {
      snackBarVal = 'Error !!, Add some values';
    } else {
      snackBarVal = 'Added $val';
    }
    final snackBar = SnackBar(
      content: Text(snackBarVal),
    );

    // Find the ScaffoldMessenger in the widget tree
    // and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onButtonPressed(int index) {
    today = DateTime.now();
    currentDate = dateFormat.format(today);
    currentTime = timeFormat.format(today);
    print(currentTime);
    values.add(
        listController[index].text + "_" + currentDate + "_" + currentTime);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Do you want to disable this button and text field?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
          ],
        );
      },
    ).then((value) {
      if (value != null && value) {
        setState(() {
          buttonEnabledList[index] = false;
          textEnabledList[index] = false;
        });
      }
    });
  }

  // void _onButtonPressed(int index) {
  //   today = DateTime.now();
  //   currentDate = dateFormat.format(today);
  //   currentTime = timeFormat.format(today);
  //   print(currentTime);
  //   values.add(
  //       listController[index].text + "_" + currentDate + "_" + currentTime);
  //   setState(() {
  //     buttonEnabledList[index] = false;
  //     textEnabledList[index] = false;
  //   });
  //   // Add your button click logic here
  // }

  // bool confirmInput(int index) {
  //   today = DateTime.now();
  //   currentDate = dateFormat.format(today);
  //   currentTime = timeFormat.format(today);
  //   print(currentTime);
  //   values.add(
  //       listController[index].text + "_" + currentDate + "_" + currentTime);
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn);
      }
    });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Text(
                        "Dynamic Text Field",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      shrinkWrap: true,
                      itemCount: listController.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 10),
                                  height: 55,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 207, 207, 207),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    enabled: buttonEnabledList[index],
                                    controller: listController[index],
                                    autofocus: false,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 2, color: Colors.black),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: listController[index]
                                                    .text
                                                    .isEmpty
                                                ? initialBorder
                                                : finalBorder),
                                      ),
                                      hintText: "Input Text Here",
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              255, 132, 140, 155)),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    // onTap: () {
                                    //   _borderColors.add(Colors.black);
                                    // },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                iconSize: 40,
                                icon: const Icon(
                                  Icons.check_rounded,
                                ),
                                // the method which is called
                                // when button is pressed
                                onPressed: buttonEnabledList[index]
                                    ? () => _onButtonPressed(index)
                                    : null,
                                // onPressed: confirmInput(index) ? null : () => {},
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     bool confirmOnInput = confirmInput(index);

                              //     // today = DateTime.now();
                              //     // currentDate = dateFormat.format(today);
                              //     // currentTime = timeFormat.format(today);
                              //     // print(currentTime);
                              //     // values.add(listController[index].text +
                              //     //     "_" +
                              //     //     currentDate +
                              //     //     "_" +
                              //     //     currentTime);
                              //     // print(values[index]);
                              //     setState(() {
                              //       if (confirmOnInput) {}
                              //       // Change the border color of the TextField

                              //       // borderColor = Colors.green;
                              //     });
                              //     snackBar(listController[index].text);
                              //   },
                              //   child: const Icon(
                              //     Icons.check_rounded,
                              //     color: Color(0xFF6B74D6),
                              //     size: 35,
                              //   ),
                              // )
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          listController.add(TextEditingController());
                          buttonEnabledList.add(true);
                          textEnabledList.add(true);
                        });
                      },
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          decoration: BoxDecoration(
                              color: const Color(0xFF444C60),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text("Add More",
                              style: GoogleFonts.nunito(
                                  color: const Color(0xFFF8F8FF))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Export'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Export Complete",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    content: const Text("Save at /storage/emulated/0/"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          //                     color: Colors.green,
                          padding: const EdgeInsets.all(14),
                          child: const Text("Ok"),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
