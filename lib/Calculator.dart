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
  num btnSize = 25;
  bool BottomSheetState = false;
  double cnhight = 0;
  var size,width,height;

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
        if(equation == ""){
          equation = "0";
        }
      }
      else if(buttonText == "pi"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if(equation == "0"){
          equation = "3.14";
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
          equation += "3.14";
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
        }else {
          equation = equation + buttonText;
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
      }
    });
  }

  Widget numButton(String btnText,double btnSize, Color btnColor, Color txtColor,
      double btnwidth, double btnhight) {
    return ElevatedButton(
      onPressed: () => buttonPressed(btnText),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: btnSize,
          color: txtColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: Size(btnwidth, btnhight),
          primary: btnColor, shadowColor: Colors.transparent

      ),
    );
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
     return Scaffold(
       key: scaffoldKey,
         backgroundColor: Colors.transparent,
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.yellow])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20,bottom: 50),
                      child: Text(
                        equation,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20,bottom: 50),
                      child: Text(
                        result,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                   )
                  ],
                ),
                Row(
                  children: [
                    Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton(
                                  "C",25, (Colors.transparent), Colors.white, width/5, 60),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton("⌫",25,(Colors.transparent), Colors.white, width/5, 60),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton("/",25, (Colors.transparent), Colors.white, width/5, 60),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton("*",25, (Colors.transparent), Colors.white, width/5, 60),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton("+",25, (Colors.transparent), Colors.white, width/5, 60),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              numButton("-",25, (Colors.transparent), Colors.white, width/5, 60),
                            ],
                          ),
                        ]
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width/20)
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                              ),
                            ),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                numButton("7",25, (Colors.white), Colors.grey, width/4, 90),
                                numButton("8",25, (Colors.white), Colors.grey, width/4, 90),
                                numButton("9",25, (Colors.white), Colors.grey, width/4, 90),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                numButton("4",25, (Colors.white), Colors.grey, width/4, 90),
                                numButton("5",25, (Colors.white), Colors.grey, width/4, 90),
                                numButton("6",25, (Colors.white), Colors.grey, width/4, 90),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                numButton("1",25, (Colors.white), Colors.grey, width/4, 90),
                                numButton("2",25, (Colors.white), Colors.grey, width/4, 90),
                                numButton("3",25, (Colors.white), Colors.grey, width/4, 90),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                numButton(".",25, (Colors.white), Colors.grey, width/4, 90),
                                numButton("0",25, (Colors.white), Colors.grey, width/4, 90),
                                numButton("=",25,(Colors.white), Colors.grey, width/4, 90),
                              ],
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                    Container(
                      color: Colors.grey,
                      height: cnhight,
                    )
                   ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                      color: Colors.black,
                      width: width,
                    child:
                      ElevatedButton(
                          child: const Text('ᐱ'),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, shadowColor: Colors.transparent
                        ),
                      onPressed: (){
                            setState(() {
                              BottomSheetState = true;
                              if(BottomSheetState == true){
                                cnhight = height/4.3;
                              }
                              else if(BottomSheetState == false){
                                cnhight = 0;
                              }
                            });
                            scaffoldKey.currentState!.
                                 showBottomSheet((context)
                                {
                                  return Container(
                                    height: height/3.4,
                                    color: Colors.black12,
                                      child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.black,
                                            child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                            ElevatedButton(
                                            child: const Text('ᐯ'),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.black, shadowColor: Colors.transparent
                                        ),

                                               // onPressed: () => Navigator.pop(context)

                                                onPressed: () {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    BottomSheetState = false;
                                                    if (BottomSheetState ==
                                                        true) {
                                                      cnhight = height/4.656;
                                                    }
                                                    else if (BottomSheetState ==
                                                        false) {
                                                      cnhight = 0;
                                                    }
                                                  });
                                                }
                                            )
                                              ],
                                            ),
                                          ),

                                        Container(
                                        color: Colors.black,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            numButton("INV",20, (Colors.black), Colors.white, width/4, height/30),
                                            numButton("RAD",20, (Colors.black), Colors.white, width/4, height/30),
                                            numButton("%",20, (Colors.black), Colors.white, width/4, height/30),
                                            numButton("sqrt",20, (Colors.black), Colors.white, width/4, height/30),
                                          ],
                                        ),
                                        ),
                                          Container(
                                            color: Colors.black,
                                            child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                numButton("sin",20, (Colors.black), Colors.white, width/4, height/30),
                                              numButton("cos",20, (Colors.black), Colors.white, width/4, height/30),
                                                numButton("tan",20, (Colors.black), Colors.white, width/4, height/30),
                                                numButton("ln",20, (Colors.black), Colors.white, width/4, height/30),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.black,
                                            child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                numButton("log",20, (Colors.black), Colors.white, width/4, height/30),
                                                numButton("!",20, (Colors.black), Colors.white, width/4, height/30),
                                                numButton("pi",20, (Colors.black), Colors.white, width/4, height/30),
                                                numButton("e",20, (Colors.black), Colors.white, width/4, height/30),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            color: Colors.black,
                                            child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                numButton("^",20, (Colors.black), Colors.white, width/4, height/30),
                                                numButton("(",20, (Colors.black), Colors.white, width/4, height/30),
                                                numButton(")",20, (Colors.black), Colors.white, width/4, height/30),
                                                numButton("v",20, (Colors.black), Colors.white, width/4, height/30),
                                              ],
                                            ),
                                          ),
                                      ],
                                      ),
                                      )
                                  );
                                }
                            );
                      },
                      )
                      )
                    ],
                     ),
          ]
          ),
          ),
    );
  }
}