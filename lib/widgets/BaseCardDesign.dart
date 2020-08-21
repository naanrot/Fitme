import 'package:flutter/material.dart';

class BaseCardDesign extends StatelessWidget {

  BaseCardDesign({@required this.color, this.childWidget, this.onPress});

  final Color color;
  final Widget childWidget;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: childWidget,
      ),
    );
  }
}