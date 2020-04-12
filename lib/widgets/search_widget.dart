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
        children: <Widget>[
          Expanded(
            flex: 4,
            child:Consumer<Data>(
              builder: (context,data,child){
                return TextField(
                    decoration: kSearchBoxInputDecoration,
                     textInputAction: TextInputAction.search,
                    onSubmitted: (value) async {
                      data.changeData(value);
                      data.getLists(await NetworkHelper().getData(data.searchData));
//                      data.isDone=true;
                      print(value);

                    }
                  );
              },
            ) ,

          ),
          Expanded(
            child: CircleAvatar(
              backgroundColor: fadedColor,
              radius: 25.0,
              child: Text(
                "UDACITY",
                style: kCostToggleTextStyle,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
