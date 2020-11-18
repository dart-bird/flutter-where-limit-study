import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:memory_status_crawling/components/loading_box.dart';
import 'package:memory_status_crawling/components/memory_box.dart';
import 'package:memory_status_crawling/components/nodata_box.dart';
import 'package:memory_status_crawling/models/memory.dart';
import 'package:memory_status_crawling/services/memoryQuery.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MemoryQuery _memoryQuery = MemoryQuery();
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  Future<List<Memory>> _getMemoryPriceData;
  Widget child;
  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    _fetchData();
    _refreshController.refreshCompleted();
  }

  void _fetchData() async {
    setState(() {
      _getMemoryPriceData = _memoryQuery.getMemoryPriceData();
      child = null;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Theme(
        data: ThemeData(),
        child: SafeArea(
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: SmartRefresher(
              controller: _refreshController,
              onRefresh: _onRefresh,
              header: WaterDropMaterialHeader(
                backgroundColor: Colors.black,
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: Text(
                      'Korea Memory Price',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: _getMemoryPriceData,
                      builder: (context, AsyncSnapshot<List<Memory>> snapshot) {
                        final _data = snapshot.data;

                        if (snapshot.connectionState == ConnectionState.waiting) {
                          child = LoadingBox();
                        } else if (snapshot.connectionState == ConnectionState.done) {
                          if (_data.length == 0) return NoDataBox();
                          child = ListView(
                            children: List.generate(
                              snapshot.data.length,
                              (index) => MemoryBox(
                                key: ValueKey(index),
                                name: _data[index].name,
                                value: _data[index].value,
                                unit: _data[index].unit,
                                imgUrl: _data[index].imgUrl,
                                index: index,
                              ),
                            ),
                          );
                        } else {
                          child = NoDataBox();
                        }
                        return child;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
