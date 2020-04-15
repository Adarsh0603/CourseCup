import 'dart:ui';
import 'package:courselister/services/network_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:courselister/constants.dart';
import 'package:provider/provider.dart';
import 'package:courselister/services/data.dart';
import 'dart:io';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Consumer<Data>(
              builder: (context, data, child) {
                return TextField(
                    cursorColor: Colors.black38,
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                        fontFamily: 'ContentFont', color: Colors.black54),
                    decoration: kSearchBoxInputDecoration,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) async {
                      data.updateBackgroundStatus(false);
                      data.changeData(value);
                      try {
                        final result =
                            await InternetAddress.lookup('google.com');
                        if (result.isNotEmpty &&
                            result[0].rawAddress.isNotEmpty) {
                          NetworkHelper networkHelper = NetworkHelper();

                          if (data.source == 'udacity') {
                            print(data.mCachedUdacityData);
                            data.getLists(data.mCachedUdacityData
                                ? await networkHelper.getUdacityCachedData(
                                    data.searchString, data.selectedUrl)
                                : await networkHelper.getUdacityData(
                                    data.searchString, data.selectedUrl));
                            data.udacityCacheStatus(true);
                          } else if (data.source == 'coursera') {
                            data.getLists(data.mCachedCourseraData
                                ? await networkHelper.getCourseraCachedData(
                                    data.searchString, data.selectedUrl)
                                : await networkHelper.getCourseraData(
                                    data.searchString, data.selectedUrl));
                            data.courseraCacheStatus(true);
                          }
                          else if (data.source == 'edx') {
                            data.getLists(data.mCachedEdxData
                                ? await networkHelper.getEdxCachedData(
                                data.searchString, data.selectedUrl)
                                : await networkHelper.getEdxData(
                                data.searchString, data.selectedUrl));
                            data.edxCacheStatus(true);
                          }
                          data.changeDataSource(false);
                        }
                      } on SocketException catch (_) {
                        data.notifyDataStatus(true);
                      }
                    });
              },
            ),
          ),
          SizedBox(width: 20.0),
          Consumer<Data>(
            builder: (BuildContext context, Data data, Widget child) {
              return Expanded(
                flex: 1,
                child: DropdownButton<String>(
                  underline: SizedBox(
                    height: 0,
                  ),
                  iconEnabledColor: Colors.white,
                  value: data.source,
                  items: [
                    DropdownMenuItem(
                      child: Image.asset(
                        'images/Udacity.png',
                        width: 32,
                      ),
                      value: 'udacity',
                    ),
                    DropdownMenuItem(

                      child: Image.asset(
                        'images/Coursera.png',
                        width: 32,
                      ),
                      value: 'coursera',
                    ),
                    DropdownMenuItem(
                      child: Image.asset(
                        'images/edx.png',
                        width: 32,
                      ),
                      value: 'edx',
                    ),
                  ],
                  onChanged: (value) async {
                    print(data.mCachedUdacityData);
                    data.changeDataSource(true);
                    data.updateBackgroundStatus(false);
                    data.updateStatus(false);
                    data.changeSource(value);
                    try {
                      final result = await InternetAddress.lookup('google.com');
                      if (result.isNotEmpty &&
                          result[0].rawAddress.isNotEmpty) {
                        NetworkHelper networkHelper = NetworkHelper();
                        if (value == 'coursera' &&
                            data.mCachedCourseraData == false) {
                          data.getLists(await networkHelper.getCourseraData(
                              data.searchString, data.selectedUrl));
                          data.courseraCacheStatus(true);
                        }
                        if (value == 'coursera' &&
                            data.mCachedCourseraData == true) {
                          data.getLists(
                              await networkHelper.getCourseraCachedData(
                                  data.searchString, data.selectedUrl));
                        }
                        if (value == 'udacity' &&
                            data.mCachedUdacityData == false) {
                          data.getLists(await networkHelper.getUdacityData(
                              data.searchString, data.selectedUrl));
                          data.udacityCacheStatus(true);
                        }
                        if (value == 'udacity' &&
                            data.mCachedUdacityData == true) {
                          data.getLists(
                              await networkHelper.getUdacityCachedData(
                                  data.searchString, data.selectedUrl));
                        }
                        if (value == 'edx' &&
                            data.mCachedEdxData == false) {
                          data.getLists(await networkHelper.getEdxData(
                              data.searchString, data.selectedUrl));
                          data.edxCacheStatus(true);
                        }
                        if (value == 'edx' &&
                            data.mCachedEdxData == true) {
                          data.getLists(
                              await networkHelper.getEdxCachedData(
                                  data.searchString, data.selectedUrl));
                        }
                        data.changeDataSource(false);
                      }
                    } on SocketException catch (_) {
                      data.notifyDataStatus(true);
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
