import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Teacher/addingAssignment.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class TeacherAssignmentPage extends StatefulWidget {
  String ders;
  TeacherAssignmentPage({@required this.ders});
  @override
  State<TeacherAssignmentPage> createState() => _TeacherAssignmentPageState();
}

class _TeacherAssignmentPageState extends State<TeacherAssignmentPage> {

  TextEditingController bookName_Controller = TextEditingController();
  TextEditingController bookPage_controller = TextEditingController();
  TextEditingController week_controller = TextEditingController();

  List<Map<String,dynamic>> assignments = [];
  String week_number;
  String book;
  String bookPages;

  void initState() {
    super.initState();
    fetchData();
  }

  Future addAssignment() async {
    var url = Uri.http("localhost", "/saas/addAsignment.php", {'q': '{http}'});

    var response1 = await http.post(url, body:({
      "course": widget.ders,
      "bookName": bookName_Controller.text.toString(),
      "bookPages": bookPage_controller.text.toString(),
      "week": week_number,
    }));
  }

  Future<void> fetchData() async {
    var url = Uri.http("localhost", "/saas/visibleAssignment.php", {'q': 'http'});
    var response = await http.post(url, body:  ({
      "week": week_number,
      "course_id": widget.ders,

    }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> assignmentData = data as List<dynamic>;
      assignments = assignmentData.map((assignment) {
        return {
          'title': assignment['bookName'],
          'pageNum': assignment['bookPages'],
        };
      }).toList();
      setState(() {});
    } else {
      print('HTTP Post Request Hatası: ${response.statusCode}');
    }
  }

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
      home: TeacherAssignmentPage(),
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
                    Navigator.pop(context);
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
                              setState(() {
                                week_number= weeks[index].weekName;
                              });
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          assignments[index]['title'],
                                          style: TextStyle(
                                              fontFamily: 'Jua', fontSize: 25),
                                        ),
                                        Text(
                                            "   "
                                        ),
                                        Text(
                                          assignments[index]['pageNum'],
                                          style: TextStyle(
                                              fontFamily: 'Jua', fontSize: 25),
                                        ),
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
      // The bottom navigation bar
      bottomNavigationBar:
      BottomNavigationBar(items: items, onTap:(index) {
        Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0));
        // Handle the navigation logic here
      }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {if(week_number != null){
          showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    Text(
                      'Give Homework!!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 120.0, vertical: 10.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: bookName_Controller,
                            keyboardType: TextInputType.emailAddress,
                            onSubmitted: (value) {},
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.text_snippet_outlined),
                              hintText: 'Book Name',
                              labelText: 'Book Name',
                            ),
                          ),
                          TextField(
                            controller: bookPage_controller,
                            keyboardType: TextInputType.emailAddress,
                            onSubmitted: (value) {},
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.text_snippet_outlined),
                              hintText: 'Book Pages',
                              labelText: 'Book Pages',
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        addAssignment();
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) =>
                                TeacherAssignmentPage(ders: widget.ders),
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
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        }
        else{
          Fluttertoast.showToast(
            msg: 'Choose week to give homework',
            backgroundColor: Colors.green,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_SHORT,
          );
        }
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartDocked,
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
