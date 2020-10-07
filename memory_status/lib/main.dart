import 'package:flutter/material.dart';
import 'package:memory_status/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '082메모리 현황',
      home: HomeScreen(),
    );
  }
}
