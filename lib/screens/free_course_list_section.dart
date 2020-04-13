import 'package:flutter/material.dart';
import 'package:courselister/widgets/free_course_card.dart';
import 'package:courselister/constants.dart';
import 'package:courselister/services/data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class FreeCourseListSection extends StatelessWidget {
  Widget drawCardsOnDataFound(BuildContext context, Data data) {
    if (!data.noData) {
      return Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 24.0,top: 25.0),
              child: Text('Free Courses', style: kCourseTagStyle),
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.searchedData['free'].length,
              itemBuilder: (BuildContext context, int index) {
                return FreeCourseCard(
                  title: data.searchedData['free'][index]['title'],
                  category: data.searchedData['free'][index]['category'],
                  summary: data.source == 'udacity'
                      ? data.searchedData['free'][index]['summary']
                      : '',
                  level: data.searchedData['free'][index]['level'],
                  url: data.searchedData['free'][index]['url'],
                  image: data.searchedData['free'][index]['image'],
                );
              },
            )
          ],
        ),
      );
    } else {
      return Center(
          child: Image(
        image: AssetImage('images/nodata2.png'),
        width: 150,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (BuildContext context, data, Widget child) {
      return Container(
        height: kFreeCardContainerHeight,
        decoration: kFreeCoursesContainerBoxDecoration,
        child: data.isDone
            ? drawCardsOnDataFound(context, data)
            : SizedBox.expand(
                child: Center(
                  child: Stack(alignment: Alignment.center, children: [
//                    Center(
//                        child: Image(
//                      image: AssetImage('images/uploadinglist.png'),
////                      width: 150,
//                    )),

                    SpinKitFadingCube(
                      color: Color(0x704285F7),
                      size: 50.0,
                    ),
                  ]),
                ),
              ),
      );
    });
  }
}
