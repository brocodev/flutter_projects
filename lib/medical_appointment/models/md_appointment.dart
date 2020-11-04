import 'md_doctor.dart';
import 'md_indication.dart';

class MedicalAppointment {
  final String title;
  DateTime date;
  final Doctor doctor;
  final List<MedicalIndication> medicalIndications;

  MedicalAppointment({
    this.title,
    this.date,
    this.doctor,
    this.medicalIndications,
  });

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
    date: DateTime.now().add(Duration(days: 30)),
    doctor: Doctor.drRichard,
    medicalIndications: _listIndications,
  );

  static final skinCareAppointment = MedicalAppointment(
    title: 'Skin care',
    date: DateTime.now().subtract(Duration(days: 10)),
    doctor: Doctor.drLiliana,
    medicalIndications: _listIndications,
  );

  static final sutureAppointment = MedicalAppointment(
    title: 'Suture revision',
    date: DateTime.now().subtract(Duration(days: 30)),
    doctor: Doctor.drEdward,
    medicalIndications: _listIndications,
  );

  static final childAppointment = MedicalAppointment(
    title: 'Kid Vaccine',
    date: DateTime.now().subtract(Duration(days: 50)),
    doctor: Doctor.drJulissa,
    medicalIndications: _listIndications,
  );

  static final listAppointment = [
    skinCareAppointment,
    sutureAppointment,
    childAppointment,
  ];
}
