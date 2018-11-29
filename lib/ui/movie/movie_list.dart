import 'package:cinema/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:cinema/network/movie_network.dart';
import 'movie_list_item.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List results;
  List<Movie> movies;
  String voteCount;

  @override
  void initState() {
    movies = [];
    MovieNetwork.listPopularMovie().then((response) {
      results = response['results'];
      if (results != null) {
        setState(() {
          results.forEach((movieItem) {
            movies.add(
              Movie(
                description: movieItem['overview'],
                title: movieItem['title'],
                imagePath:
                    "https://image.tmdb.org/t/p/w500${movieItem['poster_path']}",
                rate: movieItem['vote_average'].toString(),
              ),
            );
          });
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies == null ? 0 : movies.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieListItem(
          movie: movies[index],
          onTap: () {
            // TODO:
          },
        );
      },
    );
  }
}
