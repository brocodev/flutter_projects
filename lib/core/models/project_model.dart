class ProjectModel {
  const ProjectModel._({
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

  static const findOut = ProjectModel._(
    title: 'Find Out',
    description: 'Flutter UI + Simple Animations',
    designer: 'Mao Lop',
    pathImage: 'assets/img/projects/findout.png',
    route: 'findOut',
  );
  static const movieSelection = ProjectModel._(
    title: 'Movie Selection',
    description: 'Flutter UI + Animations',
    designer: 'Leonid Arestov',
    pathImage: 'assets/img/projects/movie.gif',
    route: 'movie',
  );
  static const musicApp = ProjectModel._(
    title: 'Music App',
    description: 'Flutter UI + Hero Animations',
    designer: 'Mantra Design',
    pathImage: 'assets/img/projects/music.gif',
    route: 'music',
  );
  static const musicAppTwo = ProjectModel._(
    title: 'Music App Two',
    description: 'Flutter UI + Explicit Animations',
    designer: 'Khonok Lee',
    pathImage: 'assets/img/projects/music_two.png',
    route: 'music_two',
  );
  static const medicalAppointment = ProjectModel._(
    title: 'Medical Appointment',
    description: 'Flutter UI',
    designer: 'Kevin Melendez',
    pathImage: 'assets/img/projects/medical_appointment.png',
    route: 'medical',
  );
  static const photographersApp = ProjectModel._(
    title: 'Social Photographers App',
    description: 'Flutter UI + Simple animation',
    designer: 'Manuel Rovira',
    pathImage: 'assets/img/projects/photographers_app.png',
    route: 'photographers',
  );
  static const instagram = ProjectModel._(
    title: 'Instagram redesign',
    description: 'Flutter UI + Implicit Animations',
    designer: 'Manuel Rovira',
    pathImage: 'assets/img/projects/ig.png',
    route: 'instagram',
  );
  static const superheroes = ProjectModel._(
    title: 'Superhero Movies',
    description: 'Flutter UI + Animations',
    designer: 'vijay verma',
    pathImage: 'assets/img/projects/heroes.gif',
    route: 'superhero',
  );

  static const orixGaming = ProjectModel._(
    title: 'Orix Gaming',
    description: 'Flutter UI + Animations',
    designer: 'Sajon',
    pathImage: 'assets/img/projects/orix_gaming.jpg',
    route: 'gaming',
  );

  static const bookApp = ProjectModel._(
    title: 'Custom Book List',
    description: 'Flutter UI + Animations',
    designer: 'Sam',
    pathImage: 'assets/img/projects/book_app.gif',
    route: 'book',
  );
  static const templateGallery = ProjectModel._(
    title: 'Template Gallery',
    description: 'Page View + Stack',
    designer: 'Sergey Valiukh',
    pathImage: 'assets/img/projects/template_gallery.gif',
    route: 'template',
  );

  static const travelApp = ProjectModel._(
    title: 'Travel app',
    description: 'Sliver Animations',
    designer: 'Pasha Zarutsky',
    pathImage: 'assets/img/projects/travel.gif',
    route: 'travel',
  );

  static const boatsApp = ProjectModel._(
    title: 'Boats app',
    description: 'Hero Custom Animation',
    designer: 'Unknown',
    pathImage: 'assets/img/projects/boats.gif',
    route: 'boats',
  );
  static const listProjects = [
    travelApp,
    templateGallery,
    boatsApp,
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
