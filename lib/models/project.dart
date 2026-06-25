class Project {
  String title;
  String description;
  ProjectStatus status;
  DateTime? date;

  Project({
    required this.title,
    required this.description,
    this.status = ProjectStatus.upComing,
    this.date,
  });
}

enum ProjectStatus { upComing, inProgress, done }
