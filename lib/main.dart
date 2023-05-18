import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalQ(),

  ));
}

class CalQ extends StatefulWidget {
  const CalQ({Key? key}) : super(key: key);

  @override
  State<CalQ> createState() => _CalQState();
}
class _CalQState extends State<CalQ> {
  //variables
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';

  onButtonClick(value) {
    if(value == "AC"){
     input = '';
     output = '' ;
    } else if(value=="<<"){
      if(input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    }else if(value=="="){
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
      }
    }
    else if(value=="🤟🏻"){
      input="Hi, there this is ";
          output="CalQ";
    }

      else{
      input= input + value;

    }
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(input,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(output,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          //buttons
          Row(
            children: [
              button(text: "AC",
                  buttonBgColor: 0xff393333,
                  tColor: Colors.orange),
              button(text: "<<",
                  buttonBgColor: 0xff393333,
                  tColor: Colors.orange),
              button(text: "🤟🏻",
                  buttonBgColor: 0x000000),
              button(
                  text: "/", tColor: Colors.orange, buttonBgColor: 0xff393333),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(text: "9"),
              button(
                  text: "x", tColor: Colors.orange, buttonBgColor: 0xff393333),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(text: "6"),
              button(
                  text: "+", tColor: Colors.orange, buttonBgColor: 0xff393333),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(text: "3"),
              button(
                  text: "-", tColor: Colors.orange, buttonBgColor: 0xff393333),
            ],
          ),
          Row(
            children: [
              button(text: "%"),
              button(text: "0"),
              button(text: "."),
              button(
                  text: "=", tColor: Colors.white, buttonBgColor: 0xffd9802e),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonBgColor = 0xff191919}) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(22),
                backgroundColor: Color(buttonBgColor),
              ),
              onPressed: () => onButtonClick(text),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 23,
                  color: tColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
        )
    );
  }
}
