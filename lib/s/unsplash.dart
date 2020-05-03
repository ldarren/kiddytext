import 'dart:async';

import 'package:kiddytext/cfg.dart';

import 'request.dart';

class Unsplash {
  Cfg _cfg;
  final _host = 'api.unsplash.com';
  Map<String, String> get _headers => {'Accept': 'application/json'};

  Unsplash(){
    loadCfg("cfg.json");
  }

  void loadCfg(path) async{
    _cfg = await Cfg.load(path);
  }

  Future<Map> searchPhotos(String query, int page) async {
    return Request.get(
      host: _host,
      path: 'search/photos',
      parameters: {'query': query, 'page': page.toString(), 'per_page': '10', 'client_id': _cfg.unsplashKey},
      headers: _headers);
  }
}