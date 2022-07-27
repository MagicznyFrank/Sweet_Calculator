import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
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
        fixedSize: Size(70, 70),
        primary: btnColor,
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                numButton("7", (Colors.white), Colors.black),
                numButton("8", (Colors.white), Colors.black),
                numButton("9", (Colors.white), Colors.black),
              ],
            ),
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                numButton("4", (Colors.white), Colors.black),
                numButton("5", (Colors.white), Colors.black),
                numButton("6", (Colors.white), Colors.black),
              ],
            ),
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                numButton("1", (Colors.white), Colors.black),
                numButton("2", (Colors.white), Colors.black),
                numButton("3", (Colors.white), Colors.black),

              ],
            ),
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                numButton(".", (Colors.white), Colors.black),
                numButton("0", (Colors.white), Colors.black),
                numButton("=", (Colors.white), Colors.black),
              ],
            ),
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () { },
                    child: Text('^'),
                  )
              ],
            ),
            SizedBox(height: 10),

          ],
        ),

      ),
    )
  );
  }
  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String text = "";
  String operation = "";

  void calculate(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      firstNumber = 0;
      secondNumber = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
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
      if (operation == "x") {
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
