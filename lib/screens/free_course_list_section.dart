import 'package:flutter/cupertino.dart';
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
              padding: const EdgeInsets.only(
                  bottom: 8.0, left: 24.0, top: 25.0, right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Free Courses',
                    style: kCourseTagStyle,
                  ),
                  Text('${data.searchedData['free'].length} free course(s)',
                      style: kCourseCountTextStyle),
                ],
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.searchedData['free'].length,
              itemBuilder: (BuildContext context, int index) {
                String summary;
                if (data.source == 'udacity')
                  summary = data.searchedData['free'][index]['summary'];
                if (data.source == 'coursera') summary = 'Check course site for details.';
                if (data.source == 'edx') summary = 'Check course site for details.';

                return FreeCourseCard(
                  title: data.searchedData['free'][index]['title'],
                  category: data.searchedData['free'][index]['category'],
                  summary: summary,
                  level: data.searchedData['free'][index]['level'],
                  url: data.searchedData['free'][index]['url'],
                  image: data.searchedData['free'][index]['image'],
                );
              },
            )
          ],
        ),
      );
    }
    if (data.noData) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('images/nodata2.png'),
            width: 200,
          ),
          Text(
            'No Courses Found.',
            style: kErrorTextStyle.copyWith(fontSize: 16.0),
          ),
          SizedBox(height: 5.0),
          Text(
            'Check your internet connection\nor search a relevant course.',
            style: kErrorTextStyle,
          )
        ],
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SpinKitFadingCube(
                        color: Colors.lightBlueAccent,
                        size: 50.0,
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Fetching ${data.source} data...',
                        style: kErrorTextStyle,
                      )
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
