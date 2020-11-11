import 'package:flutter/material.dart';

class NoDataBox extends StatelessWidget {
  const NoDataBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/no-data.png',
              scale: 3.5,
            ),
            Text('Somthing Wrong'),
          ],
        ),
      ],
    );
  }
}
