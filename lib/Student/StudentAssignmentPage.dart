import 'package:flutter/material.dart';

import '../screens/weeksScreen.dart';

class StudentAssignmentPage extends StatefulWidget {

  String course_name;
  StudentAssignmentPage({@required this.course_name});
  @override
  State<StudentAssignmentPage> createState() => _StudentAssignmentPageState();
}

class _StudentAssignmentPageState extends State<StudentAssignmentPage> {
  final List<Book> bookList = [
    Book(title: 'Apotemi', pageNum: '15-30'),
    Book(title: 'Acil', pageNum: '15-30'),
    Book(title: 'Bilgi Sarmal', pageNum: '15-30'),
  ];

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
                        widget.course_name,
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
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        AssignmentListPage(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = 0.0;
                                      var end = 1.0;
                                      var tween = Tween(begin: begin, end: end);
                                      var curvedAnimation = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeOut);

                                      return FadeTransition(
                                        opacity: tween.animate(curvedAnimation),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
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

              Column(
                children: [
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: bookList.length,
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
                                        child: Text(
                                          bookList[index].title,
                                          style: TextStyle(
                                              fontFamily: 'Jua', fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ),
            ],
          ),
        ),
      ),

      // The bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
          items: items,
          onTap: (index) {
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18.0, vertical: 8.0));
            // Handle the navigation logic here
          }),
    );
  }
}

class Book {
  String title;
  String pageNum;

  Book({
    @required this.title,
    @required this.pageNum,
  });
}

class Week {
  String weekName;
  Color color;

  Week({
    @required this.weekName,
    @required this.color,
  });
}
/*
Row(
                      children: [


                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              //print("week 1");
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => AssignmentListPage(),
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
                            child: Stack(
                              children: [

                                // The course name
                                Align(

                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.lightGreen,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Week 1",
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
                        ),





                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              print("week 2");
                            },
                            child: Stack(
                              children: [

                                // The course name
                                Align(

                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Week 2",
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
                        ),








                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              print("week 3");
                            },
                            child: Stack(
                              children: [

                                // The course name
                                Align(

                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.purple,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Week 3",
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
                        ),




                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              print("week 4");
                            },
                            child: Stack(
                              children: [

                                // The course name
                                Align(

                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Week 4",
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
                        ),




                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GestureDetector(
                            onTap: (){
                              print("week 5");
                            },
                            child: Stack(
                              children: [

                                // The course name
                                Align(

                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Week 5",
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
                        ),




                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Stack(
                              children: [

                                // The course name
                                Align(

                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Week 6",
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
                        ),




                      ],
                    ),
 */
