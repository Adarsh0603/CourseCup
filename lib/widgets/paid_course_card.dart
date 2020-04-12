import 'package:courselister/constants.dart';
import 'package:courselister/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaidCourseCard extends StatelessWidget {
  final String title;
  final String category;

//  final String summary;
  final String level;
  final String url;

  PaidCourseCard({this.title, this.category, this.level, this.url});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaidCardOuterPadding,
      child: SizedBox(
        width: kCardWidth,
        child: Material(
          shadowColor: Colors.white,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(Utils.trimString(category,20),
                        style: kCardCategoryTextStyle),
                    SizedBox(height: 5.0),
                    SizedBox(
                      width: kCardWidth /2,
                      child: Text(
                        Utils.trimString(title),
                        style: kCardTitleTextStyle,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 1),
                Text(
                  level.toUpperCase(),
                  textAlign: TextAlign.end,
                  style: kCardLevelStyle,
                ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
