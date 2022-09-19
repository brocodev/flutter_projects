import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/core/models/project_model.dart';
import 'package:flutter_projects/core/ui/screens/broco_projects_screen.dart';
import 'package:flutter_projects/projects/boats_app/boats_app.dart';
import 'package:flutter_projects/projects/bookstore_app/book_app.dart';
import 'package:flutter_projects/projects/find_out/find_out_app.dart';
import 'package:flutter_projects/projects/instagram_redesign/instagram_app.dart';
import 'package:flutter_projects/projects/medical_appointment/medical_app.dart';
import 'package:flutter_projects/projects/movie_selection/movie_selection_app.dart';
import 'package:flutter_projects/projects/music_album_collection/music_album_collection.dart';
import 'package:flutter_projects/projects/music_vinyl_player/music_vinyl_player.dart';
import 'package:flutter_projects/projects/orix_gaming/orix_gaming_app.dart';
import 'package:flutter_projects/projects/photographers_app/photographers_app.dart';
import 'package:flutter_projects/projects/superheroes/superheroes_app.dart';
import 'package:flutter_projects/projects/template_gallery/template_gallery_app.dart';
import 'package:flutter_projects/projects/travel_app/travel_app.dart';

class ProjectRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const BrocoProjectsScreen(),
    ProjectModel.findOut.route: (_) => const FindOutApp(),
    ProjectModel.movieSelection.route: (_) => const MovieSelectionApp(),
    ProjectModel.musicApp.route: (_) => const MusicAlbumList(),
    ProjectModel.musicAppTwo.route: (_) => const MusicVinylPlayer(),
    ProjectModel.medicalAppointment.route: (_) => const MedicalApp(),
    ProjectModel.photographersApp.route: (_) => const PhotographersApp(),
    ProjectModel.instagram.route: (_) => const InstagramApp(),
    ProjectModel.superheroes.route: (_) => const SuperheroesApp(),
    ProjectModel.orixGaming.route: (_) => const OrixGamingApp(),
    ProjectModel.bookApp.route: (_) => const BookStoreApp(),
    ProjectModel.boatsApp.route: (_) => const BoatsApp(),
    ProjectModel.templateGallery.route: (_) => const TemplateGalleryApp(),
    ProjectModel.travelApp.route: (_) => const TravelApp(),
  };
}
