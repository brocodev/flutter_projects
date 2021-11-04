
class ProjectModel {
  const ProjectModel({
    this.title,
    this.description,
    this.designer,
    this.pathImage,
    this.route,
  });

  final String? title;
  final String? description;
  final String? designer;
  final String? pathImage;
  final String? route;

  static const findOut = ProjectModel(
      title: "Find Out",
      description: "Flutter UI + Simple Animations",
      designer: "Mao Lop",
      pathImage: 'assets/img/findout.png',
      route: "findOut");
  static const movieSelection = ProjectModel(
    title: "Movie Selection",
    description: "Flutter UI + Animations",
    designer: "Leonid Arestov",
    pathImage: 'assets/img/movie.gif',
    route: "movie",
  );
  static const musicApp = ProjectModel(
    title: "Music App",
    description: "Flutter UI + Hero Animations",
    designer: "Mantra Design",
    pathImage: "assets/img/music.gif",
    route: "music",
  );
  static const musicAppTwo = ProjectModel(
    title: "Music App Two",
    description: "Flutter UI + Explicit Animations",
    designer: "Khonok Lee",
    pathImage: 'assets/img/music_two.png',
    route: "music_two",
  );
  static const medicalAppointment = ProjectModel(
      title: 'Medical Appointment',
      description: 'Flutter UI',
      designer: 'Kevin Melendez',
      pathImage: 'assets/img/medical_appointment.png',
      route: 'medical');
  static const photographersApp = ProjectModel(
      title: 'Social Photographers App',
      description: 'Flutter UI + Simple animation',
      designer: 'Manuel Rovira',
      pathImage: 'assets/img/photographers_app.png',
      route: 'photographers');
  static const instagram = ProjectModel(
      title: 'Instagram redesign',
      description: 'Flutter UI + Implicit Animations',
      designer: 'Manuel Rovira',
      pathImage: 'assets/img/ig.png',
      route: 'instagram');
  static const superheroes = ProjectModel(
      title: 'Superhero Movies',
      description: 'Flutter UI + Animations',
      designer: 'vijay verma',
      pathImage: 'assets/img/heroes.gif',
      route: 'superhero');

  static const orixGaming = ProjectModel(
      title: 'Orix Gaming',
      description: 'Flutter UI + Animations',
      designer: 'Sajon',
      pathImage: 'assets/img/orix_gaming.jpg',
      route: 'gaming');

  static const bookApp = ProjectModel(
      title: 'Custom Book List',
      description: 'Flutter UI + Animations',
      designer: 'Sam',
      pathImage: 'assets/img/book_app.gif',
      route: 'book');
  static const templateGallery = ProjectModel(
      title: 'Template Gallery',
      description: 'Page View + Stack',
      designer: 'Sergey Valiukh',
      pathImage: 'assets/img/template_gallery.gif',
      route: 'template');

  // static const streamingApp = _ProjectModel(
  //     title: 'Streaming App',
  //     description: 'Advanced UI',
  //     designer: 'Mao Lop',
  //     pathImage: 'assets/img/streaming_app.png',
  //     route: 'streaming');
  static const listProjects = [
    // streamingApp,
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
