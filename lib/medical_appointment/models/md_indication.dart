
class MedicalIndication {
  final String title;
  final String svgIconPath;
  final String description;

  const MedicalIndication._({this.svgIconPath, this.description, this.title});

  static const kNoDrinkAlcohol = MedicalIndication._(
      title: "No alcohol",
      description: "Don't drinking alcohol",
      svgIconPath: 'assets/svg/medical/mi-no-drinking.svg');
  static const kDrinkWater = MedicalIndication._(
      title: "Drink water",
      description: 'Drink a lot of water',
      svgIconPath: 'assets/svg/medical/mi-drink-water.svg');
  static const kNoEatFastFood = MedicalIndication._(
      title: "No fast food",
      description: "Don't eat fast food",
      svgIconPath: 'assets/svg/medical/mi-no-fast-food.svg');
  static const kEatVegetables = MedicalIndication._(
      title: "Eat diet",
      description: 'Eat more vegetables',
      svgIconPath: 'assets/svg/medical/mi-eat-vegatables.svg');
  static const kNoCoffee = MedicalIndication._(
      title: "No coffee",
      description: "Don't consume caffeine",
      svgIconPath: 'assets/svg/medical/mi-no-coffee.svg');
  static const kExercise = MedicalIndication._(
      title: "Exercise",
      description: "Make more exercise",
      svgIconPath: 'assets/svg/medical/mi-make-exercise.svg');
}
