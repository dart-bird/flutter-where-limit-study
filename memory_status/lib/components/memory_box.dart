import 'package:flutter/material.dart';

class MemoryBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.red,
        child: Column(
          children: [
            Row(
              children: [
                Text('삼성전자 DDR4-2666 (4GB)'),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.network(
                  "http://img.danawa.com/prod_img/500000/268/380/img/6380268_1.jpg?shrink=500:500&_v=20200821132850",
                  scale: 5.0,
                ),
                Spacer(),
                Row(
                  children: [
                    Text('4,525원/1GB'),
                    SizedBox(width: 8),
                    Text('가격: 19,590 원'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
