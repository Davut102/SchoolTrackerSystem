import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/Login_Screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'School Tracker System',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
          routes: {
          }
    );
  }
}
