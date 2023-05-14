import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Student/MainPageStudent.dart';
import 'package:flutter_complete_guide/Student/StudentAssignmentPage.dart';
import 'package:flutter_complete_guide/Teacher/TeacherAssigmentPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../Teacher/MainPageTeacher.dart';
import 'SignUp_Screen.dart';

bool _wrongEmail = false;
bool _wrongPassword=false;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}
class _LoginScreen extends State<LoginScreen> {

  TextEditingController Email = TextEditingController();
  TextEditingController pass = TextEditingController();

  String emailText = 'Email doesn\'t match';
  String passwordText = 'Password doesn\'t match';
  String email;
  String password;
  String level;

  Future login() async {
    var url = Uri.http("localhost", "/saas/login.php", {'q': '{http}'});

    var url1 = Uri.http("localhost", "/saas/level_controller.php", {'q': '{http}'});

    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    var response1 = await http.post(url1,body:{
      "email": email,
    });

    if (response1.statusCode == 200) {
      level = jsonDecode(response1.body);
      print(level);
    } else {
      throw Exception('Veri alınamadı. Hata Kodu: ${response.statusCode}');
    }

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: 'Login Successful',
        backgroundColor: Colors.green,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_SHORT,
      );
      if(level == 'teacher') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePageTeacher(email: email),
          ),
        );
      }else if(level == 'student'){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainPageStudent(),
          ),
        );
      }

    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.red,
        textColor: Colors.white,
        msg: 'Username and password invalid',
        toastLength: Toast.LENGTH_SHORT,
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                    padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
                    child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                    email = value;
                    },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle_outlined) ,
                        hintText: 'Email',
                        labelText: 'Email',
                        errorText: _wrongEmail ? emailText : null,
                      ),
                    ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      password = value;
                      },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: 'Password',
                      labelText: 'Password',
                      errorText: _wrongPassword ? passwordText : null,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                    // Navigator.pushNamed(context, ForgotPassword.id);
                      },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0,0,120,0),
                      child: Text(
                        'Forgot Password?',
                        style:
                        TextStyle(fontFamily: 'Jua',
                            fontSize: 15.0,
                            color: Colors.blue),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
    ),
            Container(
              alignment: Alignment.center,
              child: Container(
                  height: 50,
                  width: size.height*0.3,
                  child: ElevatedButton(
                      onPressed:()=>{
                        login(),
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
                      )
                  ),
                ),
            ),
            SizedBox(height: 30,),
            Container(
              alignment: Alignment.center,
              child: Container(
                height: 20,
                width: size.height*0.3,
                color: Colors.amber,
                child: Text(
                  'Don\'t you have an account?',
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
                width: size.height*0.3,
                child: ElevatedButton(
                    onPressed:()=>{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp_Screen()
                        ),
                      ),
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

            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}