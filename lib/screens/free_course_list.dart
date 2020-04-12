import 'package:courselister/services/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:courselister/widgets/course_card.dart';
import 'package:courselister/constants.dart';
import 'package:courselister/services/data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class FreeCourseListSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: kCoursesContainerBoxDecoration,
        child: Provider.of<Data>(context).isDone
            ? Container(
                child: Consumer<Data>(builder: (context, data, child) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<Data>(context).searchedData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CourseCard(
                        title: data.searchedData[index]['title'],
                        category: data.searchedData[index]['category'],
                        summary: data.searchedData[index]['summary'],
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
