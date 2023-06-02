import 'package:flutter/material.dart';

import 'MainPageStudent.dart';

//void main() => runApp(ProfilePage());

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

  String email;
  String fullName;
  ProfilePage({@required this.email, this.fullName});
}

class _ProfilePageState extends State<ProfilePage> {
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

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String _username = '';
  String _password = '';

  void _login() {
    setState(() {
      _username = _usernameController.text;
      _password = _passwordController.text;
    });

    print('Kullanıcı adı: $_username');
    print('Şifre: $_password');
  }

  void _changePassword() {
    setState(() {
      _password = _passwordController.text;
    });

    print('Yeni Şifre: $_password');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
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
              widget.email,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text('Email'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _usernameController,
              ),
            ),
            SizedBox(height: 16.0),
            Text('Şifre'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text('Şifre Değiştir'),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: items,
          onTap: (index) {
            // Navigation logic goes here
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPageStudent(email: widget.email),
                  ),
                );
                break;
              case 1:
              // Messages tapped
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(email: widget.email,),
                  ),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
