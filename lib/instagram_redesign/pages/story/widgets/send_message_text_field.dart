import 'package:flutter/material.dart';


class SendMessageTextField extends StatelessWidget {
  const SendMessageTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.black38,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          hintText: 'Send message',
          hintStyle: TextStyle(color: Colors.white),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "| 😍",
              style: TextStyle(
                fontSize: 22,
                height: 1.8,
                color: Colors.white70,
              ),
            ),
          )),
    );
  }
}