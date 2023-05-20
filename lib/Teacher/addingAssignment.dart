import 'package:flutter/material.dart';

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


            ],
          ),
        ),
      ),
    );
  }
}
