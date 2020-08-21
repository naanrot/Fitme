import 'package:demo_homepage/screens/cook_book_page/breakfast_screen/BreakfastScreen.dart';
import 'package:flutter/material.dart';
//import 'package:toast/toast.dart';

class CookBookPage extends StatefulWidget {
  @override
  CookBookPageState createState() => CookBookPageState();
}

class CookBookPageState extends State<CookBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CookBook"),
      ),
      body: Container(
        child:Column(
          children: <Widget>[
            Text("Choose the item you have eaten"),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BreakfastScreen(),
                            )
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            "Breakfast",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          /*Toast.show(
                            "Item2 pressed",
                            context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM,
                          );*/
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            "Lunch",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          /*Toast.show(
                            "Item3 pressed",
                            context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM,
                          );*/
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            "Dinner",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          /*Toast.show(
                            "Item4 pressed",
                            context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM,
                          );*/
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            "Snacks",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}