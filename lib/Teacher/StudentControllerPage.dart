import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class StudentControllerPage extends StatefulWidget {
  final String ders;
  StudentControllerPage({@required this.ders});

  @override
  State<StudentControllerPage> createState() => _StudentControllerPageState();
}

class _StudentControllerPageState extends State<StudentControllerPage> {
  List<String> studentList = [];

  List<String> studentList2 = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  int selectedList = 1;

  List<String> get selectedListItems {
    return (selectedList == 1) ? studentList : studentList2;
  }

  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = Uri.http("localhost", "/saas/liststudent.php", {'q': 'http'});
    var response = await http.post(url, body:  ({
      "course": widget.ders,
    }));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<dynamic> courseData = data as List<dynamic>;
      courseData.forEach((email) {
        studentList.add(email.toString());
      });
      setState(() {});
      print(studentList);
    } else {
      print('HTTP Get Request Hatası: ${response.statusCode}');
    }
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
                Center(
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedList = 1;
                              });
                            },
                            child: Text('Students who did homework', style: TextStyle(fontFamily: "Jua", fontSize: 25, color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber
                            ),
                          ),
                          SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedList = 2;
                              });
                            },
                            child: Text('Students who didn\'t do homework', style: TextStyle(fontFamily: "Jua", fontSize: 25, color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.amber
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: selectedListItems.length,
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
                                        selectedListItems[index],
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

