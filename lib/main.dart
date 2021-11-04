import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/core/app/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const BrocodevProjectsApp());
}
