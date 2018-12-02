import 'package:cinema/model/movie.dart';
import 'package:cinema/model/movie_genre.dart';
import 'package:meta/meta.dart';

class MovieDetailed extends Movie {
  String _backdropUrl;
  final int duration;
  final List<MovieGenre> genres;

  factory MovieDetailed.fromJson(Map<String, dynamic> parsedJson) {
    List<dynamic> genres = List<dynamic>.from(parsedJson['genres']);
    List<MovieGenre> movieGenres = genres.map((genre) => MovieGenre.fromJson(genre)).toList();
    
    return MovieDetailed(
      backdropUrl: parsedJson['backdrop_path'],
      description: parsedJson['overview'],
      duration: parsedJson['runtime'],
      genres: movieGenres,
      id: parsedJson['id'],
      posterUrl: parsedJson['poster_path'],
      rate: parsedJson['rate'],
      title: parsedJson['title']
    );
  }

  get backdropUrl => 'https://image.tmdb.org/t/p/w500$_backdropUrl';

  set backdropUrl(String path) {
     _backdropUrl = path;
  }

  MovieDetailed({
    @required title,
    @required description,
    @required rate,
    @required posterUrl,
    @required id,
    @required backdropUrl,
    @required this.duration,
    @required this.genres
  }) : super(
          id: id,
          description: description,
          rate: rate,
          title: title,
          posterImagePath: posterUrl
        ) {
          _backdropUrl = backdropUrl;
        }
}
