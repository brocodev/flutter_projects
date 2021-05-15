import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/books_app/book_app.dart';
import 'package:flutter_projects/find_out/find_out_app.dart';
import 'package:flutter_projects/instagram_redesign/instagram_app.dart';
import 'package:flutter_projects/movie_selection/movie_selection_app.dart';
import 'package:flutter_projects/music_album_collection/music_album_collection.dart';
import 'package:flutter_projects/music_vinyl_player/music_vinyl_player.dart';
import 'package:flutter_projects/orix_gaming/orix_gaming_app.dart';
import 'package:flutter_projects/photographers_app/photographers_app.dart';
import 'package:flutter_projects/superheroes/superheroes_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_projects/medical_appointment/medical_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brocodev Projects',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        backgroundColor: Colors.grey[50],
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => MainPage(),
        _ProjectModel.findOut.route: (context) => FindOutApp(),
        _ProjectModel.movieSelection.route: (context) => MovieSelectionApp(),
        _ProjectModel.musicApp.route: (context) => MusicAlbumList(),
        _ProjectModel.musicAppTwo.route: (context) => MusicVinylPlayer(),
        _ProjectModel.medicalAppointment.route: (context) => MedicalApp(),
        _ProjectModel.photographersApp.route: (context) => PhotographersApp(),
        _ProjectModel.instagram.route: (context) => InstagramApp(),
        _ProjectModel.superheroes.route: (context) => SuperheroesApp(),
        _ProjectModel.orixGaming.route: (context) => OrixGamingApp(),
        _ProjectModel.bookApp.route: (context) => BookApp(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: Center(child: FlutterLogo(size: 30)),
        title: Text(
          "My Flutter Projects",
          style: GoogleFonts.poppins(
              color: Colors.grey, fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        itemCount: _ProjectModel.listProjects.length,
        itemBuilder: (context, index) {
          final project = _ProjectModel.listProjects[index];
          return _ProjectCard(project: project);
        },
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    Key key,
    @required this.project,
  }) : super(key: key);

  final _ProjectModel project;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 20,
                      offset: Offset(-6, 6))
                ]),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    project.pathImage,
                    height: double.infinity,
                    width: size.width * .3,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          project.title,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600]),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          project.description,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Designer',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        project.designer,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () =>
                              Navigator.pushNamed(context, project.route),
                          color: Colors.cyan[50],
                          textColor: Colors.cyan,
                          child: Text(
                            "See project",
                            maxLines: 1,
                            softWrap: false,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectModel {
  final String title;
  final String description;
  final String designer;
  final String pathImage;
  final String route;

  const _ProjectModel({
    this.title,
    this.description,
    this.designer,
    this.pathImage,
    this.route,
  });

  static const findOut = _ProjectModel(
      title: "Find Out",
      description: "Flutter UI + Simple Animations",
      designer: "Mao Lop",
      pathImage: 'assets/img/findout.png',
      route: "findOut");
  static const movieSelection = _ProjectModel(
    title: "Movie Selection",
    description: "Flutter UI + Animations",
    designer: "Leonid Arestov",
    pathImage: 'assets/img/movie.gif',
    route: "movie",
  );
  static const musicApp = _ProjectModel(
    title: "Music App",
    description: "Flutter UI + Hero Animations",
    designer: "Mantra Design",
    pathImage: "assets/img/music.gif",
    route: "music",
  );
  static const musicAppTwo = _ProjectModel(
    title: "Music App Two",
    description: "Flutter UI + Explicit Animations",
    designer: "Khonok Lee",
    pathImage: 'assets/img/music_two.png',
    route: "music_two",
  );
  static const medicalAppointment = _ProjectModel(
      title: 'Medical Appointment',
      description: 'Flutter UI',
      designer: 'Kevin Melendez',
      pathImage: 'assets/img/medical_appointment.png',
      route: 'medical');
  static const photographersApp = _ProjectModel(
      title: 'Social Photographers App',
      description: 'Flutter UI + Simple animation',
      designer: 'Manuel Rovira',
      pathImage: 'assets/img/photographers_app.png',
      route: 'photographers');
  static const instagram = _ProjectModel(
      title: 'Instagram redesign',
      description: 'Flutter UI + Implicit Animations',
      designer: 'Manuel Rovira',
      pathImage: 'assets/img/ig.png',
      route: 'instagram');
  static const superheroes = _ProjectModel(
      title: 'Superhero Movies',
      description: 'Flutter UI + Animations',
      designer: 'vijay verma',
      pathImage: 'assets/img/heroes.gif',
      route: 'superhero');

  static const orixGaming = _ProjectModel(
      title: 'Orix Gaming',
      description: 'Flutter UI + Animations',
      designer: 'Sajon',
      pathImage: 'assets/img/orix_gaming.jpg',
      route: 'gaming');

  static const bookApp = _ProjectModel(
      title: 'Custom Book List',
      description: 'Flutter UI + Animations',
      designer: 'Sam',
      pathImage: 'assets/img/book_app.gif',
      route: 'book');

  static const listProjects = [
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
