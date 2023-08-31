// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../Pages/Home_Page.dart';
import 'package:flutter/src/material/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'H&B',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}
