import 'package:meta/meta.dart';

class MovieGenre {
  final int id;
  final String name;

  MovieGenre({@required this.id, @required this.name});

  factory MovieGenre.fromJson(Map<String, dynamic> parsedJson) {
    return MovieGenre(
      id: parsedJson['id'],
      name: parsedJson['name']      
    );
  }
}