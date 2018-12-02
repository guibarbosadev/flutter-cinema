import 'package:cinema/model/movie_detailed.dart';
import 'package:cinema/network/movie_network.dart';
import 'package:cinema/ui/movie_details/movie_details_header.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  MovieDetailsPage({@required this.movieId});

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  MovieDetailed movie;

  @override
  void initState() {
    _getMovieDetails(widget.movieId);
    super.initState();
  }

  void _getMovieDetails(int movieId) async {
    MovieNetwork.getMovieDetails(movieId).then((response) {
      setState(() {
        movie = MovieDetailed.fromJson(response);
        print('movieTitle: ${movie.genres.length}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return movie != null
        ? Scaffold(
            body: ListView(
              children: <Widget>[
                MovieDetailsHeader(movie: movie),
              ],
            ),
          )
        : Container();
  }
}
