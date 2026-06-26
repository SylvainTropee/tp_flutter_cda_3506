class Task {
  String name;
  bool isCompleted;
  List<String> details;

  Task({required this.name, required this.isCompleted, required this.details});

  Task.fromJson(Map<String, dynamic> json)
    : name = json['title'],
      isCompleted = json['completed'],
      details = [];
}
