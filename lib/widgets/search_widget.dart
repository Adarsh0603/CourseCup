import 'package:flutter/material.dart';
import 'package:courselister/constants.dart';
class SearchWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: TextField(
              decoration: kSearchBoxInputDecoration,
            ),
          ),
          Expanded(
            child: CircleAvatar(
              backgroundColor: fadedColor,
              radius: 25.0,
              child: Text(
                "PAID",
                style: kCostToggleTextStyle,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
