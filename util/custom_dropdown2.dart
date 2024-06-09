import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CustomDropdownButton2 extends StatelessWidget {
  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = Offset.zero,
    super.key,
  });
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Container(
              alignment: hintAlignment,
              child: Text(
                hint,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
            // hint: const Row(
            //   children: [
            //     Icon(
            //       Icons.list,
            //       size: 16,
            //       color: Colors.yellow,
            //     ),
            //     SizedBox(
            //       width: 4,
            //     ),
            //     Expanded(
            //       child: Text(
            //         'Select Item',
            //         style: TextStyle(
            //           fontSize: 14,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.yellow,
            //         ),
            //         overflow: TextOverflow.ellipsis,
            //       ),
            //     ),
            //   ],
            // ),
            items: dropdownItems
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Container(
                        alignment: valueAlignment,
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ))
                .toList(),
            value: value,
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: buttonHeight ?? 40,
              width: buttonWidth ?? 140,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: buttonDecoration ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black45,
                    ),
                  ),
              elevation: buttonElevation,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              // iconEnabledColor: iconEnabledColor,
              // iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.redAccent,
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<String>(
//         //To avoid long text overflowing.
//         isExpanded: true,
//         hint: Container(
//           alignment: hintAlignment,
//           child: Text(
//             hint,
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//             style: TextStyle(
//               fontSize: 14,
//               color: Theme.of(context).hintColor,
//             ),
//           ),
//         ),
//         value: value,
//         items: dropdownItems
//             .map((String item) => DropdownMenuItem<String>(
//                   value: item,
//                   child: Container(
//                     alignment: valueAlignment,
//                     child: Text(
//                       item,
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                       style: const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ))
//             .toList(),
//         onChanged: onChanged,
//         selectedItemBuilder: selectedItemBuilder,
//         buttonStyleData: ButtonStyleData(
//           height: buttonHeight ?? 40,
//           width: buttonWidth ?? 140,
//           padding: buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
//           decoration: buttonDecoration ??
//               BoxDecoration(
//                 borderRadius: BorderRadius.circular(14),
//                 border: Border.all(
//                   color: Colors.black45,
//                 ),
//               ),
//           elevation: buttonElevation,
//         ),
//         iconStyleData: IconStyleData(
//           icon: icon ?? const Icon(Icons.arrow_forward_ios_outlined),
//           iconSize: iconSize ?? 12,
//           iconEnabledColor: iconEnabledColor,
//           iconDisabledColor: iconDisabledColor,
//         ),
//         dropdownStyleData: DropdownStyleData(
//           //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
//           maxHeight: dropdownHeight ?? 200,
//           width: dropdownWidth ?? 140,
//           padding: dropdownPadding,
//           decoration: dropdownDecoration ??
//               BoxDecoration(
//                 borderRadius: BorderRadius.circular(14),
//               ),
//           elevation: dropdownElevation ?? 8,
//           //Null or Offset(0, 0) will open just under the button. You can edit as you want.
//           offset: offset,
//           scrollbarTheme: ScrollbarThemeData(
//             radius: scrollbarRadius ?? const Radius.circular(40),
//             thickness: scrollbarThickness != null
//                 ? MaterialStateProperty.all<double>(scrollbarThickness!)
//                 : null,
//             thumbVisibility: scrollbarAlwaysShow != null
//                 ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
//                 : null,
//           ),
//         ),
//         menuItemStyleData: MenuItemStyleData(
//           height: itemHeight ?? 40,
//           padding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
//         ),
//       ),
//     );
//   }
// }
