import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  final String email;
  final String fullName;

  ProfilePage({@required this.email, this.fullName});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();

  String _password = '';
  String _fullName = '';
  String _email = '';

  List<Map<String,dynamic>> userData = [];

  bool _showChangePasswordButton = false;
  bool _showChangeFullNameButton = false;
  bool _showChangeEmailButton = false;

  Future<void> fetchData() async {
    var url = Uri.http("localhost", "/saas/userData.php", {'q': 'http'});
    var response = await http.post(url, body:  ({
        "email" : widget.email
    }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> usersData = data as List<dynamic>;
      userData = usersData.map((data) {
        return {
          'email': data['email'],
          'fullName': data['fullName'],
          'password': data['password'],
        };
      }).toList();
      setState(() {});
    } else {
      print('HTTP Post Request Hatası: ${response.statusCode}');
    }
  }

  void _changePassword() {
    setState(() {
      _password = _passwordController.text;
    });

    print('Yeni Şifre: $_password');
  }

  void _changeFullName() {
    setState(() {
      _fullName = _fullNameController.text;
    });

    print('Yeni İsim: $_fullName');
  }

  void _changeEmail() {
    setState(() {
      _email = _emailController.text;
    });

    print('Yeni Email: $_email');
  }

  @override
  Widget build(BuildContext context) {

    if (userData.isEmpty) {
      fetchData();
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.cyan,
            ),
          ),
          title: Text(
            'Profile',
            style: TextStyle(fontFamily: 'Jua', fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 150,
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
                  fontFamily: 'Jua',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Full Name',
                style: TextStyle(fontFamily: 'Jua'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: _fullNameController,
                    onTap: () {
                      setState(() {
                        _showChangePasswordButton = false;
                        _showChangeFullNameButton = true;
                        _showChangeEmailButton = false;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: userData.isNotEmpty ? userData[0]['fullName'] : '',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Email',
                style: TextStyle(fontFamily: 'Jua'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: _emailController,
                    onTap: () {
                      setState(() {
                        _showChangePasswordButton = false;
                        _showChangeFullNameButton = false;
                        _showChangeEmailButton = true;
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: userData.isNotEmpty ? userData[0]['email'] : '',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Password',
                style: TextStyle(fontFamily: 'Jua'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    controller: _passwordController,
                    onTap: () {
                      setState(() {
                        _showChangePasswordButton = true;
                        _showChangeFullNameButton = false;
                        _showChangeEmailButton = false;
                      });
                    },
                    obscureText: !_showChangePasswordButton,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                      hintText: _showChangePasswordButton
                          ? userData.isNotEmpty
                          ? userData[0]['password']
                          : ''
                          : '********',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_showChangePasswordButton) {
                              _passwordController.clear();
                            }
                            _showChangePasswordButton = !_showChangePasswordButton;
                          });
                        },
                        child: Icon(
                          _showChangePasswordButton
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              if (_showChangePasswordButton)
                ElevatedButton(
                  onPressed: _changePassword,
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Change Password',
                    style: TextStyle(fontFamily: 'Jua'),
                  ),
                ),
              if (_showChangeFullNameButton)
                ElevatedButton(
                  onPressed: _changeFullName,
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Change Full Name',
                    style: TextStyle(fontFamily: 'Jua'),
                  ),
                ),
              if (_showChangeEmailButton)
                ElevatedButton(
                  onPressed: _changeEmail,
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Change Email',
                    style: TextStyle(fontFamily: 'Jua'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
