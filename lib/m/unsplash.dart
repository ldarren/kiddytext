import 'dart:async';
import 'dart:convert' show json;

import 'package:http/http.dart' as http;
import 'package:kiddytext/cfg.dart';
import 'package:meta/meta.dart';

import 'photo.dart';

class Unsplash {
  Cfg _cfg;
  final _host = 'api.unsplash.com';

  Unsplash(){
    loadCfg("cfg.json");
  }

  void loadCfg(path) async{
    _cfg = await Cfg.load(path);
  }

  Future<List<Photo>> searchPhotos(String query) async {
    final response = await request(path: 'search/photos', parameters: {'query': query, 'per_page': '10', 'client_id': _cfg.unsplashKey});

    final results = response['results'];
    return results
        .map<Photo>((json) => Photo.fromJson(json))
        .toList(growable: false);
  }

  Future<Map> request({@required String path, Map<String, String> parameters}) async {
    final uri = Uri.https(_host, path, parameters);
    final results = await http.get(uri, headers: _headers);
    final jsonObject = json.decode(results.body);
    return jsonObject;
  }

  Map<String, String> get _headers => {'Accept': 'application/json'};
}