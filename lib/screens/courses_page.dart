import 'package:courselister/constants.dart';
import 'package:courselister/screens/free_course_list_section.dart';
import 'package:courselister/screens/paid_course_list_section.dart';
import 'package:courselister/services/network_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:courselister/widgets/search_widget.dart';
import 'package:provider/provider.dart';
import 'package:courselister/services/data.dart';
import 'package:courselister/widgets/drawer_content.dart';

class CoursesPage extends StatefulWidget {


  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {

////TODO:LOAD DATA ON STARTUP in VERSION 2.0
//  void getAllData()async {
//    NetworkHelper networkHelper=NetworkHelper();
//    Provider.of<Data>(context,listen: false).getLists(await networkHelper.getUdacityData('python', Provider.of<Data>(context,listen: false).selectedUrl));
//
//  }
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//
//    getAllData();
//  Provider.of<Data>(context,listen: false).udacityCacheStatus(true);
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child: DrawerContent(),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
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
                      Expanded(
                        flex:2,
                        child: IconButton(
                          icon: Icon(Icons.dehaze),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left:16.0),
                          child: Text(
                            'What you want to learn?',
                            style: kTitleTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Expanded(flex:3,child: SearchWidget()),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'images/starter.png',
                                width:200,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(

                              'Don\'t know where to go!\nLet\'s find a path...',
                              textAlign: TextAlign.center,
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
