import 'package:flutter/material.dart';


class RedDot extends StatelessWidget {
  const RedDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: Colors.redAccent,
        boxShadow: [BoxShadow(color: Colors.redAccent.shade100, blurRadius: 5)],
        shape: BoxShape.circle,
      ),
    );
  }
}
