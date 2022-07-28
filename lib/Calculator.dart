import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

int firstNumber = 0;
int secondNumber = 0;
String result = "";
String text = "0";
String operation = "";

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor,double btnwidth, double btnhight) {
    return ElevatedButton(
      onPressed: () {
        calculate(btnText);
      },
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: txtColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
    fixedSize: Size(btnwidth, btnhight),
    primary: btnColor,shadowColor: Colors.transparent

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
        padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 80),
                  ),
                ),
              ],
            ),
            SizedBox(height: 0),
            Row(
              children: [
                Column(
                  children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      numButton("C", (Colors.transparent), Colors.white,30,60),
                    ],
                  ),
                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        numButton("back",
                            (Colors.transparent), Colors.white,30,60),
                      ],
                    ),
                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        numButton("/", (Colors.transparent), Colors.white,30,60),
                      ],
                    ),
                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        numButton("*", (Colors.transparent), Colors.white,30,60),
                      ],
                    ),
                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        numButton("+", (Colors.transparent), Colors.white,30,60),
                      ],
                    ),
                    SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        numButton("-", (Colors.transparent), Colors.white,30,60),
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
                          numButton("7", (Colors.white), Colors.black,105,90),
                          numButton("8", (Colors.white), Colors.black,105,90),
                          numButton("9", (Colors.white), Colors.black,105,90),
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
                          numButton("4", (Colors.white), Colors.black,105,90),
                          numButton("5", (Colors.white), Colors.black,105,90),
                          numButton("6", (Colors.white), Colors.black,105,90),
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
                          numButton("1", (Colors.white), Colors.black,105,90),
                          numButton("2", (Colors.white), Colors.black,105,90),
                          numButton("3", (Colors.white), Colors.black,105,90),

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
                          numButton(".", (Colors.white), Colors.black,105,90),
                          numButton("0", (Colors.white), Colors.black,105,90),
                          numButton("=", (Colors.white), Colors.black,105,90),
                        ],
                      ),
                      ),
                      SizedBox(height: 0),
                    ]

                ),
              ],
            ),
        Container(
          color: Colors.black,
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () { },
                  child: Text('^'),
                )
              ],
            ),
        ),
            SizedBox(height: 10),
          ],
        ),


      ),
    )
  );
  }


  void calculate(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      firstNumber = 0;
      secondNumber = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "*" ||
        btnText == "/") {
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
    } else if (btnText == "=") {
      secondNumber = int.parse(text);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
      }
      if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
      }
      if (operation == "*") {
        result = (firstNumber * secondNumber).toString();
      }
      if (operation == "/") {
        result = (firstNumber ~/ secondNumber).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}
