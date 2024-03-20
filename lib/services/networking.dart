import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future<String> getData() async {
    // print(location.getLatitude());
    final response = await http.get(Uri.parse(url));
    try {
      return response.body;
      // return jsonDecode(response.body);
    } on Exception catch (e) {
      return "Status code: ${response.statusCode}, Error: ${e}";
    }
  }
}
