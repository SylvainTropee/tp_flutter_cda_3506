import 'package:flutter/material.dart';
import 'package:tp_flutter_cda_3506/widgets/project-form.dart';
import '../../models/project.dart';

class ContributionPage extends StatelessWidget {
  Function(Project) submit;
  ContributionPage({super.key, required this.submit});

  @override
  Widget build(BuildContext context) {
    return ProjectForm(submit: submit);
  }
}
