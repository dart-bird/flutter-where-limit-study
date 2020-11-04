import 'package:flutter/material.dart';

class MemoryBox extends StatelessWidget {
  MemoryBox({this.name, this.value, this.unit, this.imgUrl});
  final name;
  final value;
  final unit;
  final imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(name),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.network(
                  imgUrl,
                  scale: 5.0,
                ),
                Spacer(),
                Row(
                  children: [
                    Text(unit),
                    SizedBox(width: 8),
                    Text(value),
                  ],
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
                color: Color(0xffe4e4f0), //black12
                blurRadius: 10,
                spreadRadius: 5,
                offset: Offset(3, 3))
          ],
        ),
      ),
    );
  }
}
