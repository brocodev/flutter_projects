enum TypeCheck {
  weight,
  hemoglobin,
  bloodPressure,
  electrocardiogram,
  cholesterol,
  glucose,
  height
}

enum MedicalState { normal, alert, danger }

class MedicalCheck {
  const MedicalCheck({this.check, this.value});

  final TypeCheck? check;
  final double? value;

  String? getSvgPath() {
    return {
      TypeCheck.glucose: 'assets/svg/medical/mc-glucose.svg',
      TypeCheck.weight: 'assets/svg/medical/mc-weight.svg',
      TypeCheck.hemoglobin: 'assets/svg/medical/mc-hemoglobin.svg',
      TypeCheck.bloodPressure: 'assets/svg/medical/mc-blood-pressure.svg',
      TypeCheck.electrocardiogram: 'assets/svg/medical/mc-cardiogram.svg',
      TypeCheck.cholesterol: 'assets/svg/medical/mc-cholesterol.svg',
      TypeCheck.height: 'assets/svg/medical/mc-height.svg',
    }[check!];
  }

  String? getMeasure() {
    return {
      TypeCheck.glucose: 'g/dL',
      TypeCheck.weight: 'kg',
      TypeCheck.hemoglobin: 'g/dL',
      TypeCheck.bloodPressure: 'mmHg',
      TypeCheck.electrocardiogram: 'hz',
      TypeCheck.cholesterol: 'mg/dL',
      TypeCheck.height: 'cm'
    }[check!];
  }

  MedicalState getMedicalState() {
    switch (check!) {
      case TypeCheck.weight:
        return MedicalState.alert;
      case TypeCheck.glucose:
        return MedicalState.normal;
      case TypeCheck.hemoglobin:
        return MedicalState.alert;
      case TypeCheck.bloodPressure:
        return MedicalState.normal;
      case TypeCheck.electrocardiogram:
        return MedicalState.normal;
      case TypeCheck.cholesterol:
        return MedicalState.danger;
      case TypeCheck.height:
        return MedicalState.normal;
    }
  }
}
