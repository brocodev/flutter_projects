import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    required this.labels,
  });
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      elevation: 0,
      onChanged: (value) {},
      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      iconSize: 28,
      dropdownColor: Colors.black26,
      underline: const SizedBox(),
      value: labels.first,
      items: List.generate(labels.length, (index) {
        return DropdownMenuItem<String>(
          value: labels[index],
          child: Text(labels[index]),
        );
      }),
    );
  }
}
