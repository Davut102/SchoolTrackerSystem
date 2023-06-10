import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StudentControllerPage extends StatefulWidget {
  String ders;
  String id;
  StudentControllerPage({@required this.ders, @required this.id});

  @override
  State<StudentControllerPage> createState() => _StudentControllerPageState();
}

class _StudentControllerPageState extends State<StudentControllerPage> {
  List<String> studentList = [];
  List<String> studentList2 = [];
  int selectedList = 1;

  List<String> get selectedListItems {
    return (selectedList == 1) ? studentList : studentList2;
  }

  Future<void> fetchData() async {
    var url = Uri.http("localhost", "/saas/studentChecker.php", {'q': 'http'});
    var response = await http.post(
      url,
      body: {
        "course": widget.ders,
        "assignmentID": widget.id
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> studentData = data as List<dynamic>;

      for (var student in studentData) {
        var fullName = student['fullName'];
        var status = student['status'];

        if (status == "0") {
          studentList.add(fullName);
        } else if (status == "1") {
          studentList2.add(fullName);
        }
      }

      setState(() {});
    } else {
      print('HTTP Post Request Hatası: ${response.statusCode}');
    }
    print(studentList);
    print(studentList2);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name List',
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedList = 0;
                        });
                      },
                      child: Text(
                        'WHO DONE HW',
                        style: TextStyle(
                          fontFamily: "Jua",
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedList = 1;
                        });
                      },
                      child: Text(
                        'WHO DIDNT DO HW',
                        style: TextStyle(
                          fontFamily: "Jua",
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: selectedListItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                      selectedListItems[index],
                                      style: TextStyle(
                                        fontFamily: 'Jua',
                                        fontSize: 25,
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
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
