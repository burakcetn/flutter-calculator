import 'package:flutter/material.dart';

import 'calculator_screen.dart';


class MyApp extends StatelessWidget {

  MyApp._interval();
  static final MyApp instance = MyApp._interval();
  factory  MyApp()=> instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}
