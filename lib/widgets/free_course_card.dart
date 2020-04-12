import 'package:courselister/constants.dart';
import 'package:courselister/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FreeCourseCard extends StatelessWidget {
  final String title;
  final String category;
  final String summary;
  final String level;
  final String url;

  FreeCourseCard(
      {this.title, this.category, this.summary, this.level, this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () async{

        if(await canLaunch(url))
      launch(url);
        else
          print("not available");
      },
      child: Padding(
        padding: kFreeCardOuterPadding,
        child: SizedBox(
          width: kFreeCardWidth,
          child: Material(
            shadowColor: Color(0x60ffffff),
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
                          Text(Utils.trimString(category, 30).trimLeft(),
                              style: kCardCategoryTextStyle),
                          SizedBox(height: 5.0),
                          SizedBox(
                            width: kFreeCardWidth / 2,
                            child: Text(
                              Utils.trimString(title, 50),
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
                        width: kFreeCardWidth,
                        child: Text(
                          summary,
                          style: kCardSummaryTextStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                      width: kFreeCardWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            'images/Udacity.png',
                            width: 32,
                          ),
                          Text(
                            level.toUpperCase(),
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
      ),
    );
  }
}
