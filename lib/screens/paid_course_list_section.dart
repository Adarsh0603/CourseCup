import 'package:flutter/material.dart';
import 'package:courselister/constants.dart';
import 'package:courselister/services/data.dart';
import 'package:provider/provider.dart';
import 'package:courselister/widgets/paid_course_card.dart';

class PaidCourseListSection extends StatelessWidget {
  Widget drawPaidCourses(BuildContext context, Data data) {
    if (!data.noData) {
      return Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.searchedData['paid'].length,
          itemBuilder: (BuildContext context, int index) {
            return PaidCourseCard(
              title: data.searchedData['paid'][index]['title'],
              category: data.searchedData['paid'][index]['category'],
              level: data.searchedData['paid'][index]['level'],
              url: data.searchedData['paid'][index]['url'],
            );
          },
        ),
      );
    } else {
      return Center();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (BuildContext context, Data data, Widget child) {
        return Container(
            height: kPaidCardContainerHeight,
            child: data.noData
                ? Center()
                : data.isDone == false
                    ? Center()
                    : data.searchedData['paid'].length == 0
                        ? Center(
                            child: Text(
                            'No Paid Courses',
                            style: kErrorTextStyle.copyWith(
                                fontFamily: 'ContentFont'),
                          ))
                        : data.isDone
                            ? drawPaidCourses(context, data)
                            : SizedBox.expand(child: Center()));
      },
    );
  }
}
