import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  DefaultButton({@required this.text,@required this.function, this.color = Colors.lightBlueAccent});

  final text;
  final color;
  final function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: function,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}
