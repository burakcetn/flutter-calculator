import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/views/widgets/buttons.dart';

import '../widgets/semiCircle.dart';


class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);



  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  var userInput = '';
  var answer = '';
  // Array of button
  final List<String> buttons = [
    'AC',
    '+/-',
    '%',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    ',',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorManager.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 100,),
                    Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userInput,
                        style: const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Stack(
                      children: [
                        GridView.builder(
                            itemCount: buttons.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                            itemBuilder: (BuildContext context, int index) {
                              // Clear Button
                              if (index == 0) {
                                return MyButton(
                                  buttontapped: () {
                                    setState(() {
                                      userInput =
                                          userInput.substring(0, userInput.length - 1);
                                    });
                                  },
                                  buttonLongPressed:() {
                                    setState(() {
                                      userInput = '';
                                      answer = '0';
                                    });
                                  },
                                  isDelete: true,
                                  isCircular:true,
                                  buttonText: buttons[index],
                                  color: ColorManager.darkButtonColor,
                                  textColor: Colors.white,
                                );
                              }

                              // +/- button
                              else if (index == 1) {
                                return MyButton(
                                  isCircular:true,
                                  buttonText: buttons[index],
                                  color: ColorManager.darkButtonColor,
                                  textColor: Colors.white,
                                );
                              }
                              // % Button
                              else if (index == 2) {
                                return MyButton(
                                  isCircular:true,
                                  buttontapped: () {
                                    setState(() {
                                      userInput += buttons[index];
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: ColorManager.darkButtonColor,
                                  textColor: Colors.white,
                                );
                              }
                              // 0 button

                              //  other buttons
                              else {
                                return MyButton(
                                  isCircular:false,
                                  buttontapped: () {
                                    setState(() {
                                      userInput += buttons[index];
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: isOperator(buttons[index])
                                      ? ColorManager.darkButtonColor
                                      : ColorManager.lightButtonColor,
                                  textColor: isOperator(buttons[index])
                                      ? Colors.white
                                      : Colors.white,
                                );
                              }
                            }),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:  EdgeInsets.only(bottom:height/29, right: height/60),
                            child: Container(
                              height: 90,
                              width: 190,
                              child: MyButton(
                                isEqual:true,
                                isCircular:false,
                                buttontapped: () {
                                  setState(() {
                                    userInput += '0';
                                  });
                                },
                                buttonText: '0',
                                color: ColorManager.lightButtonColor,
                                textColor: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ]// GridView.builder
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  SemiCircle(
                                    buttontapped: () {
                                      setState(() {
                                        userInput += '/';
                                      });
                                    },
                                    upDown:false,
                                    buttonText: '/',
                                    color: ColorManager.darkButtonColor,
                                    textColor: Colors.white,
                                  ),
                                  SemiCircle(
                                    buttontapped: () {
                                      setState(() {
                                        userInput += 'x';
                                      });
                                    },
                                    upDown:true,
                                    buttonText: 'x',
                                    color: ColorManager.darkButtonColor,
                                    textColor: Colors.white,
                                  ),
                                  SemiCircle(
                                    buttontapped: () {
                                      setState(() {
                                        userInput += '+';
                                      });
                                    },
                                    upDown:false,
                                    buttonText: '+',
                                    color: ColorManager.darkButtonColor,
                                    textColor: Colors.white,
                                  ),
                                  SemiCircle(
                                    buttontapped: () {
                                      setState(() {
                                        userInput += '-';
                                      });
                                    },
                                    upDown:true,
                                    buttonText: '-',
                                    color: ColorManager.darkButtonColor,
                                    textColor: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: MyButton(
                                 buttontapped: () {
                                   setState(() {
                                       equalPressed();
                                   });},
                                 isCircular:false,
                                 buttonText: '=',
                                 color: ColorManager.darkButtonColor,
                                 textColor: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30,)
                          ],
                        ),

                      ),
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );



  }
  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

// function to calculate the input operation
  void equalPressed() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}


