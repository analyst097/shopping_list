import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const String _firebaseUrl =
      'shopping-list-5c39f-default-rtdb.asia-southeast1.firebasedatabase.app';
  static const String _collectionName = 'shopping-list.json';

  static Future<http.Response> createItem(Map<String, dynamic> payload) {
    final url = Uri.https(_firebaseUrl, _collectionName);

    return http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(payload));
  }

  static Future<http.Response> getList() {
    final url = Uri.https(_firebaseUrl, _collectionName);

    return http.get(url, headers: {'Content-Type': 'application/json'});
  }

  static Future<http.Response> removeItem(String id) {
    final url = Uri.https(_firebaseUrl, 'shopping-list/$id.json');
    return http.delete(url, headers: {'Content-Type': 'application/json'});
  }
}
