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

        child: Provider.of<Data>(context).isDone
            ? Container(
          child: Consumer<Data>(builder: (context, data, child) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Provider.of<Data>(context).searchedData['paid'].length,
              itemBuilder: (BuildContext context, int index) {
                return PaidCourseCard(
                  title: data.searchedData['paid'][index]['title'],
                  category: data.searchedData['paid'][index]['category'],
                  level: data.searchedData['paid'][index]['level'],
                  url: data.searchedData['paid'][index]['url'],
                );
              },
            );
          }),
        )
            : SizedBox.expand(
            child: Center()));
  }
}
