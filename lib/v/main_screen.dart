// ref: https://github.com/AmberNet-TW-Will/RestaurantFinder
// ref: https://github.com/gaurangkeluskar22/medimumapp
import 'package:flutter/material.dart';
import 'package:kiddytext/m/photo.dart';
import 'package:kiddytext/vm/photos_bloc.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    final bloc = Provider.of<PhotosBloc>(ctx);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type something'),
              onSubmitted: (query) => bloc.search(query),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemCount: bloc.photos.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (BuildContext ctx, int i) {
                  Photo photo = bloc.photos[i];
                  return Image.network(photo.small, width: photo.width.toDouble());
                }
            )
          )
        ],
      ),
    );
  }
}