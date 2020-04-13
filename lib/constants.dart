
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const String udacityUrl =
    'https://swift-clarity-249611.firebaseio.com/.json';
const String courseraUrl =
    'https://courseradata-48824.firebaseio.com/.json';

const Color fadedColor=Color(0xffF6F7FB);
const Color fadedTextColor=Color(0xffC1C2C4);
const Color paidCardColor=Color(0xffEBFAFF);


const kStarterTextStyle=TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Colors.black38,
);
const kFreeCoursesContainerBoxDecoration=BoxDecoration(

  borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight: Radius.circular(50.0),bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
color: fadedColor,
);
const kPaidCoursesContainerBoxDecoration=BoxDecoration(
  //borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
  color: Colors.white,
);

const kTitleTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);


const kSearchBoxInputDecoration = InputDecoration(
  
  filled: true,
  prefixIcon: Icon(Icons.search),
  hintText: 'Search',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide.none,

  ),

  fillColor: fadedColor,
  //TODO: circular corners

);

const kCostToggleTextStyle=TextStyle(
  fontSize: 10.0,

  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold
);
const kMarginLeft=20.0;

const kCardShadowColor=Color(0x60ffffff);



//CARD StyleSheet

const kCardTitleTextStyle=TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
);
const kCardCategoryTextStyle=TextStyle(
  color: fadedTextColor,
);

const kCardSummaryTextStyle=TextStyle(
  color: fadedTextColor,
);
const kCardLevelStyle=TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,

  fontSize: 12.0,
);
const kFreeCardWidth=270.0;
const kFreeCardContainerHeight=0.0;
const kFreeCardOuterPadding= EdgeInsets.symmetric(vertical: 60,horizontal: 20);


const kPaidCardWidth=200.0;
const kPaidCardContainerHeight=200.0;
const kPaidCardOuterPadding= EdgeInsets.symmetric(vertical: 20,horizontal: 10);


const kCourseTagStyle=TextStyle(
  fontWeight: FontWeight.w800,
  fontSize: 18,
  color: Colors.black,

);