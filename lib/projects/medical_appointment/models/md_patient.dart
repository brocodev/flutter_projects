import 'package:flutter_projects/projects/medical_appointment/models/md_appointment.dart';
import 'package:flutter_projects/projects/medical_appointment/models/md_check.dart';
export 'md_appointment.dart';
export 'md_check.dart';

class MedicalPatient {
  const MedicalPatient({
    this.name,
    this.lastName,
    this.email,
    this.photoUrl,
    this.phone,
    this.medicalChecks,
    this.appointmentHistory,
    this.nextAppointment,
  });

  final String? name;
  final String? lastName;
  final String? email;
  final String? photoUrl;
  final String? phone;
  final List<MedicalCheck>? medicalChecks;
  final List<MedicalAppointment>? appointmentHistory;
  final MedicalAppointment? nextAppointment;

  static final currentPatient = MedicalPatient(
    name: 'Kevin',
    lastName: 'Melendez',
    email: 'kevinmdezhdez@gmail.com',
    photoUrl:
        'https://images.unsplash.com/photo-1480455624313-e29b44bbfde1?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjF8fG1lbnxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=500&q=60',
    appointmentHistory: MedicalAppointment.listAppointment,
    nextAppointment: MedicalAppointment.nextAppointment,
    phone: '+52741137588',
    medicalChecks: const [
      MedicalCheck(check: TypeCheck.weight, value: 149.7),
      MedicalCheck(check: TypeCheck.height, value: 170.7),
      MedicalCheck(check: TypeCheck.cholesterol, value: 200),
      MedicalCheck(check: TypeCheck.electrocardiogram, value: 60),
      MedicalCheck(check: TypeCheck.bloodPressure, value: 0.87),
      MedicalCheck(check: TypeCheck.hemoglobin, value: 120),
      MedicalCheck(check: TypeCheck.glucose, value: 89),
    ],
  );
}
