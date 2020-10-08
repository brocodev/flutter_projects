import 'package:flutter/material.dart';
class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key key, this.labels,
  }) : super(key: key);
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (value) {},
      elevation: 0,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      iconSize: 28,
      icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
      dropdownColor: Colors.black12,
      underline: const SizedBox(),
      items: List.generate(labels.length, (index) {
        return DropdownMenuItem(
          child: Text(labels[index]),
        );
      }),
    );
  }
}
