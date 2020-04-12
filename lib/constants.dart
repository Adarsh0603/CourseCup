
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color fadedColor=Color(0xffF6F7FB);
const Color fadedTextColor=Color(0xffC1C2C4);

const kFreeCoursesContainerBoxDecoration=BoxDecoration(
  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
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
  border: InputBorder.none,
  fillColor: fadedColor,
  //TODO: circular corners

);

const kCostToggleTextStyle=TextStyle(
  fontSize: 12.0,

  color: Colors.black54,
  fontWeight: FontWeight.bold
);
const kMarginLeft=20.0;





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
const kCardWidth=300.0;
const kFreeCardContainerHeight=270.0;
const kFreeCardOuterPadding= EdgeInsets.symmetric(vertical: 40,horizontal: 10);

const kPaidCardContainerHeight=200.0;
const kPaidCardOuterPadding= EdgeInsets.symmetric(vertical: 20,horizontal: 10);
