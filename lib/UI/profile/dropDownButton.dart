import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({
    super.key,
    required this.selectedValue,
    required this.hint,
    required this.dropdownItems,
  });

  final String selectedValue;
  final String hint;
  final List<String> dropdownItems;

  @override
  MyDropdownButtonState createState() => MyDropdownButtonState();
}

class MyDropdownButtonState extends State<MyDropdownButton> {
  late String selectedValue;
  late String hint;
  late List<String> dropdownItems;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
    hint = widget.hint;
    dropdownItems = widget.dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(hint, style: const TextStyle(color: Colors.black, fontSize: 18)),
      value: selectedValue,
      // isExpanded: true,
      underline: const SizedBox(),
      borderRadius: BorderRadius.circular(10),
      dropdownColor: Colors.blue[80],
      items: dropdownItems.map((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
    );
  }
}