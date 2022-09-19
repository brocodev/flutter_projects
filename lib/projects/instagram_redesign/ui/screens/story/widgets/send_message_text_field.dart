import 'package:flutter/material.dart';

class SendMessageTextField extends StatelessWidget {
  const SendMessageTextField({
    super.key,
  });

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
        hintStyle: const TextStyle(color: Colors.white),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Text(
            '| 😍',
            style: TextStyle(
              fontSize: 22,
              height: 1.8,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
