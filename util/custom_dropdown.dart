// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    this.label,
    required this.value,
    required this.dataList,
    required this.onChanged,
    required this.width,
  }) : super(key: key);

  final String? label;
  final String value;
  final List<DropdownMenuItem> dataList;
  final Function onChanged;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 5.0),
            child: Text(label!),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade300,
          ),
          child: SizedBox(
            // width: MediaQuery.of(context).size.width,
            width: width,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                icon: const Icon(Icons.keyboard_arrow_down),
                menuMaxHeight: 400,
                dropdownColor: Colors.grey.shade400,
                elevation: 8,
                iconSize: 25,
                itemHeight: 57,
                value: value,
                items: dataList,
                onChanged: (val) {
                  onChanged(val);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
