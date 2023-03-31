import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

// creating Stateless Widget for buttons
class SemiCircle extends StatelessWidget {

// declaring variables
  final upDown;
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

//Constructor
  SemiCircle({this.color, this.textColor = Colors.white, required this.buttonText, this.buttontapped, this.upDown});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 5,left: 5,right: 5),
        child: ClipRRect(
          borderRadius: upDown ? const BorderRadius.only(
            bottomLeft: Radius.circular(200),
            bottomRight: Radius.circular(200),
          ) : const BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          child: Container(
            height: 50,
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
