import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:courselister/services/data.dart';
class NetworkHelper {
  String udacityUrl = 'https://swift-clarity-249611.firebaseio.com/.json';




  Future<List> getData(String searchData) async {
    Response response = await get(udacityUrl);
    var jsonResponse = jsonDecode(response.body);

    List<Map> searchedCourses = [];
    for (Map course in jsonResponse)
      if (course['title']
          .contains(RegExp('$searchData', caseSensitive: false))) {
        if(course['cost']=="Free")
            searchedCourses.add(course);
      }


    print(searchedCourses);
    return searchedCourses;
  }
}
