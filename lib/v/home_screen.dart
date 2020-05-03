// ref: https://github.com/AmberNet-TW-Will/RestaurantFinder
// ref: https://github.com/gaurangkeluskar22/medimumapp

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kiddytext/m/photo.dart';
import 'package:kiddytext/vm/photos_bloc.dart';
import 'package:kiddytext/w/ImageText.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final FlutterTts flutterTts = FlutterTts();

  HomeScreen({Key key, @required this.title}) : super(key: key){
    setupTTS();
  }

  setupTTS() async{
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  search(PhotosBloc bloc, String query) async {
    try {
      var text = await bloc.search(query);
      speak(text);
    } on Exception catch(exp){
      print(exp);
    }
  }

  speak(text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext ctx) {
    final bloc = Provider.of<PhotosBloc>(ctx);

    return Scaffold(
      backgroundColor: bloc.photos.length > 0 ? bloc.photos[bloc.randomIndex].bgcolor : Colors.white,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  hintText: 'Type something'),
              onSubmitted: (query) {
                search(bloc, query);
              }
            ),
          ),
          Expanded(
            child: bloc.photos.length > 0 ? GestureDetector(
              onTap: () {
                Photo photo = bloc.photos[bloc.randomIndex];
                speak(photo.text);
              },
              child: ImageText(photo: bloc.photos[bloc.randomIndex])
            )
            :
            Card(margin: EdgeInsets.fromLTRB(8, 4, 8, 4),child: ListTile(title: Text('Type something in search box, to find picture and quote')))
          )
        ],
      ),
    );
  }
}