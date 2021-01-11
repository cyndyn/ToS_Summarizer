import 'package:flutter/material.dart';
import 'package:sfu_flutter/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Summarized For U',
      home: HomeScreen(),
    );
  }
}
