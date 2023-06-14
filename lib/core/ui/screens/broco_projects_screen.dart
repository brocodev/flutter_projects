import 'package:flutter/material.dart';
import 'package:flutter_projects/core/models/project_model.dart';
import 'package:flutter_projects/core/ui/widgets/project_card.dart';
import 'package:google_fonts/google_fonts.dart';

class BrocoProjectsScreen extends StatelessWidget {
  const BrocoProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/projects/broco.png'),
            ),
          ),
        ),
        title: Text(
          'Brocodev Projects',
          style: GoogleFonts.poppins(
            color: const Color(0xff001800),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: FlutterLogo(size: 25),
          )
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: ProjectModel.listProjects.reversed.length,
        reverse: true,
        primary: true,
        itemBuilder: (context, index) {
          final project = ProjectModel.listProjects[index];
          return ProjectCard(
            project: project,
            index: ProjectModel.listProjects.length - index,
          );
        },
      ),
    );
  }
}
