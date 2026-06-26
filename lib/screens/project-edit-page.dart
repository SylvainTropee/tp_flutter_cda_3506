import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_flutter_cda_3506/widgets/project-form.dart';

import '../models/project.dart';

class ProjectEditPage extends StatelessWidget {
  Project project;
  ProjectEditPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title), centerTitle: true),
      body: ProjectForm(project : project, submit: (project){
        context.go("/");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Le projet ${project.title}  a été modifié !"))
        );
      }),
    );
  }
}
