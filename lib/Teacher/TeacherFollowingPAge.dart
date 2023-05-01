import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Teacher/StudentListPage.dart';
import 'package:flutter_complete_guide/Teacher/TeacherAssigmentPage.dart';

import 'MainPageTeacher.dart';
import 'StudentListPage.dart';

class TeacherFollowingPage extends StatelessWidget {

  // A list of course names and images
  final List<Map<String, dynamic>> courses = [
    {'name': 'ASSIGN HOMEWORK', 'image': 'assets/Png/math.png'},


  ];


  @override
  Widget build(BuildContext context) {
    MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.yellow,
      ),
      home: MyHomePageTeacher(),
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
                // The back button
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => MyHomePageTeacher(),
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
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                // The title and date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MATH 101.01',
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
                      'Teacher',
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

                          // The course name
                          Align(

                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    courses[index]['name'],
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
                                    child: IconButton(
                                        icon: Icon(Icons.arrow_right_alt, color: Colors.white,),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation, secondaryAnimation) => TeacherAssignmentPage(),
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
        Expanded(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  // The course image

                  // The course name
                  Align(

                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 40,
                              width: 110,

                              padding: EdgeInsets.only(bottom: 15, right: 8),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'STUDENT LIST',
                                  style: TextStyle(fontSize: 14, color: Colors.red),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                                icon: Icon(Icons.arrow_right_alt, color: Colors.red,),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => StudentListPage(),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
          ],
        ),
      ),
      // The bottom navigation bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return StudentListPage();
            },
          ),
        ),
        backgroundColor: Color.fromARGB(255, 23, 31, 42),
        child: Icon(Icons.close_rounded),
        elevation: 2.0,
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 5,
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
                              return MyHomePageTeacher();
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.home),
                      color: Color.fromARGB(255, 23, 31, 42),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MyHomePageTeacher();
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.person),
                      color: Color.fromARGB(255, 23, 31, 42),
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