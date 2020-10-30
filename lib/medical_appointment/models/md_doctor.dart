import 'package:flutter_projects/medical_appointment/models/md_doctor_category.dart';

class Doctor {
  final String name;
  final DoctorCategory doctorCategory;
  final int patients;
  final double rate;
  final int likes;
  final DateTime graduationDate;
  final int comments;
  final String pngPhotoUrl;
  final String photoUrl;

  const Doctor({
    this.name,
    this.doctorCategory,
    this.graduationDate,
    this.patients,
    this.rate,
    this.likes,
    this.comments,
    this.pngPhotoUrl,
    this.photoUrl,
  });

  static const iris = Doctor(
    name: 'Iris Bohorquez',
    doctorCategory: DoctorCategory.kSurgeon,
    comments: 203,
    pngPhotoUrl: 'https://pngimg.com/uploads/doctor/doctor_PNG16043.png',
    likes: 359,
    rate: 4.7,
    patients: 402,
  );
  static const namor = Doctor(
    name: 'Namor Scoutia',
    doctorCategory: DoctorCategory.kUrologist,
    comments: 193,
    pngPhotoUrl:
        'http://www.pngall.com/wp-content/uploads/2018/05/Doctor-Free-Download-PNG.png',
    likes: 301,
    rate: 4.5,
    patients: 320,
  );
  static const alex = Doctor(
    name: 'Alex Gospel',
    doctorCategory: DoctorCategory.kCardiologist,
    comments: 210,
    pngPhotoUrl: 'http://www.pngall.com/wp-content/uploads/2018/05/Doctor.png',
    likes: 324,
    rate: 4.6,
    patients: 352,
  );
  static const robert = Doctor(
    name: 'Robert Peace',
    doctorCategory: DoctorCategory.kEndocrinologist,
    comments: 173,
    pngPhotoUrl:
        'http://www.pngall.com/wp-content/uploads/2018/05/Doctor-PNG-File-Download-Free.png',
    likes: 239,
    rate: 4.8,
    patients: 298,
  );
  static const listTopDoctor = [
    iris,
    alex,
    namor,
    robert,
  ];
}
