import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}
class _LoginScreen extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Image.network(
                  "https://assets-global.website-files.com/59d46c848021530001e0117b/5fd1bf73ba01e9060de09e2d_student-management-essentials-hero.png",
                  width: double.infinity,
                  height: 300,
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),
            color: Color.fromARGB(255, 145, 179, 250),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.topCenter,
                  child: Text(
                      'Projenin İsmi',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        width: size.height*0.3,
                        child: ElevatedButton(
                              onPressed:()=>{},
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 254, 124, 112),
                              ),
                              child: Text(
                                'Students',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )
                          ),
                      ),
                    ),
                     Container(
                       height: 30,
                       child: VerticalDivider(
                        width: 20,
                        thickness: 1.3,
                        color: Colors.black,
                    ),
                     ),
                    Expanded(
                      child: Container(
                        height: 40,
                        width: size.height*0.3,
                        child: ElevatedButton(
                            onPressed:()=>{},
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 254, 124, 112),
                            ),
                            child: Text(
                              'Teachers',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}