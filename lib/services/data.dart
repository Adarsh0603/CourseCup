import 'package:flutter/cupertino.dart';
class Data with ChangeNotifier{
  Data();
String searchData='NEw';

Map searchedData;
bool isDone = false;

void updateStatus(bool status){
  isDone=status;
  notifyListeners();
}
void getLists(Map courseList)
{
  isDone=true;
  searchedData=courseList;
  print(searchedData);
  notifyListeners();
}

void changeData(String value){
  searchData=value;
  isDone=false;
  print(searchData);
  notifyListeners();

}
}