import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Student/MainPageStudent.dart';
import 'Login_Screen.dart';
import 'package:http/http.dart' as http;

bool _wrongEmail = false;
bool _wrongPassword=false;

class SignUp_Screen extends StatefulWidget {

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  String emailText = 'Email doesn\'t match';
  String passwordText = 'Password doesn\'t match';
  int id;
  String email;
  String password;
  String isTeacher= "";

  TextEditingController id_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController level_controller = TextEditingController();


  Future register() async {
    var url = Uri.http("localhost", "/saas/register.php", {'q': '{http}'});

    if(email_controller.toString().isEmpty || !email_controller.toString().contains('@')
    ){
      Fluttertoast.showToast(
          msg: 'Invalid email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }else if (password_controller.text.length < 6 ){
      Fluttertoast.showToast(
          msg: 'Password should be at least 6 character long!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }else if(level_controller.toString() != 'student' || level_controller.toString() != 'teacher') {
      Fluttertoast.showToast(
          msg: 'Invalid user type',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }else {
      var response = await http.post(url, body: {
        "id": id_controller.text.toString(),
        "email": email_controller.text.toString(),
        "password": password_controller.text.toString(),
        "level": level_controller.text.toString(),
      });

      var data = json.decode(response.body);

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: 'Registration Successful!',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM_RIGHT,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }else{
        Fluttertoast.showToast(
          msg: 'User already exist!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor:Color(0xFFF4F6FF),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Image.network(
                      "https://assets-global.website-files.com/59d46c848021530001e0117b/5fd1bf73ba01e9060de09e2d_student-management-essentials-hero.png",
                      width: double.infinity,
                      height: 300,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                color: Color.fromARGB(255, 145, 179, 250),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.topCenter,
                      child: Text(
                        'School Tracker System',
                        style: TextStyle(
                          fontFamily: 'Jua',
                          fontSize: 20,
                          height: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 10.0),
                      child: TextField(
                        controller: id_controller,
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) {
                          id = value as int;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity),
                          hintText: 'Student ID',
                          labelText: 'Student ID',
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 10.0),
                      child: TextField(
                        controller: email_controller,
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: (value) {

                            email = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          hintText: 'Email',
                          labelText: 'Email',
                          errorText: _wrongEmail ? emailText : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 10.0),
                      child: TextField(
                        controller: password_controller,
                        onSubmitted: (value) {
                          password = value;
                        },
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key),
                          hintText: 'Password',
                          labelText: 'Password',
                          errorText: _wrongPassword ? passwordText : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 10.0),
                      child: TextField(
                        controller: level_controller,
                        onSubmitted: (value) {
                          isTeacher = value;
                        },

                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.school),
                          hintText: 'teacher or student?',
                          labelText: 'teacher or student?',
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width: size.height * 0.3,
                        child: ElevatedButton(
                          onPressed: () =>
                          {
                            register(),
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 145, 179, 250),
                          ),
                          child: Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Jua',
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 20,
                        width: size.height * 0.3,
                        color: Colors.amber,
                        child: Text(
                          'Already have an account?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Jua',
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width: size.height * 0.3,
                        child: ElevatedButton(
                          onPressed: () =>
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            ),
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 145, 179, 250),
                          ),
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Jua',
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
