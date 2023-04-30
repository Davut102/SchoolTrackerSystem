import 'package:flutter/material.dart';

//void main() => runApp(ProfilePage());

class ProfilePage extends StatelessWidget {

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mail),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://picsum.photos/200',
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Name Surname',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        bottomNavigationBar:
        BottomNavigationBar(items: items, onTap:(index) {
          Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0));
          // Handle the navigation logic here
        }
        ),
      ),
    );
  }
}
