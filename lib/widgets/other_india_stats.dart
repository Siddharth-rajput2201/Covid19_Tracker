import 'package:covid19app/datasource.dart';
import 'package:flutter/material.dart';

class Infopanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child : Column(
        children: <Widget>[
          Container(
            color: primaryBlack,
            child: Row(
              children: <Widget>[
                Text("INDIA")
              ],
            ),
          )
        ],
      )
    );
  }
}
