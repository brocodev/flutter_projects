enum MedicalState { Danger, Normal, Alert }

class MedicalCheckItem {
  final String title;
  final String info;
  final String pathImage;
  final MedicalState state;

  MedicalCheckItem({this.title, this.info, this.pathImage, this.state});

  static final listItemCheck = [
    MedicalCheckItem(
        title: 'Weight & Height',
        info: '149.7 lb - 172 cm',
        pathImage: 'assets/img/medical/weight.png',
        state: MedicalState.Normal),
    MedicalCheckItem(
        title: 'Blood pressure',
        info: '130/90 mm',
        pathImage: 'assets/img/medical/arm.png',
        state: MedicalState.Alert),
    MedicalCheckItem(
        title: 'Cholesterol',
        info: '200 mg/dl',
        pathImage: 'assets/img/medical/cholesterol.png',
        state: MedicalState.Alert),
    MedicalCheckItem(
      title: 'Glucose',
      info: '200 mg/dl',
      pathImage: 'assets/img/medical/diabetes-test.png',
      state: MedicalState.Danger,
    ),
    MedicalCheckItem(
      title: 'Lung health',
      info: '90 %',
      pathImage: 'assets/img/medical/lungs.png',
      state: MedicalState.Normal,
    ),
    MedicalCheckItem(
      title: 'Stress',
      info: '40 %',
      pathImage: 'assets/img/medical/brain.png',
      state: MedicalState.Alert,
    ),
  ];
}
