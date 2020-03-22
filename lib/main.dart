import 'package:flutter/material.dart';
import 'package:kiddytext/v/kiddy_text.dart';
import 'package:kiddytext/vm/bloc_provider.dart';
import 'package:kiddytext/vm/photos_bloc.dart';

void main() => runApp(KiddyTextApp());

class KiddyTextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotosBloc> (
      bloc: PhotosBloc(),
      child: MaterialApp(
        title: 'KiddyText',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: KiddyText(title: 'Kiddy Text'),

      )
    );
  }
}
