import 'package:courselister/constants.dart';
import 'package:courselister/screens/free_course_list_section.dart';
import 'package:courselister/screens/paid_course_list_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:courselister/widgets/search_widget.dart';
import 'package:provider/provider.dart';
import 'package:courselister/services/data.dart';
import 'package:courselister/widgets/drawer_content.dart';

class CoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child: DrawerContent(),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
            Consumer<Data>(builder: (BuildContext context, data, Widget child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                       left: kMarginLeft, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.dehaze),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:16.0),
                        child: Text(
                          'Search Your Course',
                          style: kTitleTextStyle,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SearchWidget(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                flex: 6,
                child: data.noUserInteraction
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
//                        color: fadedColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              'images/starter.png',
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Don\'t know where to go..\nLet\'s find a path...',
                              style: kStarterTextStyle,
                            ),
                          ],
                        ),
                      )
                    : Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(flex: 2, child: FreeCourseListSection()),
//                            Padding(
//                              padding: const EdgeInsets.only(left: 20.0, top: 8.0),
//                              child: Text('PAID COURSES', style: kCourseTagStyle),
//                            ),
                            Expanded(flex: 1, child: PaidCourseListSection()),
                          ],
                        ),
                      ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
