import 'package:http/http.dart';
import 'dart:convert';

var jsonUdacityResponse;
var jsonCourseraResponse;
var jsonEdxResponse;

class NetworkHelper {
  Future<Map> getUdacityData(String searchData, String searchUrl) async {
    print('GetUdacityData Called ');
    print(searchUrl);
    Response response = await get(searchUrl);
    jsonUdacityResponse = jsonDecode(response.body);
    List<Map> searchedCourses = [];
    List<Map> searchedPaidCourses = [];

    for (Map course in jsonUdacityResponse) {
      try {
        if (course['title']
            .toString()
            .contains(RegExp('$searchData', caseSensitive: false))) {
          if (course['cost'] == "Free")
            searchedCourses.add(course);
          else if (course['cost'] == "Paid") searchedPaidCourses.add(course);
        }
      } catch (e) {
        print(e);
      }
    }

    Map allCourses = {
      'free': searchedCourses,
      'paid': searchedPaidCourses,
    };

    return allCourses;
  }

  Future<Map> getUdacityCachedData(String searchData, String searchUrl) async {
    print('GetUdacityCachedData Called');

    List<Map> searchedCourses = [];
    List<Map> searchedPaidCourses = [];
    for (Map course in jsonUdacityResponse) {
      try {
        if (course['title']
            .toString()
            .contains(RegExp('$searchData', caseSensitive: false))) {
          if (course['cost'] == "Free")
            searchedCourses.add(course);
          else if (course['cost'] == "Paid") searchedPaidCourses.add(course);
        }
      } catch (e) {
        print(e);
      }
    }

    Map allCourses = {
      'free': searchedCourses,
      'paid': searchedPaidCourses,
    };

    return allCourses;
  }

  Future<Map> getCourseraData(String searchData, String searchUrl) async {
    print('GetCourseraData Called ');
    print(searchUrl);
    Response response = await get(searchUrl);
    jsonCourseraResponse = jsonDecode(response.body);
    List<Map> searchedCourses = [];
    List<Map> searchedPaidCourses = [];

    for (Map course in jsonCourseraResponse) {
      try {
        if (course['title']
            .toString()
            .contains(RegExp('$searchData', caseSensitive: false))) {
          if (course['cost'] == "Free")
            searchedCourses.add(course);
          else if (course['cost'] == "Paid") searchedPaidCourses.add(course);
        }
      } catch (e) {
        print(e);
      }
    }

    Map allCourses = {
      'free': searchedCourses,
      'paid': searchedPaidCourses,
    };

    return allCourses;
  }

  Future<Map> getCourseraCachedData(String searchData, String searchUrl) async {
    print('GetCourseraCachedData Called');

    List<Map> searchedCourses = [];
    List<Map> searchedPaidCourses = [];
    for (Map course in jsonCourseraResponse) {
      try {
        if (course['title']
            .toString()
            .contains(RegExp('$searchData', caseSensitive: false))) {
          if (course['cost'] == "Free")
            searchedCourses.add(course);
          else if (course['cost'] == "Paid") searchedPaidCourses.add(course);
        }
      } catch (e) {
        print(e);
      }
    }

    Map allCourses = {
      'free': searchedCourses,
      'paid': searchedPaidCourses,
    };

    return allCourses;
  }

  Future<Map> getEdxData(String searchData, String searchUrl) async {
    print('GetEdxData Called ');
    print(searchUrl);
    Response response = await get(searchUrl);
    jsonEdxResponse = jsonDecode(response.body);
    List<Map> searchedCourses = [];
    List<Map> searchedPaidCourses = [];

    for (Map course in jsonEdxResponse) {
      try {
        if (course['title']
            .toString()
            .contains(RegExp('$searchData', caseSensitive: false))) {
          if (course['cost'] == "Free")
            searchedCourses.add(course);
          else if (course['cost'] == "Paid") searchedPaidCourses.add(course);
        }
      } catch (e) {
        print(e);
      }
    }

    Map allCourses = {
      'free': searchedCourses,
      'paid': searchedPaidCourses,
    };

    return allCourses;
  }

  Future<Map> getEdxCachedData(String searchData, String searchUrl) async {
    print('GetEdxCachedData Called');

    List<Map> searchedCourses = [];
    List<Map> searchedPaidCourses = [];
    for (Map course in jsonEdxResponse) {
      try {
        if (course['title']
            .toString()
            .contains(RegExp('$searchData', caseSensitive: false))) {
          if (course['cost'] == "Free")
            searchedCourses.add(course);
          else if (course['cost'] == "Paid") searchedPaidCourses.add(course);
        }
      } catch (e) {
        print(e);
      }
    }

    Map allCourses = {
      'free': searchedCourses,
      'paid': searchedPaidCourses,
    };

    return allCourses;
  }
}
