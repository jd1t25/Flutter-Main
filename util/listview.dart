// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors

// import 'package:app/data/database.dart';
import 'package:flutter/material.dart';

class ListViewInput extends StatelessWidget {
  final List inputlistdata;
  final List inputlistbutton;
  // final List<bool>

  // List inputlistdata = inputlistdata;

  ListViewInput({
    super.key,
    required this.inputlistdata,
    required this.inputlistbutton,
  });

  // ListDatabase db = ListDatabase();
  // final List code = ["hello"];
  // TextEditingController valueController = TextEditingController();

  void enableButton() {}

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: inputlistdata.length,
        // separatorBuilder: (context, index) {
        //   return const Divider(height: 1);
        // },
        itemBuilder: (context, index) {
          return ListTile(
              title: TextField(
                controller: inputlistdata[index],
                onChanged: (text) {
                  inputlistbutton[index] = !inputlistbutton[index];
                },
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Value...',
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 132, 138, 150))),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.check,
                  // color: Colors.green,
                ),
                onPressed: inputlistbutton[index] ? enableButton : null,
              ));
        });
  }
}
