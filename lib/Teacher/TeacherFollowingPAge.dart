import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Teacher/StudentListPage.dart';
import 'package:flutter_complete_guide/Teacher/TeacherAssigmentPage.dart';
import 'package:flutter_complete_guide/Student/MainPageStudent.dart';
import 'package:flutter_complete_guide/Student/ProfilePage.dart';
import 'MainPageTeacher.dart';


class TeacherFollowingPage extends StatefulWidget {
  String ders;
  String email;
  TeacherFollowingPage({@required this.ders, @required this.email});

  @override
  State<TeacherFollowingPage> createState() => _TeacherFollowingPageState();
}

class _TeacherFollowingPageState extends State<TeacherFollowingPage> {
  // A list of course names and images
  final List<Map<String, dynamic>> works = [
    {'name': 'ASSIGN HOMEWORK', 'image': 'assets/Png/math.png'},
    {'name': 'STUDENT LIST', 'image': 'assets/Png/math.png'},

  ];

  @override
  Widget build(BuildContext context) {
    MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.yellow,
      ),
      home: MyHomePageTeacher(),
    );

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

    return Scaffold(
      backgroundColor:Color(0xFFF4F6FF),
      body: SafeArea(
        child: Column(
          children: [
            // The top section with back button, title, date and user info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // The back button
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePageTeacher(email: widget.email),
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                // The title and date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.ders,
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
                      widget.email,
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
                      color: Color(0xFFA4AAC4)
                  ),
                ),
              ),
            ),
            // The course boxes
            Expanded(
              child: ListView.builder(
                itemCount: works.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // İlgili elemana tıklandığında yapılacak işlemler buraya gelecek
                      if (index == 0) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => TeacherAssignmentPage(ders: widget.ders, email: widget.email),
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
                      } else if (index == 1) {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => StudentListPage(ders: widget.ders),
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
                    },
                    child: Padding(
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
                                      works[index]['name'],
                                      style: TextStyle(
                                        fontFamily: 'Jua',
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),

                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Container(
                                        height: 40,
                                        width: 110,

                                        padding: EdgeInsets.only(bottom: 15, right: 8),
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Text(
                                            'Go to page',
                                            style: TextStyle(fontSize: 14, color: Colors.white),

                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Icon(Icons.arrow_right_alt, color: Colors.white,),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // The bottom navigation bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Tooltip(
        message: 'Previous Page',
        child: FloatingActionButton(

          backgroundColor: Color.fromARGB(255, 22, 175, 14),
          onPressed: () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MyHomePageTeacher(email: widget.email);
                },
              ),
            )
          },
          child: Icon(Icons.close_outlined),
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
                        Navigator.pushReplacement(
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
                    label: 'Profile'),
              ],
            ),
          ],
        ),
      ),



    );
  }
}