// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, prefer_const_constructors, unused_field

// import 'package:app/data/database.dart';
// import 'package:app/util/check_value.dart';
import 'package:app/util/dialog_tuple.dart';
// import 'package:app/util/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListViewInput extends StatefulWidget {
  final List inputlistdata;
  final List inputlistbutton;
  // final List<bool>

  // List inputlistdata = inputlistdata;

  ListViewInput({
    super.key,
    required this.inputlistdata,
    required this.inputlistbutton,
  });

  @override
  State<ListViewInput> createState() => _ListViewInputState();
}

class _ListViewInputState extends State<ListViewInput> {
  void onSubmit(String val) {
    // CheckValue(value: double.parse(val));
    DialogTuple dialogtuple = check(value: double.parse(val));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Confirm'),
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(dialogtuple.icon),
                  SizedBox(
                    width: 13,
                  ),
                  Expanded(child: Text(dialogtuple.text)),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    dialogtuple.lastMessage,
                    style: TextStyle(color: dialogtuple.color),
                  )
                ]),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    //
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });

    // Test();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.inputlistdata.length,
        // separatorBuilder: (context, index) {
        //   return const Divider(height: 1);
        // },
        itemBuilder: (context, index) {
          widget.inputlistdata[index].addListener(() {
            setState(() {
              widget.inputlistbutton[index] =
                  widget.inputlistdata[index].text.isNotEmpty;
            });
          });
          return ListTile(
              title: TextField(
                controller: widget.inputlistdata[index],
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,3}'))
                ],
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
                // onPressed: widget.inputlistbutton[index] ? enableButton : null,
                onPressed: widget.inputlistbutton[index]
                    ? () => onSubmit(widget.inputlistdata[index].text)
                    : null,
              ));
        });
  }
}
