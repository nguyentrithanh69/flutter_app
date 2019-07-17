import 'package:flutter/material.dart';
import 'package:flutter_app/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie App",
      theme: ThemeData(
          primaryColor: Colors.black
      ),
      home: HomeScreen(),
    );
  }
}
