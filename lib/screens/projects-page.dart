import 'package:flutter/material.dart';
import '../models/project.dart';
import '../widgets/project-card.dart';


class ProjectsPage extends StatelessWidget {
  List<Project> projects;
  ProjectsPage({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCart(project: projects[index]);
      },
    );
  }
}
