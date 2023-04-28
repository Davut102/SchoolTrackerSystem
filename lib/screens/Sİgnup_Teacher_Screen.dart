import 'package:flutter/material.dart';

import 'Login_Screen.dart';

bool _wrongEmail = false;
bool _wrongPassword=false;

class SignTeacherScreen extends StatefulWidget {
  @override
  _SignTeacherScreen createState() => _SignTeacherScreen();
}
class _SignTeacherScreen extends State<SignTeacherScreen> {
  String emailText = 'Email doesn\'t match';
  String passwordText = 'Password doesn\'t match';
  String email;
  String password;
  String full_name;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          full_name = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Student ID',
                          labelText: 'Student ID',
                        ),
                      ),
                    ),

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
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width: size.height*0.3,
                        child: ElevatedButton(
                          onPressed:()=>{

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
                        width: size.height*0.3,
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
                        width: size.height*0.3,
                        child: ElevatedButton(
                            onPressed:()=>{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen(),
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
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}