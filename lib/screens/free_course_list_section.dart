import 'package:flutter/material.dart';
import 'package:courselister/widgets/free_course_card.dart';
import 'package:courselister/constants.dart';
import 'package:courselister/services/data.dart';
import 'package:provider/provider.dart';

class FreeCourseListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: kFreeCardContainerHeight,
        decoration: kFreeCoursesContainerBoxDecoration,
        child: Provider.of<Data>(context).isDone
            ? Container(
                child: Consumer<Data>(builder: (context, data, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<Data>(context).searchedData['free'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return FreeCourseCard(
                        title: data.searchedData['free'][index]['title'],
                        category: data.searchedData['free'][index]['category'],
                        summary: data.searchedData['free'][index]['summary'],
                        level: data.searchedData['free'][index]['level'],
                        url: data.searchedData['free'][index]['url'],
                      );
                    },
                  );
                }),
              )
            : SizedBox.expand(
                child: Center(child: Image(image: AssetImage('images/no_data.png'), width: 150))));
  }
}
