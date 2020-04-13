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

            shadowColor: kCardShadowColor,
            color: paidCardColor,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
              Text(Utils.trimString(category,20).trimLeft(),
                  style: kCardCategoryTextStyle.copyWith(fontSize: 12.0)),
//                    SizedBox(height: 5.0),
              SizedBox(
                width: kPaidCardWidth,
                child: Text(
                  Utils.trimString(title,50),
                  style: kCardTitleTextStyle.copyWith(fontSize: 14),
                ),
              ),
              Text(
                level.toUpperCase(),
                textAlign: TextAlign.end,
                style: kCardLevelStyle.copyWith(fontSize: 10.0),
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
