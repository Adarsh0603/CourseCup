import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(

      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 8.0,

        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Product Designer"),
              Text("School of Business"),
              Text("Envision and execute the development of industry-defining products, and learn how to successfully bring them to market.")
            ],
          ),
        ),
    );
  }
}
