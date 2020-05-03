import 'package:flutter/material.dart';
import 'package:kiddytext/m/photo.dart';
import 'package:url_launcher/url_launcher.dart';

class ImageText extends StatelessWidget{
  final Photo photo;

  ImageText({
    @required this.photo,
  });

  @override
  Widget build(BuildContext ctx){
    String url = photo.small;
    if (1242 < (MediaQuery.of(ctx).size.width * MediaQuery.of(ctx).devicePixelRatio)) url = photo.large;

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.network(url, fit: BoxFit.cover,),
        Container(
          color: Colors.black.withOpacity(0.5),
          padding: const EdgeInsets.all(8.0),
          child: Text(photo.text, style: TextStyle(fontSize: 28, color: Colors.white), textAlign: TextAlign.center,),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: photo.bgcolor.withOpacity(0.5),
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Text('Photo by '+photo.author+' on Unsplash', style: TextStyle(fontSize: 12, color: photo.color), textAlign: TextAlign.center,),
                  onTap: () async {
                    await launch('https://unsplash.com/@'+photo.username+'?utm_source=KiddyText&utm_medium=referral');
                  },
              )
            ),
          ),
        )
      ],
    );
  }
}