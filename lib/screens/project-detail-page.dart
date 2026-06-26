import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/project.dart';

class ProjectDetailPage extends StatelessWidget {
  Project project;

  ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.push("/edit", extra: project);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            switch (project.status) {
              ProjectStatus.upComing => Text(
                "Statut : A venir !",
                style: TextStyle(color: Colors.black),
              ),
              ProjectStatus.inProgress => Text(
                "Statut : En cours !",
                style: TextStyle(color: Colors.black),
              ),
              ProjectStatus.done => Text(
                "Statut : Terminé !",
                style: TextStyle(color: Colors.black),
              ),
            },
            if (project.date != null)
              Text(
                "Date de début : ${project.date?.day}/${project.date?.month}/${project.date?.year}",
                style: TextStyle(color: Colors.black),
              ),
            Text(project.description, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
