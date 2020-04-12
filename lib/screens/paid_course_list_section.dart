import 'package:flutter/material.dart';
import 'package:courselister/constants.dart';
import 'package:courselister/services/data.dart';
import 'package:provider/provider.dart';
import 'package:courselister/widgets/paid_course_card.dart';

class PaidCourseListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: kPaidCardContainerHeight,
        decoration: kPaidCoursesContainerBoxDecoration,
        child: Provider.of<Data>(context).isDone
            ? Container(
          child: Consumer<Data>(builder: (context, data, child) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Provider.of<Data>(context).searchedData.length,
              itemBuilder: (BuildContext context, int index) {
                return PaidCourseCard(
                  title: data.searchedData[index]['title'],
                  category: data.searchedData[index]['category'],
//                  summary: data.searchedData[index]['summary'],
                  level: data.searchedData[index]['level'],
                  url: data.searchedData[index]['url'],
                );
              },
            );
          }),
        )
            : SizedBox.expand(
            child: Center(child: Image(image: AssetImage('images/no_data.png'), width: 150))));
  }
}
