import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBox extends StatelessWidget {
  const LoadingBox({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SpinKitSquareCircle(
      key: key,
      color: Colors.grey.withOpacity(0.45),
      size: 30.0,
      duration: Duration(milliseconds: 500), // animation speed
    );
  }
}
