import 'package:http/http.dart';
import 'dart:convert';

import 'package:provider/provider.dart';
class NetworkHelper {


  Future<Map> getData(String searchData,String searchUrl) async {



  Response response = await get(searchUrl);
  var jsonResponse = jsonDecode(response.body);

    List<Map> searchedCourses = [];
    List<Map> searchedPaidCourses=[];

    for (Map course in jsonResponse)
      if (course['title']
          .contains(RegExp('$searchData', caseSensitive: false))) {
        if(course['cost']=="Free")
            searchedCourses.add(course);
        else if(course['cost']=="Paid")
          searchedPaidCourses.add(course);
      }


    Map allCourses={
        'free':searchedCourses,
      'paid':searchedPaidCourses,
    };
    return allCourses;

  }
}
