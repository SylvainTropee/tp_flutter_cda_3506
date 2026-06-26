import 'package:flutter/material.dart';
import 'package:tp_flutter_cda_3506/models/project.dart';
import 'package:tp_flutter_cda_3506/utils/validators.dart';

class ProjectForm extends StatefulWidget {
  Project? project;
  Function(Project) submit;

  ProjectForm({super.key, required this.submit, this.project});

  @override
  State<ProjectForm> createState() => _ProjectFormState();
}

class _ProjectFormState extends State<ProjectForm> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();

  String? title, description;
  ProjectStatus? status;
  DateTime? pickedDate;

  @override
  void initState() {
    super.initState();
    var project = widget.project;
    if(project != null){
      dateController.text
           = "${project.date?.day}/${project.date?.month}/${project.date?.year}";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) {
                title = value;
              },
              initialValue: widget.project?.title ?? "",
              validator: Validators.required,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Titre du projet",
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              onSaved: (value) {
                description = value;
              },
              initialValue: widget.project?.description ?? "",
              validator: Validators.required,
              maxLines: 5,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Description du projet",
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<ProjectStatus>(
              onSaved: (value) {
                status = value;
              },
              initialValue: widget.project?.status ?? ProjectStatus.upComing,
              decoration: InputDecoration(
                labelText: "Statut",
                labelStyle: TextStyle(color: Colors.black),
              ),
              dropdownColor: Colors.white,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {},
              items: [
                DropdownMenuItem(
                  child: Text("A venir"),
                  value: ProjectStatus.upComing,
                ),
                DropdownMenuItem(
                  child: Text("Terminé"),
                  value: ProjectStatus.done,
                ),
                DropdownMenuItem(
                  child: Text("En cours"),
                  value: ProjectStatus.inProgress,
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: dateController,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 1),
                );
                if (date != null) {
                  pickedDate = date;
                  dateController.text =
                      "${date.year}/${date.month}/${date.day}";
                }
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Date du projet",
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();

                  var project = widget.project;

                  if(project == null){
                    project = Project(
                      title: title ?? "Titre par défaut",
                      description: description ?? "Description par défaut",
                      status: status ?? ProjectStatus.upComing,
                      date: pickedDate,
                    );
                  }else{
                    project.title = title ?? "Titre par défaut";
                    project.description = description ?? "Description par défaut";
                    project.status = status ?? ProjectStatus.upComing;
                    project.date = pickedDate;
                  }
                  widget.submit(project);
                }
              },
              label: Text("Soumettre"),
              icon: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
