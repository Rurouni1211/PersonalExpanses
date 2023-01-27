import 'package:expanses/ui%20/expanses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        textTheme: TextTheme(
            bodyText1: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Lobster',
                fontSize: 20)),
        fontFamily: 'RobotoMono',
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'RobotoMono',
                fontWeight: FontWeight.bold,
                fontSize: 30))),
    home: Expenses(),
  ));
}
