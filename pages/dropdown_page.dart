// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables, unused_import, non_constant_identifier_names, avoid_print

// import 'package:app/data/gsheet.dart';
import 'package:app/data/globals.dart';
import 'package:app/data/gsheets.dart';
import 'package:app/util/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

class Dropdown extends StatefulWidget {
  Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  // Variables
  String _ifValue = "2M085";
  // GsheetDatabase gs = GsheetDatabase();
  GSheetsDatabase gs = GSheetsDatabase.getInstance();

  final SnackBar snackBar =
      const SnackBar(content: Text("Google Sheet Initialized"));

  // @override
  // void initState() {
  //   super.initState();
  //   // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   //   _Ginit();
  //   // });
  //   // // () async {
  //   //   await gs.init();
  //   // }();
  //   // snackbarKey.currentState?.showSnackBar(snackBar);
  //   // SnackBar(content: Text('Google Sheet initialized'));
  // }

  Future<void> _Ginit() async {
    try {
      await gs.init();
    } catch (e) {
      print(e);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      snackbarKey.currentState?.showSnackBar(snackBar);
      // SnackBar(content: Text('Google Sheet initialized'));
    });
    // setState(() {
    //   snackbarKey.currentState?.showSnackBar(snackBar);
    // });
  }

  // @override // // ignore: must_call_super
  // initState() {
  //   // ignore: avoid_print
  //   // print("initState Called");
  //   gs.GsheetRun();
  //   print(gs.sheets.)
  // }

  List _ifcode = [
    ['2M085  -  ID 44.700', '2M085'],
    ['2M086  -  ID 133.700', '2M086'],
    ['2M087  -  ID 51.220', '2M087'],
    ['2M088  -  ID 55.700', '2M088'],
    ['2M089  -  ID 51.720', '2M089'],
    ['2M090  -  ID 44.717', '2M090'],
    ['2M091  -  ID 50.620', '2M091'],
    ['2M092  -  ID 44.700', '2M092'],
    ['2M093  -  ID 35.200', '2M093'],
    ['2M094  -  ID 32.700', '2M094'],
    ['2M095  -  ID 33.610', '2M095'],
  ];

  void onSubmit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
      ),
      body: FutureBuilder(
          future: _Ginit(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                // height: 400,
                // width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDropdown(
                        width: 300,
                        value: _ifValue,
                        dataList: _ifcode.map<DropdownMenuItem>(
                          (item) {
                            return DropdownMenuItem(
                                value: item[1], child: Text(item[0]));
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            _ifValue = value;
                            print(_ifValue);
                            gs.readData();
                            // print(gs.readData().then(
                            //   (value) {
                            //     print('$value');
                            //   },
                            // ));
                          });
                        }),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InputPage(ifcode: _ifValue)));
                        },
                        child: const Text('Next'))
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
