import 'package:flutter/material.dart';
import 'package:memory_status/components/memory_box.dart';
import 'package:memory_status/models/memory.dart';
import 'package:memory_status/services/memoryQuery.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MemoryQuery _memoryQuery = MemoryQuery();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                '현재 메모리 가격이예요',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: _memoryQuery.getMemoryPriceData(),
                builder: (context, AsyncSnapshot<List<Memory>> snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('정보를 가져오는데 실패했어요.');
                  }
                  if (snapshot.hasData == false) {
                    return Text('데이터가 없어요.');
                  }
                  final _data = snapshot.data;
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MemoryBox(
                        name: _data[index].name,
                        value: _data[index].value,
                        unit: _data[index].unit,
                        imgUrl: _data[index].imgUrl,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
