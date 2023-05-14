import 'package:flutter/material.dart';

//void main() => runApp(MyApp());
class AssignmentListPage extends StatefulWidget {
  const AssignmentListPage({Key key}) : super(key: key);

  @override
  State<AssignmentListPage> createState() => _AssignmentListPageState();
}

class _AssignmentListPageState extends State<AssignmentListPage> {
  List<Assignment> assignmentList = [
    Assignment(name: 'Apotemi', isSelected: false),
    Assignment(name: 'Orijinal', isSelected: false),
    Assignment(name: 'Bilgi Sarmal', isSelected: false),
    Assignment(name: 'Hız ve Renk', isSelected: false),
    Assignment(name: 'Acil', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment List',
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
                      'LIST',
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
                    itemCount: assignmentList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 8.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Container(
                                    height: 50,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              150, 0, 0, 0),
                                          child: Text(
                                            assignmentList[index].name,
                                            style: TextStyle(
                                                fontFamily: 'Jua',
                                                fontSize: 25),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (assignmentList[index]
                                                .isSelected) {
                                              setState(() {
                                                assignmentList[index]
                                                    .isSelected = false;
                                              });
                                            } else {
                                              setState(() {
                                                assignmentList[index]
                                                    .isSelected = true;
                                              });
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: assignmentList[index]
                                                      .isSelected
                                                  ? Colors.green
                                                  : Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Assignment {
  String name;
  bool isSelected;

  Assignment({@required this.name, this.isSelected});
}
