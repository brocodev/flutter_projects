import 'package:flutter/cupertino.dart' show IconData;
import 'package:flutter_projects/projects/medical_appointment/utils/md_icons_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

enum DoctorCategory {
  kCardiologist._(
    nameCategory: 'Cardiologist',
    doctors: 9,
    iconData: FontAwesome.heartbeat,
    specialists: 10,
    rawColor: 0xffFF565D,
  ),
  kPediatrician._(
    nameCategory: 'Pediatrician',
    doctors: 9,
    iconData: MdIcons.pediatrician,
    specialists: 10,
    rawColor: 0xffFCD94A,
  ),
  kSurgeon._(
    nameCategory: 'Surgeon',
    iconData: MdIcons.surgeon,
    doctors: 9,
    specialists: 10,
    rawColor: 0xff1BCAB2,
  ),
  kUrologist._(
    nameCategory: 'Urologist',
    doctors: 9,
    iconData: MdIcons.prostate,
    specialists: 10,
    rawColor: 0xff33b5e5,
  ),
  kAllergist._(
    nameCategory: 'Allergist',
    doctors: 9,
    iconData: MdIcons.runny_nose,
    rawColor: 0xffFFaf00,
    specialists: 10,
  ),
  kDermatologist._(
    nameCategory: 'Dermatologist',
    iconData: MdIcons.skin,
    doctors: 9,
    rawColor: 0xffff6ad3,
    specialists: 10,
  ),
  kOphthalmologist._(
    nameCategory: 'Ophthalmologist',
    doctors: 9,
    iconData: MdIcons.eye,
    rawColor: 0xff28EB62,
    specialists: 10,
  ),
  kEndocrinologist._(
    nameCategory: 'Endocrinologist',
    doctors: 9,
    iconData: MdIcons.kidneys,
    rawColor: 0xff993299,
    specialists: 10,
  );

  const DoctorCategory._({
    this.iconData,
    this.nameCategory,
    this.specialists,
    this.doctors,
    this.rawColor,
  });

  final String? nameCategory;
  final int? specialists;
  final int? doctors;
  final int? rawColor;
  final IconData? iconData;

  static const categories = [
    kCardiologist,
    kPediatrician,
    kSurgeon,
    kUrologist,
    kAllergist,
    kDermatologist,
    kOphthalmologist,
    kEndocrinologist,
  ];
}
