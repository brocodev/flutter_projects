import 'package:flutter_projects/medical_appointment/models/md_doctor.dart';

class Appointment {
  final String nameAppointment;
  final DateTime date;
  final Doctor doctor;
  final MdAddress address;
  final List<MdIndications> medicalIndications;

  const Appointment({
    this.nameAppointment,
    this.date,
    this.doctor,
    this.address,
    this.medicalIndications,
  });
}

class MdIndications {}

class MdAddress {}
