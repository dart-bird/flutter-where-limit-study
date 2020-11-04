import 'package:memory_status/models/memory.dart';
import 'package:memory_status/services/networking.dart';

class MemoryQuery {
  String apiUrl = 'http://foolminecraft.iptime.org:8888/danawa/products/memory';

  Future<List<Memory>> getMemoryPriceData() async {
    try {
      NetworkHelper networkHelper = NetworkHelper(url: apiUrl);
      var data = await networkHelper.httpGet();
      List<Memory> memoryList = [];
      for (var i = 0; i < data.length; i++) {
        var memory = Memory(
          name: data[i]['product_name'],
          value: data[i]['product_value'],
          unit: data[i]['product_unit'],
          imgUrl: data[i]['product_img'],
        );
        memoryList.add(memory);
      }
      return memoryList;
    } catch (e) {
      print(e);
    }
  }
}
