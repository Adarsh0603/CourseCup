import 'package:flutter/material.dart';
import 'screens/courses_page.dart';
void main() => runApp(CourseListerApp());
class CourseListerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CoursesPage(),
    );
  }
}

