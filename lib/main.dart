import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/courses_page.dart';
import 'package:courselister/services/data.dart';
void main() => runApp(CourseListerApp());
class CourseListerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<Data>(
      create: (BuildContext context){
        return Data();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CoursesPage(),
      ),
    );
  }
}

