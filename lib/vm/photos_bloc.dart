import 'dart:async';
import 'package:kiddytext/m/photo.dart';
import 'package:kiddytext/m/unsplash.dart';
import 'package:kiddytext/vm/bloc.dart';

class PhotosBloc implements Bloc {
  final _service = Unsplash();
  final _stream = StreamController<List<Photo>>();
  String _query;

  PhotosBloc();

  Stream<List<Photo>> get stream => _stream.stream;
  String get query => _query;

  void search(String query) async {
    _query = query;
    final photos = await _service.searchPhotos(_query);
    if (null == photos) return null;
    _stream.sink.add(photos);
  }

  @override
  void dispose() {
    _stream.close();
  }
}