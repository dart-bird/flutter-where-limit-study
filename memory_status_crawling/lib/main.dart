import 'package:flutter/material.dart';
import 'package:memory_status_crawling/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KOR Memory Status',
      home: HomeScreen(),
    );
  }
}
