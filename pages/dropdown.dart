import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter DropDownButton',
      home: DropDown(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final List<String> ifcode = [
    '2M085  -  ID 44.700',
    '2M086  -  ID 133.700',
    '2M087  -  ID 51.220',
    '2M088  -  ID 55.700',
    '2M089  -  ID 51.720',
    '2M090  -  ID 44.717',
    '2M091  -  ID 50.620',
    '2M092  -  ID 44.700',
    '2M093  -  ID 35.200',
    '2M094  -  ID 32.700',
    '2M095  -  ID 33.610',
  ];

  String? selectedIFCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: const Row(
            children: [
              Icon(
                Icons.list,
                size: 24,
                color: Colors.black,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Select IF Code',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: ifcode
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedIFCode,
          onChanged: (value) {
            setState(() {
              selectedIFCode = value;
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 300,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: const Color.fromARGB(255, 219, 219, 219)),
            elevation: 2,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
            ),
            iconSize: 14,
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 300,
            // width: 200,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(3),
              color: Colors.white,
            ),
            // offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
              thumbColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 156, 156, 156)),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    ));
  }
}
