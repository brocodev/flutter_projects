class Patient {
  final String name;
  final String lastName;
  final String email;
  final String photoUrl;
  final String phone;
  final MedicalCheck medicalCheck;
  final List<MedicalAppointment> appointmentHistory;
  final MedicalAppointment nextAppointment;

  Patient({
    this.name,
    this.lastName,
    this.email,
    this.photoUrl,
    this.phone,
    this.medicalCheck,
    this.appointmentHistory,
    this.nextAppointment,
  });
}

class MedicalAppointment {}

class MedicalCheck {}
