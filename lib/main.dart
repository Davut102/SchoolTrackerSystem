import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/Login_Screen.dart';
import 'package:flutter_complete_guide/screens/S%C4%B0gnup_Teacher_Screen.dart';
import 'package:provider/provider.dart';


import './providers/auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato',
          ),
          home: LoginScreen(),
          routes: {
          }),
    );
  }
}
