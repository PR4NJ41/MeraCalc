// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meraCalc/homescreen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 49, 173, 255),
      // statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: "/",

      ///neocalc
      routes: {
        "/": (context) => Mycalculator(),
      },
      // home: MyHomePage(),
    );
  }
}
