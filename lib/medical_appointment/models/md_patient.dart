import 'md_appointment.dart';
import 'md_check.dart';
export 'md_appointment.dart';
export 'md_check.dart';

class MedicalPatient {
  final String name;
  final String lastName;
  final String email;
  final String photoUrl;
  final String phone;
  final List<MedicalCheck> medicalChecks;
  final List<MedicalAppointment> appointmentHistory;
  final MedicalAppointment nextAppointment;

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

  static final currentPatient = MedicalPatient(
    name: 'Kevin',
    lastName: 'Melendez',
    email: 'kevinmdezhdez@gmail.com',
    photoUrl: 'https://scontent.faca1-1.fna.fbcdn.net/v/t1.0-9/120603136_2461308150844778_7380402767182275816_n.jpg?_nc_cat=103&ccb=2&_nc_sid=09cbfe&_nc_ohc=YqMDa3aMdgMAX8QMKTS&_nc_ht=scontent.faca1-1.fna&oh=576f59fafbc50c7eff7eced5e1349d64&oe=5FB75AF6',
    appointmentHistory: MedicalAppointment.listAppointment,
    nextAppointment: MedicalAppointment.nextAppointment,
    phone: '+52741137588',
    medicalChecks: [
      MedicalCheck(check: TypeCheck.Weight, value: 149.7),
      MedicalCheck(check: TypeCheck.Height, value: 170.7),
      MedicalCheck(check: TypeCheck.Cholesterol, value: 200),
      MedicalCheck(check: TypeCheck.Electrocardiogram, value: 60),
      MedicalCheck(check: TypeCheck.Blood_Pressure, value: 0.87),
      MedicalCheck(check: TypeCheck.Hemoglobin, value: 120),
      MedicalCheck(check: TypeCheck.Glucose, value: 89),
    ],
  );
}
