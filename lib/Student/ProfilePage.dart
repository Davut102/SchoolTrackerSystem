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
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.cyan,),
          ),

          title: Text('Profile', style: TextStyle(fontFamily: 'Jua', fontSize: 25),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://www2.deloitte.com/content/dam/insights/us/articles/3523_Success-by-design/images/Success-by-design_1440x660.jpg/_jcr_content/renditions/cq5dam.web.1440.660.jpeg',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.email,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Jua'
                ),
              ),
              SizedBox(height: 20),
              Text('E-mail',style: TextStyle(fontFamily: 'Jua'),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _usernameController,

                ),
              ),
              SizedBox(height: 16.0),
              Text('Password',style: TextStyle(fontFamily: 'Jua'),),
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
                child: Text('Change Password',style: TextStyle(fontFamily: 'Jua'),),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
