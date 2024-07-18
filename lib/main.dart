import 'package:flutter/material.dart';
import 'package:passing_data/demo.dart';
import 'package:passing_data/home.dart';
import 'package:passing_data/listnames.dart';
import 'package:passing_data/welcomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home:Listnames()
    );
  }
}


