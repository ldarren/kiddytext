import 'dart:ffi';

class Photo{
  String id;
  String color;
  String url;
  String description;
  Uint32 width;
  Uint32 height;

  Photo.fromJson(json)
      : id = json['id'],
        color = json['color'],
        url = json['urls']['regular'],
        description = json['description'],
        width = json['width'],
        height = json['height'];

  @override
  bool operator == (Object other) => identical(this, other) || other is Photo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}