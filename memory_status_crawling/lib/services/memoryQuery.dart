import 'dart:async';
import 'package:intl/intl.dart';
import 'package:memory_status_crawling/models/memory.dart';
import 'package:memory_status_crawling/services/networking.dart';

class MemoryQuery {
  String apiUrl = 'http://m.danawa.com/product/bestReviewNbundle.json?code=6380268&mallReviewCount=1625';
  RegExp moneyRegExp = RegExp(r'/\B(?=(\d{3})+(?!\d))/g');
  Future<List<Memory>> getMemoryPriceData() async {
    List<Memory> memoryList = [];
    try {
      NetworkHelper networkHelper = NetworkHelper(url: apiUrl);
      final _data = await networkHelper.httpGet().timeout(Duration(seconds: 5));
      List<dynamic> _memoryObjects = _data['bundleData']['bundleList'];
      _memoryObjects = _memoryObjects.reversed.toList();

      _memoryObjects.forEach((memoryPriceData) {
        var memory = Memory(
          name: "삼성전자 DDR4-2666 (${memoryPriceData['bundleName']})",
          value: memoryPriceData['minPrice'].toString(),
          unit: "${memoryPriceData['capacityUnit'].toString()} 당 ${memoryPriceData['unitPrice'].toString()} 원",
          imgUrl: "assets/images/spinach-ram.png",
        );
        memoryList.add(memory);
      });
    } on TimeoutException catch (e) {
      print('User Internet Fault!!');
      print(e);
    } on Error catch (e) {
      print('Error: $e');
    }
    return memoryList;
  }
}
