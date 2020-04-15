import 'package:courselister/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fadedColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image(
                        image: AssetImage('images/cup.png'),
                      ),
                    ),
                    Text(
                      'Course',
                      style: TextStyle(
                        fontFamily: 'BlockFont',
                        fontSize: 32.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'Cup',
                      style: TextStyle(
                        fontFamily: 'BlockFont',
                        fontSize: 32.0,
                        color: cupColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'v.1.0',
                      style: TextStyle(
                        fontFamily: 'BlockFont',
                        fontSize: 12.0,
                        color: Colors.black38,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Search from over 2100 free courses available on top online course providers udacity, coursera and edx.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black38,
                    fontFamily: 'ContentFont',
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'NOTE: Coursera courses comes with paid certificates. You can audit the courses and get all content for free.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black38,
                    fontFamily: 'ContentFont',
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.code,
                      color: Colors.black38,
                    ),
                    Text(
                      ' with ',
                      style: kCardTitleTextStyle.copyWith(
                          fontFamily: 'ContentFont', color: Colors.black38),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Text(
                      ' by Adarsh',
                      style: kCardTitleTextStyle.copyWith(
                          fontFamily: 'ContentFont', color: Colors.black38),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
