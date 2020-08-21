import 'package:flutter/material.dart';

class UserStatDesign extends StatelessWidget {
  UserStatDesign({
    @required this.d1,
    @required this.d2,
    @required this.t1,
    @required this.t2,
    @required this.t3,
  });

  final d1;
  final t1;
  final t2;
  final t3;
  final d2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration (
        boxShadow: [
          BoxShadow(
            color: Color(0xff384259),
            blurRadius: 2,
            offset: Offset.fromDirection (360)
          )
        ],
        borderRadius: BorderRadius.circular(8),
        color: Color(0xfff9f7f7),
      ),
      child: Padding (
        padding: EdgeInsets.all(8),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text (
              t1,
              style: TextStyle (
                color: Color(0xff3f72af),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox (
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row (
                children: <Widget>[
                  Expanded(
                    child: Text (
                      t2,
                    ),
                  ),
                  Expanded (
                    child: Text (
                      d1,
                    )
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row (
                children: <Widget>[
                  Expanded(
                    child: Text (
                        t3
                    ),
                  ),
                  Expanded (
                      child: Text (
                        d2,
                      )
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
