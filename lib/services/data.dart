import 'package:flutter/cupertino.dart';
import 'package:courselister/dataurls.dart';
class Data with ChangeNotifier {
  bool mCachedCourseraData=false;
  bool mCachedUdacityData=false;
  bool mCachedEdxData=false;
  bool mDataSourceChanged = true;
  bool noUserInteraction = true;
  bool noData = false;
  String searchString = '';
  String source = 'udacity';
  String selectedUrl = udacityUrl;
  Map searchedData;
  bool isDone = false;


  void courseraCacheStatus(bool status)
  {
    mCachedCourseraData=status;
    notifyListeners();
  }

  void udacityCacheStatus(bool status){
   mCachedUdacityData=status;
   notifyListeners();
  }


  void edxCacheStatus(bool status){
    mCachedEdxData=status;
    notifyListeners();
  }
  void changeDataSource(bool dataSourceChanged) {
    mDataSourceChanged = dataSourceChanged;
    notifyListeners();
  }

  void updateBackgroundStatus(bool bgStatus) {
    noUserInteraction = bgStatus;
    notifyListeners();
  }

  void updateStatus(bool status) {
    isDone = status;
    notifyListeners();
  }

  void changeSource(String selectedSource) {
    if (selectedSource == "udacity") selectedUrl = udacityUrl;
    if (selectedSource == "coursera") selectedUrl = courseraUrl;
    if (selectedSource == "edx") selectedUrl = edxUrl;

    source = selectedSource;
    notifyListeners();
  }

  void notifyDataStatus(bool dataAvailability) {
    noData = dataAvailability;
    isDone = dataAvailability;
    notifyListeners();
  }

  void getLists(Map courseList) {
    searchedData = courseList;
    if (searchedData['free'].length == 0) {
      noData = true;
    } else
      noData = false;
    isDone = true;

    notifyListeners();
  }

  void changeData(String value) {
    searchString = value;
    isDone = false;
    notifyListeners();
  }
}
