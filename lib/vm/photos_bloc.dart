import 'dart:async';
import 'package:kiddytext/m/photo.dart';
import 'package:kiddytext/m/unsplash.dart';
import 'package:kiddytext/vm/bloc.dart';

class PhotosBloc implements Bloc {
  final _service = Unsplash();
  final _stream = StreamController<List<Photo>>();

  PhotosBloc();

  Stream<List<Photo>> get stream => _stream.stream;

  void search(String query) async {
    final photos = await _service.searchPhotos(query);
    _stream.sink.add(photos);
  }

  @override
  void dispose() {
    _stream.close();
  }
}