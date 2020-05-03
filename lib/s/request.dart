import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class Request{
  static Future<Map> get({@required String host, @required String path, Map<String, String> parameters, Map<String, String> headers}) async {
    final uri = Uri.https(host, path, parameters);
    final results = await http.get(uri, headers: headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }
}