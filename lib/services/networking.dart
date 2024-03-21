import "package:http/http.dart" as http;

class NetworkHelper {
  final String url;

  NetworkHelper({required this.url});

  Future<String> getData() async {
    final response = await http.get(Uri.parse(url));
    try {
      return response.body;
    } on Exception catch (e) {
      // ignore: unnecessary_brace_in_string_interps
      return "Status code: ${response.statusCode}, Error: ${e}";
    }
  }
}
