import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tp_flutter_cda_3506/models/project.dart';
import 'package:tp_flutter_cda_3506/screens/homepage/homepage.dart';
import 'package:tp_flutter_cda_3506/screens/project-detail-page.dart';
import 'package:tp_flutter_cda_3506/screens/project-edit-page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(path: "/", builder: (context, state) => Homepage()),
    GoRoute(
      path: "/detail",
      builder: (context, state) {
        Project project = state.extra as Project;
        return ProjectDetailPage(project: project);
      },
    ),
    GoRoute(
      path: "/edit",
      builder: (context, state) {
        Project project = state.extra as Project;
        return ProjectEditPage(project: project);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Color(0xffeceaea),
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigo),
      ),
    );
  }
}
