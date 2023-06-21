import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Login_Screen.dart';
import 'package:http/http.dart' as http;

class SignUp_Screen extends StatefulWidget {

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {

  String isTeacher= "";
  String isUnique = "false"; //bunu bool yapma sakın!!!
  TextEditingController name_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  Future register() async {
    var url = Uri.http("localhost", "/saas/register.php", {'q': '{http}'});
    var url1 = Uri.http("localhost", "/saas/verification.php", {'q': '{http}'});

    var response1 = await http.post(url1, body:  ({
      "email": email_controller.text.toString(),
      "name" : name_controller.text.toString(),
    }));

    if (response1.statusCode == 200) {
      isUnique = "false";
    }else{
      isUnique= "true";
    }

    if(email_controller.text.toString().isEmpty || !email_controller.text.toString().contains('@')
        || !(email_controller.text.toString().contains('.com') || email_controller.text.toString().contains('.gov')
            || email_controller.text.toString().contains('.tr') || email_controller.text.toString().contains('.edu'))
    ){
      Fluttertoast.showToast(
          msg: 'Invalid email',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }else if (password_controller.text.toString().length < 6 || password_controller.text.toString().length>12){
      Fluttertoast.showToast(
          msg: 'Password should be at least 6 and at most 12 character long!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }else if (!(isTeacher.toString() == 'student' || isTeacher.toString() == 'teacher')) {
      Fluttertoast.showToast(
        msg: 'Invalid user type',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
    }else if (isUnique == "false"){
      Fluttertoast.showToast(
          msg: 'Email or ID could be same',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }else {
      var response = await http.post(url, body: {
        "name": name_controller.text.toString(),
        "email": email_controller.text.toString(),
        "password": password_controller.text.toString(),
        "level": isTeacher.toString(),
      });

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
          msg: 'ID already exist!',
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
                    Image.asset(
                      'assets/engrr.gif',  width: double.infinity,
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
                        controller: name_controller,
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: (value) {},
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.perm_identity),
                          hintText: 'FullName',
                          labelText: 'FullName',
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 10.0),
                      child: TextField(
                        controller: email_controller,
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: (value) {},
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_circle_outlined),
                          hintText: 'Email',
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 10.0),
                      child: TextField(
                        controller: password_controller,
                        onSubmitted: (value) {},
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.key),
                          hintText: 'Password',
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 10.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isTeacher = 'teacher';
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isTeacher == 'teacher'
                                          ? Colors.blue
                                          : Colors.grey,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: isTeacher == 'teacher'
                                        ? Icon(
                                      Icons.check,
                                      size: 16.0,
                                      color: Colors.blue,
                                    )
                                        : Container(
                                      width: 16.0,
                                      height: 16.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'Teacher',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.0), // İstediğiniz boşluk miktarını ayarlayabilirsiniz
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isTeacher = 'student';
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isTeacher == 'student'
                                          ? Colors.blue
                                          : Colors.grey,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: isTeacher == 'student'
                                        ? Icon(
                                      Icons.check,
                                      size: 16.0,
                                      color: Colors.blue,
                                    )
                                        : Container(
                                      width: 16.0,
                                      height: 16.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'Student',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}