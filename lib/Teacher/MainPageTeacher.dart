import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Student/ProfilePage.dart';
import 'package:flutter_complete_guide/Teacher/TeacherFollowingPAge.dart';
import 'package:flutter_complete_guide/screens/Login_Screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyHomePageTeacher extends StatefulWidget {
  final String email;


  MyHomePageTeacher({@required this.email});

  @override
  State<MyHomePageTeacher> createState() => _MyHomePageTeacherState();
}

class _MyHomePageTeacherState extends State<MyHomePageTeacher> {
  List<String> courses = [];

  void initState() {
    super.initState();
    fetchData();
  }


  Future<void> fetchData() async {
    var url = Uri.http("localhost", "/saas/listcourses.php", {'q': 'http'});
    var response = await http.post(url, body:  ({
      "instructor": widget.email,
    }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> courseData = data as List<dynamic>;
      courseData.forEach((course) {
        courses.add(course.toString());
      });
      setState(() {});
      print(courses);
    } else {
      print('HTTP Get Request Hatası: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
     MaterialApp(

      theme: ThemeData(
        canvasColor: Colors.yellow,
      ),
      home: MyHomePageTeacher(email: widget.email),
    );

    return Scaffold(
      backgroundColor:Color(0xFFF4F6FF),
      body: SafeArea(
        child: Column(
          children: [
            // The top section with back button, title, date and user info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                ),
                // The title and date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Course Activity',
                      style: TextStyle(
                        fontFamily: 'Jua',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                      style: TextStyle(
                        fontFamily: 'Jua',
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                // The user picture and name
                Column(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/Png/user.png'),
                    ),
                    Text(
                      '          Teacher \n ${widget.email}',
                      style: TextStyle(
                        fontFamily: 'Jua',
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // The MY COURSES text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  My Courses',
                  style: TextStyle(
                    fontFamily: 'Jua',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // The course boxes
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color:
                        Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          // The course image
                          /*ClipRRect(
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50)),
                            child:
                            Image.asset(courses[index], fit: BoxFit.cover,),

                          ),*/
                          // The course name
                          Align(
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    courses[index],
                                    style: TextStyle(
                                      fontFamily: 'Jua',
                                      fontSize: 25,
                                      color: Colors.white
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.arrow_circle_right, color: Colors.white,) ,
                                    onPressed: () {
                                             Navigator.push(
                                                        context,
                                              PageRouteBuilder(
                                                pageBuilder: (context, animation, secondaryAnimation) => TeacherFollowingPage(ders: courses[index], email: widget.email),
                                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                              var begin = 0.0;
                                              var end = 1.0;
                                               var tween = Tween(begin: begin, end: end);
                                              var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeOut);

                                              return FadeTransition(
                                              opacity: tween.animate(curvedAnimation),
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                    }
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Tooltip(
        message: 'Logout',
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 22, 175, 14),
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            )
          },
          child: Icon(Icons.logout_sharp),
          elevation: 2.0,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
      color: Colors.transparent,
        clipBehavior: Clip.antiAlias,

        shape: CircularNotchedRectangle(),
        child: Wrap(
          children: [
            BottomNavigationBar(
              iconSize: 35,
              type: BottomNavigationBarType.fixed,
              currentIndex: 0,
              items: [
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHomePageTeacher(email: widget.email);
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.home),
                      color: Color.fromARGB(255, 22, 175, 14),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfilePage(email: widget.email);
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.person),
                      color: Color.fromARGB(255, 22, 175, 14),
                    ),
                    label: 'Profile', backgroundColor: Colors.pinkAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

