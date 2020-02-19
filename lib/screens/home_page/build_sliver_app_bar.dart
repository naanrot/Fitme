import 'package:flutter/material.dart';

class BuildSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('FitMe',style:TextStyle(fontFamily: 'Pacifico-Regular',fontSize: 30)),
      centerTitle: true,
      leading: CircleAvatar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/user.png'),
        ),
      ),
      expandedHeight: 120,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      floating: true,
      snap: true,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FlatButton(
            onPressed: () {},
            child: Text('BMI'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: Colors.white70,
          ),
        ),
      ],
      /*flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
          ),
        ),
      ),*/
    );
  }
}
