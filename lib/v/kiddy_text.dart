// ref: https://github.com/AmberNet-TW-Will/RestaurantFinder
// ref: https://github.com/gaurangkeluskar22/medimumapp
import 'package:flutter/material.dart';
import 'package:kiddytext/m/photo.dart';
import 'package:kiddytext/vm/bloc_provider.dart';
import 'package:kiddytext/vm/photos_bloc.dart';

class KiddyText extends StatelessWidget {
  final String title;

  const KiddyText({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildSearch(context),
    );
  }

  Widget _buildSearch(BuildContext context) {
    final bloc = PhotosBloc();

    return BlocProvider<PhotosBloc>(
      bloc: bloc,
      child: Column(
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
            child: _buildStreamBuilder(bloc),
          )
        ],
      ),
    );
  }

  Widget _buildStreamBuilder(PhotosBloc bloc) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot) {
        final results = snapshot.data;

        if (results == null) {
          return Center(child: Text('Enter a term'));
        }

        if (results.isEmpty) {
          return Center(child: Text('No Results'));
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Photo> results) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final photo = results[index];
        return Image.network(photo.url, width: photo.width.toDouble());
      },
    );
  }
}