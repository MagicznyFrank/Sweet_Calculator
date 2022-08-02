import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}



class _CalculatorState extends State<Calculator> {

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }

      else if(buttonText == "⌫"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if(equation == ""){
          equation = "0";
        }
      }

      else if(buttonText == "="){
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      }

      else{
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if(equation == "0"){
          equation = buttonText;
        }else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget numButton(String btnText, Color btnColor, Color txtColor,
      double btnwidth, double btnhight) {
    return ElevatedButton(
      onPressed: () => buttonPressed(btnText),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: txtColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(btnwidth, btnhight),
          primary: btnColor, shadowColor: Colors.transparent

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.yellow])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Calculator"),
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        result,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 80),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        equation,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0),
                Stack(
                  children: <Widget>[
                Row(
                  children: [
                    Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton(
                                  "C", (Colors.transparent), Colors.white, 30,
                                  60),
                            ],
                          ),
                          SizedBox(height: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton("⌫",
                                  (Colors.transparent), Colors.white, 30, 60),
                            ],
                          ),
                          SizedBox(height: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton(
                                  "/", (Colors.transparent), Colors.white, 30,
                                  60),
                            ],
                          ),
                          SizedBox(height: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton(
                                  "*", (Colors.transparent), Colors.white, 30,
                                  60),
                            ],
                          ),
                          SizedBox(height: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton(
                                  "+", (Colors.transparent), Colors.white, 30,
                                  60),
                            ],
                          ),
                          SizedBox(height: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton(
                                  "-", (Colors.transparent), Colors.white, 30,
                                  60),
                            ],
                          ),
                          SizedBox(height: 0),

                        ]
                    ),
                    Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                numButton("7", (Colors.white), Colors.black,
                                    105, 90),
                                numButton("8", (Colors.white), Colors.black,
                                    105, 90),
                                numButton("9", (Colors.white), Colors.black,
                                    105, 90),
                              ],
                            ),
                          ),
                          SizedBox(height: 0),
                          Container(
                            color: Colors.white,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                numButton("4", (Colors.white), Colors.black,
                                    105, 90),
                                numButton("5", (Colors.white), Colors.black,
                                    105, 90),
                                numButton("6", (Colors.white), Colors.black,
                                    105, 90),
                              ],
                            ),
                          ),
                          SizedBox(height: 0),
                          Container(
                            color: Colors.white,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                numButton("1", (Colors.white), Colors.black,
                                    105, 90),
                                numButton("2", (Colors.white), Colors.black,
                                    105, 90),
                                numButton("3", (Colors.white), Colors.black,
                                    105, 90),

                              ],
                            ),
                          ),
                          SizedBox(height: 0),
                          Container(
                            color: Colors.white,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                numButton(".", (Colors.white), Colors.black,
                                    105, 90),
                                numButton("0", (Colors.white), Colors.black,
                                    105, 90),
                                numButton("=", (Colors.white), Colors.black,
                                    105, 90),
                              ],
                            ),
                          ),
                          SizedBox(height: 0),

                        ]
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  left: 165,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                          child: const Text('^'),
                      onPressed: (){
                        showModalBottomSheet (
                                context: context,
                                builder: (BuildContext contex)
                                {
                                  return Container(
                                    height: 200,
                                    color: Colors.black12,
                                      child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                      const Text('BottomSheet'),
                                ],
                                  )
                                  );
                                }
                            );
                      },
                      )
                    ],
                  ),
                ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),


          ),
        )
    );
  }
}