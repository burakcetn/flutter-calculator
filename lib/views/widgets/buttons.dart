import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

// creating Stateless Widget for buttons
class MyButton extends StatelessWidget {

// declaring variables
  final buttonLongPressed;
  final isDelete;
  final isEqual;
  final isCircular;
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

//Constructor
  MyButton({this.color, this.textColor = Colors.white, required this.buttonText, this.buttontapped, this.isCircular, this.isEqual = false, this.isDelete = false, this.buttonLongPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      onLongPress: isDelete ? buttonLongPressed : (){}  ,
      child: Padding(
        padding: isEqual ? EdgeInsets.all(0) : EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: isCircular ? BorderRadius.circular(100): BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
