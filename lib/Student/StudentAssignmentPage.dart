import 'package:flutter/material.dart';



class StudentAssigmentPage extends StatelessWidget {



  final List<Map<String, dynamic>> books = [
    {'name': 'Apotemi', 'image': 'assets/Png/math.png'},
    {'name': 'Bilgi Sarmal', 'image': 'assets/Png/math.png'},
    {'name': 'ÜÇ Dört Beş', 'image': 'assets/Png/math.png'},
    {'name': 'Orijinal', 'image': 'assets/Png/math.png'},
    {'name': 'Hız ve Renk', 'image': 'assets/Png/math.png'},
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
      home: StudentAssigmentPage(),
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


                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,


                  child: Row(
                    children: [


                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: (){
                            print("week 1");
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
                ),




                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
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
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
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
                                  "Apotemi",
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
                    height: 80,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [

                        // The course name
                        Align(

                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
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
                                  "Acil",
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
                    height: 80,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [

                        // The course name
                        Align(

                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
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
                                  "Bilgi Sarmal",
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
      }),
    );
  }
}