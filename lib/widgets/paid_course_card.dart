import 'package:courselister/constants.dart';
import 'package:courselister/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaidCourseCard extends StatelessWidget {
  final String title;
  final String category;

//  final String summary;
  final String level;
  final String url;

  PaidCourseCard({this.title, this.category, this.level, this.url});



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
        padding: kPaidCardOuterPadding,
        child: SizedBox(
          width: kPaidCardWidth,
          child: Material(

            shadowColor: Colors.white,
            color: paidCardColor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text(Utils.trimString(category,20),
                  style: kCardCategoryTextStyle),
//                    SizedBox(height: 5.0),
              SizedBox(
                width: kPaidCardWidth,
                child: Text(
                  Utils.trimString(title,30),
                  style: kCardTitleTextStyle,
                ),
              ),
              Text(
                level.toUpperCase(),
                textAlign: TextAlign.end,
                style: kCardLevelStyle,
              ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
