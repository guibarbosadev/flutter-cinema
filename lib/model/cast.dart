import 'package:meta/meta.dart';

class Cast {
  int id;
  String character;
  int castId;
  String creditId;
  int gender; // 1 is for woman, 2 is forman
  String name;
  int order;
  String _profilePath;
  

  String get profilePath => 'https://image.tmdb.org/t/p/w500$_profilePath';

  set profilePath(String profilePath) {
    _profilePath = profilePath;
  }

  Cast({
    @required this.id,
    @required this.character,
    @required this.castId,
    @required this.creditId,
    @required this.gender,
    @required this.name,
    @required this.order,
    @required profilePath
  }) {
    _profilePath = profilePath;
  }

  factory Cast.fromJson(Map<String, dynamic> parsedJson) {
    return Cast(
      character: parsedJson['character'],
      creditId: parsedJson['credit_id'],
      gender: parsedJson['gender'],
      id: parsedJson['id'],
      castId: parsedJson['cast_id'],
      name: parsedJson['name'],
      order: parsedJson['order'],
      profilePath: parsedJson['profile_path']
    );
  }
}