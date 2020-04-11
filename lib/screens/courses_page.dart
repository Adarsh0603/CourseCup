import 'package:courselister/constants.dart';
import 'package:flutter/material.dart';
import 'package:courselister/widgets/search_widget.dart';
import 'package:courselister/widgets/course_card.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, left: 20, right: 20, bottom: 0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Hi Learner, Find your course",
                    style: kTitleTextStyle,
                  ),
                  SizedBox(height: 20.0),
                  SearchWidget(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: fadedColor,
                child: ListView(
                  children: <Widget>[
                    CourseCard(),
                    CourseCard(),
                    CourseCard(),
                    CourseCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
