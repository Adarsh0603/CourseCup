import 'package:courselister/services/network_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:courselister/constants.dart';
import 'package:provider/provider.dart';
import 'package:courselister/services/data.dart';

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
                    decoration: kSearchBoxInputDecoration,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) async {
                      data.updateBackgroundStatus(false);
                      data.changeData(value);
                      data.getLists(
                          await NetworkHelper().getData(data.searchString,data.selectedUrl));

                      print(value);
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
                    underline: SizedBox(height: 0,),
                  iconEnabledColor: Colors.white,
                  value: data.source,
                  items: [
                    DropdownMenuItem(
                      child:Image.asset('images/Udacity.png',width: 32,),
                      value: 'udacity',

                    ),


                    DropdownMenuItem(
                      child:Image.asset('images/Coursera.png',width: 32,),
                      value: 'coursera',
                    ),
                  ],
                  onChanged: (value) async {
                    data.updateBackgroundStatus(false);
                    data.updateStatus(false);
                    data.changeSource(value);
                    data.getLists(
                        await NetworkHelper().getData(data.searchString,data.selectedUrl));
                  },
                ),
              );
            },),

        ],
      ),
    );
  }
}
