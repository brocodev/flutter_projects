import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category {
  final String categoryName;
  final IconData iconCategory;
  final int specialists;
  final int doctors;
  final Color color;

  Category({
    this.categoryName,
    this.iconCategory,
    this.specialists,
    this.doctors,this.color
  });

  static final listCategories = [
    Category(
      categoryName: 'Cardiologist',
      doctors: 9,
      specialists: 10,
      color: Color(0xffFF565D),
      iconCategory: FontAwesomeIcons.heartbeat,
    ),
    Category(
      categoryName: 'Pediatrician',
      doctors: 9,
      specialists: 10,
      color: Color(0xffFCD94A),
      iconCategory: FontAwesomeIcons.child,
    ),
    Category(
      categoryName: 'Bone specialist',
      doctors: 9,
      specialists: 10,
      color: Color(0xff1BCAB2),
      iconCategory: FontAwesomeIcons.bone,
    ),
    Category(
      categoryName: 'Dentist',
      doctors: 9,
      color: Colors.purpleAccent,
      specialists: 10,
      iconCategory: FontAwesomeIcons.tooth,
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
