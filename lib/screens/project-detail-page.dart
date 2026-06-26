import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/project.dart';
import '../models/task.dart';

class ProjectDetailPage extends StatefulWidget {
  Project project;

  ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTasks();
  }

  Future<void> loadTasks() async {
    await widget.project.initTasks();
    setState(() {});
  }

  toggleTaskState(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.push("/edit", extra: widget.project);
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
            switch (widget.project.status) {
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
            if (widget.project.date != null)
              Text(
                "Date de début : ${widget.project.date?.day}/${widget.project.date?.month}/${widget.project.date?.year}",
                style: TextStyle(color: Colors.black),
              ),
            Text(
              widget.project.description,
              style: TextStyle(color: Colors.black),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.project.tasks.length,
                itemBuilder: (context, index) {
                  Task task = widget.project.tasks[index];
                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      leading: task.isCompleted
                          ? Icon(Icons.done, color: Colors.green)
                          : Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.yellow,
                            ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          task.isCompleted
                              ? IconButton(
                                  icon: Icon(Icons.refresh),
                                  color: Colors.green,
                                  onPressed: () {
                                    toggleTaskState(task);
                                  },
                                )
                              : IconButton(
                                  color: Colors.yellow,
                                  onPressed: () {
                                    toggleTaskState(task);
                                  },
                                  icon: Icon(Icons.check_box),
                                ),
                          Icon(Icons.delete),
                        ],
                      ),
                      title: Text(task.name),
                      subtitle: task.isCompleted
                          ? Text(
                              "Tâche complétée",
                              style: TextStyle(color: Colors.green),
                            )
                          : Text("Aucun détail"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
