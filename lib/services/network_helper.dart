import 'package:http/http.dart';
import 'dart:convert';
class NetworkHelper {
  String udacityUrl = 'https://swift-clarity-249611.firebaseio.com/.json';




  Future<Map> getData(String searchData) async {
    Response response = await get(udacityUrl);
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
