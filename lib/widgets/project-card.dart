import 'package:flutter/material.dart';
import '../models/project.dart';

class ProjectCart extends StatelessWidget {
  Project project;

  ProjectCart({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: Icon(Icons.work, color: Theme.of(context).primaryColor),
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(project.title),
        subtitle: Text(project.description),
      ),
    );
    ;
  }
}
