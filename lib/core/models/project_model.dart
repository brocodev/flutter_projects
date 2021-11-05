
class ProjectModel {
  const ProjectModel({
    required this.title,
    required this.description,
    required this.designer,
    required this.pathImage,
    required this.route,
  });

  final String title;
  final String description;
  final String designer;
  final String pathImage;
  final String route;

  static const findOut = ProjectModel(
      title: "Find Out",
      description: "Flutter UI + Simple Animations",
      designer: "Mao Lop",
      pathImage: 'assets/img/projects/findout.png',
      route: "findOut");
  static const movieSelection = ProjectModel(
    title: "Movie Selection",
    description: "Flutter UI + Animations",
    designer: "Leonid Arestov",
    pathImage: 'assets/img/projects/movie.gif',
    route: "movie",
  );
  static const musicApp = ProjectModel(
    title: "Music App",
    description: "Flutter UI + Hero Animations",
    designer: "Mantra Design",
    pathImage: "assets/img/projects/music.gif",
    route: "music",
  );
  static const musicAppTwo = ProjectModel(
    title: "Music App Two",
    description: "Flutter UI + Explicit Animations",
    designer: "Khonok Lee",
    pathImage: 'assets/img/projects/music_two.png',
    route: "music_two",
  );
  static const medicalAppointment = ProjectModel(
      title: 'Medical Appointment',
      description: 'Flutter UI',
      designer: 'Kevin Melendez',
      pathImage: 'assets/img/projects/medical_appointment.png',
      route: 'medical');
  static const photographersApp = ProjectModel(
      title: 'Social Photographers App',
      description: 'Flutter UI + Simple animation',
      designer: 'Manuel Rovira',
      pathImage: 'assets/img/projects/photographers_app.png',
      route: 'photographers');
  static const instagram = ProjectModel(
      title: 'Instagram redesign',
      description: 'Flutter UI + Implicit Animations',
      designer: 'Manuel Rovira',
      pathImage: 'assets/img/projects/ig.png',
      route: 'instagram');
  static const superheroes = ProjectModel(
      title: 'Superhero Movies',
      description: 'Flutter UI + Animations',
      designer: 'vijay verma',
      pathImage: 'assets/img/projects/heroes.gif',
      route: 'superhero');

  static const orixGaming = ProjectModel(
      title: 'Orix Gaming',
      description: 'Flutter UI + Animations',
      designer: 'Sajon',
      pathImage: 'assets/img/projects/orix_gaming.jpg',
      route: 'gaming');

  static const bookApp = ProjectModel(
      title: 'Custom Book List',
      description: 'Flutter UI + Animations',
      designer: 'Sam',
      pathImage: 'assets/img/projects/book_app.gif',
      route: 'book');
  static const templateGallery = ProjectModel(
      title: 'Template Gallery',
      description: 'Page View + Stack',
      designer: 'Sergey Valiukh',
      pathImage: 'assets/img/projects/template_gallery.gif',
      route: 'template');

  // static const streamingApp = _ProjectModel(
  //     title: 'Streaming App',
  //     description: 'Advanced UI',
  //     designer: 'Mao Lop',
  //     pathImage: 'assets/img/projects/streaming_app.png',
  //     route: 'streaming');

  static const travelApp = ProjectModel(
    title: 'Travel app',
    description: 'Sliver Animations',
    designer: 'mobilepatterns',
    pathImage: 'assets/img/projects/streaming_app.png',
    route: 'travel',
  );
  static const listProjects = [
    // streamingApp,
    travelApp,
    templateGallery,
    bookApp,
    orixGaming,
    superheroes,
    instagram,
    photographersApp,
    medicalAppointment,
    musicAppTwo,
    findOut,
    musicApp,
    movieSelection,
  ];
}
