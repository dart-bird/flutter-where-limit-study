import 'package:flutter/material.dart';

class MemoryBox extends StatefulWidget {
  MemoryBox({Key key, this.name, this.value, this.unit, this.imgUrl, this.index}) : super(key: key);
  final name;
  final value;
  final unit;
  final imgUrl;
  final index;
  @override
  _MemoryBoxState createState() => _MemoryBoxState();
}

class _MemoryBoxState extends State<MemoryBox> {
  bool _animate = false;
  bool _isStart = true;

  String name = "";
  String value = "";
  String unit = "";
  String imgUrl = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
    _isStart
        ? Future.delayed(Duration(milliseconds: widget.index * 80), () {
            setState(() {
              _animate = true;
              _isStart = false;
            });
          })
        : _animate = true;
  }

  void updateUI() {
    setState(() {
      name = widget.name;
      value = widget.value;
      unit = widget.unit;
      imgUrl = widget.imgUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOutQuart,
      child: AnimatedPadding(
        duration: Duration(milliseconds: 1000),
        padding: _animate ? const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0) : const EdgeInsets.only(top: 10),
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
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      imgUrl,
                      scale: 3.5,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(unit),
                      SizedBox(width: 8),
                      Text("$value 원"),
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
      ),
    );
  }
}
