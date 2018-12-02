import 'package:meta/meta.dart';

class Movie {
  final String title;
  final String description;
  String _posterUrl;
  final String rate;
  final int id;

  get posterUrl => 'https://image.tmdb.org/t/p/w500$_posterUrl';
  
  set posterUrl(String path) {
    this._posterUrl = path;
  }
  
  Movie({
    @required this.title,
    @required this.description,
    @required this.rate,
    @required posterImagePath,
    @required this.id
  }) {
    print('passando pelo constructor');
    posterUrl = posterImagePath;
    print(posterUrl);
  }
}