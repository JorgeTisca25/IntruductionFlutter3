//mateapp - para generar estructura
import 'package:flutter/material.dart';

//Our imports
import 'package:flutter_components/src/pages/home_temp.dart';
import 'package:flutter_components/src/pages/home_page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components App',
      home: HomePage()
    );
  }
}