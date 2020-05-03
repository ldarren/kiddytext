import 'package:flutter/material.dart';

class Photo{
  String id;
  Color bgcolor;
  Color color;
  String small;
  String large;
  String name;
  String description;
  String author;
  String username;
  int width;
  int height;

  Photo({
    this.id, 
    this.bgcolor,
    this.color, 
    this.small, 
    this.large, 
    this.name, 
    this.description, 
    this.width, 
    this.height,
    this.author,
    this.username
  });

  factory Photo.fromJson(json){
    Color bgcolor = Color(int.parse(json['color'].replaceAll('#', '0xff')));
    Color color = bgcolor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return Photo(
      id: json['id'],
      bgcolor: bgcolor,
      color: color,
      small: json['urls']['small'],
      large: json['urls']['regular'],
      name: json['alt_description'] ,
      description: json['description'], 
      width: json['width'],
      height: json['height'],
      author: json['user']['name'],
      username: json['user']['username'],
    );
  }

  @override
  bool operator == (Object other) => identical(this, other) || other is Photo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  String get text => name ?? description ?? 'No Description';
}