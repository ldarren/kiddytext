import 'package:flutter/material.dart';
import 'package:kiddytext/v/home_screen.dart';
import 'package:kiddytext/v/main_screen.dart';
import 'package:kiddytext/vm/photos_bloc.dart';
import 'package:provider/provider.dart';

main() => runApp(KiddyText());

class KiddyText extends StatelessWidget{
  final String title = 'KText';

  @override
  Widget build(BuildContext ctx){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhotosBloc>(create: (_) => PhotosBloc())
      ],
      child: MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.brown),
        initialRoute: '/',
        routes: {
          '/': (ctx) => HomeScreen(title: title),
          '/list': (ctx) => MainScreen(title: title)
        },
        debugShowCheckedModeBanner: false
      ),
    );
  }
}