import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Cfg {
  final String unsplashKey;

  Cfg({this.unsplashKey = ""});

  factory Cfg.fromJson(Map<String, dynamic> jsonMap) {
    return new Cfg(unsplashKey: jsonMap["unsplash_key"]);
  }
  static Future<Cfg> load(path) {
    return rootBundle.loadStructuredData<Cfg>(path, (jsonStr) async {
      return Cfg.fromJson(json.decode(jsonStr));
    });
  }
}