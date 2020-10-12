import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Category {
  final String categoryName;
  final IconData iconCategory;
  final int specialists;
  final int doctors;
  final Color color;

  Category(
      {this.categoryName,
      this.iconCategory,
      this.specialists,
      this.doctors,
      this.color});

  static final listCategories = [
    Category(
      categoryName: 'Cardiologist',
      doctors: 9,
      specialists: 10,
      color: Color(0xffFF565D),
      iconCategory: FontAwesome.heartbeat,
    ),
    Category(
      categoryName: 'Pediatrician',
      doctors: 9,
      specialists: 10,
      color: Color(0xffFCD94A),
      iconCategory: FontAwesome.child,
    ),
    Category(
      categoryName: 'Bone specialist',
      doctors: 9,
      specialists: 10,
      color: Color(0xff1BCAB2),
      iconCategory: FontAwesome5Solid.bone,
    ),
    Category(
      categoryName: 'Dentist',
      doctors: 9,
      color: Colors.purpleAccent,
      specialists: 10,
      iconCategory: FontAwesome5Solid.tooth,
    ),
    Category(
      categoryName: 'Urologist',
      doctors: 9,
      specialists: 10,
      color: Colors.cyan,
      iconCategory: Icons.person,
    ),
  ];
}
