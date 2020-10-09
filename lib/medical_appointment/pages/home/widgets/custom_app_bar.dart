import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: <Widget>[
        Expanded(
            child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            hintStyle:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),
            hintText: 'Search',
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            fillColor: Colors.white38,
            suffixIcon: Icon(Icons.search, color: Colors.white70),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
          ),
        )),
        const SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.white),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=335&q=80',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
