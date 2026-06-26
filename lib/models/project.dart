import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tp_flutter_cda_3506/models/task.dart';

class Project {
  String title;
  String description;
  ProjectStatus status;
  List<Task> tasks;
  DateTime? date;

  Project({
    required this.title,
    required this.description,
    this.status = ProjectStatus.upComing,
    this.date,
  }) : tasks = [];

  Future<void> initTasks() async {
    if (this.tasks.isEmpty) {
      var response = await http.get(
        Uri.parse(("https://jsonplaceholder.typicode.com/users/1/todos")),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        tasks = data.map((t) => Task.fromJson(t)).toList();
      }
    }
  }
}

enum ProjectStatus { upComing, inProgress, done }
