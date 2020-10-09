import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/find_out/find_out_app.dart';
import 'package:flutter_projects/movie_selection/movie_selection_app.dart';
import 'package:flutter_projects/music_app/music_app.dart';
import 'package:flutter_projects/music_app_two/music_app_two.dart';
import 'package:flutter_projects/photographers_app/photographers_app.dart';
import 'package:flutter_projects/res.dart';
import 'package:google_fonts/google_fonts.dart';
import 'medical_appointment/medical_app.dart';

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
      title: 'Flutter Demo',
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
        ProjectModel.findOut.routeNavigator: (context) => FindOutApp(),
        ProjectModel.movieSelection.routeNavigator: (context) =>
            MovieSelectionApp(),
        ProjectModel.musicApp.routeNavigator: (context) => MusicApp(),
        ProjectModel.musicAppTwo.routeNavigator: (context) => MusicAppTwo(),
        ProjectModel.medicalAppointment.routeNavigator: (context) => MedicalApp(),
        ProjectModel.photographersApp.routeNavigator: (context) => PhotographersApp(),
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
        itemCount: ProjectModel.listProjects.length,
        itemBuilder: (context, index) {
          final project = ProjectModel.listProjects[index];
          return ProjectCard(
            project: project,
          );
        },
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key key,
    @required this.project,
  }) : super(key: key);

  final ProjectModel project;

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
            height: size.height * .17,
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
                    width: size.width * .32,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        project.title,
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600]),
                      ),
                      AutoSizeText(
                        project.description,
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue),
                      ),
                      const Spacer(),
                      AutoSizeText(
                        'Designer',
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.grey),
                      ),
                      AutoSizeText(
                        project.designer,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: SizedBox(
              height: size.height * .032,
              width: size.width * .24,
              child: FlatButton(
                shape: StadiumBorder(side: BorderSide(color: Colors.cyan)),
                onPressed: () =>
                    Navigator.pushNamed(context, project.routeNavigator),
                color: Colors.white,
                textColor: Colors.cyan,
                child: AutoSizeText(
                  "See project",
                  maxLines: 1,
                  softWrap: false,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProjectModel {
  final String title;
  final String description;
  final String designer;
  final String pathImage;
  final String routeNavigator;

  ProjectModel({
    this.title,
    this.description,
    this.designer,
    this.pathImage,
    this.routeNavigator,
  });

  static final findOut = ProjectModel(
      title: "Find Out",
      description: "Flutter UI + Simple Animations",
      designer: "Mao Lop",
      pathImage: Res.findout,
      routeNavigator: "findOut");
  static final movieSelection = ProjectModel(
    title: "Movie Selection",
    description: "Flutter UI + Animations",
    designer: "Leonid Arestov",
    pathImage: Res.movie,
    routeNavigator: "movie",
  );
  static final musicApp = ProjectModel(
    title: "Music App",
    description: "Flutter UI + Hero Animations",
    designer: "Mantra Design",
    pathImage: Res.music,
    routeNavigator: "music",
  );
  static final musicAppTwo = ProjectModel(
    title: "Music App Two",
    description: "Flutter UI + Animations",
    designer: "Khonok Lee",
    pathImage: Res.music_two,
    routeNavigator: "music_two",
  );
  static final medicalAppointment = ProjectModel(
    title: 'Medical Appointment',
    description: 'Flutter UI',
    designer: 'Kevin Melendez',
    pathImage: Res.medical_appointment,
    routeNavigator: 'medical'
  );
  static final photographersApp = ProjectModel(
      title: 'Social Photographers App',
      description: 'Flutter UI',
      designer: 'Manuel Rovira',
      pathImage: Res.photographers_app,
      routeNavigator: 'photographers'
  );
  static final listProjects = [
    photographersApp,
    medicalAppointment,
    musicAppTwo,
    findOut,
    musicApp,
    movieSelection,
  ];
}
