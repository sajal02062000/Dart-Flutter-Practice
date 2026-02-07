import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper({required this.url});

  final String url;

  // Function to get data from Network location with header in it
  Future<http.Response> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    return response;
  }

  Future<http.Response> postData({required Map body}) async {
    http.Response response = await http.post(Uri.parse(url), body: body);
    return response;
  }

  Future<http.Response> putData({required Map body}) async {
    http.Response response = await http.put(Uri.parse(url), body: body);
    return response;
  }

  Future<http.Response> deleteData() async {
    http.Response response = await http.delete(Uri.parse(url));
    return response;
  }
}
