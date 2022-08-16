// ignore_for_file: deprecated_member_use, prefer_const_constructors, unnecessary_new, unnecessary_string_interpolations, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

// OPERATIONS YAHA HAIN

class Mycalculator extends StatefulWidget {
  const Mycalculator({Key? key}) : super(key: key);

  @override
  State<Mycalculator> createState() => _MycalculatorState();
}

class _MycalculatorState extends State<Mycalculator> {
  String equation = "0";
  String result = "0";
  String expression = "0";

  solve(String text) {
    setState(() {
      if (text == "Sci") {
        result = "Feature needed to be added";
      } else if (text == "C") {
        equation = "0";
        result = "0";
      } else if (text == "X") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (text == "=") {
        expression = equation;
        expression = expression.replaceAll("x", "*");
        expression = expression.replaceAll("/", "/");
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = text;
        } else {
          equation = equation + text;
        }
      }
    });
  }

  Widget button(String text, double H, double W) {
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 72,
        height: 72,
        child: RaisedButton(
          elevation: 15,
          splashColor: Colors.grey.shade300,
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          onPressed: () => {
            solve(text),
            HapticFeedback.heavyImpact(),
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget bluebutton(String text) {
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 72,
        height: 72,
        child: RaisedButton(
          elevation: 15,
          // splashColor: Color.fromARGB(255, 112, 112, 112),
          // color: Color.fromARGB(255, 0, 153, 255),
          color: Colors.blue.shade300,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          onPressed: () => {
            solve(text),
            HapticFeedback.vibrate(),
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget lightbluebutton(String text) {
    return Container(
      margin: EdgeInsets.all(5),
      child: SizedBox(
        width: 72,
        height: 72,
        child: RaisedButton(
          elevation: 15,
          // splashColor: Color.fromARGB(255, 112, 112, 112),
          // color: Colors.blue.shade300,
          color: Color.fromARGB(255, 49, 173, 255),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          onPressed: () => {
            solve(text),
            HapticFeedback.vibrate(),
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 173, 255),
        foregroundColor: Colors.white,
        elevation: 2,
        actions: <Widget>[
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.sunny),
            color: Colors.white,
          ),
        ],
        // toolbarOpacity: 1,
        title: Center(child: Text("MyCalc")),
      ),
      backgroundColor: Colors.lightBlue.shade50,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.all(20),
                          alignment: Alignment.centerRight,
                          child: Text(
                            "$equation",
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          )),
                      Divider(),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerRight,
                        child: Text(
                          "$result",
                          style: TextStyle(fontSize: 40),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  lightbluebutton("C"),
                  // button(text: "%"),
                  // lightbluebutton("%"),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: SizedBox(
                        width: 72,
                        height: 72,
                        child: RaisedButton.icon(
                          elevation: 15,
                          // color: Colors.blue.shade300,
                          color: Color.fromARGB(255, 49, 173, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          onPressed: () => {
                            solve("%"),
                            HapticFeedback.vibrate(),
                          },

                          label: Container(child: null),
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "%",
                              style:
                                  TextStyle(fontSize: 28, color: Colors.white),
                            ),
                            // Icon(
                            //   // Icons.keyboard,
                            //   color: Colors.white,
                            //   size: 23,
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(5),
                    child: Center(
                      child: SizedBox(
                        width: 72,
                        height: 72,
                        child: RaisedButton.icon(
                          elevation: 15,
                          // color: Colors.blue.shade300,
                          color: Color.fromARGB(255, 49, 173, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          onPressed: () => {
                            solve("X"),
                            HapticFeedback.vibrate(),
                          },
                          onLongPress: () => {
                            solve("X"),
                            HapticFeedback.vibrate(),
                          },

                          label: Container(child: null),
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.backspace_outlined,
                              color: Colors.white,
                              size: 23,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // IconButton(
                  //     onPressed: () => {},
                  //     icon: Icon(
                  //       Icons.arrow_back_ios_new,
                  //       size: 30,
                  //     ))
                  bluebutton("/"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button("7", widths, heights),
                  button("8", widths, heights),
                  button("9", widths, heights),
                  bluebutton("x")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button("4", widths, heights),
                  button("5", widths, heights),
                  button("6", widths, heights),
                  bluebutton("-")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button("1", widths, heights),
                  button("2", widths, heights),
                  button("3", widths, heights),
                  bluebutton("+")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button("00", widths, heights),
                  button("0", widths, heights),
                  button(".", widths, heights),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: SizedBox(
                      width: 72,
                      height: 72,
                      child: RaisedButton(
                        elevation: 15,
                        splashColor: Colors.blue.shade800,
                        color: Color.fromARGB(255, 0, 153, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        onPressed: () => {
                          solve("="),
                          HapticFeedback.vibrate(),
                        },
                        child: Text(
                          "=",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
    );
  }
}
