import 'package:flutter/material.dart';
import 'package:tp_flutter_cda_3506/models/project.dart';
import 'package:tp_flutter_cda_3506/utils/validators.dart';

class ContributionPage extends StatefulWidget {
  Function(Project) submit;

  ContributionPage({super.key, required this.submit});

  @override
  State<ContributionPage> createState() => _ContributionPageState();
}

class _ContributionPageState extends State<ContributionPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();

  String? title, description;
  ProjectStatus? status;
  DateTime? pickedDate;

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
              decoration: InputDecoration(
                labelText: "Statut",
                labelStyle: TextStyle(color: Colors.black),
              ),
              initialValue: ProjectStatus.upComing,
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
                if(date != null){
                  pickedDate = date;
                  dateController.text = "${date.year}/${date.month}/${date.day}";
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
                  var project = Project(
                    title: title ?? "Titre par défaut",
                    description: description ?? "Description par défaut",
                    status: status ?? ProjectStatus.upComing,
                    date: pickedDate
                  );
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
