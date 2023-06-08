import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Student/MainPageStudent.dart';
import 'package:flutter_complete_guide/Student/ProfilePage.dart';
import 'package:http/http.dart' as http;

class StudentAssignmentPage extends StatefulWidget {
  @override
  State<StudentAssignmentPage> createState() => _StudentAssignmentPageState();
  String course_id;
  String email;
  String fullName;
  StudentAssignmentPage({@required this.course_id, @required this.email, this.fullName});
}

class _StudentAssignmentPageState extends State<StudentAssignmentPage> {
  List<Map<String,dynamic>> assignments = [];
  String week_number;
  bool _hasBeenPressed = false;

  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = Uri.http("localhost", "/saas/visibleAssignment.php", {'q': 'http'});
    var response = await http.post(url, body:  ({
      "week": week_number,
      "course_id": widget.course_id,

    }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> assignmentData = data as List<dynamic>;
      assignments = assignmentData.map((assignment) {
        return {
          'title': assignment['bookName'],
          'pageNum': assignment['bookPages'],
          'selected' : false,
        };
      }).toList();
      setState(() {});
      print(assignments);
    } else {
      print('HTTP Post Request Hatası: ${response.statusCode}');
    }
  }

// liste olsun
  final List<Week> weeks = [
    Week(weekName: "Week 1", color: Colors.green),
    Week(weekName: "Week 2", color: Colors.pink),
    Week(weekName: "Week 3", color: Colors.purple),
    Week(weekName: "Week 4", color: Colors.blue),
    Week(weekName: "Week 5", color: Colors.red),
    Week(weekName: "Week 6", color: Colors.amber),
  ];

  // A list of bottom navigation bar items
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

  @override
  Widget build(BuildContext context) {
    MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.yellow,
      ),
      home: StudentAssignmentPage(),
    );

    return Scaffold(
      backgroundColor: Color(0xFFF4F6FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // The top section with back button, title, date and user info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // The back button
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  // The title and date
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course_id,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/Png/math.png',
                        width: 150,
                        height: 150,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: weeks.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: GestureDetector(
                              onTap: () {
                                print(weeks[index].weekName);
                                setState(() {
                                    week_number=weeks[index].weekName;
                                });
                                print(assignments.toList());
                                fetchData();

                              },
                              child: Stack(
                                children: [
                                  // The course name
                                  Align(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Container(
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: weeks[index].color,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            weeks[index].weekName,
                                            style: TextStyle(
                                                fontFamily: 'Jua',
                                                fontSize: 25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),

              Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: assignments.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 8.0),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              // The course name
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: 75,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                50, 0, 0, 0),

                                            child: Text(
                                              assignments[index]['title'],
                                              style: TextStyle(
                                                  fontFamily: 'Jua', fontSize: 25),

                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 30, 0),
                                            child: Text(
                                              assignments[index]['pageNum'],
                                              style: TextStyle(
                                                  fontFamily: 'Jua', fontSize: 25),
                                            ),
                                          ),
                                          //Spacer(),

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 50, 0),
                                            child: Container(
                                              height: 35,
                                              width: 35,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              child: ElevatedButton(
                                                //child: Text(' '),

                                                style: ElevatedButton.styleFrom(
                                                  primary: assignments[index]['selected'] ? Colors.green : Colors.red,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                   // _hasBeenPressed = !_hasBeenPressed;
                                                    assignments[index]['selected'] =  !assignments[index]['selected'];
                                                  });
                                                },
                                                /*child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),*/
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 22, 175, 14),
        onPressed: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MainPageStudent(email: widget.email);
              },
            ),
          )
        },
        child: Icon(Icons.close_outlined),
        elevation: 2.0,
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
                              return MainPageStudent(email: widget.email);
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

class Week {
  String weekName;
  Color color;

  Week({
    @required this.weekName,
    @required this.color,
  });
}