import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({this.url});
  final String url;

  Future httpGet() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return jsonResponse;
      }
    } catch (e) {
      return e.toString();
    }
  }
}