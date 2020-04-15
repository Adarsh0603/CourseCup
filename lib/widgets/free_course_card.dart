import 'package:courselister/constants.dart';
import 'package:courselister/services/data.dart';
import 'package:courselister/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class FreeCourseCard extends StatelessWidget {
  final String title;
  final String category;
  final String summary;
  final String level;
  final String url;
  final String image;

  FreeCourseCard(
      {this.title,
      this.category,
      this.summary,
      this.level,
      this.url,
      this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          duration: Duration(seconds: 1),
          content: Text(
            'Double Tap to visit course site.',

            style: TextStyle(fontFamily: 'CardFont'),
          ),
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      onDoubleTap: () async {
        if (await canLaunch(url)) {
          launch(url);
        } else
          print("not available");
      },
      child: Padding(
        padding: kFreeCardOuterPadding,
        child: SizedBox(
          width: kFreeCardWidth,
          child: Material(
            shadowColor: kCardShadowColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            elevation: 15,
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
                          Text(Utils.trimString(category, 20).trimLeft(),
                              style: kCardCategoryTextStyle),
                          SizedBox(height: 5.0),
                          SizedBox(
                            width: kFreeCardWidth / 1.8,
                            child: Text(
                              Utils.trimString(title, 50),
                              style: kCardTitleTextStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Flexible(
                        child: Material(
                          shadowColor: kCardShadowColor,
                          elevation: 5.0,
                          child: Container(

                              width: 75,
                              height: 75,
                              child: Image(

                                image: NetworkImage(image),
                              )),
                        ),
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
                          Consumer<Data>(
                            builder:
                                (BuildContext context, data, Widget child) {
                              String sourceImage;
                              if(data.source == 'udacity') sourceImage='images/Udacity.png';
                              if(data.source == 'coursera') sourceImage='images/Coursera.png';
                              if(data.source == 'edx') sourceImage='images/edx.png';

                              return Image.asset(
                                sourceImage,
                                width: 28,
                              );
                            },
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
