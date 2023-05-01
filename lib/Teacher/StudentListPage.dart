import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

class StudentListPage extends StatelessWidget {

  List<Student> studentList = [

    Student(
      name: 'Ali',
    ),
    Student(
      name: 'Davut',
    ),
    Student(
      name: 'Fatih Talha',
    ),
    Student(
      name: 'Ilayda',
    ),
    Student(
      name: 'Joe',
    ),
    Student(
      name: 'Alex',
    ),
    Student(
      name: 'Chris',
    ),
    Student(
      name: 'Hanry',
    ),
    Student(
      name: 'Julia',
    ),
    Student(
      name: 'Anna',
    ),
    Student(
      name: 'Ayse',
    ),
    Student(
      name: 'Mehmet',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name List',
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  ],
                ),
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
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: studentList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    height: 50,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        studentList[index].name,
                                        style:
                                        TextStyle(fontFamily: 'Jua', fontSize: 25
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class Student {
  String name;
  Student(
      {@required this.name,
      });
}
