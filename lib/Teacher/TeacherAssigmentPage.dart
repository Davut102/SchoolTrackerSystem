import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Teacher/addingAssignment.dart';

class TeacherAssignmentPage extends StatefulWidget {
  String ders;
  TeacherAssignmentPage({@required this.ders});
  @override
  State<TeacherAssignmentPage> createState() => _TeacherAssignmentPageState();
}

class _TeacherAssignmentPageState extends State<TeacherAssignmentPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String book;
  String bookPages;

  void _showBottomSheet(BuildContext context) {
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
                  'Öğrenciye verilecek ödev!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 120.0, vertical: 10.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (value) {
                      book = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_snippet_outlined),
                      hintText: 'Lesson Title',
                      labelText: 'Assigment',
                    ),
                  ),
                ),
                ElevatedButton(
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
                    );},
                  child: Text('add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  final List<Book> bookList = [
    Book(
        title: 'Apotemi',
        pageNum: '15-30'
    ),
    Book(
        title: 'Acil',
        pageNum: '15-30'
    ),
    Book(
        title: 'Bilgi Sarmal',
        pageNum: '15-30'
    ),
  ];


  List<Book> updated_list = [];


// liste olsun
  final List<Week> weeks = [
    Week(weekName: "Week 1", color: Colors.green, bookList:[
      Book(title: 'Apotemi', pageNum: '15-30'),
      Book(title: 'Acil', pageNum: '15-30'),
      Book(title: 'Bilgi Sarmal', pageNum: '15-30'),
    ] ),
    Week(weekName: "Week 2", color: Colors.pink, bookList:[
      Book(title: 'Apotemi2', pageNum: '15-30'),
      Book(title: 'Acil2', pageNum: '15-30'),
      Book(title: 'Bilgi Sarmal2', pageNum: '15-30'),
    ] ),
    Week(weekName: "Week 3", color: Colors.purple, bookList:[ ] ),
    Week(weekName: "Week 4", color: Colors.blue, bookList:[
      Book(title: 'Apotemi', pageNum: '15-30'),
      Book(title: 'Acil', pageNum: '15-30'),
      Book(title: 'Bilgi Sarmal', pageNum: '15-30'),
    ] ),
    Week(weekName: "Week 5", color: Colors.red, bookList:[
      Book(title: 'Apotemi', pageNum: '15-30'),
      Book(title: 'Acil', pageNum: '15-30'),
      Book(title: 'Bilgi Sarmal', pageNum: '15-30'),
    ] ),
    Week(weekName: "Week 6", color: Colors.amber, bookList:[
      Book(title: 'Apotemi', pageNum: '15-30'),
      Book(title: 'Acil', pageNum: '15-30'),
      Book(title: 'Bilgi Sarmal', pageNum: '15-30'),
    ] ),
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
                              print(weeks[index].weekName);
                              setState(() {
                                updated_list = weeks[index].bookList;
                              });

                              print(updated_list.toList());


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
                  itemCount: updated_list.length,
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
                                          updated_list[index].title,
                                          style: TextStyle(
                                              fontFamily: 'Jua', fontSize: 25),

                                        ),
                                        Text(
                                            "   "


                                        ),
                                        Text(
                                          updated_list[index].pageNum,
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => addAssignment(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartDocked,

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
  List<Book> bookList;// bir book list fonksiyonu atadık

  Week({
    @required this.weekName,
    @required this.color,
    @required this.bookList
  });
}
