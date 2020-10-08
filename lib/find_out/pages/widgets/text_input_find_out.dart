import 'package:flutter/material.dart';


class TextInputFindOut extends StatelessWidget {
  const TextInputFindOut({
    Key key,
    @required this.label,
    @required this.iconData,
    this.textInputType,
  }) : super(key: key);
  final String label;
  final IconData iconData;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    final isPassword = textInputType == TextInputType.visiblePassword;
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
          color: Colors.grey[100], width: 2, style: BorderStyle.solid),
    );
    final hidePasswordNotifier = ValueNotifier(true);
    return ValueListenableBuilder(
        valueListenable: hidePasswordNotifier,
        builder: (context, value, child) {
          return TextField(
            keyboardType: textInputType,
            obscureText: isPassword ? value : false,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                suffixIcon: isPassword
                    ? IconButton(
                  onPressed: () => hidePasswordNotifier.value =
                  !hidePasswordNotifier.value,
                  icon: Icon(
                    value ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey[700],
                  ),
                )
                    : null,
                enabledBorder: outlineInputBorder,
                hintText: label,
                focusedBorder: outlineInputBorder.copyWith(
                    borderSide: BorderSide(color: Colors.pink, width: 2)),
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(iconData, color: Colors.pinkAccent, size: 18)),
          );
        });
  }
}
