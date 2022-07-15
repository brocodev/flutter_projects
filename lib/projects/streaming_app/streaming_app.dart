import 'package:flutter/material.dart' show AppBar, BuildContext, Center, Key, MaterialApp, Scaffold, StatelessWidget, Text, Widget;

class StreamingApp extends StatelessWidget {
  const StreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
