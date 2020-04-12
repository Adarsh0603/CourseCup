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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(
                   top: 30,left: kMarginLeft, right: 20),
                child: Column(
                  children: <Widget>[
                    Consumer<Data>(builder: (context, data, child) {
                      return Text(
                        'Search Your Course',
                        style: kTitleTextStyle,
                      );
                    }),
                    SizedBox(height: 20.0),
                    SearchWidget(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0,left:20.0),
              child: Text('FREE COURSES',style: kCourseTagStyle),
            ),
            Expanded(flex: 2, child: FreeCourseListSection()),
            Padding(
              padding: const EdgeInsets.only(left:20.0,top: 8.0),
              child: Text('PAID COURSES',style: kCourseTagStyle),
            ),
            Expanded(flex:1,child: PaidCourseListSection()),
          ],
        ),
      ),
    );
  }
}
