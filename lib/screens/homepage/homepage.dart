import 'package:flutter/material.dart';
import 'package:tp_flutter_cda_3506/models/project.dart';
import 'package:tp_flutter_cda_3506/screens/homepage/contribution-page.dart';
import 'package:tp_flutter_cda_3506/widgets/project-form.dart';
import 'package:tp_flutter_cda_3506/screens/homepage/projects-page.dart';
import '../../widgets/project-card.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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

  int _selectedIndex = 0;

  void submit(Project project) {
    setState(() {
      projects.add(project);
      _selectedIndex = 0;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Le projet ${project.title} a été ajouté !"))
    );
  }

  void _addProject() {
    setState(() {
      projects.add(
        Project(
          title: "Projet n°${projects.length + 1}",
          description: "Nouveau projet",
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex == 0 ? ProjectFAB(onPressed: _addProject) : null,
      appBar: AppBar(
        leading: const Icon(Icons.rocket_launch_rounded),
        title: Text(_selectedIndex == 0 ? "Mes projets" : "Contribuer"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Projets"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Contribuer",
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? ProjectsPage(projects: projects)
          : ContributionPage(submit: submit),
    );
  }
}

class ProjectFAB extends StatelessWidget {
  void Function() onPressed;

  ProjectFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add, size: 45),
    );
  }
}
