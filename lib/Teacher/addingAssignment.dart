import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class addAssignment extends StatefulWidget {

  @override
  State<addAssignment> createState() => _addAssignmentState();
}

class _addAssignmentState extends State<addAssignment> {
  TextEditingController courseName_Controller = TextEditingController();
  TextEditingController bookName_Controller = TextEditingController();
  TextEditingController bookPage_controller = TextEditingController();
  TextEditingController week_controller = TextEditingController();

  String course_name;
  String bookName;
  String bookPages;
  String week;

  Future addAssignment() async {
    var url = Uri.http("localhost", "/saas/addAssignment.php", {'q': '{http}'});

    var response1 = await http.post(url, body: ({
      "course_name": courseName_Controller.text.toString(),
      "bookName": bookName_Controller.text.toString(),
      "bookPages": bookPage_controller.text.toString(),
      "week": week_controller.text.toString(),
    }));

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
              'ADD ASSIGNMENT'
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: courseName_Controller,
                onSubmitted: (value) {
                  course_name = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  hintText: 'COURSE NAME',
                  labelText: 'COURSE NAME',
                ),
              ),

              TextField(
                controller: bookName_Controller,
                onSubmitted: (value) {
                  bookName = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  hintText: 'COURSE NAME',
                  labelText: 'COURSE NAME',
                ),
              ),
              TextField(
                controller: bookPage_controller,
                onSubmitted: (value) {
                  bookPages = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  hintText: 'BOOK NAME',
                  labelText: 'BOOK PAGES',
                ),
              ),

              TextField(
                controller: week_controller,
                onSubmitted: (value) {
                  week = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity),
                  hintText: 'WEEK NUMBER',
                  labelText: 'WEEK NUMBER',
                ),
              ),
              ElevatedButton(
                onPressed: () =>
                {
                  addAssignment(),
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


            ],
          ),
        ),
      ),
    );
  }
}
