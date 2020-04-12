import 'package:courselister/constants.dart';
import 'package:courselister/screens/free_course_list_section.dart';
import 'package:courselister/screens/paid_course_list_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:courselister/widgets/search_widget.dart';
import 'package:provider/provider.dart';
import 'package:courselister/services/data.dart';

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
                  top: 50.0, left: kMarginLeft, right: 20, bottom: 0),
              child: Column(
                children: <Widget>[
                  Consumer<Data>(
                      builder: (context, data, child) {
                        return Text(
                          'Search Your Course',
                          style: kTitleTextStyle,
                        );
                      }
                  ),
                  SizedBox(height: 20.0),
                  SearchWidget(),
                ],
              ),
            ),
            SizedBox(height: 40.0),
               Expanded(flex:2,child: FreeCourseListSection()),
            Expanded(child: PaidCourseListSection()),
          ],
        ),

      ),
    );
  }
}
