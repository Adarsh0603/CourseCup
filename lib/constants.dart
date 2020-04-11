import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color fadedColor=Color(0xffF6F7FB);
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