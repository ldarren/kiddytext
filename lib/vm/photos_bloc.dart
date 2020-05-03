import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kiddytext/m/photo.dart';
import 'package:kiddytext/s/unsplash.dart';
import 'package:profanity_filter/profanity_filter.dart';

class PhotosBloc with ChangeNotifier{

  Unsplash _unsplash = new Unsplash();
  final _filter = ProfanityFilter();
  final rand = new Random();
  int _page = 1;
  String _query = 'cute';
  int _randIdx = 0;
  List<Photo> _photos = [];

  List<Photo> get photos {
    return _photos;
  }

  int get page {
    return _page;
  }

  int get randomIndex {
    return _randIdx;
  }

  set page(int nextPage) {
    _page = nextPage;
    search(_query);
  }

  Future<String> search(String query) async {
    if ("" == query || _filter.checkStringForProfanity(query)) _query = 'cute';
    else _query = query;
    final response = await _unsplash.searchPhotos(_query, _page);
    if (null != response['errors']) throw new Exception(response['errors']);
    final results = response['results'];
    _photos = results
        .map<Photo>((json) => Photo.fromJson(json))
        .toList(growable: false);

    if (0 == _photos.length) return search('error');

    _randIdx = rand.nextInt(_photos.length);
    notifyListeners();
    return _query;
  }
}