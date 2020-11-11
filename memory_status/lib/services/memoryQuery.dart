import 'dart:async';

import 'package:memory_status/models/memory.dart';
import 'package:memory_status/services/networking.dart';

class MemoryQuery {
  String apiUrl = 'http://192.168.1.8:8888/danawa/products/memory';

  Future<List<Memory>> getMemoryPriceData() async {
    NetworkHelper networkHelper = NetworkHelper(url: apiUrl);
    List<Memory> memoryList = [];
    try {
      final data = await networkHelper.httpGet().timeout(Duration(seconds: 5));

      for (var i = 0; i < data.length; i++) {
        var memory = Memory(
          name: data[i]['product_name'],
          value: data[i]['product_value'],
          unit: data[i]['product_unit'],
          imgUrl: data[i]['product_img'],
        );
        memoryList.add(memory);
      }
    } on TimeoutException catch (e) {
      print('User Internet Fault!!');
      print(e);
    } on Error catch (e) {
      print('Error: $e');
    }
    return memoryList;
  }
}
