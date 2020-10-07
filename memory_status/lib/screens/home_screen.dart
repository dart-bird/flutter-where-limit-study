import 'package:flutter/material.dart';
import 'package:memory_status/components/memory_box.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('082메모리 현황'),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            MemoryBox(),
          ],
        ),
      ),
    );
  }
}
