import 'package:flutter/material.dart';
import 'package:flutter_projects/core/models/project_model.dart';
import 'package:flutter_projects/core/ui/widgets/project_card.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: const Center(child: FlutterLogo(size: 30)),
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
            index: ProjectModel.listProjects.length - index,
          );
        },
      ),
    );
  }
}
