import 'package:flutter/material.dart';
import 'package:tp_flutter_cda_3506/models/project.dart';
import '../widgets/project-card.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  List<Project> projects = [
    Project(
      title: "Projet Manhattan",
      description: "Un projet vraiment enorme",
    ),
    Project(
      title: "Projet important",
      description: "Un projet vraiment important",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.rocket_launch_rounded),
        title: const Text("Mes projets"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Projets"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Contribuer",
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return ProjectCart(project: projects[index]);
        },
      ),
    );
  }
}

