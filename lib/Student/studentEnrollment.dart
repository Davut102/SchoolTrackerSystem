import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Student/MainPageStudent.dart';
import 'package:flutter_complete_guide/Student/StudentAssignmentPage.dart';
import 'package:flutter_complete_guide/Teacher/TeacherAssigmentPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../Teacher/MainPageTeacher.dart';


class StudentEnrollment extends StatefulWidget {
  List<String> EnrolledCourses = [];
  String email;
  StudentEnrollment(@required this.email, @required this.EnrolledCourses);
  @override
  State<StudentEnrollment> createState() => _StudentEnrollmentState();
}



class _StudentEnrollmentState extends State<StudentEnrollment> {

  final List<String> UnEnrolledCourses = [];
  String index_unenrolled;//for the index of the unenrolledcourse

  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = Uri.http("localhost", "/saas/studentsUnEnrolledCourses.php", {'q': 'http'});
    var response = await http.post(url, body:  ({
      "email": widget.email,
    }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> courseData = data as List<dynamic>;
      courseData.forEach((course) {
        UnEnrolledCourses.add(course.toString());
      });
      setState(() {});
      print(UnEnrolledCourses);
    } else {
      print('HTTP Get Request Hatası: ${response.statusCode}');
    }
  }

  void initialState() {
    super.initState();
    addData();
  }

  Future<void> addData() async {
    var url =Uri.http("localhost", "/saas/addingCourses.php", {'q': 'http'});
    var response = await http.post(url, body:  ({
      "email": widget.email,
      "course_id": index_unenrolled,
    }));
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           leading: IconButton(
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => MainPageStudent(email: widget.email),
                 ),
               );
             },
             icon: Icon(Icons.arrow_back),
           ),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: UnEnrolledCourses.length,
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
                      // The course name
                      Align(
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text(
                                UnEnrolledCourses[index],
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
                                        pageBuilder: (context, animation, secondaryAnimation) => StudentAssignmentPage(),
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
                                    );}
                              ),
                              IconButton(
                                onPressed: (){
                                  index_unenrolled=UnEnrolledCourses[index];
                                  print(index_unenrolled);
                                  addData();
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StudentEnrollment(widget.email,widget.EnrolledCourses),
                                      ),
                                    );
                                  });

                                },
                                icon: Icon(Icons.add),
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
      ),
    );
  }
}
