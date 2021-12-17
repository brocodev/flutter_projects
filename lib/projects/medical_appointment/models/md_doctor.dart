import 'package:flutter_projects/projects/medical_appointment/models/md_address.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_doctor_category.dart';

class Doctor {

  const Doctor({
    this.name,
    this.doctorCategory,
    this.graduationYear,
    this.patients,
    this.mdAddress,
    this.rate,
    this.likes,
    this.comments,
    this.pngPhotoUrl,
    this.photoUrl,
  });

  final String? name;
  final DoctorCategory? doctorCategory;
  final int? patients;
  final double? rate;
  final int? likes;
  final int? graduationYear;
  final int? comments;
  final String? pngPhotoUrl;
  final String? photoUrl;
  final MdAddress? mdAddress;


  static const  drRichard = Doctor(
    name: 'Richard Smith',
    photoUrl:
        'https://images.unsplash.com/photo-1582750433449-648ed127bb54?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    doctorCategory: DoctorCategory.kCardiologist,
    comments: 120,
    patients: 310,
    likes: 220,
    mdAddress: MdAddress.sanFransisco,
    graduationYear: 2010,
    rate: 4.5,
  );

  static const drLiliana = Doctor(
    name: 'Liliana Mondragon',
    photoUrl:
        'https://images.unsplash.com/photo-1591604021695-0c69b7c05981?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    doctorCategory: DoctorCategory.kDermatologist,
    comments: 120,
    patients: 310,
    likes: 220,
    mdAddress: MdAddress.sanFransisco,
    graduationYear: 2010,
    rate: 4.5,
  );
  static const drJulissa = Doctor(
    name: 'Julissa Towers',
    photoUrl:
        'https://images.unsplash.com/photo-1527613426441-4da17471b66d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    doctorCategory: DoctorCategory.kPediatrician,
    comments: 120,
    patients: 310,
    likes: 220,
    mdAddress: MdAddress.sanFransisco,
    graduationYear: 2010,
    rate: 4.5,
  );

  static const drEdward = Doctor(
    name: 'Edward Ghirca',
    photoUrl:
        'https://images.unsplash.com/photo-1580281658626-ee379f3cce93?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    doctorCategory: DoctorCategory.kSurgeon,
    comments: 120,
    patients: 310,
    likes: 220,
    mdAddress: MdAddress.sanFransisco,
    graduationYear: 2010,
    rate: 4.5,
  );
  static const drGuido = Doctor(
    name: 'Guido Mista',
    photoUrl:
        'https://images.unsplash.com/photo-1576669801775-ff43c5ab079d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
    doctorCategory: DoctorCategory.kCardiologist,
    comments: 120,
    patients: 310,
    likes: 220,
    mdAddress: MdAddress.sanFransisco,
    graduationYear: 2010,
    rate: 4.5,
  );

  static const listTopDoctor = [
    Doctor(
      name: 'Iris Bohorquez',
      doctorCategory: DoctorCategory.kSurgeon,
      comments: 203,
      pngPhotoUrl: 'https://pngimg.com/uploads/doctor/doctor_PNG16043.png',
      mdAddress: MdAddress.brownwood,
      graduationYear: 2009,
      likes: 359,
      rate: 4.7,
      patients: 402,
    ),
    Doctor(
      name: 'Namor Scoutia',
      doctorCategory: DoctorCategory.kUrologist,
      comments: 193,
      pngPhotoUrl:
          'http://www.pngall.com/wp-content/uploads/2018/05/Doctor-Free-Download-PNG.png',
      mdAddress: MdAddress.brownwood,
      graduationYear: 2000,
      likes: 301,
      rate: 4.5,
      patients: 320,
    ),
    Doctor(
      name: 'Alex Gospel',
      doctorCategory: DoctorCategory.kCardiologist,
      comments: 210,
      graduationYear: 2012,
      pngPhotoUrl:
          'http://www.pngall.com/wp-content/uploads/2018/05/Doctor.png',
      mdAddress: MdAddress.brownwood,
      likes: 324,
      rate: 4.6,
      patients: 352,
    ),
    Doctor(
      name: 'Robert Peace',
      doctorCategory: DoctorCategory.kEndocrinologist,
      comments: 173,
      pngPhotoUrl:
          'http://www.pngall.com/wp-content/uploads/2018/05/Doctor-PNG-File-Download-Free.png',
      mdAddress: MdAddress.brownwood,
      graduationYear: 2010,
      likes: 239,
      rate: 4.8,
      patients: 298,
    )
  ];
}
