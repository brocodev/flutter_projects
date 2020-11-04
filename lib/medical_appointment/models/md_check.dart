enum TypeCheck {
  Weight,
  Hemoglobin,
  Blood_Pressure,
  Electrocardiogram,
  Cholesterol,
  Glucose,
  Height
}
enum MedicalState { Normal, Alert, Danger }

class MedicalCheck {
  final TypeCheck check;
  final double value;

  const MedicalCheck({this.check, this.value});

  String getSvgPath() {
    return {
      TypeCheck.Glucose: 'assets/svg/medical/mc-glucose.svg',
      TypeCheck.Weight: 'assets/svg/medical/mc-weight.svg',
      TypeCheck.Hemoglobin: 'assets/svg/medical/mc-hemoglobin.svg',
      TypeCheck.Blood_Pressure: 'assets/svg/medical/mc-blood-pressure.svg',
      TypeCheck.Electrocardiogram: 'assets/svg/medical/mc-cardiogram.svg',
      TypeCheck.Cholesterol: 'assets/svg/medical/mc-cholesterol.svg',
      TypeCheck.Height: 'assets/svg/medical/mc-height.svg',
    }[check];
  }

  String getMeasure() {
    return {
      TypeCheck.Glucose: 'g/dL',
      TypeCheck.Weight: 'kg',
      TypeCheck.Hemoglobin: 'g/dL',
      TypeCheck.Blood_Pressure: 'mmHg',
      TypeCheck.Electrocardiogram: 'hz',
      TypeCheck.Cholesterol: 'mg/dL',
      TypeCheck.Height: 'cm'
    }[check];
  }

  MedicalState getMedicalState() {
    switch (check) {
      case TypeCheck.Weight:
        return MedicalState.Alert;
      case TypeCheck.Glucose:
        return MedicalState.Normal;
      case TypeCheck.Hemoglobin:
        return MedicalState.Alert;
      case TypeCheck.Blood_Pressure:
        return MedicalState.Normal;
      case TypeCheck.Electrocardiogram:
        return MedicalState.Normal;
      case TypeCheck.Cholesterol:
        return MedicalState.Danger;
      default:
        return MedicalState.Normal;
    }
  }
}
