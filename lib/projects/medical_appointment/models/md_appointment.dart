import 'package:flutter_projects/projects/medical_appointment/models/md_doctor.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_indication.dart';

class MedicalAppointment {
  MedicalAppointment({
    this.title,
    this.date,
    this.doctor,
    this.medicalIndications,
  });

  final String? title;
  DateTime? date;
  final Doctor? doctor;
  final List<MedicalIndication>? medicalIndications;

  static final _listIndications = [
    MedicalIndication.kDrinkWater,
    MedicalIndication.kEatVegetables,
    MedicalIndication.kExercise,
    MedicalIndication.kNoCoffee,
    MedicalIndication.kNoDrinkAlcohol,
    MedicalIndication.kNoEatFastFood,
  ];

  static final nextAppointment = MedicalAppointment(
    title: 'Heart care',
    date: DateTime.now().add(const Duration(days: 30)),
    doctor: Doctor.drRichard,
    medicalIndications: _listIndications,
  );

  static final skinCareAppointment = MedicalAppointment(
    title: 'Skin care',
    date: DateTime.now().subtract(const Duration(days: 10)),
    doctor: Doctor.drLiliana,
    medicalIndications: _listIndications,
  );

  static final sutureAppointment = MedicalAppointment(
    title: 'Suture revision',
    date: DateTime.now().subtract(const Duration(days: 30)),
    doctor: Doctor.drEdward,
    medicalIndications: _listIndications,
  );

  static final childAppointment = MedicalAppointment(
    title: 'Kid Vaccine',
    date: DateTime.now().subtract(const Duration(days: 50)),
    doctor: Doctor.drJulissa,
    medicalIndications: _listIndications,
  );

  static final listAppointment = [
    skinCareAppointment,
    sutureAppointment,
    childAppointment,
  ];
}
