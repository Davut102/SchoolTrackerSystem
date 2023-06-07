import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/Login_Screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<dynamic> quotes = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    Timer(Duration(seconds: 5), () => navigateToNextScreen());
  }

  Future<void> fetchData() async {
    var url = Uri.parse('https://api.api-ninjas.com/v1/quotes?category=success');

    var headers = {
      'X-Api-Key': 'CDta3qoBcp8yPEIfLCZ5Xw==W1EVFLoYCXz0GY3b',
    };

    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      setState(() {
        quotes = jsonDecode(response.body) as List<dynamic>;
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  void navigateToNextScreen() {
    // Yeni sayfanın rotasını belirleyin ve yönlendirin
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
        SizedBox(height: 10),
        Column(
          children: quotes.map((quote) {
            return Center(
              child: ListTile(
                title: Text(quote['quote']),
                subtitle: Text('Author: ${quote['author']}'),
              ),
            );
          }).toList(),
        ),
        ],
      ),
    ),
    );
  }
}
