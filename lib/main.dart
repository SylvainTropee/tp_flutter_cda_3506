import 'package:flutter/material.dart';
import 'package:tp_flutter_cda_3506/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Color(0xffeceaea),
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigo)
      ),
      home: Homepage(),
    );
  }
}

