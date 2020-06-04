import 'package:covid19app/datasource.dart';
import 'package:covid19app/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: primaryBlack,
          ),
          home: HomePage()
      );
  }
}

