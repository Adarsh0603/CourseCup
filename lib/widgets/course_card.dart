import 'package:courselister/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String category;
  final String summary;
  final String level;
  final String url;

  CourseCard({this.title, this.category, this.summary, this.level, this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kCardOuterPadding,
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
                        Text(category,
                            style: kCardCategoryTextStyle),
                        SizedBox(height: 5.0),
                        SizedBox(
                          width: kCardWidth / 2,
                          child: Text(
                            title,
                            style: kCardTitleTextStyle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 5),
                    Flexible(
                      child: Container(
                          width: 100,
                          height: 60,
                          child: Image(
                            image: AssetImage('images/test.jpg'),
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: kCardWidth,
                      child: Text(
                        summary,
                        style: kCardSummaryTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                    width: kCardWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Image.asset(
                          'images/Udacity.png',
                          width: 32,
                        ),
                        Text(
                          level,
                          textAlign: TextAlign.end,
                          style: kCardLevelStyle,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
