import 'package:courselister/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProviderTile extends StatelessWidget {
 final String url;
 final String siteName;
final String imageAddress;
 ProviderTile({@required this.url,@required this.siteName,@required this.imageAddress});

 @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        if(await canLaunch(url) )
          launch(url);
        else
          print('NaN');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage('images/$imageAddress'),
              width: 48,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(siteName,style: TextStyle(fontSize: 20.0,fontFamily: 'BlockFont',color: Colors.black45),),

          ],
        ),
      ),
    );
  }
}
